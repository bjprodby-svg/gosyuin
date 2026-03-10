import SwiftUI
import CoreLocation

// MARK: - Tokyo (52 shrines, ID 1-18 + 51-72 + 101-112)

let tokyoShrines: [Shrine] = [

    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    // MARK: - Central Tokyo (ID 1-18)
    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

    Shrine(
        id: UUID(uuidString: "00000001-0000-0000-0000-000000000001")!,
        name: "Meiji Jingu",
        address: "1-1 Yoyogikamizonocho, Shibuya, Tokyo",
        description: "Step through a massive cypress torii and into a 170-acre forest — you'll forget you're in one of the world's busiest cities. Meiji Jingu was built in 1920 for Emperor Meiji, and its forest was planted by 100,000 volunteers who donated 120,000 trees from across Japan. Today it's a living monument to harmony between nature and spirituality.",
        coordinate: CLLocationCoordinate2D(latitude: 35.6764, longitude: 139.6993),
        stampSlotId: 1,
        category: .jingu,
        tagline: "A 100-year-old forest hiding in the heart of Tokyo",
        highlights: [
            "Walk through a forest of 120,000 trees in central Shibuya",
            "Japan's most visited shrine — 3 million people at New Year",
            "12-meter torii gate carved from a 1,500-year-old cypress",
            "150 varieties of iris bloom in June at the inner garden"
        ],
        mustSee: "The towering main torii gate at the entrance — carved from a 1,500-year-old Taiwanese cypress tree, it's the largest wooden torii in Japan.",
        tips: [
            "Visit early morning (before 9 AM) to avoid crowds and feel the forest's tranquility",
            "The inner garden (Meiji Jingu Gyoen, ¥500) is worth it — especially in June for iris season",
            "Write your wishes on an ema wooden plaque near the main hall",
            "Free to enter, open sunrise to sunset year-round"
        ],
        bestSeason: "Year-round (June for iris, Jan 1-3 for New Year)",
        access: "3 min walk from Meiji-jingumae Station (Chiyoda/Fukutoshin Line)",
        hours: "Sunrise to sunset (varies by month, ~5:00-18:30)",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000001-0000-0000-0000-000000000002")!,
        name: "Senso-ji",
        address: "2-3-1 Asakusa, Taito, Tokyo",
        description: "In 628 AD, two fishermen pulled a golden Kannon statue from the Sumida River — and Tokyo's oldest temple was born. Nearly 1,400 years later, the thunderous Kaminarimon gate with its 700kg red lantern still takes your breath away. Walk through Nakamise-dori's 250 meters of traditional shops, and you'll feel the heartbeat of old Edo.",
        coordinate: CLLocationCoordinate2D(latitude: 35.7148, longitude: 139.7967),
        stampSlotId: 2,
        category: .tera,
        tagline: "Where Tokyo's 1,400-year-old soul still beats",
        highlights: [
            "The Kaminarimon — the most photographed gate in Japan",
            "Nakamise-dori: 250m of traditional snacks & souvenirs since Edo era",
            "Five-story pagoda glowing against the Tokyo Skytree at night",
            "Draw your fortune (omikuji) — Senso-ji is famously harsh!"
        ],
        mustSee: "Come back after dark — the five-story pagoda and main hall are illuminated until 11 PM, creating a magical contrast with the Tokyo Skytree behind.",
        tips: [
            "Visit at 6 AM to have the grounds almost to yourself",
            "Try the freshly-made ningyo-yaki (custard cakes) on Nakamise-dori",
            "Don't worry if you get 'curse' on your omikuji — tie it to the rack and leave the bad luck behind",
            "The hidden Denboin Garden opens limited periods in spring — check schedule"
        ],
        bestSeason: "Year-round (Jul for Sumida Fireworks, Dec for Hagoita Fair)",
        access: "5 min walk from Asakusa Station (Ginza/Asakusa Line)",
        hours: "Main hall 6:00-17:00 (grounds open 24h, lit up until 23:00)",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000001-0000-0000-0000-000000000003")!,
        name: "Yasukuni Jinja",
        address: "3-1-1 Kudankita, Chiyoda, Tokyo",
        description: "When the cherry blossoms at Yasukuni's reference tree open, Japan Meteorological Agency officially declares spring has arrived in Tokyo. The 500-meter approach lined with cherry and ginkgo trees is stunning in every season, leading to one of Tokyo's most architecturally impressive shrines with its massive steel torii.",
        coordinate: CLLocationCoordinate2D(latitude: 35.6940, longitude: 139.7440),
        stampSlotId: 3,
        category: .jinja,
        tagline: "The tree that tells Tokyo spring has arrived",
        highlights: [
            "Tokyo's official cherry blossom reference tree — spring starts here",
            "500-meter tree-lined approach, spectacular in autumn too",
            "One of Japan's largest torii gates — 25 meters of bronze-plated steel",
            "The Yushukan museum with zero-fighter aircraft exhibits"
        ],
        mustSee: "In late March, find the small cherry tree by the gate — when its blossoms open, it's the official signal that hanami season has begun in Tokyo.",
        tips: [
            "The cherry blossom forecast dates are announced around this tree each year",
            "Walk the full approach from Kudanshita Station for the best experience",
            "The autumn ginkgo avenue is equally stunning (late November)",
            "Yushukan museum (¥1,000) takes about 2 hours — plan accordingly"
        ],
        bestSeason: "Late Mar – early Apr (sakura), late Nov (ginkgo)",
        access: "5 min walk from Kudanshita Station (Tozai/Hanzomon/Shinjuku Line)",
        hours: "6:00-17:00 (Nov-Feb), 6:00-18:00 (Mar-Oct)",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000001-0000-0000-0000-000000000004")!,
        name: "Kanda Myojin",
        address: "2-16-2 Sotokanda, Chiyoda, Tokyo",
        description: "Where 1,270 years of spiritual tradition meets Akihabara's electric soul. Kanda Myojin is the only shrine in Japan where you can buy an IT safety amulet for your laptop. Business owners pray here for prosperity, tech workers for bug-free code, and anime fans for limited-edition collaboration goods.",
        coordinate: CLLocationCoordinate2D(latitude: 35.7020, longitude: 139.7681),
        stampSlotId: 4,
        category: .jinja,
        tagline: "1,270 years old and it still protects your laptop",
        highlights: [
            "IT safety amulets — pray for bug-free code (only here!)",
            "Anime collaborations — limited-edition goods you can't get elsewhere",
            "Kanda Matsuri — one of Tokyo's three great festivals (odd years, May)",
            "Stunning vermillion main hall rebuilt in 1934, survived WWII"
        ],
        mustSee: "Visit the amulet shop and pick up an IT Safety charm — a microchip-shaped omamori that's become legendary among tech workers worldwide.",
        tips: [
            "Combine with an Akihabara visit — it's a 5-minute walk from Electric Town",
            "Check for anime collaboration periods — seasonal goods sell out fast",
            "The Kanda Festival (mid-May, odd years) features 200 portable shrines parading through Akihabara",
            "Try the amazake (sweet rice drink) at the shop inside the grounds"
        ],
        bestSeason: "Mid-May (Kanda Festival, odd years), Year-round",
        access: "5 min walk from Ochanomizu Station (JR Chuo/Sobu Line)",
        hours: "24h (grounds), amulet office 9:00-16:00",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000001-0000-0000-0000-000000000005")!,
        name: "Hie Jinja",
        address: "2-10-5 Nagatacho, Chiyoda, Tokyo",
        description: "Hidden on a hillside between skyscrapers in Tokyo's political district, Hie Jinja surprises visitors with a dramatic tunnel of vermillion torii gates climbing the slope. For over 500 years, it has guarded this area since the days of Edo Castle. It's also one of the few shrines in Japan with an escalator.",
        coordinate: CLLocationCoordinate2D(latitude: 35.6750, longitude: 139.7399),
        stampSlotId: 5,
        category: .jinja,
        tagline: "A secret tunnel of torii gates in Tokyo's power district",
        highlights: [
            "Instagram-worthy tunnel of vermillion torii gates up the hillside",
            "One of the only shrines in Japan with an escalator",
            "Sanno Matsuri — one of the three great Edo festivals (even years, June)",
            "Powerful blessings for career success — popular with politicians & businesspeople"
        ],
        mustSee: "Climb (or ride the escalator!) to the hilltop, then look back through the torii tunnel — it's one of Tokyo's most photogenic hidden spots.",
        tips: [
            "Enter from the side with the torii stairway, not the main road — much more dramatic",
            "The escalator entrance is on the east side if you have mobility concerns",
            "Early morning light through the torii tunnel is perfect for photos",
            "Walk 5 min to the Capitol Hotel Tokyu rooftop bar for sunset views after"
        ],
        bestSeason: "Jun (Sanno Festival, even years), Year-round",
        access: "3 min walk from Tameike-Sanno Station (Ginza/Namboku Line)",
        hours: "5:00-18:00 (Apr-Sep), 6:00-17:00 (Oct-Mar)",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000001-0000-0000-0000-000000000006")!,
        name: "Nezu Jinja",
        address: "1-28-9 Nezu, Bunkyo, Tokyo",
        description: "Imagine 3,000 azalea bushes of 100 varieties erupting into color on a hillside, framed by a tunnel of miniature vermillion torii gates. That's Nezu Jinja in April — one of Tokyo's most jaw-dropping seasonal spectacles. But even without the flowers, this nearly 1,900-year-old shrine in the charming Yanaka neighborhood is one of Tokyo's best-kept secrets.",
        coordinate: CLLocationCoordinate2D(latitude: 35.7207, longitude: 139.7619),
        stampSlotId: 6,
        category: .jinja,
        tagline: "3,000 azaleas and a secret torii tunnel in old Tokyo",
        highlights: [
            "3,000 azalea bushes in 100 varieties — a hillside of color in April",
            "Charming miniature torii gate tunnel through the garden",
            "Nearly 1,900 years of unbroken history",
            "In the heart of Yanaka — Tokyo's most nostalgic neighborhood"
        ],
        mustSee: "During the Azalea Festival (mid-April to early May), climb the hillside garden path through the torii tunnel with thousands of bushes blooming around you. \u{00A5}200 entrance fee, absolutely worth it.",
        tips: [
            "The Azalea Festival is mid-April to early May — don't miss it",
            "Combine with a stroll through Yanaka Ginza shopping street (7 min walk)",
            "The torii gate tunnel is photogenic even without azaleas",
            "Much less crowded than major shrines — a peaceful escape"
        ],
        bestSeason: "Mid-Apr to early May (Azalea Festival)",
        access: "5 min walk from Nezu Station (Chiyoda Line)",
        hours: "6:00-17:00 (azalea garden 9:00-17:30 during festival)",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000001-0000-0000-0000-000000000007")!,
        name: "Tokyo Daijingu",
        address: "2-4-1 Fujimi, Chiyoda, Tokyo",
        description: "If you're looking for love, this is the shrine. Tokyo Daijingu invented the Shinto wedding ceremony and has been Japan's most trusted matchmaker since 1880. Young women travel from across the country to pray here, and the grounds are covered in heart-shaped ema plaques filled with romantic wishes.",
        coordinate: CLLocationCoordinate2D(latitude: 35.7005, longitude: 139.7476),
        stampSlotId: 7,
        category: .jinja,
        tagline: "Japan's most powerful shrine for finding love",
        highlights: [
            "Tokyo's #1 shrine for love — thousands pray for romance here daily",
            "Birthplace of the modern Shinto wedding ceremony (since 1880)",
            "Heart-shaped ema and adorable love-themed omamori",
            "\"Suzuran\" lily-of-the-valley charm — said to bring romantic encounters"
        ],
        mustSee: "Read the heart-shaped ema — thousands of romantic wishes from visitors all over Japan. Then pick up the famous Suzuran charm, said to bring love within the year.",
        tips: [
            "The most popular omamori sell out — visit early in the day",
            "Single? Buy the \"En-musubi\" (love connection) charm in pink",
            "Couples should visit together for the pair charm set",
            "It's small and intimate — you can visit in 20 minutes, but linger to read the ema"
        ],
        bestSeason: "Year-round (Valentine's Day & Tanabata week are magical)",
        access: "5 min walk from Iidabashi Station (JR/Metro)",
        hours: "6:00-21:00 (amulet office 8:00-19:00)",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000001-0000-0000-0000-000000000008")!,
        name: "Yushima Tenmangu",
        address: "3-30-1 Yushima, Bunkyo, Tokyo",
        description: "Every January, thousands of students descend on this shrine with one prayer: pass my exams. Dedicated to Sugawara no Michizane — a brilliant scholar deified as the god of learning — Yushima Tenmangu is covered in prayer plaques during exam season. But come in February, and the 300 plum trees transform it into a fragrant wonderland of white and pink blossoms.",
        coordinate: CLLocationCoordinate2D(latitude: 35.7080, longitude: 139.7684),
        stampSlotId: 8,
        category: .tenmangu,
        tagline: "Where students come to pray — and plum trees come to bloom",
        highlights: [
            "Walls of prayer plaques from students hoping to pass exams",
            "300 plum trees in stunning white & pink bloom (Feb)",
            "Annual Plum Blossom Festival with traditional kagura dance",
            "The bronze cow statue — rub its head for wisdom!"
        ],
        mustSee: "In February, the plum garden explodes with 300 trees blooming at once. During the Ume Matsuri festival, you'll see traditional dance performances under the blossoms.",
        tips: [
            "Rub the bronze cow statue's head — it's said to boost your intelligence",
            "Visit in February for plum blossoms + fewer tourists than cherry blossom spots",
            "Buy a \"Gokaku\" (exam success) pencil set as a gift for students",
            "Combine with a walk through Ueno Park (10 min walk)"
        ],
        bestSeason: "Feb (plum blossoms), Jan-Mar (exam season energy)",
        access: "2 min walk from Yushima Station (Chiyoda Line)",
        hours: "6:00-19:30 (amulet office 8:30-19:30)",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000001-0000-0000-0000-000000000009")!,
        name: "Gotoku-ji",
        address: "2-24-7 Gotokuji, Setagaya, Tokyo",
        description: "Welcome to the birthplace of the lucky cat. Gotoku-ji is home to thousands of maneki-neko figurines — waving cats of every size — left by grateful visitors whose wishes came true. The sight of hundreds of white cats lining the shelves is surreal and unforgettable. Legend says a feudal lord was saved from lightning by a cat beckoning him into this temple.",
        coordinate: CLLocationCoordinate2D(latitude: 35.6596, longitude: 139.6442),
        stampSlotId: 9,
        category: .tera,
        tagline: "Thousands of lucky cats and the legend that started it all",
        highlights: [
            "Hundreds of maneki-neko figurines covering entire shelves",
            "Birthplace of Japan's iconic beckoning cat legend",
            "Peaceful Setagaya neighborhood away from tourist crowds",
            "Buy your own maneki-neko to take home (from \u{00A5}300)"
        ],
        mustSee: "The maneki-neko display shelf next to the main hall — rows upon rows of white lucky cats in every size, all left by visitors whose wishes came true.",
        tips: [
            "Buy a small maneki-neko, make a wish, then return it when it comes true",
            "Note: the cats here DON'T hold a coin — it's the original pure beckoning style",
            "Combine with a walk through Gotokuji shopping street for local cafes",
            "Quietest on weekday mornings — perfect for photos"
        ],
        bestSeason: "Year-round (autumn colors in late November)",
        access: "5 min walk from Gotokuji Station (Odakyu Line) or Miyanosaka Station (Tokyu Setagaya Line)",
        hours: "6:00-18:00 (Mar-Sep), 6:00-17:00 (Oct-Feb)",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000001-0000-0000-0000-000000000010")!,
        name: "Zojo-ji",
        address: "4-7-35 Shibakoen, Minato, Tokyo",
        description: "The iconic view of Zojo-ji's massive Sangedatsumon gate with Tokyo Tower rising directly behind it is one of the most photographed scenes in Tokyo. This 600-year-old temple was the family temple of the Tokugawa shoguns, and six of the fifteen shoguns are buried here. The contrast of ancient Buddhist architecture against the modern skyline is pure Tokyo.",
        coordinate: CLLocationCoordinate2D(latitude: 35.6565, longitude: 139.7472),
        stampSlotId: 10,
        category: .tera,
        tagline: "Where the shoguns rest beneath Tokyo Tower",
        highlights: [
            "The most iconic temple-meets-skyline photo in Tokyo",
            "Sangedatsumon gate — oldest wooden structure in Tokyo (1622)",
            "Resting place of 6 Tokugawa shoguns",
            "Rows of jizo statues with tiny windmills and knitted caps"
        ],
        mustSee: "Stand in front of the Sangedatsumon gate and look up — Tokyo Tower frames perfectly behind the ancient wooden structure. At night, both are illuminated.",
        tips: [
            "Best photo spot: stand at the main gate looking toward the main hall with Tokyo Tower behind",
            "The jizo statue garden is deeply moving — each statue represents a lost child",
            "New Year's Eve bell-ringing ceremony draws huge crowds",
            "Free to enter, combine with Shiba Park for a half-day walk"
        ],
        bestSeason: "Year-round (cherry blossoms in late March, New Year for bell ceremony)",
        access: "3 min walk from Onarimon Station (Mita Line) or Daimon Station (Oedo Line)",
        hours: "6:00-17:30 (grounds open 24h)",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000001-0000-0000-0000-000000000011")!,
        name: "Tomioka Hachimangu",
        address: "1-20-3 Tomioka, Koto, Tokyo",
        description: "Sumo wrestling was born here. Tomioka Hachimangu hosted the first official sumo tournaments in the Edo period, and giant stone monuments engraved with the names of legendary yokozuna still stand in the grounds. Every August, the Fukagawa Hachiman Festival turns the streets into a water-drenched celebration where portable shrines and spectators alike get thoroughly soaked.",
        coordinate: CLLocationCoordinate2D(latitude: 35.6724, longitude: 139.7985),
        stampSlotId: 11,
        category: .hachimangu,
        tagline: "The birthplace of sumo and Tokyo's wildest water festival",
        highlights: [
            "Birthplace of professional sumo — champion name stones everywhere",
            "Fukagawa Festival (Aug): 53 mikoshi paraded while crowds throw water",
            "Gorgeous gold-leaf decorated main hall rebuilt in 1968",
            "Historic Fukagawa neighborhood with Edo-period canal atmosphere"
        ],
        mustSee: "The yokozuna stone monument near the entrance — trace the names of every sumo grand champion in history, carved into massive stone tablets.",
        tips: [
            "The Fukagawa Festival in mid-August is one of Tokyo's wildest — wear clothes you don't mind getting soaked",
            "Visit the antique flea market held on 1st, 15th, and 28th of each month",
            "Try Fukagawa-meshi (clam rice) at nearby restaurants — the local specialty",
            "Walk along the canal to Kiyosumi Garden (10 min) for a peaceful continuation"
        ],
        bestSeason: "Mid-Aug (Fukagawa Festival), Year-round",
        access: "3 min walk from Monzen-Nakacho Station (Tozai/Oedo Line)",
        hours: "24h (grounds), office 9:00-17:00",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000001-0000-0000-0000-000000000012")!,
        name: "Atago Jinja",
        address: "1-5-3 Atago, Minato, Tokyo",
        description: "At the top of the steepest stone stairway in central Tokyo sits Atago Jinja — and climbing those 86 steps is said to guarantee career success. Known as the 'Stairs of Success,' the legend comes from a samurai who rode his horse straight up these steps to present cherry blossoms to the shogun, earning instant fame and fortune.",
        coordinate: CLLocationCoordinate2D(latitude: 35.6618, longitude: 139.7495),
        stampSlotId: 12,
        category: .jinja,
        tagline: "Climb the 86 Stairs of Success in Tokyo's business district",
        highlights: [
            "86-step 'Stairs of Success' — climb for career blessings",
            "Highest natural point in central Tokyo (26 meters)",
            "Sacred pond with koi fish and turtles at the summit",
            "Surrounded by Minato skyscrapers — a pocket of green in the concrete jungle"
        ],
        mustSee: "The stone stairway itself — nearly vertical, 86 steps. Look up from the bottom and you'll understand why climbing it is considered proof of ambition.",
        tips: [
            "Climb up the steep front stairs (Otoko-zaka) for the blessing, descend via the gentler side stairs",
            "Popular with businesspeople on Monday mornings seeking the week's luck",
            "There's an elevator on the backside if the stairs are too steep",
            "The NHK Broadcasting Museum next door is free and worth a peek"
        ],
        bestSeason: "Year-round (June for hydrangeas)",
        access: "5 min walk from Kamiyacho Station (Hibiya Line) or Onarimon Station (Mita Line)",
        hours: "6:00-17:00",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000001-0000-0000-0000-000000000013")!,
        name: "Hanazono Jinja",
        address: "5-17-3 Shinjuku, Shinjuku, Tokyo",
        description: "Tucked behind Shinjuku's neon-lit Kabukicho district, Hanazono Jinja has been the spiritual guardian of this entertainment quarter for over 350 years. By day, salarymen pray for business success; by night, the shrine glows with lanterns as bar-hoppers pass through. Its Tori-no-Ichi festival in November features spectacular raked decorations symbolizing raking in good fortune.",
        coordinate: CLLocationCoordinate2D(latitude: 35.6935, longitude: 139.7034),
        stampSlotId: 13,
        category: .jinja,
        tagline: "Shinjuku's sacred guardian behind the neon lights",
        highlights: [
            "A shrine hidden behind Kabukicho — Tokyo's most dramatic location contrast",
            "Tori-no-Ichi festival (Nov) with ornate kumade lucky rakes",
            "Beautiful lantern-lit atmosphere at night",
            "Sunday morning flea market with vintage goods and antiques"
        ],
        mustSee: "Visit after dark when the shrine lanterns are lit — the contrast of peaceful shrine grounds with Kabukicho's neon glow in the background is uniquely Tokyo.",
        tips: [
            "Open 24 hours — one of the few shrines you can visit late at night",
            "The Sunday flea market (early morning) is great for vintage finds",
            "Combine with Golden Gai (2 min walk) for tiny atmospheric bars",
            "Tori-no-Ichi in November is a must — buy a kumade rake for luck"
        ],
        bestSeason: "Nov (Tori-no-Ichi Festival), Year-round",
        access: "5 min walk from Shinjuku-Sanchome Station (Marunouchi/Fukutoshin Line)",
        hours: "24h (grounds), office 8:00-20:00",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000001-0000-0000-0000-000000000014")!,
        name: "Asakusa Jinja",
        address: "2-3-1 Asakusa, Taito, Tokyo",
        description: "Right next to the famous Senso-ji temple, Asakusa Jinja honors the two fishermen who found the golden Kannon statue that started it all. While most visitors rush past to Senso-ji, this elegant shrine is home to the Sanja Matsuri — Tokyo's largest and wildest festival, where 2 million people fill the streets and 100 portable shrines are paraded with incredible energy.",
        coordinate: CLLocationCoordinate2D(latitude: 35.7147, longitude: 139.7967),
        stampSlotId: 14,
        category: .jinja,
        tagline: "Home of Tokyo's biggest and wildest festival",
        highlights: [
            "Sanja Matsuri (May) — 2 million people, 100 mikoshi, pure energy",
            "Honors the fishermen who started the Senso-ji legend in 628 AD",
            "Elegant cypress-bark roof architecture (Important Cultural Property)",
            "Pair of guardian komainu (lion-dogs) from the Edo period"
        ],
        mustSee: "If you visit in mid-May, the Sanja Matsuri is absolutely not to be missed — it's the most energetic, wild, and authentic Tokyo festival experience you can have.",
        tips: [
            "It's right next to Senso-ji — don't miss it when you visit Asakusa",
            "Sanja Matsuri is the 3rd weekend of May — book accommodation early",
            "The shrine receives far fewer visitors than Senso-ji despite being adjacent",
            "Draw a fortune here for a second opinion after Senso-ji's famously harsh ones"
        ],
        bestSeason: "Mid-May (Sanja Matsuri), Year-round",
        access: "7 min walk from Asakusa Station (Ginza/Asakusa Line)",
        hours: "24h (grounds), office 9:00-16:30",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000001-0000-0000-0000-000000000015")!,
        name: "Sengaku-ji",
        address: "2-11-1 Takanawa, Minato, Tokyo",
        description: "The final resting place of the 47 Ronin — Japan's most legendary story of samurai loyalty. In 1703, forty-seven masterless samurai avenged their lord's death and then committed ritual seppuku here. Their graves still stand in a row, and visitors burn incense at each one. It's the most emotionally powerful shrine experience in Tokyo.",
        coordinate: CLLocationCoordinate2D(latitude: 35.6360, longitude: 139.7374),
        stampSlotId: 15,
        category: .tera,
        tagline: "Where the 47 Ronin rest — Japan's greatest loyalty story",
        highlights: [
            "47 ronin graves in a row — burn incense at each to pay respects",
            "Museum with original weapons and armor from the revenge raid",
            "Ako Gishi-sai memorial festival on Dec 14 with samurai reenactment",
            "The well where the ronin washed their enemy's head"
        ],
        mustSee: "Walk slowly past all 47 graves and burn incense at the bundle near the entrance. The atmosphere is quiet, solemn, and deeply moving — you can feel 300 years of respect.",
        tips: [
            "Buy incense at the entrance (small bundle) and light it at the graves",
            "The small museum (\u{00A5}500) has original artifacts from the revenge raid",
            "Dec 14 memorial festival features a procession of people dressed as the ronin",
            "Read the story before visiting — it makes the experience much more powerful"
        ],
        bestSeason: "Dec 14 (Ako Gishi-sai memorial), Year-round",
        access: "1 min walk from Sengakuji Station (Asakusa Line)",
        hours: "7:00-17:00 (Oct-Mar), 7:00-18:00 (Apr-Sep)",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000001-0000-0000-0000-000000000016")!,
        name: "Jindai-ji",
        address: "5-15-1 Jindaiji Motomachi, Chofu, Tokyo",
        description: "Tokyo's second-oldest temple hides in the western suburbs, surrounded by deep forest that feels centuries away from the city. Jindai-ji is famous for its handmade soba noodles — over 20 restaurants line the approach, all making buckwheat noodles the traditional way. In spring, the adjacent botanical garden blooms with plum and cherry blossoms.",
        coordinate: CLLocationCoordinate2D(latitude: 35.6655, longitude: 139.5447),
        stampSlotId: 16,
        category: .tera,
        tagline: "Ancient forest temple with the best soba noodles in Tokyo",
        highlights: [
            "Tokyo's 2nd oldest temple — founded in 733 AD",
            "Over 20 soba restaurants lining the approach road",
            "National treasure bronze Shaka Nyorai statue (7th century)",
            "Jindai Botanical Garden next door with 4,800 rose bushes"
        ],
        mustSee: "After visiting the temple, you absolutely must try the handmade soba at one of the approach restaurants — Jindai-ji soba is considered some of the best in Tokyo.",
        tips: [
            "Try multiple soba shops — each has a slightly different style and taste",
            "The Botanical Garden (\u{00A5}500) is stunning during rose season (May & Oct)",
            "Daruma Market in early March features over 300 stalls selling daruma dolls",
            "Allow a half day — the forest atmosphere makes you want to linger"
        ],
        bestSeason: "Feb-Mar (plum blossoms + Daruma Market), Oct (autumn colors)",
        access: "15 min bus from Chofu Station (Keio Line) or Mitaka Station (JR Chuo Line)",
        hours: "5:00-17:00",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000001-0000-0000-0000-000000000017")!,
        name: "Nogi Jinja",
        address: "8-11-27 Akasaka, Minato, Tokyo",
        description: "Adjacent to the trendy Nogizaka neighborhood and just steps from the national art center, Nogi Jinja commemorates General Nogi Maresuke, a Meiji-era military hero who chose to follow his emperor in death. The shrine grounds include his preserved Meiji-era residence, and the monthly antique market draws collectors from across Tokyo.",
        coordinate: CLLocationCoordinate2D(latitude: 35.6664, longitude: 139.7268),
        stampSlotId: 17,
        category: .jinja,
        tagline: "A Meiji-era oasis next to Nogizaka's modern art scene",
        highlights: [
            "Preserved Meiji-era residence of General Nogi",
            "Monthly antique flea market (4th Sunday) with quality vintage goods",
            "Walking distance from The National Art Center, Tokyo",
            "Beautiful autumn ginkgo trees along the approach"
        ],
        mustSee: "The preserved Meiji-era wooden house where General Nogi lived — a rare glimpse into how a high-ranking Meiji official actually lived, right in the heart of modern Akasaka.",
        tips: [
            "Visit on the 4th Sunday for the excellent antique market",
            "Combine with The National Art Center (5 min walk) for art + history day",
            "Nogizaka46 fans often visit — the idol group is named after this area",
            "The surrounding streets have great cafes and restaurants"
        ],
        bestSeason: "Late Nov (ginkgo), 4th Sunday each month (antique market)",
        access: "1 min walk from Nogizaka Station (Chiyoda Line)",
        hours: "6:00-17:00",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000001-0000-0000-0000-000000000018")!,
        name: "Akasaka Hikawa Jinja",
        address: "6-10-12 Akasaka, Minato, Tokyo",
        description: "One of the few Edo-era buildings to survive both the 1923 earthquake and WWII firebombing, Akasaka Hikawa Jinja has stood on this hilltop since 1730. The 400-year-old ginkgo tree at the entrance is a designated natural monument. Once the guardian shrine of the Tokugawa shoguns' Akasaka estate, it now watches over one of Tokyo's busiest business districts.",
        coordinate: CLLocationCoordinate2D(latitude: 35.6743, longitude: 139.7367),
        stampSlotId: 18,
        category: .jinja,
        tagline: "An Edo survivor watching over Akasaka since 1730",
        highlights: [
            "Main hall from 1730 — survived earthquake AND firebombing",
            "400-year-old ginkgo tree (designated natural monument)",
            "Powerful blessings for preventing bad luck and misfortune",
            "Quiet hilltop retreat from the Akasaka business district below"
        ],
        mustSee: "The 400-year-old ginkgo tree at the entrance — it has survived everything Tokyo has thrown at it for four centuries. Touch the bark and feel the history.",
        tips: [
            "One of the best autumn foliage spots in central Tokyo (late November)",
            "The approach stairway is steep but atmospheric — lined with stone lanterns",
            "Surprisingly quiet despite being in the middle of Akasaka",
            "Monthly good-luck market on the 14th"
        ],
        bestSeason: "Late Nov (ginkgo golden foliage), Year-round",
        access: "7 min walk from Akasaka Station (Chiyoda Line) or Roppongi-Itchome Station (Namboku Line)",
        hours: "6:00-17:00",
        imageURLs: []
    ),

    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    // MARK: - Greater Tokyo (ID 51-72)
    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

    Shrine(
        id: UUID(uuidString: "00000001-0000-0000-0000-000000000051")!,
        name: "Shibamata Taishakuten",
        address: "7-10-3 Shibamata, Katsushika, Tokyo",
        description: "Made famous by the beloved film series 'Otoko wa Tsurai yo' (It's Tough Being a Man), Shibamata Taishakuten is the heart of one of Tokyo's most nostalgic neighborhoods. The temple's intricate wooden carvings depicting scenes from the Lotus Sutra are considered masterpieces of Edo-period craftsmanship. The retro approach street lined with dango shops and rice cracker vendors feels like stepping into 1960s Japan.",
        coordinate: CLLocationCoordinate2D(latitude: 35.7581, longitude: 139.8791),
        stampSlotId: 51,
        category: .tera,
        tagline: "The temple that inspired Japan's most beloved film series",
        highlights: [
            "Iconic location from the 'Tora-san' film series — Japan's longest-running movie franchise",
            "Extraordinary wooden relief carvings depicting the Lotus Sutra",
            "Retro approach street with traditional dango, senbei, and craft shops",
            "Shibamata neighborhood — one of Tokyo's last shitamachi (old downtown) gems"
        ],
        mustSee: "The rear gallery of carved wooden panels depicting scenes from the Lotus Sutra — the detail and scale of these Edo-period carvings is breathtaking and often overlooked by visitors.",
        tips: [
            "Walk the approach street slowly and try the kusa-dango (grass mochi) — a Shibamata specialty",
            "The Tora-san Museum nearby is a must for film fans (¥500)",
            "Take the old-fashioned Yagiri-no-Watashi river ferry across the Edogawa — Japan's last surviving edo-period ferry route",
            "Visit on weekday mornings for the most authentic local atmosphere"
        ],
        bestSeason: "Year-round (spring for cherry blossoms along Edogawa River)",
        access: "2 min walk from Shibamata Station (Keisei Kanamachi Line)",
        hours: "9:00-16:00 (carving gallery), grounds open earlier",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000001-0000-0000-0000-000000000052")!,
        name: "Ikegami Honmon-ji",
        address: "1-1-1 Ikegami, Ota, Tokyo",
        description: "One of the most important Nichiren Buddhist temples in Japan, Ikegami Honmon-ji marks the site where the monk Nichiren passed away in 1282. Every October, the Oeshiki memorial festival draws hundreds of thousands as elaborate manto lantern floats are paraded through the streets at night, creating a river of light. The five-story pagoda overlooking Ota Ward is one of the oldest in the Tokyo area.",
        coordinate: CLLocationCoordinate2D(latitude: 35.5770, longitude: 139.7053),
        stampSlotId: 52,
        category: .tera,
        tagline: "A river of light flows through Tokyo every October",
        highlights: [
            "Oeshiki Festival (Oct 12-13) — manto lantern floats paraded through the night",
            "Site where the great monk Nichiren passed away in 1282",
            "Five-story pagoda from 1608 — one of the oldest in the Tokyo area",
            "96 stone steps approaching the main gate — an impressive ascent"
        ],
        mustSee: "The Oeshiki Festival on the night of October 12 — thousands of lantern-covered manto floats carried by chanting devotees create an unforgettable river of golden light through the dark streets.",
        tips: [
            "The Oeshiki on October 12 night is Tokyo's most atmospheric autumn festival — arrive by 7 PM",
            "The hilltop grounds offer panoramic views across southern Tokyo",
            "Combine with a visit to the nearby Ikegami Baien plum garden in February",
            "The long stone staircase is atmospheric but steep — take your time"
        ],
        bestSeason: "Oct 12-13 (Oeshiki Festival), Feb (plum blossoms)",
        access: "10 min walk from Ikegami Station (Tokyu Ikegami Line)",
        hours: "5:00-17:00 (grounds open 24h)",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000001-0000-0000-0000-000000000053")!,
        name: "Oji Jinja",
        address: "1-12-26 Oji-Honcho, Kita, Tokyo",
        description: "Guardian shrine of the Oji district for over 700 years, Oji Jinja sits atop a wooded hill that was once a popular Edo-period picnic spot. The shrine is deeply connected to the fox folklore of the area — on New Year's Eve, a magical procession called Oji Kitsune-no-Gyoretsu sees hundreds of people in fox costumes and makeup march through the streets, recreating the legend of foxes gathering beneath a great hackberry tree.",
        coordinate: CLLocationCoordinate2D(latitude: 35.7539, longitude: 139.7375),
        stampSlotId: 53,
        category: .jinja,
        tagline: "Where foxes gather on New Year's Eve — a living Edo legend",
        highlights: [
            "Oji Kitsune-no-Gyoretsu (Fox Parade) on New Year's Eve",
            "Over 700 years of history guarding the Oji district",
            "Wooded hilltop grounds — a beloved Edo-period scenic spot",
            "Adjacent to Asukayama Park — Tokyo's oldest public park"
        ],
        mustSee: "If you can visit on New Year's Eve, the Fox Parade is extraordinary — hundreds of people in fox makeup carrying paper lanterns walk silently through the dark streets to the shrine.",
        tips: [
            "The Fox Parade starts at nearby Shozoku Inari around 11 PM on Dec 31",
            "Combine with Asukayama Park next door for cherry blossoms in spring",
            "The Oji area has several fox-related sites — pick up a walking map at the station",
            "Much less crowded than central Tokyo shrines — a genuine local atmosphere"
        ],
        bestSeason: "Dec 31 (Fox Parade), Late Mar-Apr (cherry blossoms at Asukayama)",
        access: "3 min walk from Oji Station (JR Keihin-Tohoku Line / Namboku Line)",
        hours: "24h (grounds), office 9:00-17:00",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000001-0000-0000-0000-000000000054")!,
        name: "Oji Inari Jinja",
        address: "1-12-26 Kishimachi, Kita, Tokyo",
        description: "The legendary meeting place of foxes in Edo-period folklore, Oji Inari Jinja is the spiritual heart of Tokyo's richest fox mythology. According to the legend, every New Year's Eve, all the foxes of the Kanto region would gather beneath a great enoki tree near this shrine, donning disguises to pay their respects. The shrine's fox statues and fox-shaped ema are among the most charming in Tokyo.",
        coordinate: CLLocationCoordinate2D(latitude: 35.7558, longitude: 139.7375),
        stampSlotId: 54,
        category: .inari,
        tagline: "The legendary gathering place of Kanto's foxes",
        highlights: [
            "Center of Tokyo's richest fox (kitsune) folklore tradition",
            "Charming fox statues and fox-shaped ema throughout the grounds",
            "Connected to the Oji Kitsune-no-Gyoretsu Fox Parade on New Year's Eve",
            "Hidden stone fox carvings tucked into the hillside — find them all"
        ],
        mustSee: "Explore the wooded hillside behind the main hall — stone fox statues are tucked into rocky crevices and behind trees, creating a magical hide-and-seek atmosphere.",
        tips: [
            "Visit together with Oji Jinja (2 min walk) for the complete fox mythology experience",
            "The Fox Parade on New Year's Eve begins near this shrine",
            "Fox-shaped ema here are unique and make great souvenirs",
            "The hillside grounds are especially atmospheric in autumn foliage"
        ],
        bestSeason: "Dec 31 (Fox Parade), Nov (autumn colors on the hillside)",
        access: "5 min walk from Oji Station (JR Keihin-Tohoku Line / Namboku Line)",
        hours: "24h (grounds), office 9:00-17:00",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000001-0000-0000-0000-000000000055")!,
        name: "Toyokawa Inari Tokyo Betsuin",
        address: "1-4-7 Moto-Akasaka, Minato, Tokyo",
        description: "A unique blend of Buddhist temple and Inari shrine right in the heart of Akasaka, Toyokawa Inari Tokyo Betsuin is famous for its collection of over 1,000 fox statues crowding every corner of the grounds. Despite being in one of Tokyo's busiest business districts, the dense arrangement of stone foxes creates an otherworldly atmosphere that feels far removed from the surrounding skyscrapers.",
        coordinate: CLLocationCoordinate2D(latitude: 35.6733, longitude: 139.7346),
        stampSlotId: 55,
        category: .inari,
        tagline: "A thousand fox statues hiding in the heart of Akasaka",
        highlights: [
            "Over 1,000 fox statues packed into compact grounds — surreal and photogenic",
            "Rare Buddhist-Inari fusion — both temple and shrine elements",
            "Celebrity and entertainment industry favorite for success prayers",
            "Seven lucky gods pilgrimage course within the grounds"
        ],
        mustSee: "The Reiko-zuka fox mound at the rear — hundreds of fox statues of every size crowd together in a dense, almost overwhelming display. One of the most photogenic hidden spots in Tokyo.",
        tips: [
            "The fox statue area at the back is the highlight — don't leave without seeing it",
            "Popular with TV and entertainment industry people — located near TBS studios",
            "The seven lucky gods stamps can all be collected within the temple grounds",
            "Free to enter, and the compact grounds make it a quick but memorable visit"
        ],
        bestSeason: "Year-round (New Year and Setsubun in February are lively)",
        access: "5 min walk from Akasaka-Mitsuke Station (Ginza/Marunouchi Line)",
        hours: "6:00-20:00",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000001-0000-0000-0000-000000000056")!,
        name: "Shiba Toshogu",
        address: "4-8-10 Shibakoen, Minato, Tokyo",
        description: "One of the few surviving Toshogu shrines in central Tokyo, Shiba Toshogu was built in 1617 to enshrine Tokugawa Ieyasu and sits quietly in the shadow of Tokyo Tower. While Nikko's Toshogu draws millions, this intimate shrine offers a peaceful alternative with its own beautiful karamon gate and stone lantern-lined approach — all without the crowds.",
        coordinate: CLLocationCoordinate2D(latitude: 35.6578, longitude: 139.7503),
        stampSlotId: 56,
        category: .jinja,
        tagline: "A quiet Tokugawa shrine in the shadow of Tokyo Tower",
        highlights: [
            "One of the few Toshogu shrines surviving in central Tokyo",
            "Beautiful karamon gate with ornate carvings",
            "Stone lantern-lined approach in a tranquil garden setting",
            "Adjacent to Zojo-ji and Shiba Park — perfect for a combined visit"
        ],
        mustSee: "The ornate karamon gate — smaller than Nikko's but beautifully preserved, with detailed carvings of dragons and phoenixes that reward close inspection.",
        tips: [
            "Combine with Zojo-ji temple next door and Shiba Park for a half-day historical walk",
            "Tokyo Tower is visible from the grounds — great photo opportunity",
            "Much quieter than Nikko — you'll likely have the shrine to yourself",
            "The icho (ginkgo) trees in the grounds turn golden in late November"
        ],
        bestSeason: "Late Nov (ginkgo foliage), Year-round",
        access: "5 min walk from Onarimon Station (Mita Line) or Shibakoen Station (Mita Line)",
        hours: "6:00-17:00",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000001-0000-0000-0000-000000000057")!,
        name: "Namiyoke Inari Jinja",
        address: "6-20-37 Tsukiji, Chuo, Tokyo",
        description: "The guardian shrine of Tsukiji — Tokyo's legendary fish market district. When the original Tsukiji area was reclaimed from the sea in the 17th century, the waves kept destroying the landfill until a shrine was erected to calm them, giving it the name 'Wave-Repelling Inari.' Today it blesses the seafood industry and visitors who come to pray before a sushi breakfast.",
        coordinate: CLLocationCoordinate2D(latitude: 35.6594, longitude: 139.7700),
        stampSlotId: 57,
        category: .inari,
        tagline: "The shrine that calmed the waves and guards Tsukiji's fish",
        highlights: [
            "Guardian deity of Tsukiji — the world's most famous fish market district",
            "Giant lion head floats (shishi-gashira) displayed at the entrance",
            "Unique seafood-industry blessings — even tuna traders pray here",
            "Named 'Wave-Repelling' for protecting the original Tsukiji landfill"
        ],
        mustSee: "The massive shishi-gashira (lion head) floats at the entrance — these enormous festival heads, one male and one female, are among the largest in Tokyo.",
        tips: [
            "Visit before or after a Tsukiji outer market sushi breakfast — perfect combination",
            "The Tsukiji Shishi Matsuri in June features the giant lion heads paraded through the streets",
            "Despite the main market moving to Toyosu, the outer market around the shrine is still thriving",
            "The shrine is compact — a 10-minute visit pairs perfectly with market exploration"
        ],
        bestSeason: "Jun (Tsukiji Lion Festival), Year-round",
        access: "5 min walk from Tsukiji Station (Hibiya Line) or Tsukijishijo Station (Oedo Line)",
        hours: "24h (grounds), office 9:00-17:00",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000001-0000-0000-0000-000000000058")!,
        name: "Okunitama Jinja",
        address: "3-1 Miyamachi, Fuchu, Tokyo",
        description: "The most important shrine in the old Musashi Province, Okunitama Jinja has been the spiritual center of the Tokyo region for nearly 1,900 years. Its Kurayami Matsuri (Darkness Festival) in May is one of the greatest traditional festivals in Tokyo — enormous mikoshi are carried through the streets at night with all lights extinguished, recreating an ancient ritual of worship in total darkness.",
        coordinate: CLLocationCoordinate2D(latitude: 35.6691, longitude: 139.4776),
        stampSlotId: 58,
        category: .jinja,
        tagline: "1,900 years old — the spiritual heart of old Musashi Province",
        highlights: [
            "Kurayami Matsuri (May) — massive night festival with mikoshi carried in darkness",
            "Ichinomiya of Musashi Province — the highest-ranking shrine in the greater Tokyo region",
            "Keyaki (zelkova) tree-lined approach over 500 meters long",
            "Nearly 1,900 years of continuous worship"
        ],
        mustSee: "The Kurayami Matsuri on the night of May 5 — eight enormous mikoshi weighing over a ton each are paraded through pitch-dark streets by hundreds of bearers. The energy is overwhelming.",
        tips: [
            "Kurayami Matsuri runs April 30 to May 6, but the main night procession is May 5",
            "The zelkova-lined approach is one of the most beautiful shrine avenues in Tokyo",
            "Located near Fuchu Racecourse — combine for a unique day trip from central Tokyo",
            "The shrine grounds are spacious and peaceful on regular days"
        ],
        bestSeason: "May 5 (Kurayami Matsuri), Late Nov (autumn foliage on approach)",
        access: "5 min walk from Fuchu Station (Keio Line)",
        hours: "6:00-17:00 (Sep 15-Mar 31), 6:00-18:00 (Apr 1-Sep 14)",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000001-0000-0000-0000-000000000059")!,
        name: "Musashi Mitake Jinja",
        address: "176 Mitakesan, Ome, Tokyo",
        description: "Perched at 929 meters atop Mount Mitake in Tokyo's rugged western highlands, Musashi Mitake Jinja has been a sacred mountain pilgrimage site for over 2,000 years. The shrine is famous as the protector of dogs — wolf worship (ookami-sama) is central to its tradition, and pet owners bring their dogs for blessings. The hike up through ancient cedar forests is one of the best day trips from central Tokyo.",
        coordinate: CLLocationCoordinate2D(latitude: 35.7856, longitude: 139.1523),
        stampSlotId: 59,
        category: .jinja,
        tagline: "A sacred mountain shrine where dogs receive divine blessings",
        highlights: [
            "Mountain-top shrine at 929m — one of Tokyo's most dramatic locations",
            "Wolf deity worship — bring your dog for a special blessing ceremony",
            "Ancient cedar forest hiking trail to the summit",
            "Cable car ride with panoramic views of the Okutama mountains"
        ],
        mustSee: "The view from the shrine summit on a clear day — you can see all the way to the Tokyo skyline from a mountaintop that feels like a different world entirely.",
        tips: [
            "Take the Mitake Tozan Cable Car to reduce the hike — then walk 25 min to the shrine",
            "Dogs are welcomed and can receive formal blessings (¥500-3,000)",
            "In autumn, the Rock Garden trail below the shrine has spectacular foliage",
            "Allow a full day from central Tokyo — the journey is part of the experience"
        ],
        bestSeason: "May (fresh green), Nov (autumn foliage), Year-round",
        access: "Cable car from Takimoto Station (bus from Mitake Station, JR Ome Line)",
        hours: "8:00-16:00 (shrine office), grounds open daylight hours",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000001-0000-0000-0000-000000000060")!,
        name: "Kishimojin-do (Zoshigaya)",
        address: "3-15-20 Zoshigaya, Toshima, Tokyo",
        description: "Tucked away in the quiet residential streets of Zoshigaya, Kishimojin-do enshrines the goddess of child-rearing and safe childbirth. Originally a Buddhist demon who devoured children, Kishimojin was converted by the Buddha and became their fierce protector instead. The temple's intimate grounds and traditional neighborhood feel make it one of Tokyo's most charming hidden discoveries.",
        coordinate: CLLocationCoordinate2D(latitude: 35.7193, longitude: 139.7163),
        stampSlotId: 60,
        category: .tera,
        tagline: "A reformed demon now guards Tokyo's children",
        highlights: [
            "Deity of safe childbirth and child-rearing — popular with expecting parents",
            "Fascinating origin story — a child-eating demon converted to protector",
            "Quiet Zoshigaya neighborhood with old Tokyo charm",
            "Nearby Zoshigaya Missionary Museum and historic cemetery"
        ],
        mustSee: "The intimate main hall housing the Kishimojin statue — the atmosphere is deeply personal and reverent, with expecting mothers and families offering prayers for their children's safety.",
        tips: [
            "Combine with a walk through Zoshigaya Cemetery where famous authors are buried",
            "The nearby Zoshigaya Missionary Museum is a charming Meiji-era wooden building",
            "The hand-made candy stall near the entrance has been there for generations",
            "Very few tourists — a genuine local neighborhood temple experience"
        ],
        bestSeason: "Year-round (Oct for Oeshiki Festival procession)",
        access: "5 min walk from Zoshigaya Station (Toden Arakawa Line) or Kishibojimmae Station (Fukutoshin Line)",
        hours: "9:00-17:00",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000001-0000-0000-0000-000000000061")!,
        name: "Tennoji",
        address: "7-14-8 Yanaka, Taito, Tokyo",
        description: "Standing at the heart of Yanaka — Tokyo's most beloved old neighborhood — Tennoji is a Tendai Buddhist temple that once anchored a vast cemetery and entertainment complex in the Edo period. The large seated bronze Buddha in the grounds gazes serenely over the surrounding tombs, and the temple's position at the edge of Yanaka Cemetery makes it the perfect starting point for exploring this nostalgic corner of Tokyo.",
        coordinate: CLLocationCoordinate2D(latitude: 35.7249, longitude: 139.7728),
        stampSlotId: 61,
        category: .tera,
        tagline: "The bronze Buddha watching over Yanaka's timeless streets",
        highlights: [
            "Large seated bronze Buddha statue in the open air",
            "Gateway to Yanaka Cemetery — one of Tokyo's most atmospheric walks",
            "Heart of the Yanaka neighborhood — Tokyo's most nostalgic district",
            "Formerly hosted one of Edo's three great tomikuji lotteries"
        ],
        mustSee: "The outdoor bronze Buddha — seated peacefully among the trees and tombstones, it creates a meditative atmosphere that perfectly captures Yanaka's timeless character.",
        tips: [
            "Start here and walk through Yanaka Cemetery to Nippori Station for the classic Yanaka stroll",
            "Combine with Yanaka Ginza shopping street for old-school snacks and crafts",
            "The cherry blossom avenue through Yanaka Cemetery is one of Tokyo's finest",
            "Visit on a weekday for the quietest, most contemplative experience"
        ],
        bestSeason: "Late Mar-Apr (cherry blossoms in Yanaka Cemetery), Year-round",
        access: "5 min walk from Nippori Station (JR Yamanote Line) via Yanaka Cemetery",
        hours: "6:00-17:00",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000001-0000-0000-0000-000000000062")!,
        name: "Fukagawa Fudo-do",
        address: "1-17-13 Tomioka, Koto, Tokyo",
        description: "A branch temple of the great Narita-san Shinshoji, Fukagawa Fudo-do brings the power of the fire ritual (goma) to downtown Tokyo. Multiple times daily, priests chant sutras before a roaring sacred fire in a dramatic ritual that is open to all visitors. The modern inner prayer hall, with its towering crystal wall of 10,000 prayer tablets, is an unexpected architectural marvel.",
        coordinate: CLLocationCoordinate2D(latitude: 35.6722, longitude: 139.7987),
        stampSlotId: 62,
        category: .tera,
        tagline: "Sacred fire rituals roar in the heart of downtown Tokyo",
        highlights: [
            "Daily goma fire ceremonies — watch priests chant before roaring flames",
            "Crystal wall of 10,000 prayer tablets in the inner hall",
            "Branch of the famous Narita-san Shinshoji temple",
            "Adjacent to Tomioka Hachimangu — visit both on one walk"
        ],
        mustSee: "Attend a goma fire ritual — the rhythmic chanting, drumming, and roaring flames create one of the most intense spiritual experiences available in Tokyo. Check the schedule at the entrance.",
        tips: [
            "Fire rituals are held multiple times daily — check the posted schedule on arrival",
            "The inner prayer hall with the crystal wall is modern and striking — don't skip it",
            "Walk straight to Tomioka Hachimangu next door for a shrine-temple combo",
            "The Fukagawa Fudo Ennichi market on the 1st, 15th, and 28th brings local vendors"
        ],
        bestSeason: "Year-round (Setsubun in February for special fire ceremony)",
        access: "2 min walk from Monzen-Nakacho Station (Tozai/Oedo Line)",
        hours: "8:00-18:00 (fire rituals throughout the day)",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000001-0000-0000-0000-000000000063")!,
        name: "Suitengu",
        address: "2-4-1 Nihonbashi Kakigaracho, Chuo, Tokyo",
        description: "Tokyo's most beloved shrine for safe childbirth and fertility, Suitengu has been the spiritual protector of mothers and children since the Edo period. Located in the Nihonbashi business district, the shrine draws a steady stream of expecting parents who come to receive special belly bands blessed by the priests. The 'Dog Day' visits on the calendar's inu-no-hi are especially popular, as dogs symbolize easy birth.",
        coordinate: CLLocationCoordinate2D(latitude: 35.6793, longitude: 139.7820),
        stampSlotId: 63,
        category: .jinja,
        tagline: "Where Tokyo's parents-to-be pray for safe childbirth",
        highlights: [
            "Tokyo's #1 shrine for safe childbirth and fertility prayers",
            "Blessed belly bands (hara-obi) for expecting mothers",
            "Dog Day (inu-no-hi) visits — dogs symbolize easy birth in Japanese tradition",
            "Located in historic Nihonbashi — Tokyo's original commercial heart"
        ],
        mustSee: "The komainu dog statue at the entrance — mothers rub its head for easy delivery. On Dog Days (inu-no-hi), the shrine is packed with expecting couples in a uniquely joyful atmosphere.",
        tips: [
            "Check the Japanese calendar for the next 'inu-no-hi' (Dog Day) if you're expecting",
            "The blessed belly band (hara-obi, ¥4,000) is a meaningful gift for expecting friends",
            "Located in Nihonbashi — combine with a walk through Tokyo's oldest commercial district",
            "The shrine building is modern but the traditions date back centuries"
        ],
        bestSeason: "Year-round (inu-no-hi days are especially popular)",
        access: "8 min walk from Ningyocho Station (Hibiya/Asakusa Line) or Suitengumae Station (Hanzomon Line)",
        hours: "7:00-18:00",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000001-0000-0000-0000-000000000064")!,
        name: "Togo Jinja",
        address: "1-5-3 Jingumae, Shibuya, Tokyo",
        description: "Hidden behind the bustling Takeshita Street and Harajuku's fashion chaos, Togo Jinja is a surprisingly serene shrine dedicated to Admiral Togo Heihachiro, the hero of the Battle of Tsushima. The shrine grounds include a tranquil garden with a koi pond, and the monthly antique market on the first and fourth Sundays draws vintage hunters from across the city.",
        coordinate: CLLocationCoordinate2D(latitude: 35.6686, longitude: 139.7052),
        stampSlotId: 64,
        category: .jinja,
        tagline: "A hidden garden of calm behind Harajuku's fashion frenzy",
        highlights: [
            "Peaceful garden with koi pond steps from Takeshita Street's chaos",
            "Monthly antique market (1st & 4th Sundays) with quality vintage finds",
            "Enshrines Admiral Togo — hero of the 1905 Battle of Tsushima",
            "Victory and success blessings — popular before competitions and exams"
        ],
        mustSee: "Walk from the noise of Takeshita Street into the shrine grounds — the sudden silence and green garden with its koi pond is one of the most dramatic contrasts in Tokyo.",
        tips: [
            "The antique market on the 1st and 4th Sunday mornings is excellent for vintage kimono and ceramics",
            "Enter from the Harajuku side for the best contrast experience",
            "The garden pond is beautiful in spring with cherry blossoms reflected in the water",
            "After visiting, walk to nearby Meiji Jingu for the full Harajuku shrine experience"
        ],
        bestSeason: "Year-round (1st & 4th Sunday for antique market, Apr for cherry blossoms)",
        access: "3 min walk from Harajuku Station (JR Yamanote Line) or Meiji-jingumae Station",
        hours: "6:00-17:00",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000001-0000-0000-0000-000000000065")!,
        name: "Takao-san Yakuo-in",
        address: "2177 Takaomachi, Hachioji, Tokyo",
        description: "Perched near the summit of Mount Takao — Tokyo's most popular hiking mountain — Yakuo-in is a 1,260-year-old Shingon Buddhist temple guarded by tengu (long-nosed mountain goblins). The temple's dramatic setting among ancient cedars, its elaborate tengu statues, and the panoramic views of the Kanto Plain make the hike worth every step. On clear days, Mount Fuji appears framed by the mountain ridgeline.",
        coordinate: CLLocationCoordinate2D(latitude: 35.6252, longitude: 139.2437),
        stampSlotId: 65,
        category: .tera,
        tagline: "Tengu guardians and Mount Fuji views atop Tokyo's favorite mountain",
        highlights: [
            "Dramatic tengu statues guarding the mountain approach",
            "Mount Fuji views from the summit on clear days",
            "1,260 years of mountain worship history",
            "Cable car and chairlift access partway up the mountain"
        ],
        mustSee: "The pair of tengu statues flanking the main hall — one with a long nose (daitengu) and one with a bird's beak (kotengu). These mythical mountain guardians have protected Yakuo-in for centuries.",
        tips: [
            "Take the cable car or chairlift partway, then hike 30 min to the temple and 20 min more to the summit",
            "Winter mornings (Dec-Feb) offer the clearest Mount Fuji views from the summit",
            "Try the tororo soba (grated yam noodles) at the restaurants near the summit — a Mount Takao specialty",
            "Avoid weekends in autumn — Mount Takao draws huge crowds during foliage season"
        ],
        bestSeason: "Nov (spectacular autumn foliage), Dec-Feb (clear Fuji views)",
        access: "5 min walk from Takaosanguchi Station (Keio Takao Line) to cable car base",
        hours: "8:30-16:00 (temple office), grounds open daylight hours",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000001-0000-0000-0000-000000000066")!,
        name: "Konno Hachimangu",
        address: "2-1-11 Shibuya, Shibuya, Tokyo",
        description: "Just steps from the chaos of Shibuya's scramble crossing, Konno Hachimangu has been quietly guarding this area since the Heian period, over 900 years ago. The shrine sits on a hilltop surrounded by old-growth trees, and its spring water was once a natural spring feeding the Shibuya river. Known for blessings of perseverance and endurance, it's a favorite of athletes and students facing tough challenges.",
        coordinate: CLLocationCoordinate2D(latitude: 35.6611, longitude: 139.7019),
        stampSlotId: 66,
        category: .hachimangu,
        tagline: "900 years of calm just steps from Shibuya Crossing",
        highlights: [
            "Over 900 years of history hidden behind Shibuya's busiest streets",
            "Natural spring water — one of the last in the Shibuya area",
            "Blessings for endurance and perseverance — popular with athletes",
            "Peaceful hilltop forest just minutes from the scramble crossing"
        ],
        mustSee: "The contrast itself is the experience — walk from the sensory overload of Shibuya Crossing into this ancient wooded hilltop and feel 900 years of stillness wash over you.",
        tips: [
            "The natural spring at the base of the hill is drinkable — bring a bottle",
            "Visit before or after Shibuya shopping for an unexpected moment of calm",
            "The hilltop grounds have old-growth trees rarely seen this close to Shibuya Station",
            "A genuine hidden gem — even most Tokyoites don't know this shrine exists"
        ],
        bestSeason: "Year-round (autumn foliage in late November)",
        access: "5 min walk from Shibuya Station (JR/Metro/Tokyu/Keio)",
        hours: "24h (grounds), office 9:00-17:00",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000001-0000-0000-0000-000000000067")!,
        name: "Imado Jinja",
        address: "1-5-22 Imado, Taito, Tokyo",
        description: "The self-proclaimed birthplace of the maneki-neko lucky cat (a friendly rivalry with Gotoku-ji), Imado Jinja is Tokyo's go-to shrine for romantic matchmaking. The shrine is filled with pairs of lucky cats — always displayed as couples — and the grounds are covered in heart-shaped ema plaques from love-seekers. Its lively monthly matchmaking events draw singles from across the city.",
        coordinate: CLLocationCoordinate2D(latitude: 35.7199, longitude: 139.8038),
        stampSlotId: 67,
        category: .jinja,
        tagline: "Lucky cats in pairs — Tokyo's fun-loving matchmaking shrine",
        highlights: [
            "Paired maneki-neko cats everywhere — always displayed as couples",
            "Heart-shaped ema plaques covering the grounds",
            "Monthly matchmaking events (enmusubi-no-kai) for singles",
            "Rival claim to being the birthplace of the lucky cat"
        ],
        mustSee: "The enormous pair of maneki-neko cats flanking the altar — these oversized lucky cats in male-female pairs are unique to Imado Jinja and perfectly photogenic.",
        tips: [
            "If you're single, check the schedule for the monthly matchmaking event (enmusubi-no-kai)",
            "Buy the paired cat charm — it's said to work best when you keep it close to your heart",
            "Walk to nearby Senso-ji and Asakusa Jinja for a full Asakusa shrine day",
            "The shrine is a bit north of the main Asakusa tourist area — worth the extra walk"
        ],
        bestSeason: "Year-round (Valentine's Day and Tanabata for extra romance energy)",
        access: "15 min walk from Asakusa Station (Ginza/Asakusa Line) or bus to Riverside Sports Center",
        hours: "9:00-16:00",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000001-0000-0000-0000-000000000068")!,
        name: "Toranomon Kotohiragu",
        address: "1-2-7 Toranomon, Minato, Tokyo",
        description: "Surrounded by the gleaming towers of Toranomon Hills, this compact shrine has been the maritime and business guardian of the area since 1660. As a branch of the famous Konpira-san in Shikoku, it offers the same blessings for safe sea travel and business prosperity — making it a favorite lunchtime prayer stop for the thousands of office workers in the surrounding skyscrapers.",
        coordinate: CLLocationCoordinate2D(latitude: 35.6661, longitude: 139.7470),
        stampSlotId: 68,
        category: .jinja,
        tagline: "An Edo-era maritime shrine amid Toranomon's glass towers",
        highlights: [
            "Branch of the famous Konpira-san shrine in Shikoku",
            "Maritime safety and business prosperity blessings",
            "Dramatic contrast — traditional shrine beneath modern skyscrapers",
            "Beloved lunchtime escape for Toranomon's office workers"
        ],
        mustSee: "Stand at the entrance and look up — the shrine's traditional copper roof against the glass facade of Toranomon Hills behind it is one of Tokyo's most striking old-meets-new contrasts.",
        tips: [
            "Visit during weekday lunch hours to see the shrine buzzing with salarymen offering quick prayers",
            "The monthly ennichi festival on the 10th brings extra stalls and energy",
            "Combine with nearby Atago Jinja (10 min walk) for a Minato shrine walk",
            "Free and quick to visit — perfect for a 15-minute break between meetings"
        ],
        bestSeason: "Year-round",
        access: "1 min walk from Toranomon Station (Ginza Line) or Toranomon Hills Station (Hibiya Line)",
        hours: "6:00-17:00",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000001-0000-0000-0000-000000000069")!,
        name: "Matsuchiyama Shoden",
        address: "1-5-2 Matsugaya, Taito, Tokyo",
        description: "Perched on a small hill overlooking the Sumida River near Asakusa, Matsuchiyama Shoden is one of Tokyo's most unusual temples. Devoted to the elephant-headed deity Kangiten (derived from the Hindu god Ganesha), the temple is covered in daikon radish motifs — symbols of marital harmony and desire. Visitors offer actual daikon radishes at the altar, creating one of Tokyo's quirkiest spiritual experiences.",
        coordinate: CLLocationCoordinate2D(latitude: 35.7172, longitude: 139.7956),
        stampSlotId: 69,
        category: .tera,
        tagline: "An elephant god, daikon radishes, and Tokyo's quirkiest altar",
        highlights: [
            "Elephant-headed deity Kangiten — unique Hindu-Buddhist fusion",
            "Daikon radish offerings and motifs everywhere — wonderfully quirky",
            "Hilltop location with views over the Sumida River",
            "One of the oldest temples in the Asakusa area"
        ],
        mustSee: "The main altar where real daikon radishes are piled as offerings — it's a sight you won't see at any other temple in Tokyo, and the symbolism of desire and marital harmony is fascinating.",
        tips: [
            "Bring a daikon radish as an offering if you want the full experience — or buy one nearby",
            "The hilltop garden has excellent views of the Sumida River and Tokyo Skytree",
            "Combine with Senso-ji and Asakusa Jinja for a complete Asakusa pilgrimage",
            "Very few foreign tourists visit — a genuine insider's discovery"
        ],
        bestSeason: "Jan (Daikon Festival), Year-round",
        access: "10 min walk from Asakusa Station (Ginza/Asakusa Line)",
        hours: "6:00-16:30",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000001-0000-0000-0000-000000000070")!,
        name: "Kameido Tenjin-sha",
        address: "3-6-1 Kameido, Koto, Tokyo",
        description: "Famous for its stunning wisteria trellises that cascade over arched drum bridges in late April, Kameido Tenjin-sha is one of Tokyo's most photogenic seasonal destinations. Built in 1646 as a branch of Dazaifu Tenmangu, it enshrines the god of learning and draws students before exam season. The wisteria reflected in the shrine's ponds with the Tokyo Skytree rising behind is a signature Tokyo image.",
        coordinate: CLLocationCoordinate2D(latitude: 35.6986, longitude: 139.8268),
        stampSlotId: 70,
        category: .tenmangu,
        tagline: "Cascading wisteria and Tokyo Skytree — spring perfection",
        highlights: [
            "Spectacular wisteria trellises cascading over drum bridges (late April)",
            "Tokyo Skytree framed by wisteria and pond reflections",
            "Branch of Dazaifu Tenmangu — strong exam success blessings",
            "Arched drum bridges reflected in tranquil shrine ponds"
        ],
        mustSee: "Visit in late April when the wisteria is in full bloom — the purple cascades draped over the red drum bridges, reflected in the pond with the Skytree behind, is one of Tokyo's most beautiful seasonal views.",
        tips: [
            "Wisteria season is late April to early May — check bloom forecasts before visiting",
            "The evening wisteria illumination (if offered) is extraordinarily romantic",
            "Combine with nearby Kameido Gyoza for Tokyo's most famous pot stickers after your visit",
            "The plum blossoms in February are also lovely and far less crowded"
        ],
        bestSeason: "Late Apr-early May (wisteria), Feb (plum blossoms)",
        access: "15 min walk from Kameido Station (JR Sobu Line) or Kameido Station (Tobu Line)",
        hours: "6:00-17:00 (extended during wisteria festival)",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000001-0000-0000-0000-000000000071")!,
        name: "Koami Jinja",
        address: "16-23 Nihonbashi Koamicho, Chuo, Tokyo",
        description: "One of Tokyo's smallest but most powerful shrines, Koami Jinja is famous for two things: miraculous financial luck and surviving every disaster. The shrine was the only structure in its neighborhood to survive the 1923 Great Kanto Earthquake and the WWII firebombing — the people who sheltered here all survived. Today, finance workers from nearby Nihonbashi line up to pray for prosperity and wash coins in the sacred Zeniarai well.",
        coordinate: CLLocationCoordinate2D(latitude: 35.6833, longitude: 139.7789),
        stampSlotId: 71,
        category: .jinja,
        tagline: "Tokyo's luckiest tiny shrine — survived earthquake, war, and everything else",
        highlights: [
            "Survived 1923 earthquake and WWII firebombing — legendary protection",
            "Zeniarai Benten coin-washing well — wash your money to multiply it",
            "Powerful financial luck blessings — beloved by Nihonbashi finance workers",
            "One of the smallest yet most talked-about shrines in Tokyo"
        ],
        mustSee: "The Zeniarai Benten well — wash your coins or bills in the sacred water and keep them in your wallet. Finance workers swear by this ritual for investment luck.",
        tips: [
            "Bring coins to wash in the Zeniarai well — keep the washed money in your wallet for luck",
            "Despite its tiny size, the shrine has a serious reputation in the financial district",
            "Visit on a weekday to see office workers in suits lined up for prayers",
            "Combine with a walk through historic Nihonbashi — Japan's commercial birthplace"
        ],
        bestSeason: "Year-round (New Year for special financial blessings)",
        access: "5 min walk from Ningyocho Station (Hibiya/Asakusa Line)",
        hours: "24h (grounds), office 9:00-16:00",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000001-0000-0000-0000-000000000072")!,
        name: "Yushima Seido",
        address: "1-4-25 Yushima, Bunkyo, Tokyo",
        description: "The birthplace of Japanese public education, Yushima Seido is a Confucian temple that served as the site of the Tokugawa shogunate's official academy — the forerunner of the University of Tokyo. The striking black-lacquered buildings are unlike anything else in Tokyo's shrine landscape, and the massive bronze statue of Confucius in the courtyard is one of the largest in the world outside China.",
        coordinate: CLLocationCoordinate2D(latitude: 35.7017, longitude: 139.7682),
        stampSlotId: 72,
        category: .tera,
        tagline: "The black-lacquered birthplace of Japanese education",
        highlights: [
            "Birthplace of Japan's public education system — forerunner of the University of Tokyo",
            "Striking black-lacquered Confucian architecture — unique in Tokyo",
            "One of the world's largest bronze Confucius statues",
            "Powerful academic success blessings — a scholarly pilgrimage"
        ],
        mustSee: "The Taisei-den main hall — its dramatic black lacquer exterior with green roof tiles is completely unlike any other religious building in Tokyo, reflecting its Confucian Chinese origins.",
        tips: [
            "Walk from nearby Kanda Myojin (5 min) for a fascinating contrast — Shinto vs. Confucian",
            "The Confucius statue is in the courtyard — look for the four attendant sages",
            "Free to enter the outer grounds; the main hall opens on weekends and holidays",
            "Very few tourists visit — a genuinely off-the-beaten-path discovery in central Tokyo"
        ],
        bestSeason: "Year-round (Apr for Confucius ceremony, Nov for autumn foliage)",
        access: "3 min walk from Ochanomizu Station (JR Chuo/Sobu Line)",
        hours: "9:30-17:00 (Sat, Sun, holidays; weekdays grounds only)",
        imageURLs: []
    ),

    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    // MARK: - Tokyo Ten Shrines 完結 + 主要寺社 (ID 101-112)
    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

    // 東京十社 — 芝大神宮
    Shrine(
        id: UUID(uuidString: "00000001-0000-0000-0000-000000000101")!,
        name: "Shiba Daijingu",
        address: "1-12-7 Shibadaimon, Minato, Tokyo",
        description: "One of the Tokyo Ten Shrines (東京十社), Shiba Daijingu has been known as 'Kanto's Ise Shrine' since the Heian period, enshrining the same deities as Ise Jingu. During the Edo era, the shrine's lively dara-dara matsuri — an 11-day festival — was one of the longest in Tokyo. Today it's a hidden gem in the shadow of Tokyo Tower, offering powerful blessings for good fortune and romance.",
        coordinate: CLLocationCoordinate2D(latitude: 35.6580, longitude: 139.7528),
        stampSlotId: 101,
        category: .jinja,
        tagline: "The 'Ise of Kanto' — one of the Tokyo Ten Shrines",
        highlights: [
            "One of the Tokyo Ten Shrines (東京十社) designated by Emperor Meiji",
            "Known as 'Kanto no Ise' — enshrines the same deities as Ise Jingu",
            "The Dara-Dara Matsuri: an 11-day festival, one of Edo's longest",
            "Powerful blessings for good fortune, romance, and prosperity"
        ],
        mustSee: "The shrine's stunning contrast with modern Tokyo — tiny ancient grounds with Tokyo Tower looming directly behind, a perfect symbol of old-meets-new.",
        tips: [
            "Just 5 minutes from Zojo-ji and Tokyo Tower — combine all three",
            "The Dara-Dara Matsuri in September features ginger stalls, a centuries-old tradition",
            "One of the best places to buy good-luck charms (omamori) for romance",
            "Small shrine — you can visit in 15 minutes, perfect as a quick stop"
        ],
        bestSeason: "Sep (Dara-Dara Matsuri), New Year (hatsumode), Year-round",
        access: "3 min walk from Daimon Station (Oedo/Asakusa Line) or Hamamatsucho Station (JR)",
        hours: "Open 24 hours (office 9:00-17:00)",
        imageURLs: []
    ),

    // 東京十社 — 白山神社
    Shrine(
        id: UUID(uuidString: "00000001-0000-0000-0000-000000000102")!,
        name: "Hakusan Jinja",
        address: "3-30-26 Hakusan, Bunkyo, Tokyo",
        description: "One of the Tokyo Ten Shrines, Hakusan Jinja is Tokyo's premier hydrangea shrine. Every June, about 3,000 hydrangeas transform the hillside grounds into a sea of blue, purple, and white — the annual Bunkyo Ajisai Matsuri draws thousands. The shrine dates to 948 AD and enshrines Kukurihime-no-Mikoto, a deity of matchmaking and reconciliation. It's one of the most beautiful neighborhood shrines in Tokyo.",
        coordinate: CLLocationCoordinate2D(latitude: 35.7219, longitude: 139.7519),
        stampSlotId: 102,
        category: .jinja,
        tagline: "Tokyo's hydrangea shrine — 3,000 flowers paint the hillside every June",
        highlights: [
            "One of the Tokyo Ten Shrines (東京十社)",
            "3,000 hydrangeas bloom in June — the Bunkyo Ajisai Matsuri",
            "Enshrines Kukurihime — goddess of matchmaking and reconciliation",
            "Peaceful hillside grounds in a residential Bunkyo neighborhood"
        ],
        mustSee: "Visit during the Bunkyo Ajisai Matsuri (mid-June) when 3,000 hydrangeas are in full bloom — the adjacent Hakusan Park becomes a carpet of blue and purple, and the shrine opens special areas normally closed to the public.",
        tips: [
            "June is THE month to visit — the hydrangea festival is genuinely spectacular",
            "Combine with nearby Koishikawa Korakuen garden and Tokyo Dome for a full day",
            "The shrine is on a quiet residential hill — a welcome break from busy Tokyo",
            "Draw a special hydrangea-themed omikuji fortune during the festival"
        ],
        bestSeason: "Jun (Ajisai Matsuri — hydrangea festival), Year-round",
        access: "3 min walk from Hakusan Station (Toei Mita Line)",
        hours: "Open 24 hours (office 9:00-17:00)",
        imageURLs: []
    ),

    // 東京十社 — 品川神社
    Shrine(
        id: UUID(uuidString: "00000001-0000-0000-0000-000000000103")!,
        name: "Shinagawa Jinja",
        address: "3-7-15 Kitashinagawa, Shinagawa, Tokyo",
        description: "One of the Tokyo Ten Shrines, Shinagawa Jinja stands atop a steep stone staircase overlooking the old Tokaido road — the great highway that connected Edo to Kyoto. Founded in 1187 by Minamoto no Yoritomo, the shrine features a rare fuji-zuka (miniature Mt. Fuji) that pilgrims climb for blessings, and a striking double dragon relief carved into the stone torii. The Shinagawa Shuku festival in June is one of Tokyo's most energetic local matsuri.",
        coordinate: CLLocationCoordinate2D(latitude: 35.6221, longitude: 139.7401),
        stampSlotId: 103,
        category: .jinja,
        tagline: "Tokaido road guardian — one of the Tokyo Ten Shrines with a climbable Mt. Fuji",
        highlights: [
            "One of the Tokyo Ten Shrines (東京十社), founded by the first shogun in 1187",
            "Rare fuji-zuka — a climbable miniature Mt. Fuji within the shrine grounds",
            "Double dragon relief carved into the stone torii — stunning craftsmanship",
            "Overlooks the historic Tokaido road — Japan's most important Edo-era highway"
        ],
        mustSee: "Climb the fuji-zuka — a miniature Mt. Fuji built into the hillside. In Edo times, this was a pilgrimage substitute for those who couldn't make the real climb. The views from the top are surprisingly good.",
        tips: [
            "The stone staircase is steep — take your time and enjoy the view from the top",
            "Walk the old Tokaido road below the shrine for a taste of Edo-era Tokyo",
            "The Shinagawa Shuku festival in early June features exciting mikoshi processions",
            "Less visited than other Tokyo Ten Shrines — you'll often have it to yourself"
        ],
        bestSeason: "Jun (Shinagawa Shuku Matsuri), New Year, Year-round",
        access: "1 min walk from Shinbamba Station (Keikyu Line)",
        hours: "Open 24 hours (office 9:00-17:00)",
        imageURLs: []
    ),

    // 五色不動 — 目黒不動
    Shrine(
        id: UUID(uuidString: "00000001-0000-0000-0000-000000000104")!,
        name: "Ryusen-ji (Meguro Fudo)",
        address: "3-20-26 Shimomeguro, Meguro, Tokyo",
        description: "The most famous of the Edo Five-Color Fudo temples (江戸五色不動), Ryusen-ji has been the 'Meguro Fudo' — the Black-Eyes Fudo — since 808 AD when the monk Jikaku Daishi enshrined a Fudo Myo-o statue here. The temple's powerful waterfall for ascetic practice and sacred spring have drawn believers for over 1,200 years. The area 'Meguro' (black eyes) is literally named after this temple's Fudo deity.",
        coordinate: CLLocationCoordinate2D(latitude: 35.6318, longitude: 139.7086),
        stampSlotId: 104,
        category: .tera,
        tagline: "The Black-Eyes Fudo — the district of Meguro is named after this temple",
        highlights: [
            "Most famous of the Edo Five-Color Fudo (五色不動) — 'Meguro' means 'black eyes'",
            "1,200-year history — one of the oldest temples in the Tokyo area",
            "Sacred waterfall used for ascetic practice (takigyo) since the Heian period",
            "The entire Meguro district is literally named after this temple's deity"
        ],
        mustSee: "The sacred waterfall (Dokko-no-taki) at the back of the temple grounds — one of the few remaining natural waterfalls in central Tokyo, still used for purification rituals.",
        tips: [
            "Visit on the 28th of any month for the ennichi market with food stalls and antiques",
            "The area around the temple is old residential Meguro — charmingly quiet",
            "Combine with Meguro River cherry blossom walk in late March-early April",
            "The 'Meguro Sanma Matsuri' (sardine festival) in September is a beloved local event"
        ],
        bestSeason: "Monthly 28th (ennichi market), Late Mar-Apr (cherry blossoms), Year-round",
        access: "12 min walk from Fudo-mae Station (Tokyu Meguro Line) or Meguro Station (JR)",
        hours: "9:00-17:00",
        imageURLs: []
    ),

    // 護国寺
    Shrine(
        id: UUID(uuidString: "00000001-0000-0000-0000-000000000105")!,
        name: "Gokoku-ji",
        address: "5-40-1 Otsuka, Bunkyo, Tokyo",
        description: "Built in 1681 by the fifth Tokugawa shogun for his mother's prayer hall, Gokoku-ji is one of the few Edo-period temples to survive war and earthquake with its original main hall intact — a rare treasure in Tokyo. The Kannon-do main hall (Important Cultural Property) and the Niomon gate create a sense of grandeur unusual for an urban temple. The adjacent Toshimagaoka Imperial Cemetery holds the graves of several members of the imperial family.",
        coordinate: CLLocationCoordinate2D(latitude: 35.7178, longitude: 139.7267),
        stampSlotId: 105,
        category: .tera,
        tagline: "A shogun's mother's temple — one of Tokyo's few surviving Edo-period halls",
        highlights: [
            "Main hall (Kannon-do) is an original 1697 structure — a rarity in Tokyo",
            "Built by the fifth Tokugawa shogun for his mother Keishoin",
            "Niomon gate and main hall are Important Cultural Properties",
            "Adjacent Toshimagaoka Cemetery holds imperial family graves"
        ],
        mustSee: "The Kannon-do main hall — one of the very few original Edo-period wooden temple buildings surviving in Tokyo. Step inside and you're walking on the same floors as Edo-era shoguns.",
        tips: [
            "One of Tokyo's most undervisited major temples — genuinely peaceful",
            "The grounds are large and leafy — a perfect autumn foliage spot in Bunkyo",
            "Look for the rare Sanju-no-to (three-story pagoda) near the entrance",
            "Gokokuji Station is named after this temple — exit 1 leads right to the gate"
        ],
        bestSeason: "Nov-Dec (autumn foliage), Apr (cherry blossoms), Year-round",
        access: "1 min walk from Gokokuji Station (Tokyo Metro Yurakucho Line)",
        hours: "6:00-17:00",
        imageURLs: []
    ),

    // 福徳神社
    Shrine(
        id: UUID(uuidString: "00000001-0000-0000-0000-000000000106")!,
        name: "Fukutoku Jinja",
        address: "2-4-14 Nihonbashi Muromachi, Chuo, Tokyo",
        description: "Hidden in plain sight between the glass towers of Nihonbashi Muromachi, Fukutoku Jinja is a 1,000-year-old shrine that was beautifully rebuilt in 2014 within the COREDO Muromachi complex. In the Edo era, the shrine was so favored for its fortune blessings that the Tokugawa shoguns personally visited. Today it's one of Tokyo's hottest power spots for business success and lottery luck, drawing suited office workers during lunch breaks.",
        coordinate: CLLocationCoordinate2D(latitude: 35.6858, longitude: 139.7738),
        stampSlotId: 106,
        category: .jinja,
        tagline: "A 1,000-year shrine reborn in a glass skyscraper complex — Tokyo's luck powerhouse",
        highlights: [
            "1,000-year-old shrine rebuilt in 2014 — stunning modern-traditional fusion",
            "Tokugawa shoguns visited personally for fortune blessings",
            "One of Tokyo's hottest power spots for business success and lottery luck",
            "Beautifully integrated into the COREDO Muromachi complex"
        ],
        mustSee: "The shrine at night — the modern lighting design illuminates the traditional wooden structure against the surrounding glass towers, creating one of the most photogenic shrine scenes in Tokyo.",
        tips: [
            "Buy a 'Tomikunji' lottery charm — the shrine is famous for lottery luck",
            "The Nihonbashi Sakura Festival in spring features projected cherry blossoms at the shrine",
            "Lunchtime is busy with office workers — visit early morning for quiet contemplation",
            "COREDO Muromachi has excellent restaurants and shops for after your visit"
        ],
        bestSeason: "Year-round (spring for Sakura Festival, New Year for hatsumode)",
        access: "1 min walk from Mitsukoshimae Station (Ginza/Hanzomon Line)",
        hours: "Open 24 hours (office 9:00-17:00)",
        imageURLs: []
    ),

    // 赤城神社
    Shrine(
        id: UUID(uuidString: "00000001-0000-0000-0000-000000000107")!,
        name: "Akagi Jinja",
        address: "1-10 Akagi Motomachi, Shinjuku, Tokyo",
        description: "A 700-year-old shrine redesigned by world-famous architect Kengo Kuma in 2010, Akagi Jinja is the most architecturally striking shrine in Tokyo. The sleek glass-and-wood design seamlessly blends contemporary minimalism with Shinto tradition, and the shrine complex includes a modern apartment building and café — a radical reimagining of what a neighborhood shrine can be. Located on the charming Kagurazaka slope, it's a must-visit for architecture and design enthusiasts.",
        coordinate: CLLocationCoordinate2D(latitude: 35.7033, longitude: 139.7380),
        stampSlotId: 107,
        category: .jinja,
        tagline: "A Kengo Kuma masterpiece — 700 years of tradition in contemporary glass",
        highlights: [
            "Redesigned by Kengo Kuma in 2010 — Japan's most famous living architect",
            "Glass-and-wood design fuses contemporary minimalism with Shinto tradition",
            "Shrine complex includes apartments and a café — a radical urban shrine model",
            "Charming location on the Kagurazaka slope — Tokyo's 'Little Paris'"
        ],
        mustSee: "The main shrine building itself — Kengo Kuma's glass and wood lattice structure lets natural light filter through in a way that makes the sacred space feel both ancient and futuristic.",
        tips: [
            "Visit the shrine café for coffee with a view of Kuma's architecture",
            "Walk Kagurazaka's cobblestone back alleys after — one of Tokyo's most charming neighborhoods",
            "The shrine's Gegege-no-Kitaro manga connection draws anime fans — look for themed ema",
            "Architecture enthusiasts should visit at sunset when the glass catches the golden light"
        ],
        bestSeason: "Year-round (autumn for Kagurazaka's atmosphere)",
        access: "1 min walk from Kagurazaka Station (Tozai Line)",
        hours: "Open 24 hours (office 9:00-17:00)",
        imageURLs: []
    ),

    // 穴守稲荷神社
    Shrine(
        id: UUID(uuidString: "00000001-0000-0000-0000-000000000108")!,
        name: "Anamori Inari Jinja",
        address: "3-27-18 Haneda, Ota, Tokyo",
        description: "Just minutes from Haneda Airport, Anamori Inari Jinja has protected travelers and the local fishing community since 1804. The shrine is famous for its tunnel of vermillion torii gates — reminiscent of Fushimi Inari in Kyoto but without the crowds. Legend says a fox deity living in a cave ('ana') guarded the shore, giving the shrine its name. It's the perfect first or last shrine visit when flying through Haneda.",
        coordinate: CLLocationCoordinate2D(latitude: 35.5521, longitude: 139.7387),
        stampSlotId: 108,
        category: .inari,
        tagline: "Haneda's guardian fox shrine — a tunnel of vermillion torii near the runway",
        highlights: [
            "Vermillion torii tunnel — a mini Fushimi Inari without the crowds",
            "Just minutes from Haneda Airport — perfect for travelers",
            "Named after a fox deity's cave ('ana') that guarded the shore",
            "Annual Haneda Festival features the shrine's energetic mikoshi"
        ],
        mustSee: "The tunnel of vermillion torii gates in the rear shrine — walk through the arch of red gates with the sound of planes overhead for a uniquely Tokyo spiritual experience.",
        tips: [
            "Perfect first or last stop when flying through Haneda Airport",
            "Take the Keikyu Line — Anamori-Inari Station is literally named after the shrine",
            "The 'kitsune-zuka' (fox mound) at the back has hundreds of fox statues",
            "Buy a travel-safety charm (omamori) — especially appropriate given the airport location"
        ],
        bestSeason: "New Year (hatsumode), Year-round",
        access: "1 min walk from Anamori-Inari Station (Keikyu Airport Line)",
        hours: "Open 24 hours (office 9:00-17:00)",
        imageURLs: []
    ),

    // 高幡不動尊金剛寺
    Shrine(
        id: UUID(uuidString: "00000001-0000-0000-0000-000000000109")!,
        name: "Takahatafudo Kongoji",
        address: "733 Takahata, Hino, Tokyo",
        description: "The greatest temple in western Tokyo, Takahatafudo has been a center of Fudo Myo-o worship since 1100 AD. The Fudo hall houses one of Japan's oldest Fudo statues — the Joroku Fudo (over 3 meters tall) is an Important Cultural Property. Every June, the hillside explodes with 7,500 hydrangeas, and the temple hosts one of the Kanto region's most spectacular setsubun bean-throwing ceremonies with celebrity guests.",
        coordinate: CLLocationCoordinate2D(latitude: 35.6617, longitude: 139.4014),
        stampSlotId: 109,
        category: .tera,
        tagline: "Western Tokyo's greatest temple — 7,500 hydrangeas and a 3-meter Fudo",
        highlights: [
            "Houses the Joroku Fudo — a 3-meter-tall Important Cultural Property statue",
            "7,500 hydrangeas bloom across the hillside in June",
            "Celebrity setsubun (bean-throwing) ceremony draws huge crowds in February",
            "Connection to the Shinsengumi — Hijikata Toshizo's hometown temple"
        ],
        mustSee: "The Joroku Fudo statue inside the Fudo Hall — at over 3 meters tall with fierce expression and flaming aureola, it is one of the most powerful Fudo images in Japan and an Important Cultural Property.",
        tips: [
            "Shinsengumi fans: this was Hijikata Toshizo's family temple — look for the memorial statue",
            "The hydrangea festival in June rivals Hakusan Jinja's — 7,500 bushes across the hills",
            "The five-story pagoda is a beautiful recent addition with panoramic views",
            "Sunday flea market on the grounds is great for antiques and snacks"
        ],
        bestSeason: "Jun (hydrangea festival), Feb (setsubun), Nov (autumn foliage)",
        access: "2 min walk from Takahatafudo Station (Keio Line / Tama Monorail)",
        hours: "6:00-17:00",
        imageURLs: []
    ),

    // 上野東照宮
    Shrine(
        id: UUID(uuidString: "00000001-0000-0000-0000-000000000110")!,
        name: "Ueno Toshogu",
        address: "9-88 Ueno-koen, Taito, Tokyo",
        description: "A dazzling golden shrine hidden within Ueno Park, Ueno Toshogu was built in 1627 to enshrine Tokugawa Ieyasu — the founder of the Tokugawa shogunate. The karamon gate and honden (main hall) are covered in gold leaf and intricate carvings that rival Nikko Toshogu, yet few tourists know it exists. The approach is lined with 200 stone lanterns and 50 bronze lanterns donated by feudal lords, creating one of Tokyo's most atmospheric shrine paths.",
        coordinate: CLLocationCoordinate2D(latitude: 35.7155, longitude: 139.7742),
        stampSlotId: 110,
        category: .jinja,
        tagline: "A golden shrine hidden in Ueno Park — Nikko's splendor without the crowds",
        highlights: [
            "Gold-leaf-covered main hall and karamon gate — a miniature Nikko in Tokyo",
            "Built in 1627 for Tokugawa Ieyasu, founder of the Tokugawa shogunate",
            "200 stone lanterns and 50 bronze lanterns line the atmospheric approach",
            "One of Tokyo's best-kept secrets — most visitors walk right past it"
        ],
        mustSee: "Pay the ¥500 to enter the inner precinct — the gold-leaf-covered main hall (Important Cultural Property) gleams in the sunlight, and the Chinese-style karamon gate features impossibly detailed carvings of ascending and descending dragons.",
        tips: [
            "Don't skip the inner precinct (¥500) — the gold leaf and carvings are truly spectacular",
            "The peony garden adjacent to the shrine is stunning in January-February and April-May",
            "Combine with Ueno Park's museums, zoo, and Shinobazu Pond for a full day",
            "Morning light makes the gold leaf glow — visit before noon for the best effect"
        ],
        bestSeason: "Jan-Feb (winter peonies), Apr-May (spring peonies), Year-round",
        access: "5 min walk from Ueno Station (JR/Metro) inside Ueno Park",
        hours: "9:00-16:30 (Oct-Feb until 16:00)",
        imageURLs: []
    ),

    // 高岩寺（とげぬき地蔵）
    Shrine(
        id: UUID(uuidString: "00000001-0000-0000-0000-000000000111")!,
        name: "Koganji",
        address: "3-35-2 Sugamo, Toshima, Tokyo",
        description: "Better known as 'Togenuki Jizo' (Thorn-Removing Jizo), Koganji is the heart and soul of Sugamo — 'Grandma's Harajuku.' The temple's famous healing Jizo statue, Arai Kannon, is washed with water by visitors who believe rubbing the same spot on the statue will cure ailments in their own body. The Sugamo Jizo-dori shopping street is one of Tokyo's most charming retro experiences, with red underwear shops and traditional sweets.",
        coordinate: CLLocationCoordinate2D(latitude: 35.7333, longitude: 139.7392),
        stampSlotId: 111,
        category: .tera,
        tagline: "Grandma's Harajuku — wash the healing Jizo and cure what ails you",
        highlights: [
            "Famous Arai Kannon — wash the statue to heal your ailments",
            "Heart of 'Grandma's Harajuku' — Sugamo's beloved retro shopping street",
            "Ennichi markets on the 4th, 14th, and 24th of every month draw huge crowds",
            "One of Tokyo's most authentic neighborhood temple experiences"
        ],
        mustSee: "The Arai Kannon (Washing Kannon) — join the queue to pour holy water over the white cloth-covered statue. Tradition says rubbing the same spot on the statue as your ailment will bring healing.",
        tips: [
            "Visit on the 4th, 14th, or 24th for the ennichi market — Jizo-dori comes alive",
            "Try the famous shio-daifuku (salt rice cakes) from the shops on the street",
            "Don't miss the red underwear shops — buying red underpants here is a beloved tradition for good health",
            "Combine with a stroll to nearby Rikugien Garden — one of Tokyo's finest"
        ],
        bestSeason: "Year-round (monthly ennichi on 4th, 14th, 24th)",
        access: "5 min walk from Sugamo Station (JR Yamanote Line / Mita Line)",
        hours: "6:00-17:00",
        imageURLs: []
    ),

    // 十二社熊野神社
    Shrine(
        id: UUID(uuidString: "00000001-0000-0000-0000-000000000112")!,
        name: "Juniso Kumano Jinja",
        address: "2-11-2 Nishishinjuku, Shinjuku, Tokyo",
        description: "Standing in the shadow of Shinjuku's skyscrapers, Juniso Kumano Jinja has been the guardian shrine of the western Shinjuku area since 1394 when a local lord brought the deity from Kumano in Wakayama. The name 'Juniso' (Twelve Shrines) recalls the twelve sub-shrines that once surrounded the complex when this area was a lakeside retreat. Today the shrine offers a rare pocket of tranquility steps from the Tokyo Metropolitan Government Building and Shinjuku Central Park.",
        coordinate: CLLocationCoordinate2D(latitude: 35.6911, longitude: 139.6914),
        stampSlotId: 112,
        category: .jinja,
        tagline: "A 630-year-old Kumano shrine at the foot of Shinjuku's skyscrapers",
        highlights: [
            "Guardian shrine of Nishishinjuku since 1394 — predates the skyscrapers by 600 years",
            "Connected to the famous Kumano pilgrimage shrines of Wakayama",
            "The 'Juniso' (Twelve Shrines) area was once a scenic lakeside retreat",
            "Stunning contrast — ancient shrine grounds against towering skyscrapers"
        ],
        mustSee: "Stand at the shrine entrance and look up — the contrast of the ancient torii gate framing the massive Shinjuku skyscrapers behind it is one of the most dramatic 'old vs. new' views in all of Tokyo.",
        tips: [
            "Located right next to Shinjuku Central Park — combine for a green escape from the city",
            "Walk to the Tokyo Metropolitan Government Building's free observation deck (5 min) after",
            "The annual September festival (reitaisai) features a lively mikoshi procession through the skyscraper district",
            "A genuinely quiet escape — most tourists never discover this shrine"
        ],
        bestSeason: "Sep (reitaisai festival), Year-round",
        access: "5 min walk from Nishi-Shinjuku-Gochome Station (Oedo Line) or Hatsudai Station (Keio Line)",
        hours: "Open 24 hours (office 9:00-17:00)",
        imageURLs: []
    ),
]
