#!/usr/bin/env python3
"""
Fetch accurate shrine images using Japanese names + coordinates for verification.
Uses Wikimedia Commons geosearch to find images actually taken near each shrine.
"""

import re
import os
import json
import time
import urllib.request
import urllib.parse
import ssl

ssl._create_default_https_context = ssl._create_unverified_context

MODELS_DIR = os.path.join(os.path.dirname(__file__), '..', 'GosyuinMap', 'Models')

# Mapping of English names to Japanese for more accurate search
JAPANESE_NAMES = {
    # Tokyo
    "Meiji Jingu": "明治神宮",
    "Senso-ji": "浅草寺",
    "Nezu Jinja": "根津神社",
    "Kanda Myojin": "神田明神",
    "Hie Jinja": "日枝神社",
    "Yasukuni Jinja": "靖国神社",
    "Tokyo Daijingu": "東京大神宮",
    "Zojo-ji": "増上寺",
    "Asakusa Jinja": "浅草神社",
    "Nogi Jinja": "乃木神社",
    "Gotokuji": "豪徳寺",
    "Yushima Tenmangu": "湯島天満宮",
    "Shibamata Taishakuten": "柴又帝釈天",
    "Tomioka Hachimangu": "富岡八幡宮",
    "Hikawa Jinja (Akasaka)": "赤坂氷川神社",
    "Hanazono Jinja": "花園神社",
    "Hatonomori Hachiman Jinja": "鳩森八幡神社",
    "Atago Jinja": "愛宕神社",
    "Akagi Jinja": "赤城神社",
    "Omotenashi Jinja": "おもてなし神社",
    "Shinjuku Juniso Kumano Jinja": "新宿十二社熊野神社",
    "Ebisu Jinja": "恵比寿神社",
    "Ana Hachimangu": "穴八幡宮",
    "Zenkoku-ji (Bishamonten)": "善國寺 毘沙門天",
    "Otonashi Shinmei Jinja": "音無親水神社",
    "Yanagimori Jinja": "柳森神社",
    "Shiba Daijingu": "芝大神宮",
    "Tenso Jinja (Harajuku)": "天祖神社 原宿",
    "Nakano Shimbashi Hikawa Jinja": "中野新橋氷川神社",
    "Togoshi Hachiman Jinja": "戸越八幡神社",
    "Kanamara Jinja": "金山神社",
    "Ikegami Honmon-ji": "池上本門寺",
    "Oji Jinja": "王子神社",
    "Oji Inari Jinja": "王子稲荷神社",
    "Toyokawa Inari Tokyo Betsuin": "豊川稲荷東京別院",
    "Shiba Toshogu": "芝東照宮",
    "Namiyoke Inari Jinja": "波除稲荷神社",
    "Okunitama Jinja": "大國魂神社",
    "Musashi Mitake Jinja": "武蔵御嶽神社",
    "Kishimojin-do (Zoshigaya)": "雑司ヶ谷鬼子母神堂",
    "Tennoji": "天王寺",
    "Fukagawa Fudo-do": "深川不動堂",
    "Suitengu": "水天宮",
    "Togo Jinja": "東郷神社",
    "Takao-san Yakuo-in": "高尾山薬王院",
    "Konno Hachimangu": "金王八幡宮",
    "Imado Jinja": "今戸神社",
    "Toranomon Kotohiragu": "虎ノ門金刀比羅宮",
    "Matsuchiyama Shoden": "待乳山聖天",
    "Kameido Tenjin-sha": "亀戸天神社",
    "Koami Jinja": "小網神社",
    "Teppozu Inari Jinja": "鉄砲洲稲荷神社",
    # Kanagawa
    "Tsurugaoka Hachimangu": "鶴岡八幡宮",
    "Kotoku-in (Great Buddha)": "高徳院",
    "Hasedera": "長谷寺 鎌倉",
    "Kencho-ji": "建長寺",
    "Hokoku-ji (Bamboo Temple)": "報国寺 鎌倉",
    "Enoshima Jinja": "江島神社",
    "Kawasaki Daishi": "川崎大師",
    "Samukawa Jinja": "寒川神社",
    "Engaku-ji": "円覚寺",
    "Jochi-ji": "浄智寺",
    "Meigetsuin": "明月院",
    "Tokei-ji": "東慶寺",
    "Zuisen-ji": "瑞泉寺 鎌倉",
    "Sugimoto-dera": "杉本寺",
    "Kuzuharaoka Jinja": "葛原岡神社",
    "Sasuke Inari Jinja": "佐助稲荷神社",
    "Ofuna Kannon-ji": "大船観音寺",
    "Iseyama Kotai Jingu": "伊勢山皇大神宮",
    "Soji-ji": "總持寺",
    "Hakone Jinja": "箱根神社",
    "Oyama Afuri Jinja": "大山阿夫利神社",
    "Hotoku Ninomiya Jinja": "報徳二宮神社",
    "Hiratsuka Hachimangu": "平塚八幡宮",
    "Hakone Kuzuryu Jinja": "箱根九頭龍神社",
    "Jufuku-ji": "寿福寺",
    "Jomyo-ji": "浄妙寺",
    "Morito Jinja": "森戸神社",
    "Hashirimizu Jinja": "走水神社",
    "Mizonokuchi Jinja": "溝口神社",
    "Yokoji": "横寺",
    "Kuji Jinja": "久地神社",
    "Nagao Jinja": "長尾神社",
    "Myorakuji": "妙楽寺 川崎",
    "Inage Jinja": "稲毛神社",
    "Hie Daijinja": "日枝大神社",
    "Noborito Inari Jinja": "登戸稲荷神社",
    # Chiba
    "Naritasan Shinshoji": "成田山新勝寺",
    "Katori Jingu": "香取神宮",
    "Awa Jinja": "安房神社",
    "Chiba Jinja": "千葉神社",
    "Shimosa Kokubunji": "下総国分寺",
    "Hokekyoji": "法華経寺",
    "Sogo Reido (Narita)": "宗吾霊堂",
    "Tamasaki Jinja": "玉前神社",
    "Nihonji": "日本寺 鋸山",
    "Katsushika Hachimangu": "葛飾八幡宮",
    "Mama Kannon": "ママ観音",
    "Shimosa Ichinomiya Tamasaki Jinja": "上総一宮玉前神社",
    "Inage Sengen Jinja": "稲毛浅間神社",
    "Funabashi Daijingu": "船橋大神宮",
    "Kashiwa Jinja": "柏神社",
    "Nukiho Jinja": "抜穂神社",
    "Tateyama Hachiman Jinja": "館山八幡神社",
    "Chiba-dera": "千葉寺",
    # Kansai
    "Fushimi Inari Taisha": "伏見稲荷大社",
    "Kinkaku-ji (Golden Pavilion)": "金閣寺",
    "Kiyomizu-dera": "清水寺",
    "Yasaka Jinja": "八坂神社",
    "Shimogamo Jinja": "下鴨神社",
    "Kamigamo Jinja": "上賀茂神社",
    "Kitano Tenmangu": "北野天満宮",
    "Heian Jingu": "平安神宮",
    "Nijo Castle (Nijo-jo)": "二条城",
    "Sumiyoshi Taisha": "住吉大社",
    "Osaka Tenmangu": "大阪天満宮",
    "Namba Yasaka Jinja": "難波八阪神社",
    "Imamiya Ebisu Jinja": "今宮戎神社",
    "Shitennoji": "四天王寺",
    "Kasuga Taisha": "春日大社",
    "Todai-ji": "東大寺",
    "Yakushi-ji": "薬師寺",
    "Kofuku-ji": "興福寺",
    "Ginkaku-ji": "銀閣寺",
    "Tofuku-ji": "東福寺",
    "Nanzen-ji": "南禅寺",
    "Ryoan-ji": "龍安寺",
    "Tenryu-ji": "天龍寺",
    "Daitoku-ji": "大徳寺",
    "Myoshin-ji": "妙心寺",
    "Kennin-ji": "建仁寺",
    "Nishi Hongan-ji": "西本願寺",
    "Higashi Hongan-ji": "東本願寺",
    "Kifune Jinja": "貴船神社",
    "Kurama-dera": "鞍馬寺",
    "Byodo-in": "平等院",
    "Daigo-ji": "醍醐寺",
    "Sanjusangendo": "三十三間堂",
    "To-ji": "東寺",
    "Eikan-do": "永観堂",
    "Kodai-ji": "高台寺",
    "Tamatsukuri Inari": "玉造稲荷神社",
    "Hozen-ji": "法善寺",
    "Domyoji Tenmangu": "道明寺天満宮",
    "Ishikiri Tsurugiya Jinja": "石切劔箭神社",
    "Ikukunitama Jinja": "生國魂神社",
    "Katano Amanogawa": "交野天の川",
    "Hiraoka Jinja": "枚岡神社",
    "Ise Jingu (Naiku)": "伊勢神宮 内宮",
    "Ise Jingu (Geku)": "伊勢神宮 外宮",
    "Tsubaki Grand Shrine": "椿大神社",
    "Sarutahiko Jinja": "猿田彦神社",
    "Omiwa Jinja": "大神神社",
    "Yoshino Kinpusen-ji": "金峯山寺",
    "Hase-dera (Nara)": "長谷寺 奈良",
    "Tanzan Jinja": "談山神社",
    "Kumano Hongu Taisha": "熊野本宮大社",
    "Kumano Nachi Taisha": "熊野那智大社",
    "Kumano Hayatama Taisha": "熊野速玉大社",
    "Koyasan Kongobu-ji": "高野山金剛峯寺",
    "Koyasan Okunoin": "高野山奥之院",
    "Awashima Jinja": "淡嶋神社",
    "Kamikura Jinja": "神倉神社",
    "Niutsuhime Jinja": "丹生都比売神社",
    "Nachi Falls (Hirou Jinja)": "飛瀧神社",
    "Ikuta Jinja": "生田神社",
    "Minatogawa Jinja": "湊川神社",
    "Nagata Jinja": "長田神社",
    "Suma-dera": "須磨寺",
    "Nishinomiya Jinja": "西宮神社",
    "Nakayama-dera": "中山寺",
    "Himeji Gokoku Jinja": "姫路護国神社",
    "Engyoji": "圓教寺",
    # Chubu
    "Atsuta Jingu": "熱田神宮",
    "Togakushi Jinja": "戸隠神社",
    "Zenko-ji": "善光寺",
    "Suwa Taisha": "諏訪大社",
    "Izumo Taisha": "出雲大社",
    "Itsukushima Jinja": "厳島神社",
    "Nikko Toshogu": "日光東照宮",
    "Futarasan Jinja": "二荒山神社",
    "Rinnoji": "輪王寺",
    "Takeda Jinja": "武田神社",
    "Kitaguchi Hongu Fuji Sengen Jinja": "北口本宮冨士浅間神社",
    "Fujisan Hongu Sengen Taisha": "富士山本宮浅間大社",
    "Mishima Taisha": "三嶋大社",
    "Kunozan Toshogu": "久能山東照宮",
    "Shuzenji": "修善寺",
    "Tsurugajo (Aizu Wakamatsu)": "鶴ヶ城",
    "Osaki Hachimangu": "大崎八幡宮",
    "Zuiganji": "瑞巌寺",
    "Shiogama Jinja": "鹽竈神社",
    "Risshaku-ji (Yamadera)": "立石寺 山寺",
    "Dewasanzan (Haguro-san)": "羽黒山",
    "Chusonji": "中尊寺",
    "Motsuji": "毛越寺",
    "Iwakiyama Jinja": "岩木山神社",
    "Toshogu (Sendai)": "仙台東照宮",
    "Kaikoji": "海向寺",
    "Takayama Inari Jinja": "高山稲荷神社",
    "Nanko Jinja": "楠公神社",
    # Famous
    "Hikawa Jinja Omiya": "武蔵一宮氷川神社",
    "Chichibu Jinja": "秩父神社",
    "Mitsumine Jinja": "三峯神社",
    "Washinomiya Jinja": "鷲宮神社",
    "Tsuki Jinja": "調神社",
    "Musashi Ichinomiya Hikawa Jinja": "武蔵一宮氷川神社",
    "Kawagoe Hikawa Jinja": "川越氷川神社",
    "Kawagoe Kumano Jinja": "川越熊野神社",
    "Kitain": "喜多院",
    "Shakujii Hikawa Jinja": "石神井氷川神社",
    "Ohmiya Hachimangu": "大宮八幡宮",
    "Shorin-zan Daruma-ji": "少林山達磨寺",
    "Haruna Jinja": "榛名神社",
    "Myogi Jinja": "妙義神社",
    "Ikaho Jinja": "伊香保神社",
    "Nukisaki Jinja": "貫前神社",
    "Ashikaga Orihime Jinja": "足利織姫神社",
    "Nikko Futarasan Jinja (Chuguji)": "日光二荒山神社中宮祠",
    "Tarobogu (Aga Jinja)": "太郎坊宮",
    "Taga Taisha": "多賀大社",
    "Hiyoshi Taisha": "日吉大社",
    "Tsukubasan Jinja": "筑波山神社",
    "Kashima Jingu": "鹿島神宮",
    "Oarai Isosaki Jinja": "大洗磯前神社",
    "Hitachi Kairakuen Tokiwa Jinja": "常磐神社",
    "Oyama Jinja (Kanazawa)": "尾山神社",
    "Kenrokuen Jinja": "金澤神社",
    "Shirayama Hime Jinja": "白山比咩神社",
    "Eiheiji": "永平寺",
    "Kehi Jingu": "氣比神宮",
    "Wakasa Hikime Jinja": "若狭彦神社",
    # East Japan additions
    "Ebara Jinja": "荏原神社",
    "Shinagawa Jinja": "品川神社",
    "Meguro Fudo (Ryusen-ji)": "目黒不動尊 瀧泉寺",
    "Roppongi Tenso Jinja": "六本木天祖神社",
    "Hikawa Jinja Shibuya": "氷川神社 渋谷",
    "Suwa Jinja (Nishi-Nippori)": "諏方神社 西日暮里",
    "Shirahige Jinja": "白鬚神社",
    "Karasumori Jinja": "烏森神社",
    "Onoterusaki Jinja": "小野照崎神社",
    "Anamori Inari Jinja": "穴守稲荷神社",
    "Musashi Kokubunji": "武蔵国分寺",
    "Tanashi Jinja": "田無神社",
    "Iriya Kishimojin": "入谷鬼子母神",
    "Oiwa Inari Tamiya Jinja": "於岩稲荷田宮神社",
    "Koenji Hikawa Jinja": "高円寺氷川神社",
    "Suginami Kumano Jinja": "杉並熊野神社",
    "Akabane Hachiman Jinja": "赤羽八幡神社",
    "Jujo Fuji Sengen Jinja": "十条富士浅間神社",
    "Hikawa Jinja (Itabashi)": "氷川神社 板橋",
    "Tokiwadai Tenso Jinja": "常盤台天祖神社",
    "Nerima Otori Jinja": "練馬大鳥神社",
    "Shakujii Tenso Jinja": "石神井天祖神社",
    "Hikarigaoka Hakusan Jinja": "光が丘白山神社",
    "Kichijoji Musashino Hachimangu": "武蔵野八幡宮",
    "Fuchu Okunitama Jinja": "大國魂神社 府中",
    "Ome Sumiyoshi Jinja": "青梅住吉神社",
    "Tachikawa Suwa Jinja": "立川諏訪神社",
    "Hachioji Jinja": "八王子神社",
    "Machida Tenmangu": "町田天満宮",
    "Komae Itsukushima Jinja": "狛江厳島神社",
    "Chofu Fuda Tenmangu": "布多天神社",
    "Fussa Shinmei Jinja": "福生神明社",
    "Hamura Shimmei Jinja": "羽村神明社",
    "Akiruno Niikura Fuji Sengen Jinja": "あきる野新倉富士浅間神社",
    "Mitaka Hachimangu": "三鷹八幡大神社",
    # West Japan
    "Dazaifu Tenmangu": "太宰府天満宮",
    "Kushida Jinja": "櫛田神社",
    "Hakozaki-gu": "筥崎宮",
    "Munakata Taisha": "宗像大社",
    "Aso Jinja": "阿蘇神社",
    "Suizenji Joju-en": "水前寺成趣園",
    "Izumo Taisha": "出雲大社",
    "Kibitsu Jinja": "吉備津神社",
    "Korakuen Okayama": "後楽園 岡山",
    "Itsukushima Jinja": "厳島神社",
    "Izumo-taisha-mae Jinja": "出雲大社前",
    "Yaegaki Jinja": "八重垣神社",
    "Tottori Hakuto Jinja": "白兎神社",
    "Ichinomiya Jinja (Tokushima)": "一宮神社 徳島",
    "Konpira-san (Kotohira-gu)": "金刀比羅宮",
    "Ishizuchi Jinja": "石鎚神社",
    "Okuninushi Jinja": "大国主神社",
    "Matsuyama Isaniwa Jinja": "伊佐爾波神社",
    "Kompira-san (Zentsu-ji)": "善通寺",
    "Okayama Kibitsu Jinja": "吉備津彦神社",
    "Hiroshima Gokoku Jinja": "広島護国神社",
    "Fudo-in": "不動院 広島",
    "Toshogu Hiroshima": "東照宮 広島",
    "Izumo Hinomisaki Jinja": "日御碕神社",
    "Matsue Jinja": "松江神社",
    "Tamatsukuri-yu Jinja": "玉作湯神社",
    "Amanoiwato Jinja": "天岩戸神社",
    "Miyazaki Jingu": "宮崎神宮",
    "Udo Jingu": "鵜戸神宮",
    "Aoshima Jinja": "青島神社",
    "Kirishima Jingu": "霧島神宮",
    "Terukuni Jinja": "照国神社",
    "Izumi Jinja": "出水神社",
    "Shikanoshima Jinja": "志賀海神社",
    "Sumiyoshi Jinja Hakata": "住吉神社 博多",
    "Kashii-gu": "香椎宮",
    "Komyozen-ji": "光明禅寺",
    # Other
    "Hokkaido Jingu": "北海道神宮",
    "Otaru Suitengu": "小樽水天宮",
    "Hakodate Hachimangu": "函館八幡宮",
    "Shuri Castle (Shureimon)": "首里城",
    "Naminoue-gu": "波上宮",
    "Futenma-gu": "普天満宮",
}

