import SwiftUI
import CoreLocation

// MARK: - Other Regions (6 shrines, ID 45-50)

let otherShrines: [Shrine] = [

    Shrine(
        id: UUID(uuidString: "00000002-0000-0000-0000-000000000045")!,
        name: "Ise Jingu (Naiku)",
        address: "1 Ujitatecho, Ise, Mie",
        description: "The holiest site in all of Shinto, Ise Jingu's Inner Shrine (Naiku) enshrines Amaterasu-Omikami — the sun goddess and the most sacred deity in the Japanese Shinto pantheon. The shrine buildings are demolished and completely rebuilt every 20 years in the Shikinen Sengu ceremony, ensuring both material renewal and the living transmission of ancient carpentry techniques — a tradition maintained for over 1,300 years.",
        coordinate: CLLocationCoordinate2D(latitude: 34.4553, longitude: 136.7257),
        stampSlotId: 45,
        category: .jingu,
        tagline: "The holiest shrine in Japan — home of the sun goddess Amaterasu",
        highlights: [
            "Japan's highest-ranking shrine — holiest site of Shinto religion",
            "Shikinen Sengu: sacred buildings rebuilt identically every 20 years",
            "Walk across the Uji Bridge over the Isuzu River to the sacred forest",
            "Only the Imperial family and selected priests may enter the inner sanctuary"
        ],
        mustSee: "Cross the Uji Bridge at dawn — the morning mist rising from the Isuzu River, filtered through towering cedar trees, creates a spiritual atmosphere unlike anywhere else in Japan.",
        tips: [
            "Arrive at sunrise for the most atmospheric experience — the bridge and forest are extraordinary in morning light",
            "The Okage Yokocho traditional street near Naiku has excellent local Mie cuisine",
            "Visit both Naiku (inner) and Geku (outer) shrines for the complete experience — they are 6 km apart",
            "Photography is prohibited beyond the first torii gate into the main precinct — be respectful"
        ],
        bestSeason: "Year-round (spring and autumn are most beautiful; every 20 years for Sengu ceremony)",
        access: "Bus from Iseshi Station (JR/Kintetsu) to Naiku (Jingu Kaikan-mae) — 15 min",
        hours: "Open daily, hours vary by season (5:00-18:00 in summer, 5:00-17:00 in winter)",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000002-0000-0000-0000-000000000046")!,
        name: "Itsukushima Jinja",
        address: "1-1 Miyajimacho, Hatsukaichi, Hiroshima",
        description: "Built on the tidal flats of Miyajima island, Itsukushima Jinja appears to float on the sea at high tide — with its great torii gate rising from the water like an orange flame against the forested mountain. Founded in the 6th century and expanded by the warlord Taira no Kiyomori in 1168, it is one of Japan's three most celebrated scenic views and a UNESCO World Heritage Site.",
        coordinate: CLLocationCoordinate2D(latitude: 34.2958, longitude: 132.3195),
        stampSlotId: 46,
        category: .jinja,
        tagline: "A shrine that floats on the sea — Japan's most scenic view",
        highlights: [
            "Floating torii gate — rises from the tidal sea at high tide",
            "One of Japan's three great scenic views (Nihon Sankei)",
            "UNESCO World Heritage Site covering the entire Miyajima island",
            "Night illumination of the torii and shrine reflected in the tide pools"
        ],
        mustSee: "Check the tide schedule before visiting — at high tide the shrine buildings appear to float on the sea. At low tide, walk out to the torii gate and touch it. Both experiences are unforgettable.",
        tips: [
            "Take the ferry from Miyajimaguchi Station for the full approaching-by-sea experience (\u{00A5}200 per way)",
            "The island's deer are as friendly as Nara's — and they will steal your maps",
            "Stay overnight on the island to experience the torii gate at sunrise — almost no crowds",
            "Try Momiji Manju (maple leaf cakes) — the island's famous snack, sold everywhere"
        ],
        bestSeason: "Year-round (spring cherry blossoms and autumn maples frame the torii beautifully)",
        access: "Ferry from Miyajimaguchi Station (JR San-yo Line) — 10 min ride",
        hours: "Open 24 hours; inner shrine 6:30-18:00 (seasonal variation)",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000002-0000-0000-0000-000000000047")!,
        name: "Izumo Taisha",
        address: "195 Kizukihigashi, Taisha, Izumo, Shimane",
        description: "The oldest and most revered matchmaking shrine in Japan, Izumo Taisha is where all the gods of Japan are believed to gather every October to arrange marriages and determine the fates of relationships for the coming year. The colossal shimenawa rope hanging in the main hall — weighing 5.2 tons — is the largest in Japan and a symbol of overwhelming divine power.",
        coordinate: CLLocationCoordinate2D(latitude: 35.4014, longitude: 132.6851),
        stampSlotId: 47,
        category: .taisha,
        tagline: "Where Japan's gods meet to arrange every couple's destiny",
        highlights: [
            "Japan's most powerful matchmaking shrine — where the gods arrange marriages",
            "5.2-ton shimenawa rope — the largest sacred rope in Japan",
            "Kamiari-zuki: October is called the 'Month of Gods' here (when gods gather)",
            "One of Japan's oldest shrines with roots in ancient Izumo mythology"
        ],
        mustSee: "The massive shimenawa rope in the Kagura-den hall — 13.5 meters long and weighing 5.2 tons, covered in twisted rice straw. Tossing a coin into it and having it stick is said to bring the best marriage luck.",
        tips: [
            "October (Kamiari-zuki / the Month of Gods) is the most spiritually significant time to visit",
            "The approach (Sando) is lined with ancient pine trees — walk it slowly",
            "The four-fold clap (shide) when praying here differs from normal Shinto (2-beat) — a sign of the shrine's unique standing",
            "Izumo soba (dark buckwheat, served three layers in a wooden lacquer box) is the local specialty"
        ],
        bestSeason: "Oct (Kamiari-zuki, gods gather), Year-round for matchmaking wishes",
        access: "Bus from Izumoshi Station (JR Sanin Line) to Izumo Taisha-mae — 30 min",
        hours: "6:00-20:00 (outer grounds open 24h)",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000002-0000-0000-0000-000000000048")!,
        name: "Dazaifu Tenmangu",
        address: "4-7-1 Saifu, Dazaifu, Fukuoka",
        description: "Built over the grave of Sugawara no Michizane — the scholar-official deified as the god of learning after dying in exile in 903 AD — Dazaifu Tenmangu is the most important of all Tenmangu shrines in western Japan. Over 2 million students visit each year before university entrance exams. The pond bridge approach, the massive camphor trees, and the vibrant new architecture of its Starbucks make it one of Japan's most photographed shrine precincts.",
        coordinate: CLLocationCoordinate2D(latitude: 33.5214, longitude: 130.5331),
        stampSlotId: 48,
        category: .tenmangu,
        tagline: "Where 2 million students pray for exam success over Michizane's grave",
        highlights: [
            "Built directly over the grave of Sugawara no Michizane",
            "2 million student visitors per year before entrance exams",
            "Spectacular plum orchard — over 6,000 trees — blooming February to March",
            "Unique Starbucks designed by kengo kuma with woven wood facade"
        ],
        mustSee: "Cross the three-arch bridge over the pond to approach the main hall — the reflection of the hall and the ancient camphor trees in the water is one of Kyushu's most beautiful shrine approaches.",
        tips: [
            "February and March plum blossom season is magical — 6,000 trees around the shrine",
            "Buy the famous umegae-mochi (plum blossom rice cake) — sold at shops on the approach",
            "The Kengo Kuma-designed Starbucks on the approach is worth a look and a coffee",
            "Combine with the Kyushu National Museum (next door) for a cultural half-day"
        ],
        bestSeason: "Feb-Mar (plum blossoms), Jan (student exam prayer season)",
        access: "5 min walk from Dazaifu Station (Nishitetsu Dazaifu Line)",
        hours: "6:00-19:00 (Apr-Sep 6:00-20:00)",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000002-0000-0000-0000-000000000049")!,
        name: "Toshogu (Nikko)",
        address: "2301 Sannai, Nikko, Tochigi",
        description: "Built in 1617 to enshrine Tokugawa Ieyasu — the shogun who unified Japan after a century of civil war — Nikko Toshogu is one of the most ornate and opulent religious complexes in the world. Every surface of the 55 buildings is carved and painted in lavish detail, the most famous being the three wise monkeys ('see no evil, hear no evil, speak no evil') and the Sleeping Cat.",
        coordinate: CLLocationCoordinate2D(latitude: 36.7582, longitude: 139.5992),
        stampSlotId: 49,
        category: .jinja,
        tagline: "Japan's most ornate shrine — gold and color in the mountain forest",
        highlights: [
            "Yomeimon Gate — the 'Gate of Sunsets', carved with over 500 figures",
            "Three Wise Monkeys (Mizaru, Kikazaru, Iwazaru) carved in the stable",
            "Nemuri-neko (Sleeping Cat) — the most famous carving in Japan",
            "UNESCO World Heritage Site in Tochigi's mountain forest"
        ],
        mustSee: "Stand before the Yomeimon Gate (Gate of Sunsets) and spend time finding all 500 carved figures — it is said you could spend a sunset gazing at it without seeing everything. One pillar is deliberately carved upside-down to ward off evil.",
        tips: [
            "Buy the combined ticket (\u{00A5}1,300) for Toshogu plus the inner area where the mausoleum is",
            "The cedar forest approach along Omotesando is stunning — walk it slowly",
            "Autumn foliage (mid-November) in the mountain setting is world-class",
            "Arrive when it opens at 8 AM — tour groups arrive by 10 AM"
        ],
        bestSeason: "Nov (spectacular autumn foliage), May (spring fresh green against the ornate buildings)",
        access: "13 min by bus from Nikko Station (JR Nikko Line / Tobu Nikko Line)",
        hours: "8:00-17:00 (Nov-Mar 8:00-16:00)",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000002-0000-0000-0000-000000000050")!,
        name: "Fukuoka (Hakozaki) Hachimangu",
        address: "1-22-1 Hakozaki, Higashi, Fukuoka",
        description: "One of Japan's three greatest Hachimangu shrines, Hakozaki Hachimangu was founded in 923 AD on the site where Emperor Ojin was believed to have appeared. Famous for the enemy flags captured during the Mongol invasions of 1274 and 1281, the shrine still displays sacred items from that era. Its Hojoya festival in September — one of Kyushu's most important — fills the surrounding streets with hundreds of stalls.",
        coordinate: CLLocationCoordinate2D(latitude: 33.6246, longitude: 130.4215),
        stampSlotId: 50,
        category: .hachimangu,
        tagline: "Kyushu's guardian shrine that turned back the Mongol fleet",
        highlights: [
            "One of Japan's three great Hachimangu shrines",
            "Connected to the miraculous defeat of the Mongol invasions (13th century)",
            "Hojoya Festival (Sept) — one of Kyushu's largest with hundreds of market stalls",
            "Powerful blessings for national protection and decisive victory"
        ],
        mustSee: "The main gate (Ro-mon) — one of the finest torii-gate structures in Kyushu, standing at the end of a long stone-lantern-lined approach through a camphor forest.",
        tips: [
            "The Hojoya Festival in mid-September (Sept 12-18) is extraordinary — the surrounding streets become a massive outdoor market",
            "Combine with a visit to Fukuoka's famous Hakata area for tonkotsu ramen",
            "The shrine beach (Suminoe) a short walk away offers a different atmosphere",
            "Lucky daikoku lucky charms here are considered especially powerful for business"
        ],
        bestSeason: "Sept 12-18 (Hojoya Festival), Jan (New Year's hatsumode)",
        access: "3 min walk from Hakozaki-miya-mae Station (Fukuoka City Subway Hakozaki Line)",
        hours: "9:00-17:00 (outer grounds 24h)",
        imageURLs: []
    ),
]
