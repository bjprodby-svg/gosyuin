#!/usr/bin/env python3
"""Extract imageURLs from Swift files into a JSON file, and remove them from source."""
import re, os, json

MODELS_DIR = os.path.join(os.path.dirname(__file__), '..', 'GosyuinMap', 'Models')
OUTPUT_JSON = os.path.join(os.path.dirname(__file__), '..', 'GosyuinMap', 'Resources', 'shrine_images.json')

os.makedirs(os.path.dirname(OUTPUT_JSON), exist_ok=True)

image_map = {}  # name -> [urls]

files = sorted(f for f in os.listdir(MODELS_DIR) if f.startswith('ShrineData_') and f.endswith('.swift'))

for filename in files:
    filepath = os.path.join(MODELS_DIR, filename)
    with open(filepath, 'r') as f:
        content = f.read()

    # Find all shrine entries
    entries = re.split(r'(?=Shrine\()', content)
    new_content = content

    for entry in entries:
        name_match = re.search(r'name:\s*"([^"]+)"', entry)
        img_match = re.search(r'imageURLs:\s*\[([^\]]*)\]', entry, re.DOTALL)
        if name_match and img_match:
            name = name_match.group(1)
            urls_text = img_match.group(1).strip()
            if urls_text and '://' in urls_text:
                urls = re.findall(r'"(https?://[^"]+)"', urls_text)
                if urls:
                    image_map[name] = urls
                    # Replace with empty array in source
                    old_img = img_match.group(0)
                    new_img = 'imageURLs: []'
                    new_content = new_content.replace(old_img, new_img, 1)

    with open(filepath, 'w') as f:
        f.write(new_content)
    print(f"{filename}: extracted {sum(1 for e in entries if re.search(r'name:', e))} entries")

with open(OUTPUT_JSON, 'w') as f:
    json.dump(image_map, f, ensure_ascii=False, indent=None)

print(f"\nWrote {len(image_map)} entries to {OUTPUT_JSON}")
print(f"JSON size: {os.path.getsize(OUTPUT_JSON) / 1024:.0f} KB")