def fetch_json(url):
    for attempt in range(3):
        try:
            req = urllib.request.Request(url, headers={
                'User-Agent': 'GosyuinMap/1.0 (shrine image fetcher)'
            })
            with urllib.request.urlopen(req, timeout=10) as resp:
                return json.loads(resp.read().decode('utf-8'))
        except:
            if attempt < 2:
                time.sleep(1)
    return None

def get_wikipedia_images(ja_name, en_name, limit=3):
    """Get images from Japanese Wikipedia article."""
    # Try Japanese name first, then English
    for name in [ja_name, en_name]:
        if not name:
            continue
        encoded = urllib.parse.quote(name)
        url = (
            f"https://ja.wikipedia.org/w/api.php?action=query&titles={encoded}"
            f"&prop=pageimages|images&piprop=original&pilimit=1&imlimit=20"
            f"&format=json&redirects=1"
        )
        data = fetch_json(url)
        if not data:
            continue

        pages = data.get('query', {}).get('pages', {})
        for page_id, page in pages.items():
            if page_id == '-1':
                continue

            images = []
            # Main page image
            if 'original' in page:
                src = page['original'].get('source', '')
                if is_good_image(src):
                    images.append(resize_url(src))

            # Other images from page
            for img in page.get('images', []):
                title = img.get('title', '')
                if not is_useful_image_title(title):
                    continue
                img_url = get_commons_thumb(title)
                if img_url and is_good_image(img_url):
                    resized = resize_url(img_url)
                    if resized not in images:
                        images.append(resized)
                if len(images) >= limit:
                    break

            if images:
                return images[:limit]

    return []

