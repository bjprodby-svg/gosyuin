#!/usr/bin/env python3
"""
Fetch Wikimedia Commons images for all shrines and update Swift source files.
Uses Wikipedia API to find images associated with each shrine.
"""

import re
import os
import json
import time
import urllib.request
import urllib.parse
import urllib.error
import ssl

ssl._create_default_https_context = ssl._create_unverified_context

MODELS_DIR = os.path.join(os.path.dirname(__file__), '..', 'GosyuinMap', 'Models')

def fetch_json(url):
    """Fetch JSON from URL with retries."""
    for attempt in range(3):
        try:
            req = urllib.request.Request(url, headers={
                'User-Agent': 'GosyuinMap/1.0 (shrine image fetcher)'
            })
            with urllib.request.urlopen(req, timeout=10) as resp:
                return json.loads(resp.read().decode('utf-8'))
        except Exception as e:
            if attempt < 2:
                time.sleep(1)
            else:
                return None

def search_wikimedia_images(query, limit=3):
    """Search Wikimedia Commons for images related to query."""
    # Try Japanese Wikipedia first to get the article
    encoded = urllib.parse.quote(query)

    # Strategy 1: Search Japanese Wikipedia for the shrine page and get its images
    url = (
        f"https://ja.wikipedia.org/w/api.php?action=query&titles={encoded}"
        f"&prop=pageimages|images&piprop=original&pilimit=1&imlimit=10"
        f"&format=json&redirects=1"
    )
    data = fetch_json(url)
    if data:
        pages = data.get('query', {}).get('pages', {})
        for page_id, page in pages.items():
            if page_id == '-1':
                continue

            images = []

            # Get main page image
            if 'original' in page:
                src = page['original'].get('source', '')
                if is_good_image(src):
                    images.append(src)

            # Get other images from the page
            for img in page.get('images', []):
                title = img.get('title', '')
                if not is_useful_image_title(title):
                    continue
                img_url = get_commons_image_url(title)
                if img_url and is_good_image(img_url) and img_url not in images:
                    images.append(img_url)
                if len(images) >= limit:
                    break

            if images:
                return images[:limit]

    # Strategy 2: Search Wikimedia Commons directly
    url = (
        f"https://commons.wikimedia.org/w/api.php?action=query"
        f"&generator=search&gsrsearch={encoded}&gsrlimit=5&gsrnamespace=6"
        f"&prop=imageinfo&iiprop=url&iiurlwidth=800"
        f"&format=json"
    )
    data = fetch_json(url)
    if data:
        pages = data.get('query', {}).get('pages', {})
        images = []
        for page in sorted(pages.values(), key=lambda p: p.get('index', 999)):
            info = page.get('imageinfo', [{}])[0]
            thumb = info.get('thumburl', '')
            if thumb and is_good_image(thumb):
                images.append(thumb)
            if len(images) >= limit:
                break
        if images:
            return images

    return []

def get_commons_image_url(title, width=800):
    """Get the actual URL for a Wikimedia Commons file."""
    encoded = urllib.parse.quote(title)
    url = (
        f"https://commons.wikimedia.org/w/api.php?action=query&titles={encoded}"
        f"&prop=imageinfo&iiprop=url&iiurlwidth={width}&format=json"
    )
    data = fetch_json(url)
    if data:
        pages = data.get('query', {}).get('pages', {})
        for page in pages.values():
            info = page.get('imageinfo', [{}])[0]
            return info.get('thumburl') or info.get('url')
    return None

def is_useful_image_title(title):
    """Filter out non-photo images."""
    lower = title.lower()
    skip = ['logo', 'icon', 'map', 'svg', 'flag', 'coat', 'symbol',
            'commons-', 'wikidata', '.ogg', '.wav', 'location', 'dot',
            'red_pog', 'blue_pog', 'increase', 'decrease', 'steady',
            'japan_location', 'prefectures']
    return not any(s in lower for s in skip)

