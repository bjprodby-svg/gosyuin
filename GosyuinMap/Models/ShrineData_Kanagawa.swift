import SwiftUI
import CoreLocation

// MARK: - Kanagawa (36 shrines, ID 19-26 + 73-84 + 113-120 + 123-130)

let kanagawaShrines: [Shrine] = [

    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    // MARK: - Kamakura
    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

    Shrine(
        id: UUID(uuidString: "00000001-0000-0000-0000-000000000019")!,
        name: "Tsurugaoka Hachimangu",
        address: "2-1-31 Yukinoshita, Kamakura, Kanagawa",
        description: "The spiritual heart of Kamakura and the symbol of samurai culture. Founded by Minamoto no Yoritomo — Japan's first shogun — in 1063, its grand staircase and vermillion buildings preside over a straight boulevard that runs all the way to the sea. The approach is lined with cherry trees, and the shrine hosts horseback archery (yabusame) that recreates samurai martial arts.",
        coordinate: CLLocationCoordinate2D(latitude: 35.3260, longitude: 139.5564),
        stampSlotId: 19,
        category: .hachimangu,
        tagline: "The first shogun's shrine at the heart of samurai Kamakura",
        highlights: [
            "Founded by Japan's first shogun — the soul of samurai culture",
            "Dramatic grand staircase leading to the main hall",
            "Yabusame horseback archery in September and April",
            "Cherry-tree-lined boulevard from the shrine to the ocean"
        ],
        mustSee: "Climb the grand stone staircase to the main hall and look back — the view stretches down the tree-lined boulevard (Wakamiya Oji) all the way to the sea.",
        tips: [
            "Walk Wakamiya Oji from the beach to the shrine for the full approach experience",
            "Yabusame (horseback archery) is held in mid-April and mid-September — absolutely worth timing your visit",
            "The lotus ponds at the entrance are stunning in July-August",
            "Try the local Kamakura-bori lacquerware at shops along Komachi-dori"
        ],
        bestSeason: "Late Mar-Apr (cherry blossoms + yabusame), Sept (yabusame)",
        access: "10 min walk from Kamakura Station (JR Yokosuka Line)",
        hours: "5:00-21:00 (Oct-Mar 6:00-21:00)",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000001-0000-0000-0000-000000000020")!,
        name: "Kotoku-in (Great Buddha)",
        address: "4-2-28 Hase, Kamakura, Kanagawa",
        description: "The Great Buddha of Kamakura has been sitting in the open air for over 500 years — ever since a tsunami washed away the temple hall that once housed it. At 13.35 meters tall and weighing 121 tons, this bronze Amida Buddha is one of Japan's most iconic images. You can even go inside the hollow statue and see the casting marks from 1252.",
        coordinate: CLLocationCoordinate2D(latitude: 35.3167, longitude: 139.5357),
        stampSlotId: 20,
        category: .tera,
        tagline: "A 121-ton Buddha sitting under the open sky since 1495",
        highlights: [
            "13.35m bronze Buddha — one of Japan's most iconic landmarks",
            "Sits outdoors since a tsunami destroyed its hall in 1495",
            "Go inside the hollow statue (\u{00A5}50!) and see 1252 casting marks",
            "National Treasure and symbol of Kamakura"
        ],
        mustSee: "Pay the extra \u{00A5}50 to go inside the statue. Standing in the hollow bronze interior, seeing the ancient casting techniques from 1252, is a once-in-a-lifetime experience.",
        tips: [
            "Go inside the statue — only \u{00A5}50 and unforgettable",
            "Visit early morning (before 9 AM) to avoid tour bus crowds",
            "The giant straw sandals (waraji) on the back wall were donated by children",
            "Combine with Hasedera temple (5 min walk) for a Kamakura half-day"
        ],
        bestSeason: "Year-round (spring cherry blossoms frame the Buddha beautifully)",
        access: "7 min walk from Hase Station (Enoden Line)",
        hours: "8:00-17:30 (Oct-Mar until 17:00)",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000001-0000-0000-0000-000000000021")!,
        name: "Hasedera",
        address: "3-11-2 Hase, Kamakura, Kanagawa",
        description: "Perched on a hillside overlooking Sagami Bay, Hasedera offers the most stunning ocean view of any temple in the Kamakura area. The 9.18-meter golden Kannon statue is Japan's largest wooden Buddhist image, and the terraced gardens bloom with different flowers in every season — most famously, 2,500 hydrangeas that paint the hillside in June.",
        coordinate: CLLocationCoordinate2D(latitude: 35.3113, longitude: 139.5321),
        stampSlotId: 21,
        category: .tera,
        tagline: "Ocean views, golden Kannon, and 2,500 hydrangeas",
        highlights: [
            "Panoramic ocean view from the hilltop observation deck",
            "9.18m golden Kannon — Japan's largest wooden Buddhist statue",
            "2,500 hydrangeas covering the hillside in June",
            "Jizo garden with hundreds of small stone statues wearing red bibs"
        ],
        mustSee: "In June, the hydrangea path (ajisai) winds through 2,500 bushes with the ocean sparkling below. It's one of the most beautiful seasonal sights in all of Kanto.",
        tips: [
            "June hydrangea season is peak — arrive at opening (8 AM) to avoid queues",
            "The observation deck cafe serves matcha with the ocean view",
            "Count the adorable jizo statues in the cave passage — hundreds of them",
            "Combine with the Great Buddha (5 min walk)"
        ],
        bestSeason: "Jun (hydrangeas), Year-round for ocean views",
        access: "5 min walk from Hase Station (Enoden Line)",
        hours: "8:00-17:00 (Jul-Aug until 17:30)",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000001-0000-0000-0000-000000000024")!,
        name: "Kencho-ji",
        address: "8 Yamanouchi, Kamakura, Kanagawa",
        description: "The first Zen temple ever built in Japan. Founded in 1253 by a Chinese monk invited by the regent Hojo Tokiyori, Kencho-ji sits in a valley surrounded by forested hills. The approach through ancient juniper trees (planted 760 years ago) is awe-inspiring, and hiking the trail behind the temple leads to a stunning panoramic view of Kamakura and the sea.",
        coordinate: CLLocationCoordinate2D(latitude: 35.3329, longitude: 139.5549),
        stampSlotId: 24,
        category: .tera,
        tagline: "Japan's first Zen temple, surrounded by 760-year-old trees",
        highlights: [
            "Japan's very first Zen temple — founded in 1253",
            "Avenue of 760-year-old juniper trees (Byakushin)",
            "Hiking trail to Hansobo shrine with panoramic views",
            "Active Zen training monastery — monks still practice here daily"
        ],
        mustSee: "Hike the trail behind the temple up to Hansobo shrine — tengu (mythical creature) statues line the path, and the view from the top overlooks all of Kamakura to the ocean.",
        tips: [
            "The hiking trail continues to Tsurugaoka Hachimangu (1 hour) — a fantastic Kamakura walk",
            "The 760-year-old juniper trees near the Sanmon gate are breathtaking",
            "Zazen (seated meditation) sessions are held on Fridays and Saturdays",
            "Entrance \u{00A5}500, allow 1-2 hours with the hiking trail"
        ],
        bestSeason: "Nov-Dec (autumn colors), Jun (hydrangeas on trail)",
        access: "15 min walk from Kita-Kamakura Station (JR Yokosuka Line)",
        hours: "8:30-16:30",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000001-0000-0000-0000-000000000025")!,
        name: "Hokoku-ji (Bamboo Temple)",
        address: "2-7-4 Jomyoji, Kamakura, Kanagawa",
        description: "Step through the gate and into another world — a grove of 2,000 towering moso bamboo stalks that filter the sunlight into an ethereal green glow. Hokoku-ji's bamboo garden is one of the most serene and Instagram-worthy spots in all of Kamakura. Sit in the tea house deep in the grove, sip matcha, and let the rustling bamboo wash away every stress.",
        coordinate: CLLocationCoordinate2D(latitude: 35.3173, longitude: 139.5666),
        stampSlotId: 25,
        category: .tera,
        tagline: "Matcha tea among 2,000 towering bamboo stalks",
        highlights: [
            "2,000 moso bamboo stalks creating an ethereal green canopy",
            "Matcha tea house hidden deep inside the bamboo grove",
            "One of the most photographed spots in Kamakura",
            "Sunday morning zazen (meditation) sessions open to visitors"
        ],
        mustSee: "Order matcha (\u{00A5}600 with entrance) at the tea house deep in the bamboo grove. Sitting there, surrounded by towering green stalks swaying in the breeze, is pure peace.",
        tips: [
            "Arrive at 9 AM opening to experience the grove in quiet solitude",
            "The bamboo photographs best on overcast days — the green glow intensifies",
            "Sunday zazen meditation is 7:30-10:30 (free, reservation required)",
            "It's a 12-min walk from the bus stop — slightly off the main tourist route"
        ],
        bestSeason: "Year-round (early morning for best light and solitude)",
        access: "Bus from Kamakura Station to Jomyoji stop (12 min), then 3 min walk",
        hours: "9:00-16:00",
        imageURLs: []
    ),

    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    // MARK: - Fujisawa / Enoshima
    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

    Shrine(
        id: UUID(uuidString: "00000001-0000-0000-0000-000000000022")!,
        name: "Enoshima Jinja",
        address: "2-3-8 Enoshima, Fujisawa, Kanagawa",
        description: "Cross the bridge to the sacred island of Enoshima and climb through a series of three shrines dedicated to the goddess Benzaiten — the deity of music, art, and good fortune. On clear days, Mt. Fuji rises behind the island like a painting. The island also has sea caves, a lighthouse observatory, and some of the freshest shirasu (whitebait) you'll ever taste.",
        coordinate: CLLocationCoordinate2D(latitude: 35.3001, longitude: 139.4797),
        stampSlotId: 22,
        category: .jinja,
        tagline: "A sacred island with three shrines and Mt. Fuji views",
        highlights: [
            "Three linked shrines climbing from the harbor to the hilltop",
            "Mt. Fuji sunset views on clear days — absolutely breathtaking",
            "Sea caves at the back of the island with dragon legends",
            "Sea Candle lighthouse for 360° panoramic views"
        ],
        mustSee: "On a clear winter day, watch the sunset from the Sea Candle observatory — Mt. Fuji's silhouette against an orange sky is one of the most magical views near Tokyo.",
        tips: [
            "Buy the 'eno-pass' for escalator + lighthouse + cave access (saves money and legs)",
            "Try fresh shirasu (whitebait) don at the restaurants near the harbor",
            "Winter has the clearest Fuji views; summer is great for the beach vibe",
            "The island gets very crowded on weekends — weekday visits are much better"
        ],
        bestSeason: "Dec-Feb (clearest Mt. Fuji views), Year-round",
        access: "15 min walk from Katase-Enoshima Station (Odakyu Line) across the bridge",
        hours: "8:30-17:00 (shrine), lighthouse/caves vary seasonally",
        imageURLs: []
    ),

    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    // MARK: - Kawasaki
    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

    Shrine(
        id: UUID(uuidString: "00000001-0000-0000-0000-000000000023")!,
        name: "Kawasaki Daishi",
        address: "4-48 Daishi-Ekimae, Kawasaki, Kanagawa",
        description: "Every New Year, 3 million people flood Kawasaki Daishi — making it one of the top three most visited temples in Japan during hatsumode (first shrine visit). Founded in 1128, this Shingon Buddhist temple is famous for yakuyoke — protection against misfortune. The approach street is lined with shops selling the temple's famous toffee candy, cut with rhythmic knife performances.",
        coordinate: CLLocationCoordinate2D(latitude: 35.5285, longitude: 139.7282),
        stampSlotId: 23,
        category: .daishi,
        tagline: "3 million visitors at New Year and legendary toffee candy",
        highlights: [
            "Top 3 most visited temple in Japan at New Year (3 million people)",
            "Yakuyoke specialty — powerful protection against misfortune",
            "Approach street toffee shops with rhythmic knife-cutting performances",
            "Massive octagonal five-story pagoda"
        ],
        mustSee: "Watch the toffee (tontoko-ame) being made on the approach street — the rhythmic knife-cutting performance is mesmerizing, and the fresh candy is delicious.",
        tips: [
            "Avoid Jan 1-3 unless you want the full hatsumode crowd experience",
            "The yakuyoke (bad-luck prevention) ritual is taken very seriously here",
            "Buy freshly-cut tontoko-ame toffee from the approach street vendors",
            "The temple grounds are large — allow at least 1 hour"
        ],
        bestSeason: "Jan (hatsumode), Year-round",
        access: "5 min walk from Kawasaki-Daishi Station (Keikyu Daishi Line)",
        hours: "5:30-18:00 (Apr-Sep), 6:00-17:30 (Oct-Mar)",
        imageURLs: []
    ),

    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    // MARK: - Samukawa
    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

    Shrine(
        id: UUID(uuidString: "00000001-0000-0000-0000-000000000026")!,
        name: "Samukawa Jinja",
        address: "3916 Miyayama, Samukawa, Koza District, Kanagawa",
        description: "The most powerful shrine in all of Sagami Province — and the only Ichinomiya (highest-ranked) shrine in Kanagawa. Samukawa Jinja has been revered for over 1,600 years for its unique power of happo-yoke: protection from misfortune in all eight directions. The spacious grounds with ancient trees feel remarkably peaceful, far from the tourist crowds of Kamakura.",
        coordinate: CLLocationCoordinate2D(latitude: 35.3716, longitude: 139.3850),
        stampSlotId: 26,
        category: .jinja,
        tagline: "Protection from all eight directions for 1,600 years",
        highlights: [
            "Ichinomiya — highest-ranked shrine in Kanagawa Prefecture",
            "Happo-yoke: unique blessing for protection in all 8 directions",
            "1,600+ years of unbroken worship history",
            "Spacious grounds with towering ancient cedars — no crowds"
        ],
        mustSee: "Get the happo-yoke charm — it's the only shrine in Japan famous specifically for protecting against misfortune from every direction. Considered the most comprehensive protection amulet available.",
        tips: [
            "The happo-yoke ritual can be done as a formal prayer (pay at the office)",
            "Much less crowded than Kamakura shrines — a peaceful contrast",
            "Visit during New Year for hatsumode if you can handle the crowds",
            "The surrounding area has good soba restaurants"
        ],
        bestSeason: "Year-round",
        access: "5 min walk from Miyayama Station (JR Sagami Line)",
        hours: "6:00-17:00",
        imageURLs: []
    ),

    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    // MARK: - Kita-Kamakura
    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

    Shrine(
        id: UUID(uuidString: "00000001-0000-0000-0000-000000000073")!,
        name: "Engaku-ji",
        address: "409 Yamanouchi, Kamakura, Kanagawa",
        description: "Founded in 1282 to honor the fallen soldiers of the Mongol invasions, Engaku-ji is the second-ranked Zen temple in Kamakura's prestigious Five Mountains system. The moment you step off the train at Kita-Kamakura Station, the temple's massive Sanmon gate rises directly before you, framed by towering cedars. Its Shariden (relic hall) is a National Treasure, and the hilltop bell — cast in 1301 — is the largest temple bell in Kamakura.",
        coordinate: CLLocationCoordinate2D(latitude: 35.3387, longitude: 139.5467),
        stampSlotId: 73,
        category: .tera,
        tagline: "Kamakura's second Zen temple, born from the ashes of the Mongol wars",
        highlights: [
            "Second-ranked in Kamakura's Five Mountains Zen hierarchy",
            "Shariden (relic hall) — a National Treasure of delicate Song-dynasty architecture",
            "Ogane bell (1301) — Kamakura's largest, with a panoramic hilltop view",
            "Autumn maples framing the Sanmon gate are legendary"
        ],
        mustSee: "Climb up to the Ogane bell platform — the 1301 bronze bell is one of Kamakura's National Treasures, and the hilltop view over the temple rooftops and forested valley is stunning.",
        tips: [
            "The temple is literally at the station exit of Kita-Kamakura — you can't miss it",
            "Saturday morning zazen meditation sessions (8:00) are open to all — arrive 15 min early",
            "The Sanmon gate framed by autumn maples in late November is peak Kamakura beauty",
            "Combine with Tokei-ji and Jochi-ji for a full Kita-Kamakura morning"
        ],
        bestSeason: "Late Nov-early Dec (autumn maples), Jun (hydrangeas)",
        access: "1 min walk from Kita-Kamakura Station (JR Yokosuka Line)",
        hours: "8:00-16:30 (Dec-Feb 8:00-16:00)",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000001-0000-0000-0000-000000000074")!,
        name: "Jochi-ji",
        address: "1402 Yamanouchi, Kamakura, Kanagawa",
        description: "The fourth-ranked temple of Kamakura's Five Mountains, Jochi-ji hides a rare treasure: a cave containing figures of the Seven Gods of Fortune carved into the rock. The intimate temple grounds feel like a secret garden tucked into a narrow valley, with moss-covered paths winding past ancient stone stupas and a thatched-roof gate that photographers adore.",
        coordinate: CLLocationCoordinate2D(latitude: 35.3337, longitude: 139.5451),
        stampSlotId: 74,
        category: .tera,
        tagline: "A secret valley garden with the Seven Gods of Fortune in a cave",
        highlights: [
            "Fourth of Kamakura's Five Mountains Zen temples",
            "Cave shrine with carved Seven Gods of Fortune (Shichifukujin)",
            "Thatched Chinese-style Sanmon gate — one of the most photogenic in Kamakura",
            "Moss-covered stone stupas and tranquil garden paths"
        ],
        mustSee: "Duck into the cave at the rear of the grounds — the carved Seven Gods of Fortune emerge from the rock walls, lit by candles. It is one of Kamakura's most atmospheric hidden corners.",
        tips: [
            "Much less crowded than Engaku-ji or Kencho-ji — a genuine local secret",
            "The thatched Sanmon gate is stunning when draped in fresh green or autumn color",
            "Located on the Daibutsu hiking trail — combine it with a walk to the Great Buddha",
            "Entrance \u{00A5}200, allow 30 minutes for a leisurely visit"
        ],
        bestSeason: "Jun (hydrangeas and lush moss), Nov (autumn colors)",
        access: "8 min walk from Kita-Kamakura Station (JR Yokosuka Line)",
        hours: "9:00-16:30",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000001-0000-0000-0000-000000000077")!,
        name: "Meigetsuin",
        address: "189 Yamanouchi, Kamakura, Kanagawa",
        description: "Known throughout Japan as the 'Hydrangea Temple,' Meigetsuin explodes into a sea of pale blue ajisai flowers every June, drawing thousands of visitors to its narrow hillside paths. But its most famous feature is visible year-round: the perfectly circular window (marumado) in the main hall that frames a Zen garden like a living painting, changing with every season.",
        coordinate: CLLocationCoordinate2D(latitude: 35.3354, longitude: 139.5481),
        stampSlotId: 77,
        category: .tera,
        tagline: "The Hydrangea Temple — a sea of blue in June and a perfect round window",
        highlights: [
            "2,500+ pale blue hydrangeas covering every path in June",
            "Iconic circular window (marumado) framing the inner garden like a painting",
            "Inner garden opens twice yearly — June hydrangeas and December autumn maples",
            "Rabbit sculptures and a real rabbit hutch delight visitors of all ages"
        ],
        mustSee: "Sit before the circular window (marumado) in the main hall — it perfectly frames the Zen garden behind it, creating a living painting that changes color with the seasons. In autumn, the frame fills with fiery red.",
        tips: [
            "June weekdays are far better than weekends — expect long queues on Saturday/Sunday",
            "Arrive at 8:30 AM opening in June to beat the crowds by at least an hour",
            "The inner garden (\u{00A5}500 extra) opens only in June and late November — don't miss it",
            "The rabbits carved into various spots around the temple are a charming scavenger hunt"
        ],
        bestSeason: "Jun (hydrangeas — peak season), Late Nov (autumn colors through the round window)",
        access: "10 min walk from Kita-Kamakura Station (JR Yokosuka Line)",
        hours: "9:00-16:00 (Jun 8:30-17:00)",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000001-0000-0000-0000-000000000078")!,
        name: "Tokei-ji",
        address: "1367 Yamanouchi, Kamakura, Kanagawa",
        description: "For over 600 years, Tokei-ji served as Japan's only 'divorce temple' — a sanctuary where women could dissolve marriages by living within its walls for three years, at a time when only men had the right to divorce. Founded in 1285 by the widow of regent Hojo Tokimune, this former nunnery is now a serene flower temple where plum blossoms, irises, and bush clover mark the passing seasons.",
        coordinate: CLLocationCoordinate2D(latitude: 35.3362, longitude: 139.5462),
        stampSlotId: 78,
        category: .tera,
        tagline: "Japan's historic divorce temple — where women found freedom for 600 years",
        highlights: [
            "Japan's only 'divorce temple' — women's refuge for over 600 years",
            "Founded by the widow of the regent who repelled the Mongol invasions",
            "Seasonal flowers year-round: plum, magnolia, iris, bush clover",
            "Treasure house with Important Cultural Properties from the nunnery era"
        ],
        mustSee: "Walk slowly through the flower garden behind the main hall — each season brings different blooms, and the quiet atmosphere of this former nunnery has a gentle, contemplative energy unlike any other temple in Kamakura.",
        tips: [
            "February plum blossoms and June irises are the peak flower seasons",
            "The treasure house (\u{00A5}300 extra) displays artifacts from the temple's centuries as a nunnery",
            "Pair with Engaku-ji (3 min walk) and Jochi-ji for a Kita-Kamakura trio",
            "The small cemetery in the back contains graves of notable literary figures"
        ],
        bestSeason: "Feb (plum blossoms), Jun (irises), Sept (bush clover)",
        access: "4 min walk from Kita-Kamakura Station (JR Yokosuka Line)",
        hours: "8:30-16:30 (Oct-Mar until 16:00)",
        imageURLs: []
    ),

    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    // MARK: - Kamakura (East / Nikaidō)
    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

    Shrine(
        id: UUID(uuidString: "00000001-0000-0000-0000-000000000075")!,
        name: "Zuisen-ji",
        address: "710 Nikaidō, Kamakura, Kanagawa",
        description: "Tucked into the far eastern hills of Kamakura, Zuisen-ji is a hidden gem famous for its Zen rock garden designed by the legendary monk Muso Soseki in the 14th century. The garden features natural rock caves carved into the cliffside that once served as meditation chambers. In February, the temple's plum grove is one of the earliest and most beautiful in all of Kamakura.",
        coordinate: CLLocationCoordinate2D(latitude: 35.3223, longitude: 139.5716),
        stampSlotId: 75,
        category: .tera,
        tagline: "A hidden Zen garden carved into the cliffs by a legendary monk",
        highlights: [
            "Zen rock garden designed by master monk Muso Soseki (14th century)",
            "Natural cliff caves (yagura) that served as meditation chambers",
            "One of Kamakura's earliest and finest plum blossom groves",
            "Far from the crowds — a true hidden temple in the eastern hills"
        ],
        mustSee: "Walk behind the main hall to the cliff garden — the rock caves carved directly into the hillside were meditation spaces for Zen monks 700 years ago. The moss and ferns growing over the carved stone create an otherworldly atmosphere.",
        tips: [
            "February plum blossoms here bloom earlier than most Kamakura temples",
            "The walk from Kamakura Station (25 min) passes through quiet residential lanes — very pleasant",
            "Combine with Hokoku-ji bamboo temple (15 min walk) for a peaceful east Kamakura half-day",
            "Entrance \u{00A5}200, allow 30-45 minutes to explore the garden and caves"
        ],
        bestSeason: "Feb (plum blossoms), Jun (hydrangeas), Nov (autumn colors)",
        access: "25 min walk from Kamakura Station or bus to Daitonomiya stop, then 10 min walk",
        hours: "9:00-17:00",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000001-0000-0000-0000-000000000076")!,
        name: "Sugimoto-dera",
        address: "903 Nikaidō, Kamakura, Kanagawa",
        description: "Founded in 734 AD — over 500 years before the samurai made Kamakura their capital — Sugimoto-dera is the oldest temple in all of Kamakura. The moss-covered stone staircase leading to the thatched-roof main hall is so ancient and weathered that visitors now use a side path, but the sight of those green-carpeted steps beneath towering cedar trees is one of the most evocative images in all of Kamakura.",
        coordinate: CLLocationCoordinate2D(latitude: 35.3201, longitude: 139.5624),
        stampSlotId: 76,
        category: .tera,
        tagline: "Kamakura's oldest temple — 734 AD and a moss-covered staircase frozen in time",
        highlights: [
            "Oldest temple in Kamakura — founded in 734 AD, predating the samurai era by 500 years",
            "Iconic moss-covered stone staircase (now closed for preservation)",
            "Thatched-roof main hall housing three Eleven-Headed Kannon statues",
            "White banners (nobori) lining the approach create a striking visual"
        ],
        mustSee: "Stand at the base and look up the moss-covered stone staircase — closed to foot traffic to preserve the moss, it has become Kamakura's most photographed ancient scene. The green carpet of moss under the cedar canopy is breathtaking.",
        tips: [
            "The moss staircase photographs best after rain when the green is most vivid",
            "Combine with Hokoku-ji (5 min walk) and Jomyo-ji for an east Kamakura route",
            "The main hall interior is dark and atmospheric — three Kannon statues gaze down at you",
            "Entrance \u{00A5}300, allow 20-30 minutes"
        ],
        bestSeason: "Jun-Jul (moss at its greenest after rainy season), Year-round",
        access: "Bus from Kamakura Station to Sugimotodera stop (8 min), then 1 min walk",
        hours: "9:00-16:00",
        imageURLs: []
    ),

    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    // MARK: - Kamakura (West / Sasuke)
    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

    Shrine(
        id: UUID(uuidString: "00000001-0000-0000-0000-000000000083")!,
        name: "Kuzuharaoka Jinja",
        address: "Kajiwara, Kamakura, Kanagawa",
        description: "Nestled deep in the wooded hills behind the Daibutsu hiking trail, Kuzuharaoka Jinja is Kamakura's most romantic shrine — dedicated to the tragic love story of Hino Toshimoto, a courtier who died plotting to restore imperial rule in 1332. Today the shrine is beloved by couples who come to pray for lasting relationships, tying heart-shaped ema plaques beside the 'love stone' in the grounds.",
        coordinate: CLLocationCoordinate2D(latitude: 35.3277, longitude: 139.5433),
        stampSlotId: 83,
        category: .jinja,
        tagline: "Kamakura's hidden love shrine deep in the forested hills",
        highlights: [
            "Kamakura's premier romance shrine — couples flock for love blessings",
            "Heart-shaped ema plaques and the famous 'love stone' (Ume Ishiki)",
            "Hidden location deep in the forest along the Daibutsu hiking trail",
            "Dedicated to the tragic loyalist courtier Hino Toshimoto"
        ],
        mustSee: "Find the 'love stone' in the grounds — couples place offerings here and pray together. The heart-shaped ema wall nearby is covered in wishes from lovers across Japan.",
        tips: [
            "Best reached via the Daibutsu hiking trail from Jochi-ji or the Great Buddha side",
            "The trail can be muddy after rain — wear sturdy shoes",
            "Combine with Zeniarai Benten (money-washing shrine, 5 min walk) for a forest shrine duo",
            "Weekdays are nearly deserted — a wonderfully private shrine visit"
        ],
        bestSeason: "Apr-May (fresh green forest canopy), Nov (autumn colors on the hiking trail)",
        access: "20 min hike from Kita-Kamakura Station via Daibutsu trail, or 20 min walk from Kamakura Station",
        hours: "Open 24 hours (unstaffed at night)",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000001-0000-0000-0000-000000000084")!,
        name: "Sasuke Inari Jinja",
        address: "2-22-12 Sasuke, Kamakura, Kanagawa",
        description: "Hidden in a narrow valley behind Kamakura Station, Sasuke Inari Jinja is one of the most atmospheric shrines in all of Japan. Dozens of red torii gates tunnel through dense forest up a hillside to a cave shrine guarded by hundreds of small fox statues. Legend says the fox deity appeared in a dream to Minamoto no Yoritomo and told him to raise his army — leading to the founding of the Kamakura Shogunate.",
        coordinate: CLLocationCoordinate2D(latitude: 35.3227, longitude: 139.5417),
        stampSlotId: 84,
        category: .inari,
        tagline: "A tunnel of red torii and hundreds of fox guardians hidden in a forest cave",
        highlights: [
            "Dozens of red torii gates tunneling through forest to a cliffside cave",
            "Hundreds of small fox (kitsune) statues clustered around the cave shrine",
            "Legend links this shrine to the founding of the Kamakura Shogunate",
            "One of Kamakura's most atmospheric and least touristy spots"
        ],
        mustSee: "Walk through the red torii tunnel and climb to the cave shrine at the top — hundreds of moss-covered fox statues of every size crowd the rocky alcove. It feels like discovering a secret that has been here for centuries.",
        tips: [
            "The path can be slippery — wear shoes with grip, especially after rain",
            "Morning light filtering through the torii tunnel is the best time for photos",
            "Combine with Zeniarai Benten (3 min walk) for two of Kamakura's most mystical spots",
            "There are no facilities — bring water, especially in summer"
        ],
        bestSeason: "Year-round (moss and foxes are atmospheric in any weather; rainy days add mystique)",
        access: "20 min walk from Kamakura Station (west exit, through residential streets)",
        hours: "Open 24 hours (unstaffed at night)",
        imageURLs: []
    ),

    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    // MARK: - Ofuna
    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

    Shrine(
        id: UUID(uuidString: "00000001-0000-0000-0000-000000000079")!,
        name: "Ofuna Kannon-ji",
        address: "1-5-3 Okamoto, Kamakura, Kanagawa",
        description: "Rising 25 meters above the treetops near Ofuna Station, the gleaming white Kannon statue of Ofuna Kannon-ji is visible from the train and has been a landmark of the area since 1960. Originally conceived in 1929 as a prayer for peace, construction was interrupted by World War II and only completed 31 years later. The serene white figure gazing over the surrounding hills is a symbol of compassion and postwar hope.",
        coordinate: CLLocationCoordinate2D(latitude: 35.3465, longitude: 139.5349),
        stampSlotId: 79,
        category: .tera,
        tagline: "A 25-meter white Kannon watching over Ofuna — born from a prayer for peace",
        highlights: [
            "25-meter gleaming white Kannon statue visible from passing trains",
            "Construction began in 1929, interrupted by WWII, completed in 1960",
            "Symbol of peace and compassion — a postwar monument of hope",
            "Hilltop location with views across Ofuna and the surrounding hills"
        ],
        mustSee: "Climb the hill to the base of the statue and look up — the 25-meter white Kannon towering above you against the sky is profoundly moving, especially knowing the decades of war and peace that shaped its creation.",
        tips: [
            "You can see the statue from the JR train window approaching Ofuna Station — look left (southbound)",
            "The grounds are small and quiet — a 20-minute visit is sufficient",
            "Combine with a visit to the Ofuna Flower Center next door for a relaxing half-day",
            "Entrance \u{00A5}300, the hilltop is peaceful and rarely crowded"
        ],
        bestSeason: "Year-round (the white statue is striking against blue sky or dramatic clouds)",
        access: "5 min walk from Ofuna Station (JR Tokaido / Yokosuka Line, west exit)",
        hours: "9:00-16:30",
        imageURLs: []
    ),

    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    // MARK: - Yokohama
    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

    Shrine(
        id: UUID(uuidString: "00000001-0000-0000-0000-000000000080")!,
        name: "Iseyama Kotai Jingu",
        address: "64 Miyazakicho, Nishi, Yokohama, Kanagawa",
        description: "Perched on a hill overlooking the Yokohama skyline and Minato Mirai waterfront, Iseyama Kotai Jingu is Yokohama's most important shrine — often called 'Kanto's Ise Jingu' because it enshrines the same sun goddess Amaterasu as the great Ise Shrine. Established in 1870 during the Meiji era as the spiritual guardian of the newly opened port city, it remains the first place Yokohama residents visit at New Year.",
        coordinate: CLLocationCoordinate2D(latitude: 35.4498, longitude: 139.6305),
        stampSlotId: 80,
        category: .jingu,
        tagline: "Yokohama's guardian shrine — Amaterasu watching over the port city",
        highlights: [
            "Yokohama's highest-ranking shrine — 'Kanto's Ise Jingu'",
            "Enshrines Amaterasu, the same sun goddess as the great Ise Shrine",
            "Hilltop location with panoramic views of Minato Mirai and Landmark Tower",
            "Cherry blossoms along the approach and around the main hall in spring"
        ],
        mustSee: "Stand at the shrine's hilltop vantage point and look out — the futuristic Yokohama skyline with Landmark Tower and the Ferris wheel spread below you, creating a striking contrast of ancient and modern.",
        tips: [
            "New Year's hatsumode draws huge crowds — visit early morning on Jan 2 or 3 for a calmer experience",
            "The shrine is a short walk uphill from Sakuragicho Station — a good start to a Minato Mirai day",
            "Cherry blossoms on the approach slope are beautiful in late March",
            "The omamori (charms) here carry special weight as Yokohama's primary shrine"
        ],
        bestSeason: "Late Mar-Apr (cherry blossoms), Jan (hatsumode), Year-round",
        access: "10 min walk from Sakuragicho Station (JR Negishi Line / Yokohama Subway)",
        hours: "6:00-18:00 (shrine office 9:00-17:00)",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000001-0000-0000-0000-000000000081")!,
        name: "Soji-ji",
        address: "2-1-1 Tsurumi, Tsurumi, Yokohama, Kanagawa",
        description: "One of the two head temples of the Soto Zen Buddhist sect — the largest Zen school in Japan — Soji-ji's sprawling Tsurumi campus covers an astonishing 150,000 square meters. Originally founded in 1321 in Ishikawa Prefecture, it relocated to Yokohama in 1911. Over 200 trainee monks live and practice here daily, making it one of the most important active Zen training monasteries in the world.",
        coordinate: CLLocationCoordinate2D(latitude: 35.5036, longitude: 139.6754),
        stampSlotId: 81,
        category: .tera,
        tagline: "Head temple of Japan's largest Zen school — 200 monks train here daily",
        highlights: [
            "One of two head temples of Soto Zen — Japan's largest Zen school",
            "150,000 sq meter campus — one of the largest temple grounds in Kanto",
            "Over 200 trainee monks in active residence and daily practice",
            "The massive Sanmon gate and sweeping corridors are awe-inspiring"
        ],
        mustSee: "Walk the enormous Sanmon gate approach and through the main corridors — the sheer scale of the buildings, polished to a mirror finish by monks' daily cleaning practice, gives you a visceral sense of living Zen tradition.",
        tips: [
            "Zazen (seated meditation) sessions are open to the public — check the website for schedule",
            "The temple grounds are so large you could spend an hour just walking the corridors",
            "Tsurumi Station is only 5 min from Yokohama Station — easy to combine with a Yokohama day",
            "The Sanmon gate and Buddha hall are especially impressive — allow at least 1 hour"
        ],
        bestSeason: "Year-round (spring cherry blossoms on the approach avenue)",
        access: "5 min walk from Tsurumi Station (JR Keihin-Tohoku Line)",
        hours: "5:00-17:00 (visitor hours may vary; check ahead for zazen schedule)",
        imageURLs: []
    ),

    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    // MARK: - Hakone
    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

    Shrine(
        id: UUID(uuidString: "00000001-0000-0000-0000-000000000082")!,
        name: "Hakone Jinja",
        address: "80-1 Motohakone, Hakone, Ashigarashimo District, Kanagawa",
        description: "Standing on the forested shores of Lake Ashi with a vermillion torii gate rising from the water, Hakone Jinja is one of the most photographed shrines in all of Japan. On clear mornings, Mt. Fuji towers behind the lake torii in a composition so perfect it seems painted. Founded in 757 AD, the shrine has been a sacred site for mountain worship and a vital prayer stop for travelers crossing the Hakone Pass on the old Tokaido road.",
        coordinate: CLLocationCoordinate2D(latitude: 35.2350, longitude: 139.0221),
        stampSlotId: 82,
        category: .jinja,
        tagline: "A lakeside torii with Mt. Fuji — Japan's most perfect shrine photograph",
        highlights: [
            "Iconic red torii gate standing in Lake Ashi — Japan's most photographed shrine scene",
            "Mt. Fuji rising behind the lake on clear mornings — a once-in-a-lifetime view",
            "Ancient cedar-lined approach through dense forest to the lakeside",
            "Sacred site for mountain worship since 757 AD"
        ],
        mustSee: "Walk down the stone steps to the lakeside torii gate at dawn — on a clear morning, Mt. Fuji appears above the mist on the lake behind the red gate. It is quite possibly the most beautiful shrine view in Japan.",
        tips: [
            "Arrive before 8 AM for the lakeside torii without crowds — tour boats start at 9:30",
            "Winter mornings (Dec-Feb) offer the clearest Mt. Fuji views across the lake",
            "Take the sightseeing pirate ship across Lake Ashi for the full approach by water",
            "Combine with Hakone Shrine, the ropeway, and an onsen for a perfect Hakone day trip"
        ],
        bestSeason: "Dec-Feb (clearest Fuji views), Nov (autumn colors around the lake)",
        access: "Bus from Hakone-Yumoto Station to Motohakone stop (40 min), then 10 min walk",
        hours: "Open 24 hours (treasure hall 9:00-16:00)",
        imageURLs: []
    ),

    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    // MARK: - Kanagawa Additional (ID 113-120)
    // 鎌倉五山完結 + 主要神社
    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

    Shrine(
        id: UUID(uuidString: "00000002-0000-0000-0000-000000000113")!,
        name: "Oyama Afuri Jinja",
        address: "125 Oyama, Isehara, Kanagawa",
        description: "Perched partway up the sacred Mt. Oyama (1,252m), Oyama Afuri Jinja has been a center of mountain worship since the 3rd century. 'Afuri' means 'rain-falling' — the mountain's frequent rain was seen as a gift from the rain deity. During the Edo period, 'Oyama-mairi' pilgrimages were so popular that a ukiyo-e-worthy culture of inns, tofu cuisine, and ritual waterfall purification flourished along the mountain path. The cable car ride up through ancient cedar forest is spectacular.",
        coordinate: CLLocationCoordinate2D(latitude: 35.4235, longitude: 139.2282),
        stampSlotId: 113,
        category: .jinja,
        tagline: "The rain deity's mountain shrine — a sacred peak worshipped since antiquity",
        highlights: [
            "Sacred mountain shrine dating to the 3rd century — 'Afuri' means rain-falling",
            "Cable car through ancient cedar forest to the shrine terrace",
            "Panoramic views from the shrine — on clear days, Tokyo Skytree and beyond",
            "Edo-era Oyama-mairi pilgrimage route with traditional tofu restaurants"
        ],
        mustSee: "The view from the shrine's lower terrace — on a clear day you can see from Enoshima and Sagami Bay all the way to the Tokyo skyline, with layers of mountains behind you.",
        tips: [
            "Take the cable car (¥640 one way) — the walk is steep and takes about 40 minutes",
            "Try Oyama tofu at the restaurants along the approach — a 300-year-old culinary tradition",
            "November night illumination of the autumn leaves is absolutely magical",
            "The summit shrine (90 min hike from cable car) rewards with Mt. Fuji views on clear days"
        ],
        bestSeason: "Nov (autumn illumination), Jun (hydrangeas on the path), Year-round",
        access: "Bus from Isehara Station (Odakyu Line) to Oyama Cable (25 min), then cable car",
        hours: "6:00-17:00 (cable car 9:00-16:30, extended during illumination)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000002-0000-0000-0000-000000000114")!,
        name: "Hotoku Ninomiya Jinja",
        address: "Jonai, Odawara, Kanagawa",
        description: "Located within the grounds of Odawara Castle, Hotoku Ninomiya Jinja enshrines Ninomiya Sontoku (Kinjiro) — one of Japan's most beloved historical figures. Sontoku was a peasant boy who lifted his family and entire village from poverty through relentless study and hard work; the image of young Kinjiro reading a book while carrying firewood is one of Japan's most iconic images, once found at every school. The shrine, established in 1894, celebrates the virtues of diligence, thrift, and community service.",
        coordinate: CLLocationCoordinate2D(latitude: 35.2506, longitude: 139.1529),
        stampSlotId: 114,
        category: .jinja,
        tagline: "The shrine of diligence — honoring the boy who read while carrying firewood",
        highlights: [
            "Enshrines Ninomiya Sontoku — one of Japan's most beloved historical figures",
            "Located within Odawara Castle's scenic grounds",
            "The reading-while-walking Kinjiro statue was once at every Japanese school",
            "A shrine to diligence, thrift, and community service — uniquely inspirational"
        ],
        mustSee: "The original Ninomiya Kinjiro statue — the boy reading a book while carrying firewood on his back. This image was once so universal in Japan that it appeared on the ¥1 note.",
        tips: [
            "Combine with Odawara Castle (same grounds) — one of Japan's best-restored castles",
            "Try kamaboko (fish cake) — Odawara is the kamaboko capital of Japan",
            "Students visit for academic success blessings — appropriate given Sontoku's legacy",
            "The castle park is stunning during cherry blossom season in late March-early April"
        ],
        bestSeason: "Late Mar-Apr (cherry blossoms at the castle), Year-round",
        access: "15 min walk from Odawara Station (JR Tokaido Shinkansen / Odakyu Line)",
        hours: "Open 24 hours (office 9:00-17:00)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000002-0000-0000-0000-000000000115")!,
        name: "Hiratsuka Hachimangu",
        address: "1-6-12 Asahi, Hiratsuka, Kanagawa",
        description: "The most important shrine in the Shonan area, Hiratsuka Hachimangu was founded by Emperor Nintoku in the 4th century — making it one of the oldest shrines in Kanagawa. The shrine enshrines Ojin Tenno (Emperor Ojin), the deity of martial arts and protection. Its location near the old Tokaido road made it a vital rest stop for travelers between Edo and Kyoto. The annual Hiratsuka Tanabata Festival in July transforms the area around the shrine into one of Japan's largest star festivals.",
        coordinate: CLLocationCoordinate2D(latitude: 35.3306, longitude: 139.3503),
        stampSlotId: 115,
        category: .hachimangu,
        tagline: "Shonan's guardian — a 4th-century shrine and gateway to the Tanabata Festival",
        highlights: [
            "One of the oldest shrines in Kanagawa — founded in the 4th century",
            "Shonan area's most important shrine on the old Tokaido road",
            "Gateway to the Hiratsuka Tanabata Festival — one of Japan's biggest star festivals",
            "Beautiful 'chinowakyuguri' (reed ring) purification in June"
        ],
        mustSee: "Visit during the Hiratsuka Tanabata Festival (first week of July) — the shopping arcades near the shrine explode with giant, colorful streamers and decorations in one of Japan's top three Tanabata celebrations.",
        tips: [
            "The Tanabata Festival in early July draws 3 million visitors — plan accordingly",
            "After the shrine, walk to Hiratsuka Beach for Shonan's laid-back surf culture",
            "The setsubun ceremony in February is lively with celebrity bean-throwers",
            "Quiet on ordinary days — a genuine local shrine experience"
        ],
        bestSeason: "Early Jul (Tanabata Festival), Feb (setsubun), Year-round",
        access: "20 min walk from Hiratsuka Station (JR Tokaido Line)",
        hours: "Open 24 hours (office 9:00-17:00)",
        imageURLs: []
    ),

    // 九頭龍神社
    Shrine(
        id: UUID(uuidString: "00000002-0000-0000-0000-000000000116")!,
        name: "Hakone Kuzuryu Jinja",
        address: "Motohakone, Hakone, Kanagawa",
        description: "Tucked deep in the forest on the shore of Lake Ashi, Hakone Kuzuryu Jinja (Nine-Headed Dragon Shrine) is one of Japan's most powerful power spots for love and success. The shrine tamed the nine-headed dragon that once terrorized Lake Ashi, turning it into a protective deity. On the 13th of every month, a special boat ferries pilgrims across the lake for the 'monthly worship' — a ritual so popular that devotees travel from across Japan. The combination of lake, forest, and dragon mythology creates an atmosphere of pure magic.",
        coordinate: CLLocationCoordinate2D(latitude: 35.2089, longitude: 139.0237),
        stampSlotId: 116,
        category: .jinja,
        tagline: "The dragon shrine of Lake Ashi — Japan's ultimate power spot for love",
        highlights: [
            "One of Japan's most powerful power spots for romance and career success",
            "The legend of the nine-headed dragon tamed to protect Lake Ashi",
            "Monthly 13th worship — special boats ferry pilgrims across the lake",
            "Deep forest lakeside setting creates an otherworldly atmosphere"
        ],
        mustSee: "The lakeside worship area at dawn — mist rises from Lake Ashi, the forest frames the tiny shrine, and (if you're lucky) Mt. Fuji appears through the haze. It feels like stepping into a Miyazaki film.",
        tips: [
            "The main shrine is a 30-minute forest walk from Hakone Shrine — combine both",
            "Monthly 13th worship has a special sightseeing boat from Togendai (reservations fill fast)",
            "There's a smaller new shrine near Hakone Shrine that's easier to access",
            "Buy the dragon-themed love charm (ryugu-den omamori) — it's the shrine's signature"
        ],
        bestSeason: "Year-round (monthly 13th for special worship), Nov (autumn foliage around the lake)",
        access: "30 min forest walk from Hakone Shrine, or boat on the 13th from Togendai",
        hours: "Open 24 hours (shrine office 9:00-16:00)",
        imageURLs: []
    ),

    // 鎌倉五山 第三位 — 寿福寺
    Shrine(
        id: UUID(uuidString: "00000002-0000-0000-0000-000000000117")!,
        name: "Jufuku-ji",
        address: "1-17-7 Ogigayatsu, Kamakura, Kanagawa",
        description: "Ranked third among the Kamakura Five Mountains (鎌倉五山), Jufuku-ji was founded in 1200 by Hojo Masako — the wife of Japan's first shogun and one of the most powerful women in Japanese history. She invited the great Zen master Eisai (who brought tea culture from China) to be its founding priest. The moss-covered stone path through the cedar forest is considered one of the most beautiful temple approaches in all of Kamakura. The inner grounds are normally closed, making the approach path its own reward.",
        coordinate: CLLocationCoordinate2D(latitude: 35.3248, longitude: 139.5453),
        stampSlotId: 117,
        category: .tera,
        tagline: "The shogun's widow's temple — the most beautiful approach in Kamakura",
        highlights: [
            "Third of the Kamakura Five Mountains (鎌倉五山 第三位)",
            "Founded by Hojo Masako — the 'Nun Shogun,' one of Japan's most powerful women",
            "Founding priest Eisai brought tea culture from China to Japan",
            "Moss-covered stone approach through cedars — Kamakura's most atmospheric path"
        ],
        mustSee: "The moss-covered stone approach — the narrow path lined with towering cedars, the stones softened by centuries of moss, is considered the most beautiful temple entrance in all of Kamakura.",
        tips: [
            "The inner grounds are normally closed — but the approach path is the real treasure",
            "At the back of the valley, the rock-cut graves of Hojo Masako and Minamoto Sanetomo can be visited",
            "Just 5 minutes from Kamakura Station — perfect as a quiet start to a temple day",
            "Combine with Engaku-ji and Kencho-ji for a 'Kamakura Five Mountains' pilgrimage"
        ],
        bestSeason: "Jun (moss and hydrangeas), Nov-Dec (autumn foliage), Year-round",
        access: "10 min walk from Kamakura Station (JR Yokosuka Line)",
        hours: "Approach path open 24 hours (inner grounds normally closed)",
        imageURLs: []
    ),

    // 鎌倉五山 第五位 — 浄妙寺
    Shrine(
        id: UUID(uuidString: "00000002-0000-0000-0000-000000000118")!,
        name: "Jomyo-ji",
        address: "3-8-31 Jomyoji, Kamakura, Kanagawa",
        description: "The fifth and easternmost of the Kamakura Five Mountains, Jomyo-ji is the most serene and accessible of the five great Zen temples. Founded in 1188, the temple is famous for its elegant dry landscape garden and a remarkable surprise: a refined English-style tearoom (Ishigama Garden Terrace) with freshly baked scones served in a beautiful stone building on the grounds. It's where Zen austerity meets English afternoon tea — and somehow it works perfectly.",
        coordinate: CLLocationCoordinate2D(latitude: 35.3231, longitude: 139.5711),
        stampSlotId: 118,
        category: .tera,
        tagline: "Zen garden meets English tea — the most surprising temple in Kamakura",
        highlights: [
            "Fifth of the Kamakura Five Mountains (鎌倉五山 第五位)",
            "Beautiful dry landscape rock garden for Zen contemplation",
            "Ishigama Garden Terrace — English-style tea and scones in a temple!",
            "Matcha tea ceremony available in the traditional tea house"
        ],
        mustSee: "The Ishigama Garden Terrace — a converted stone storehouse serving English afternoon tea with freshly baked scones and clotted cream, overlooking the temple gardens. Zen austerity and English gentility in perfect harmony.",
        tips: [
            "Have matcha at the traditional tea house (Kisen-an) AND scones at the Garden Terrace",
            "Less crowded than other Kamakura temples — you may have the garden to yourself",
            "Walk further east to Hokoku-ji (bamboo temple, 5 min) to complete the eastern temples",
            "The Kamakura-gu shrine is nearby — combine for a rich half-day in eastern Kamakura"
        ],
        bestSeason: "Late Mar-Apr (cherry blossoms), Nov-Dec (autumn foliage), Year-round",
        access: "Bus from Kamakura Station to Jomyoji stop (10 min), or 25 min walk",
        hours: "9:00-16:30",
        imageURLs: []
    ),

    // 森戸神社
    Shrine(
        id: UUID(uuidString: "00000002-0000-0000-0000-000000000119")!,
        name: "Morito Jinja",
        address: "849 Horiuchi, Hayama, Kanagawa",
        description: "Perched on the rocky Hayama coastline with sweeping views of Sagami Bay and Mt. Fuji, Morito Jinja is the most beautifully situated seaside shrine in the Kanto region. Founded in 1180 by Minamoto no Yoritomo during his exile, the shrine has watched over Hayama's coast for over 800 years. The offshore Najima rock with its tiny torii gate, the sound of waves crashing below, and Mt. Fuji glowing at sunset create an almost impossibly romantic scene.",
        coordinate: CLLocationCoordinate2D(latitude: 35.2703, longitude: 139.5744),
        stampSlotId: 119,
        category: .jinja,
        tagline: "Hayama's seaside shrine — Mt. Fuji sunsets and ocean-sprayed torii",
        highlights: [
            "Stunning seaside location with Mt. Fuji views across Sagami Bay",
            "Offshore Najima rock with a tiny torii gate standing in the waves",
            "Founded by Japan's first shogun during his exile in 1180",
            "One of the most romantic shrine settings in all of Japan"
        ],
        mustSee: "The sunset view — stand at the shrine and watch the sun set behind Mt. Fuji across Sagami Bay, with the tiny torii on Najima rock silhouetted in the golden water. One of the most beautiful views in Kanagawa.",
        tips: [
            "Come in the late afternoon for the sunset — it is absolutely spectacular on clear days",
            "Winter (Dec-Feb) offers the clearest Mt. Fuji views and most dramatic sunsets",
            "Hayama is the Imperial family's beach retreat — the town has a refined, laid-back atmosphere",
            "The shrine's love-related charms are popular — the seaside setting makes them special"
        ],
        bestSeason: "Dec-Feb (clearest Fuji sunsets), Year-round",
        access: "Bus from Zushi Station (JR) to Morito Kaigan stop (15 min), then 3 min walk",
        hours: "9:00-16:00 (grounds open sunrise to sunset)",
        imageURLs: []
    ),

    // 走水神社
    Shrine(
        id: UUID(uuidString: "00000002-0000-0000-0000-000000000120")!,
        name: "Hashirimizu Jinja",
        address: "2-12-5 Hashirimizu, Yokosuka, Kanagawa",
        description: "One of Japan's most moving shrines, Hashirimizu Jinja marks the spot where, according to the Kojiki (Japan's oldest historical record), Princess Ototachibana sacrificed herself to calm the stormy seas so her husband, the legendary hero Yamato Takeru, could cross safely to the Boso Peninsula. The shrine sits on a hillside overlooking the narrow strait between Yokosuka and Chiba, exactly where the ancient story took place. The sacred spring water is some of the purest in Kanagawa.",
        coordinate: CLLocationCoordinate2D(latitude: 35.2456, longitude: 139.7231),
        stampSlotId: 120,
        category: .jinja,
        tagline: "Where a princess gave her life for love — Japan's most touching ancient legend",
        highlights: [
            "Site of Princess Ototachibana's legendary sacrifice from the Kojiki",
            "Overlooks the strait where the ancient story took place",
            "Sacred spring water — some of the purest natural water in Kanagawa",
            "Deep connection to Yamato Takeru — one of Japan's greatest legendary heroes"
        ],
        mustSee: "The view from the hilltop shrine across the Uraga Channel to the Boso Peninsula — this is the exact stretch of water where, in legend, Princess Ototachibana threw herself into the waves to save her beloved Yamato Takeru.",
        tips: [
            "Fill a bottle at the sacred spring — locals treasure this water for tea and cooking",
            "The shrine is small but the story behind it is one of Japan's greatest love stories",
            "Combine with Yokosuka's naval port area for a unique contrast of ancient legend and modern military",
            "The coastal walk around Hashirimizu is beautiful and uncrowded"
        ],
        bestSeason: "Year-round (winter for clearest strait views)",
        access: "Bus from Yokosuka-chuo Station (Keikyu Line) to Hashirimizu Jinja stop (15 min)",
        hours: "Open 24 hours (office 9:00-16:00)",
        imageURLs: []
    ),

    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    // MARK: - Kawasaki (Takatsu / Tama / Kawasaki-ku)
    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

    Shrine(
        id: UUID(uuidString: "00000002-0000-0000-0000-000000000123")!,
        name: "Mizonokuchi Jinja",
        address: "3-13-3 Mizonokuchi, Takatsu-ku, Kawasaki, Kanagawa",
        description: "The main guardian shrine of Mizonokuchi, one of Kawasaki's busiest commercial districts. Enshrining Susano-o-no-Mikoto, the shrine dates back over 400 years and serves as the spiritual anchor for the Takatsu area. Despite its urban setting wedged between train lines and shopping streets, the compact grounds maintain a calm atmosphere with well-kept greenery.",
        coordinate: CLLocationCoordinate2D(latitude: 35.6012, longitude: 139.6107),
        stampSlotId: 123,
        category: .jinja,
        tagline: "The spiritual anchor of bustling Mizonokuchi",
        highlights: [
            "Guardian shrine of the Takatsu area for over 400 years",
            "Annual summer festival (Reisai) fills Mizonokuchi streets with mikoshi parades",
            "Popular hatsumode destination for southern Kawasaki residents",
            "Compact but well-maintained grounds with seasonal flowers"
        ],
        mustSee: "Visit during the August Reisai festival when the normally quiet shrine grounds erupt with energy — mikoshi portable shrines are carried through the Mizonokuchi shopping streets.",
        tips: [
            "Just 2 minutes from Mizonokuchi Station — easy to visit while shopping",
            "The shrine sells unique Kawasaki-themed omamori (charms)",
            "Good starting point for exploring the Takatsu-ku shrine circuit",
            "Hatsumode (New Year) crowds are manageable compared to central Tokyo shrines"
        ],
        bestSeason: "New Year / August festival",
        access: "2 min walk from Mizonokuchi Station (Tokyu Den-en-toshi / Tokyu Oimachi Line)",
        hours: "Open 24 hours (office 9:00-16:30)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000002-0000-0000-0000-000000000124")!,
        name: "Yokoji",
        address: "4-9-1 Shimosakunobe, Takatsu-ku, Kawasaki, Kanagawa",
        description: "The oldest temple in Kawasaki, founded in the 7th century during the Asuka period. The Yakushi-do (Healing Buddha Hall) houses an important wooden Yakushi Nyorai statue designated as a national Important Cultural Property. The temple's long history predates Kawasaki itself — it was already ancient when the surrounding farmland was first being settled.",
        coordinate: CLLocationCoordinate2D(latitude: 35.5905, longitude: 139.6220),
        stampSlotId: 124,
        category: .tera,
        tagline: "Kawasaki's oldest temple — 1,300 years of healing prayers",
        highlights: [
            "Founded in the 7th century — predates the city of Kawasaki by centuries",
            "Yakushi Nyorai statue designated as an Important Cultural Property",
            "Ancient camphor trees line the quiet temple grounds",
            "Archaeological site revealing layers of Kawasaki's earliest history"
        ],
        mustSee: "The Yakushi-do hall with its ancient wooden Yakushi Nyorai (Healing Buddha) — one of the oldest Buddhist statues in the Kanto region, radiating centuries of devotion.",
        tips: [
            "The temple grounds are quiet and rarely crowded — a hidden gem",
            "Look for the massive camphor trees near the main hall",
            "Combine with nearby Kuji Jinja for a Takatsu temple-shrine walk",
            "The surrounding residential area retains some old Kawasaki charm"
        ],
        bestSeason: "Year-round (autumn foliage in November)",
        access: "10 min walk from Kajigaya Station (Tokyu Den-en-toshi Line)",
        hours: "Open 24 hours (hall interior by appointment)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000002-0000-0000-0000-000000000125")!,
        name: "Kuji Jinja",
        address: "3-17-1 Kuji, Takatsu-ku, Kawasaki, Kanagawa",
        description: "A tranquil neighborhood shrine nestled in the Kuji area of Takatsu-ku, near the historic Nikaryou Irrigation Canal. The shrine has served as the local guardian deity since the Edo period, and its grounds offer a peaceful retreat from the surrounding residential area. The annual autumn festival features traditional kagura performances.",
        coordinate: CLLocationCoordinate2D(latitude: 35.6050, longitude: 139.5950),
        stampSlotId: 125,
        category: .jinja,
        tagline: "A quiet guardian along the historic Nikaryou Canal",
        highlights: [
            "Historic connection to the Nikaryou Irrigation Canal (二ヶ領用水)",
            "Autumn festival with traditional kagura dance performances",
            "Beautiful cherry blossom spot along the canal path",
            "Well-preserved Edo-period shrine architecture"
        ],
        mustSee: "Walk the cherry-blossom-lined Nikaryou Canal path from the shrine — in spring, the canal becomes one of Kawasaki's best secret hanami spots.",
        tips: [
            "The Nikaryou Canal path connects to several other Takatsu shrines — great for a walking tour",
            "Cherry blossom season (late March-early April) is particularly beautiful here",
            "Much quieter than Mizonokuchi — perfect for a contemplative visit",
            "Combine with Yokoji temple nearby for a half-day Takatsu exploration"
        ],
        bestSeason: "Spring (cherry blossoms along canal) / Autumn (festival)",
        access: "12 min walk from Mizonokuchi Station or 8 min walk from Tsudayama Station (Nambu Line)",
        hours: "Open 24 hours (office 9:00-16:00)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000002-0000-0000-0000-000000000126")!,
        name: "Nagao Jinja",
        address: "3-3-1 Nagao, Tama-ku, Kawasaki, Kanagawa",
        description: "A hillside shrine in Tama-ku's Nagao neighborhood with ancient roots reaching back over 1,000 years. Enshrining the deity of agriculture and prosperity, the shrine sits atop a forested hill that offers a surprising pocket of nature in suburban Kawasaki. The approach through tall trees feels like entering another era entirely.",
        coordinate: CLLocationCoordinate2D(latitude: 35.6080, longitude: 139.5790),
        stampSlotId: 126,
        category: .jinja,
        tagline: "A hillside sanctuary hidden in suburban Kawasaki",
        highlights: [
            "Over 1,000 years of history as the local guardian deity",
            "Forested hillside approach feels like a mountain shrine",
            "Views over the Tama-ku residential area from the hilltop",
            "Rich wildlife — birds and insects drawn to the preserved forest"
        ],
        mustSee: "The stone staircase approach through the forest — climbing through towering trees, you'll forget you're minutes from a train station. The hilltop offers a panoramic view of the Tama hills.",
        tips: [
            "Wear sturdy shoes — the hillside path can be uneven",
            "Early morning visits are magical with birdsong echoing through the trees",
            "Combine with nearby Myorakuji for a Tama-ku nature walk",
            "The forest canopy makes this a cool retreat even in summer"
        ],
        bestSeason: "Year-round (summer for forest shade, autumn for foliage)",
        access: "15 min walk from Mukogaoka-Yuen Station (Odakyu Line)",
        hours: "Open 24 hours",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000002-0000-0000-0000-000000000127")!,
        name: "Myorakuji",
        address: "7-1 Nagao, Tama-ku, Kawasaki, Kanagawa",
        description: "Known locally as 'Ajisai-dera' (Hydrangea Temple), Myorakuji bursts with over 1,000 hydrangea bushes every June, transforming the hillside temple grounds into a sea of blue, purple, and pink. Founded in the Kamakura period, the temple preserves a contemplative atmosphere year-round, but the hydrangea season draws visitors from across Kawasaki and beyond.",
        coordinate: CLLocationCoordinate2D(latitude: 35.6090, longitude: 139.5680),
        stampSlotId: 127,
        category: .tera,
        tagline: "Kawasaki's Hydrangea Temple — 1,000 blooms on a hillside",
        highlights: [
            "Over 1,000 hydrangea bushes in 28 varieties bloom every June",
            "Kamakura-period temple with authentic Zen atmosphere",
            "Hillside grounds with winding paths through seasonal flowers",
            "Far less crowded than Kamakura's famous hydrangea temples"
        ],
        mustSee: "Visit in mid-June when the hydrangeas peak — the hillside paths wind through walls of blue, purple, and pink blooms. Unlike Kamakura's Meigetsuin, you can enjoy the flowers without the crushing crowds.",
        tips: [
            "Peak hydrangea season: mid-June to early July",
            "Come early morning for the best photos without crowds",
            "Combine with Nagao Jinja next door for a nature-filled half day",
            "The temple grounds are beautiful year-round — plum blossoms in February, autumn leaves in November"
        ],
        bestSeason: "June (hydrangea peak)",
        access: "15 min walk from Mukogaoka-Yuen Station (Odakyu Line)",
        hours: "9:00-16:30",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000002-0000-0000-0000-000000000128")!,
        name: "Inage Jinja",
        address: "1-6-10 Kawasaki-ku, Kawasaki, Kanagawa",
        description: "The most important shrine in Kawasaki City, with a history stretching back to the reign of Emperor Keiko (1st century CE according to tradition). Enshrining Takeinadane-no-Mikoto, the shrine serves as the primary guardian of Kawasaki and hosts the city's largest traditional festivals. Located near the bustling Kawasaki Station, it bridges the ancient spiritual world with one of Japan's most dynamic urban centers.",
        coordinate: CLLocationCoordinate2D(latitude: 35.5305, longitude: 139.7010),
        stampSlotId: 128,
        category: .jinja,
        tagline: "The principal guardian shrine of Kawasaki City",
        highlights: [
            "Kawasaki's most important shrine — nearly 2,000 years of legendary history",
            "August Reisai is the largest traditional festival in the city",
            "Sacred bonfire ceremony (Tondo) in January burns thousands of New Year decorations",
            "Unique blend of ancient shrine and ultra-modern urban setting"
        ],
        mustSee: "The August Reisai festival turns the area around Kawasaki Station into a massive celebration — mikoshi parades, traditional music, and street food fill the streets for three days.",
        tips: [
            "Just 5 minutes from JR Kawasaki Station — easy to visit anytime",
            "The shrine grounds are an oasis of calm between the station and the shopping area",
            "Pair with a visit to Kawasaki Daishi for the complete Kawasaki shrine experience",
            "The prayer hall architecture is impressive — take time to admire the carvings"
        ],
        bestSeason: "August (Reisai festival) / New Year",
        access: "5 min walk from Kawasaki Station (JR / Keikyu)",
        hours: "Open 24 hours (office 9:00-17:00)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000002-0000-0000-0000-000000000129")!,
        name: "Hie Daijinja",
        address: "4-3-1 Mizonokuchi, Takatsu-ku, Kawasaki, Kanagawa",
        description: "A historic branch of the famous Hie shrine tradition, this compact yet dignified shrine sits quietly in the Mizonokuchi area. Enshrining Oyamakui-no-Kami, the mountain deity, it has protected the local community since the Muromachi period. The shrine is known for its connection to agricultural blessings and its role in the area's traditional festival circuit.",
        coordinate: CLLocationCoordinate2D(latitude: 35.6025, longitude: 139.6050),
        stampSlotId: 129,
        category: .jinja,
        tagline: "Mountain deity guardian of Mizonokuchi since the Muromachi era",
        highlights: [
            "Branch of the prestigious Hie shrine lineage (Sanno tradition)",
            "Muromachi-period origins — over 500 years of local worship",
            "Participates in the Takatsu-ku traditional festival circuit",
            "Intimate grounds with a neighborhood shrine atmosphere"
        ],
        mustSee: "The approach path lined with stone lanterns — small but perfectly formed, it captures the essence of a neighborhood guardian shrine that has watched over this community for five centuries.",
        tips: [
            "Very local atmosphere — you'll likely be the only visitor",
            "The shrine is part of the Takatsu shrine circuit with Mizonokuchi Jinja and Kuji Jinja",
            "Good omamori selection for safe travel and family protection",
            "Walking distance from Mizonokuchi — combine with shopping"
        ],
        bestSeason: "Year-round",
        access: "7 min walk from Mizonokuchi Station (Tokyu Den-en-toshi Line)",
        hours: "Open 24 hours (office hours vary)",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000002-0000-0000-0000-000000000130")!,
        name: "Noborito Inari Jinja",
        address: "6-1-5 Noborito, Tama-ku, Kawasaki, Kanagawa",
        description: "A vibrant Inari shrine near Noborito Station, guarding the gateway between Kawasaki's Tama-ku and the Tama River. The vermillion torii gates and fox statues create a quintessential Inari atmosphere. The shrine has particular significance for local businesses and the nearby Fujiko F. Fujio Museum area, offering prosperity blessings in a neighborhood famous for Doraemon.",
        coordinate: CLLocationCoordinate2D(latitude: 35.6230, longitude: 139.5700),
        stampSlotId: 130,
        category: .inari,
        tagline: "Vermillion guardian at the gateway to Doraemon's neighborhood",
        highlights: [
            "Classic Inari shrine with vermillion torii and fox guardians",
            "Near the famous Fujiko F. Fujio Museum (Doraemon Museum)",
            "Prosperity blessings popular with local businesses",
            "Views toward the Tama River and Setagaya across the water"
        ],
        mustSee: "The row of vermillion torii gates framing the approach — a miniature Fushimi Inari experience right in suburban Kawasaki.",
        tips: [
            "Combine with a visit to the Fujiko F. Fujio Museum nearby",
            "The Tama River bank is a 5-minute walk — great for a riverside stroll",
            "Fox-themed ema (votive tablets) make unique souvenirs",
            "Noborito Station area has good local restaurants for lunch"
        ],
        bestSeason: "Year-round (New Year for hatsumode)",
        access: "5 min walk from Noborito Station (Odakyu Line / JR Nambu Line)",
        hours: "Open 24 hours (office 9:00-16:00)",
        imageURLs: []
    ),
]