def get_geosearch_images(lat, lon, radius=500, limit=3):
    """Get images from Wikimedia Commons near coordinates."""
    url = (
        f"https://commons.wikimedia.org/w/api.php?action=query"
        f"&generator=geosearch&ggscoord={lat}|{lon}&ggsradius={radius}"
        f"&ggslimit=10&ggsnamespace=6"
        f"&prop=imageinfo&iiprop=url&iiurlwidth=800"
        f"&format=json"
    )
    data = fetch_json(url)
    if not data:
        return []

    pages = data.get('query', {}).get('pages', {})
    images = []
    for page in sorted(pages.values(), key=lambda p: p.get('index', 999)):
        title = page.get('title', '')
        if not is_useful_image_title(title):
            continue
        info = page.get('imageinfo', [{}])[0]
        thumb = info.get('thumburl', '')
        if thumb and is_good_image(thumb):
            images.append(thumb)
        if len(images) >= limit:
            break
    return images

def get_commons_thumb(title, width=800):
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

def resize_url(url, width=800):
    """Ensure wikimedia thumbnail is at correct width."""
    if '/thumb/' in url and url.count('/') > 5:
        # Replace last segment width
        parts = url.rsplit('/', 1)
        if 'px-' in parts[-1]:
            import re
            new_name = re.sub(r'\d+px-', f'{width}px-', parts[-1])
            return parts[0] + '/' + new_name
    return url