def is_good_image(url):
    """Check if URL looks like a good photo."""
    lower = url.lower()
    if not any(ext in lower for ext in ['.jpg', '.jpeg', '.png', '.webp']):
        return False
    skip = ['logo', 'icon', 'map.', 'flag', 'coat_of', 'symbol', 'commons-logo']
    return not any(s in lower for s in skip)

def extract_shrines_from_file(filepath):
    """Extract shrine names and their imageURLs line positions."""
    with open(filepath, 'r') as f:
        content = f.read()

    # Find all shrine entries with name and imageURLs position
    shrines = []
    # Match name: "..." patterns
    name_pattern = re.compile(r'name:\s*"([^"]+)"')
    img_pattern = re.compile(r'imageURLs:\s*\[([^\]]*)\]', re.DOTALL)

    # Split by Shrine( entries
    entries = re.split(r'(?=Shrine\()', content)

    for entry in entries:
        name_match = name_pattern.search(entry)
        img_match = img_pattern.search(entry)
        if name_match and img_match:
            name = name_match.group(1)
            existing_urls = img_match.group(1).strip()
            has_images = bool(existing_urls) and '://' in existing_urls
            shrines.append({
                'name': name,
                'has_images': has_images,
                'img_match_text': img_match.group(0),
            })

    return shrines, content

def update_file_with_images(filepath, shrine_images):
    """Update a Swift file with fetched image URLs."""
    with open(filepath, 'r') as f:
        content = f.read()

    changes = 0
    for name, urls in shrine_images.items():
        if not urls:
            continue

        # Build the replacement imageURLs string
        url_strings = ',\n            '.join(f'"{u}"' for u in urls)
        new_img = f'imageURLs: [\n            {url_strings}\n        ]'

        # Find the shrine entry by name and replace its imageURLs
        # Look for: name: "NAME" ... imageURLs: [...]
        pattern = re.compile(
            r'(name:\s*"' + re.escape(name) + r'".*?)(imageURLs:\s*\[[^\]]*\])',
            re.DOTALL
        )
        match = pattern.search(content)
        if match:
            old = match.group(0)
            new = match.group(1) + new_img
            content = content.replace(old, new, 1)
            changes += 1

    if changes > 0:
        with open(filepath, 'w') as f:
            f.write(content)

    return changes

def main():
    files = sorted(f for f in os.listdir(MODELS_DIR) if f.startswith('ShrineData_') and f.endswith('.swift'))

    total_shrines = 0
    total_fetched = 0
    total_already = 0

    for filename in files:
        filepath = os.path.join(MODELS_DIR, filename)
        shrines, content = extract_shrines_from_file(filepath)

        if not shrines:
            continue

        print(f"\n{'='*60}")
        print(f"Processing {filename} ({len(shrines)} shrines)")
        print(f"{'='*60}")

        shrine_images = {}

        for shrine in shrines:
            total_shrines += 1
            name = shrine['name']

            if shrine['has_images']:
                total_already += 1
                print(f"  [SKIP] {name} (already has images)")
                continue

            print(f"  [FETCH] {name}...", end=' ', flush=True)
            urls = search_wikimedia_images(name)

            if urls:
                shrine_images[name] = urls
                total_fetched += 1
                print(f"OK ({len(urls)} images)")
            else:
                print("no images found")

            time.sleep(0.3)  # Rate limiting

        if shrine_images:
            changes = update_file_with_images(filepath, shrine_images)
            print(f"  >> Updated {changes} entries in {filename}")

    print(f"\n{'='*60}")
    print(f"SUMMARY")
    print(f"  Total shrines: {total_shrines}")
    print(f"  Already had images: {total_already}")
    print(f"  Newly fetched: {total_fetched}")
    print(f"  No images found: {total_shrines - total_already - total_fetched}")
    print(f"{'='*60}")

if __name__ == '__main__':
    main()