def is_useful_image_title(title):
    lower = title.lower()
    skip = ['logo', 'icon', 'map', '.svg', 'flag', 'coat', 'symbol',
            'commons-', 'wikidata', '.ogg', '.wav', 'location', 'dot',
            'red_pog', 'blue_pog', 'increase', 'decrease', 'steady',
            'japan_location', 'prefectures', 'relief', 'locator',
            'wikipe-tan', 'edit-', 'question_mark', 'translation',
            'disambig', 'arrow', 'crystal', 'gnome', 'nuvola', 'padlock']
    return not any(s in lower for s in skip)

def is_good_image(url):
    lower = url.lower()
    if not any(ext in lower for ext in ['.jpg', '.jpeg', '.png', '.webp']):
        return False
    skip = ['logo', 'icon', 'map.', 'flag', 'coat_of', 'symbol',
            'commons-logo', 'wiki-', 'padlock', 'ambox', 'edit-',
            'crystal_clear', 'gnome-', 'nuvola']
    return not any(s in lower for s in skip)

def extract_shrines_from_file(filepath):
    with open(filepath, 'r') as f:
        content = f.read()

    shrines = []
    entries = re.split(r'(?=Shrine\()', content)

    for entry in entries:
        name_match = re.search(r'name:\s*"([^"]+)"', entry)
        lat_match = re.search(r'latitude:\s*([\d.]+)', entry)
        lon_match = re.search(r'longitude:\s*([\d.]+)', entry)
        if name_match and lat_match and lon_match:
            shrines.append({
                'name': name_match.group(1),
                'lat': float(lat_match.group(1)),
                'lon': float(lon_match.group(1)),
            })

    return shrines, content

def update_file(filepath, shrine_images):
    with open(filepath, 'r') as f:
        content = f.read()

    changes = 0
    for name, urls in shrine_images.items():
        if not urls:
            continue

        url_strings = ',\n            '.join(f'"{u}"' for u in urls)
        new_img = f'imageURLs: [\n            {url_strings}\n        ]'

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

    total = 0
    fetched = 0
    geo_fallback = 0
    failed = 0

    for filename in files:
        filepath = os.path.join(MODELS_DIR, filename)
        shrines, _ = extract_shrines_from_file(filepath)
        if not shrines:
            continue

        print(f"\n{'='*60}")
        print(f"{filename} ({len(shrines)} shrines)")
        print(f"{'='*60}")

        shrine_images = {}

        for s in shrines:
            total += 1
            name = s['name']
            ja_name = JAPANESE_NAMES.get(name)

            print(f"  [{total:3d}] {name}", end='', flush=True)
            if ja_name:
                print(f" ({ja_name})", end='', flush=True)

            # Strategy 1: Wikipedia article images
            urls = get_wikipedia_images(ja_name, name)

            # Strategy 2: Geosearch fallback
            if not urls:
                urls = get_geosearch_images(s['lat'], s['lon'])
                if urls:
                    geo_fallback += 1
                    print(f" [geo]", end='')

            if urls:
                shrine_images[name] = urls
                fetched += 1
                print(f" -> {len(urls)} images")
            else:
                failed += 1
                print(f" -> NONE")

            time.sleep(0.3)

        if shrine_images:
            changes = update_file(filepath, shrine_images)
            print(f"  >> Updated {changes} entries")

    print(f"\n{'='*60}")
    print(f"DONE: {fetched}/{total} fetched, {geo_fallback} geo-fallback, {failed} no images")
    print(f"{'='*60}")

if __name__ == '__main__':
    main()
