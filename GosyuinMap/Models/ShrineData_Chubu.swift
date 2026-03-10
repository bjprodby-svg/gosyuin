import SwiftUI
import CoreLocation

// MARK: - Chubu (28 shrines, ID 191-218)

let chubuShrines: [Shrine] = [

    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    // MARK: - Tokai: Aichi
    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

    Shrine(
        id: UUID(uuidString: "00000004-0000-0000-0000-000000000191")!,
        name: "Atsuta Jingu",
        address: "1-1-1 Jingu, Atsuta, Nagoya, Aichi",
        description: "One of Japan's most revered shrines, Atsuta Jingu is said to house the Kusanagi no Tsurugi — one of the three Imperial Regalia of Japan. Founded nearly 2,000 years ago, the shrine sits within a dense forest of towering camphor trees in the heart of Nagoya. With over 9 million visitors during New Year's hatsumode alone, it ranks among the nation's most visited sacred sites.",
        coordinate: CLLocationCoordinate2D(latitude: 35.1269, longitude: 136.9081),
        stampSlotId: 191,
        category: .jingu,
        tagline: "Guardian of the imperial sword in Nagoya's sacred forest",
        highlights: [
            "Houses the Kusanagi no Tsurugi — one of Japan's three Imperial Regalia",
            "Dense camphor forest with trees over 1,000 years old",
            "Treasure hall displaying over 4,000 artifacts including swords and masks",
            "Top 5 most-visited shrine in Japan during New Year"
        ],
        mustSee: "Walk the main approach through the ancient camphor forest — the towering trees create a canopy so dense that even midday feels like twilight. The solemn atmosphere prepares you for the inner sanctuary ahead.",
        tips: [
            "The Treasure Hall (Bunkaden) displays historic swords and ceremonial items — ¥300 admission",
            "Try kishimen flat noodles at the shrine's famous noodle shop inside the grounds",
            "The shrine is free to enter and open year-round — early morning visits are most peaceful",
            "During hatsumode (Jan 1-3) expect massive crowds — arrive before dawn or after dark"
        ],
        bestSeason: "Year-round (Jun for Atsuta Festival with fireworks, Jan for hatsumode)",
        access: "3 min walk from Jingu-mae Station (Meitetsu Nagoya Line) or 7 min from Atsuta Station (JR Tokaido Line)",
        hours: "Open 24 hours (Treasure Hall 9:00-16:30, closed last Wed & Thu of month)",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000004-0000-0000-0000-000000000192")!,
        name: "Toyokawa Inari",
        address: "1 Toyokawa-cho, Toyokawa, Aichi",
        description: "Toyokawa Inari is a fascinating rarity — a Buddhist temple (Myogon-ji) that enshrines the Inari fox deity, blurring the line between Shinto and Buddhism. One of Japan's three great Inari sanctuaries, the temple grounds feature a mesmerizing Reiko-zuka area with over 1,000 fox statues in every conceivable pose, donated by devotees over the centuries.",
        coordinate: CLLocationCoordinate2D(latitude: 34.8272, longitude: 137.5640),
        stampSlotId: 192,
        category: .inari,
        tagline: "A thousand foxes guard this rare Buddhist-Inari sanctuary",
        highlights: [
            "Over 1,000 fox statues crowded in the Reiko-zuka area",
            "Rare fusion of Buddhist temple and Inari fox deity worship",
            "One of Japan's three great Inari sanctuaries",
            "Stunning main hall with elaborate wood carvings"
        ],
        mustSee: "The Reiko-zuka fox mound is unforgettable — over a thousand stone fox statues of all sizes crowd together on a hillside, some mossy and ancient, others brand new, creating an eerie and beautiful landscape.",
        tips: [
            "Toyokawa inari-zushi (fried tofu sushi) is a local specialty — try it in the shops along the approach road",
            "The temple is free to enter and takes about 45 minutes to explore fully",
            "Visit on the first or 15th of the month for special prayer services",
            "Easy day trip from Nagoya — about 60 minutes by Meitetsu limited express"
        ],
        bestSeason: "Year-round (New Year for hatsumode, spring and autumn for pleasant weather)",
        access: "5 min walk from Toyokawa Station (JR Iida Line) or Toyokawa-Inari Station (Meitetsu Toyokawa Line)",
        hours: "5:00-18:00 (grounds); prayer hall 6:00-16:00",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000004-0000-0000-0000-000000000193")!,
        name: "Osu Kannon",
        address: "2-21-47 Osu, Naka, Nagoya, Aichi",
        description: "Located at the heart of Nagoya's vibrant Osu shopping district, Osu Kannon is a beloved Shingon Buddhist temple dedicated to the Goddess of Mercy (Kannon). The temple houses the oldest surviving copy of the Kojiki, Japan's most ancient historical record, in its Shinpuku-ji library. The bustling market atmosphere surrounding the temple seamlessly blends sacred and secular Nagoya life.",
        coordinate: CLLocationCoordinate2D(latitude: 35.1580, longitude: 136.9030),
        stampSlotId: 193,
        category: .tera,
        tagline: "Nagoya's beloved Kannon temple in the heart of its liveliest district",
        highlights: [
            "Home to the oldest surviving copy of the Kojiki (Japan's oldest history book)",
            "Vibrant Osu shopping arcade stretching out from the temple gates",
            "Monthly antique market on the 18th and 28th",
            "Dramatic red-painted main hall rebuilt in 1970 in traditional style"
        ],
        mustSee: "Stand at the top of the temple steps and look back down at the Osu arcade entrance — the contrast between the solemn red temple hall and the bustling neon-lit shopping street captures the essence of modern Nagoya.",
        tips: [
            "The antique flea market on the 18th and 28th of each month is one of Nagoya's best",
            "Combine with an afternoon exploring the Osu arcade — electronics, vintage clothing, and street food",
            "The temple is free to enter and quick to visit — 15 minutes is sufficient",
            "Try the local specialty Taiwan ramen in the surrounding streets"
        ],
        bestSeason: "Year-round (monthly markets on 18th & 28th, Feb for Setsubun)",
        access: "1 min walk from Osu Kannon Station (Tsurumai Line, Exit 2)",
        hours: "6:00-19:00 (grounds open earlier)",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000004-0000-0000-0000-000000000194")!,
        name: "Masumida Jinja",
        address: "2-1 Masumida-dori, Ichinomiya, Aichi",
        description: "As the Ichinomiya (first-ranked shrine) of Owari Province, Masumida Jinja has been the spiritual center of the Ichinomiya region for over 2,600 years, giving the city its name. The shrine is dedicated to Amenohohi-no-mikoto, a deity of agriculture and prosperity. Its grounds feature a tranquil sacred pond and a refined worship hall rebuilt in the classic Owari architectural tradition.",
        coordinate: CLLocationCoordinate2D(latitude: 35.3040, longitude: 136.8010),
        stampSlotId: 194,
        category: .jinja,
        tagline: "The shrine that gave Ichinomiya its name — first of Owari Province",
        highlights: [
            "Ichinomiya (first shrine) of Owari Province with 2,600+ years of history",
            "The city of Ichinomiya literally means 'first shrine' — named after this shrine",
            "Peach Blossom Festival (Momo no Sekku) celebrations in March",
            "Sacred pond and serene grounds in the city center"
        ],
        mustSee: "Walk through the main approach to the honden — the classic Owari-style architecture with clean wooden lines and restrained elegance represents a refined provincial shrine tradition distinct from the grand Kyoto style.",
        tips: [
            "Ichinomiya Tanabata Festival in late July transforms the area with elaborate decorations",
            "The shrine is compact — 20 minutes is enough for a thorough visit",
            "Free admission and open year-round",
            "Combine with a walk along the nearby Masumida shopping street for local atmosphere"
        ],
        bestSeason: "Jul (Tanabata Festival), Jan (hatsumode), Year-round",
        access: "10 min walk from Owari-Ichinomiya Station (JR Tokaido Line / Meitetsu Nagoya Line)",
        hours: "5:00-17:00 (outer grounds open 24 hours)",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000004-0000-0000-0000-000000000195")!,
        name: "Tsushima Jinja",
        address: "1 Jinja-cho, Tsushima, Aichi",
        description: "The head shrine of over 3,000 Tsushima shrines scattered across Japan, Tsushima Jinja has been a center for epidemic-prevention prayers since the 6th century. Its most spectacular event is the Owari Tsushima Tennō Festival, held on the fourth weekend of July, where elaborately decorated boats adorned with hundreds of lanterns float across the Tennō River in a breathtaking display of light.",
        coordinate: CLLocationCoordinate2D(latitude: 35.1770, longitude: 136.7260),
        stampSlotId: 195,
        category: .jinja,
        tagline: "Head shrine of 3,000 Tsushima shrines — famed for its lantern boats",
        highlights: [
            "Head shrine of 3,000+ Tsushima shrines throughout Japan",
            "Owari Tsushima Tennō Festival — UNESCO Intangible Cultural Heritage",
            "Makiwara boats glowing with 365 lanterns floating on the river at night",
            "Historic grounds with over 1,500 years of epidemic-prevention worship"
        ],
        mustSee: "If visiting in late July, the Yoimatsuri (eve festival) features five boats lit with hundreds of paper lanterns drifting across the dark river — an image so iconic it was painted by Hiroshige in his famous ukiyo-e series.",
        tips: [
            "The Tennō Festival on the fourth Saturday-Sunday of July is a UNESCO-listed event — book accommodation early",
            "The shrine is quieter on non-festival days — ideal for contemplative visits",
            "Free admission; the grounds include pleasant walking paths",
            "About 30 minutes from Nagoya by Meitetsu Tsushima Line"
        ],
        bestSeason: "Late Jul (Tennō Festival), Year-round",
        access: "15 min walk from Tsushima Station (Meitetsu Tsushima Line)",
        hours: "Open 24 hours (shrine office 9:00-16:30)",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000004-0000-0000-0000-000000000196")!,
        name: "Inuyama Naritasan",
        address: "14 Kita-koken, Inuyama, Aichi",
        description: "Perched on a hillside overlooking Inuyama Castle and the Kiso River, Inuyama Naritasan (Seiryuu-ji) is a branch temple of the famous Naritasan Shinsho-ji in Chiba. The temple's elevated position offers sweeping panoramic views of Inuyama Castle, one of Japan's oldest original castles, and the surrounding mountains. The main hall houses a statue of Fudo Myoo, the fierce protector deity.",
        coordinate: CLLocationCoordinate2D(latitude: 35.3840, longitude: 136.9390),
        stampSlotId: 196,
        category: .tera,
        tagline: "Hilltop temple with panoramic views of Inuyama Castle and the Kiso River",
        highlights: [
            "Panoramic views of Inuyama Castle, the Kiso River, and surrounding mountains",
            "Branch of Naritasan Shinsho-ji — one of Japan's most popular temples",
            "Fudo Myoo (Immovable Wisdom King) as principal deity",
            "Multi-tiered pagoda visible from across the city"
        ],
        mustSee: "Climb to the observation terrace behind the main hall for a stunning panoramic view of Inuyama Castle framed against the Kiso River and the mountains of Gifu — one of the best castle views in all of Japan.",
        tips: [
            "Combine with a visit to Inuyama Castle (10 min walk) for a perfect half-day trip",
            "The castle town (Jokamachi) street has charming shops and local street food",
            "Free admission to the temple grounds",
            "About 30 minutes from Nagoya by Meitetsu Inuyama Line"
        ],
        bestSeason: "Apr (cherry blossoms with castle view), Nov (autumn colors), Year-round",
        access: "15 min walk from Inuyama-Yuen Station (Meitetsu Inuyama Line)",
        hours: "8:00-17:00",
        imageURLs: []
    ),

    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    // MARK: - Tokai: Shizuoka
    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

    Shrine(
        id: UUID(uuidString: "00000004-0000-0000-0000-000000000197")!,
        name: "Fujisan Hongu Sengen Taisha",
        address: "1-1 Miya-cho, Fujinomiya, Shizuoka",
        description: "The head shrine of over 1,300 Sengen shrines across Japan, Fujisan Hongu Sengen Taisha sits at the southwestern base of Mt. Fuji and has been the spiritual guardian of Japan's most sacred mountain for over 2,000 years. The shrine's main deity is Konohanasakuya-hime, the goddess of Mt. Fuji and cherry blossoms. The inner sanctuary technically encompasses the summit of Mt. Fuji itself.",
        coordinate: CLLocationCoordinate2D(latitude: 35.2280, longitude: 138.6120),
        stampSlotId: 197,
        category: .taisha,
        tagline: "The head shrine of Mt. Fuji — where the sacred mountain begins",
        highlights: [
            "Head shrine of 1,300+ Sengen shrines dedicated to Mt. Fuji",
            "Inner sanctuary extends to the summit of Mt. Fuji itself",
            "Waku-ike sacred spring pond fed by Mt. Fuji snowmelt",
            "Lacquered two-story main hall (national treasure) in vivid vermillion"
        ],
        mustSee: "Visit the Waku-ike spring pond behind the main hall — crystal-clear water from Mt. Fuji snowmelt bubbles up from underground, creating a mirror-like pool that has been considered sacred for millennia.",
        tips: [
            "On clear days, Mt. Fuji is visible from the shrine grounds — morning visits offer the best chance",
            "Try Fujinomiya yakisoba (stir-fried noodles) at local restaurants — the city's signature dish",
            "The Yabusame (horseback archery) festival in May is spectacular",
            "Free admission; the grounds include a small museum of Fuji artifacts"
        ],
        bestSeason: "Apr-May (cherry blossoms with Fuji views), Nov (autumn leaves), Winter (clearest Fuji views)",
        access: "10 min walk from Fujinomiya Station (JR Minobu Line)",
        hours: "5:00-20:00 (Nov-Feb 6:00-19:00)",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000004-0000-0000-0000-000000000198")!,
        name: "Kunozan Toshogu",
        address: "390 Negoya, Suruga, Shizuoka, Shizuoka",
        description: "The original burial site of Tokugawa Ieyasu, founder of the Tokugawa shogunate, Kunozan Toshogu was built in 1617 — two years before the more famous Nikko Toshogu. Designated a national treasure, its ornate Gongen-zukuri architecture features vibrant lacquer work and elaborate carvings that rival Nikko in artistry. The shrine crowns a cliff overlooking Suruga Bay with spectacular Pacific Ocean views.",
        coordinate: CLLocationCoordinate2D(latitude: 34.9582, longitude: 138.4620),
        stampSlotId: 198,
        category: .jinja,
        tagline: "Tokugawa Ieyasu's original resting place atop a sea cliff",
        highlights: [
            "Original burial site of Tokugawa Ieyasu — predecessor to Nikko Toshogu",
            "National treasure main hall with vibrant lacquer and gold leaf decoration",
            "Dramatic clifftop location overlooking Suruga Bay and the Pacific Ocean",
            "Access by ropeway offering sweeping ocean panoramas"
        ],
        mustSee: "The Gongen-zukuri main hall — its lacquer work and carved details are a national treasure, completed in the ornate early Edo style. The craftsmanship rivals the more famous Nikko Toshogu but with far fewer crowds.",
        tips: [
            "Take the Nihondaira Ropeway from the plateau — the 5-minute ride offers breathtaking ocean views",
            "Alternatively, climb the 1,159 stone steps from the base — historically how pilgrims ascended",
            "The Nihondaira plateau has observation decks with Mt. Fuji views on clear days",
            "Admission ¥500; allow 1-2 hours including ropeway"
        ],
        bestSeason: "Year-round (winter for clearest Mt. Fuji views from Nihondaira, spring for blossoms)",
        access: "Nihondaira Ropeway from Nihondaira plateau (bus from Shizuoka Station to Nihondaira, 40 min)",
        hours: "9:00-17:00",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000004-0000-0000-0000-000000000199")!,
        name: "Mishima Taisha",
        address: "2-1-5 Omiya-cho, Mishima, Shizuoka",
        description: "One of the most historically significant shrines in eastern Japan, Mishima Taisha served as the spiritual base for Minamoto no Yoritomo before he launched his campaign to establish Japan's first samurai government in Kamakura. The shrine's vast grounds feature a sacred deer park, a treasure hall with Yoritomo-era artifacts, and a beautiful kinmokusei (fragrant olive) tree designated a national natural monument.",
        coordinate: CLLocationCoordinate2D(latitude: 35.1230, longitude: 138.9190),
        stampSlotId: 199,
        category: .taisha,
        tagline: "Where Yoritomo prayed before founding Japan's samurai government",
        highlights: [
            "Minamoto no Yoritomo prayed here before founding the Kamakura shogunate",
            "1,200-year-old kinmokusei (fragrant olive) — a national natural monument",
            "Sacred deer park within the shrine grounds",
            "Treasure hall with samurai-era swords and armor"
        ],
        mustSee: "The 1,200-year-old kinmokusei tree near the main hall — when it blooms in late September, its sweet fragrance fills the entire shrine grounds and can be smelled from blocks away.",
        tips: [
            "Mishima has crystal-clear spring water channels throughout the city — take a waterside stroll after visiting",
            "The shrine is right next to Mishima Station — perfect for a stopover on the Shinkansen line",
            "Try local Mishima croquettes at shops near the shrine",
            "Free admission to the shrine; treasure hall ¥500"
        ],
        bestSeason: "Late Sep-Oct (kinmokusei fragrance), Apr (cherry blossoms), Year-round",
        access: "10 min walk from Mishima Station (JR Tokaido Shinkansen / Izu-Hakone Railway)",
        hours: "Open 24 hours (treasure hall 9:00-16:00)",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000004-0000-0000-0000-000000000200")!,
        name: "Hattasan Sonei-ji",
        address: "2777 Hattasan, Fukuroi, Shizuoka",
        description: "One of the three famous temples of Enshu (Enshu San-zan), Hattasan Sonei-ji has been a major pilgrimage destination for over 1,300 years. Set deep in the forested mountains of western Shizuoka, the temple is dedicated to the Kannon (Goddess of Mercy) and is particularly beloved for its seasonal festivals and the famous Hattasan dango — skewered rice dumplings that have been a temple specialty for centuries.",
        coordinate: CLLocationCoordinate2D(latitude: 34.7923, longitude: 137.9548),
        stampSlotId: 200,
        category: .tera,
        tagline: "Enshu's forest temple — a 1,300-year pilgrimage with famous dango",
        highlights: [
            "One of the Enshu San-zan (three great Enshu temples)",
            "1,300+ years of history as a Kannon worship site",
            "Famous Hattasan dango — a centuries-old rice dumpling specialty",
            "Lush forested mountain setting with long stone approach"
        ],
        mustSee: "Walk the long stone-paved approach up through the forest canopy to the main hall — the gradual climb through towering cedars builds a sense of pilgrimage that culminates at the worship hall perched on the mountainside.",
        tips: [
            "Buy Hattasan dango at the stalls near the entrance — the anko (red bean) and kinako (soybean powder) varieties are legendary",
            "The temple draws huge crowds during hatsumode (New Year) — plan accordingly",
            "Combine with visits to Kasuisai and Yusan-ji to complete the Enshu San-zan pilgrimage",
            "Free admission; parking available at the base of the approach"
        ],
        bestSeason: "Jan (hatsumode), Apr (cherry blossoms), Nov (autumn foliage)",
        access: "Shizutetsu bus from Fukuroi Station (JR Tokaido Line) to Hattasan, about 25 min",
        hours: "8:00-17:00",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000004-0000-0000-0000-000000000201")!,
        name: "Kinomiya Jinja",
        address: "43-1 Nishiyamacho, Atami, Shizuoka",
        description: "Tucked in a forested ravine in the hot spring town of Atami, Kinomiya Jinja is famed for its Okusu — a 2,000-year-old great camphor tree that is one of the largest and oldest trees in Japan. The tree stands over 26 meters tall with a trunk circumference of nearly 24 meters, and walking around it once is said to extend your life by one year. The shrine has become a popular spiritual power spot in recent years.",
        coordinate: CLLocationCoordinate2D(latitude: 35.0950, longitude: 139.0690),
        stampSlotId: 201,
        category: .jinja,
        tagline: "Walk around a 2,000-year-old tree to add a year to your life",
        highlights: [
            "Okusu — a 2,000-year-old camphor tree, one of the largest in Japan",
            "Walking around the tree once said to extend your life by one year",
            "Beautifully lit up at night with atmospheric lighting",
            "Popular modern power spot in the hot spring town of Atami"
        ],
        mustSee: "Walk slowly around the base of the 2,000-year-old Okusu camphor tree — its trunk circumference spans nearly 24 meters, and standing beneath its ancient canopy is a profoundly humbling experience.",
        tips: [
            "The tree is beautifully illuminated at night — evening visits are magical",
            "Combine with an Atami hot spring stay for a full relaxation day",
            "The shrine is small but atmospheric — 30 minutes is enough",
            "Try the shrine's original wheat manju (stuffed bun) at the tea shop"
        ],
        bestSeason: "Year-round (spring for wisteria, evening for illumination)",
        access: "6 min walk from Kinomiya Station (JR Ito Line) or 15 min walk from Atami Station",
        hours: "9:00-17:00 (tree illumination until 23:00)",
        imageURLs: []
    ),

    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    // MARK: - Koshinetsu
    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

    Shrine(
        id: UUID(uuidString: "00000004-0000-0000-0000-000000000202")!,
        name: "Zenko-ji",
        address: "491-i Motoyoshi-cho, Nagano, Nagano",
        description: "One of the most important and beloved temples in Japan, Zenko-ji has welcomed pilgrims for over 1,400 years regardless of sect, gender, or social class — a radical openness in feudal Japan. The temple houses what is believed to be the first Buddhist image ever brought to Japan in 552 AD. Its pitch-black underground passage (Kaidan Meguri) allows visitors to grope in total darkness for the 'Key to Paradise.'",
        coordinate: CLLocationCoordinate2D(latitude: 36.6617, longitude: 138.1862),
        stampSlotId: 202,
        category: .tera,
        tagline: "Grope in total darkness for the Key to Paradise",
        highlights: [
            "Houses what is believed to be the first Buddhist image in Japan (552 AD)",
            "Kaidan Meguri — walk in pitch darkness to find the Key to Paradise",
            "Welcome to all regardless of sect or gender — rare in feudal Japan",
            "Once-in-a-lifetime Gokaicho ceremony every 7 years (next: 2028)"
        ],
        mustSee: "Descend into the Kaidan Meguri beneath the main hall — in absolute darkness, feel along the wall until you find and turn the metal Key to Paradise (Gokuraku no Jojo). It is one of the most unique and moving temple experiences in Japan.",
        tips: [
            "Arrive early to attend the O-juzu Chodai morning blessing ceremony — the head priest touches a rosary to each visitor's head",
            "The approach street (Nakamise-dori) has excellent oyaki dumplings and soba shops",
            "Inner temple admission ¥600 (includes Kaidan Meguri and treasure hall)",
            "The Gokaicho once-every-7-years ceremony draws millions — next in 2028"
        ],
        bestSeason: "Year-round (Gokaicho years are extraordinary, winter for snow atmosphere)",
        access: "20 min walk from Nagano Station (JR Hokuriku Shinkansen) or 10 min by bus to Zenkoji-Daimon",
        hours: "Inner temple: varies by season (approx. 5:30-16:30); grounds open 24h",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000004-0000-0000-0000-000000000203")!,
        name: "Togakushi Jinja",
        address: "3506 Togakushi, Nagano, Nagano",
        description: "A breathtaking five-shrine complex spread across the forested slopes of Mt. Togakushi, linked by trails through towering 400-year-old cedar trees. The shrine complex is connected to the Amaterasu cave myth — it is said that the mountain door (togakushi means 'hidden door') was thrown here when Amaterasu was coaxed from her cave, bringing light back to the world. The 2 km cedar-lined approach to Okusha is one of Japan's most iconic forest walks.",
        coordinate: CLLocationCoordinate2D(latitude: 36.7565, longitude: 138.0606),
        stampSlotId: 203,
        category: .jinja,
        tagline: "Walk through 400-year-old cedars to the mountain door of the gods",
        highlights: [
            "Five interconnected shrines spanning a sacred mountain",
            "2 km cedar-lined approach to Okusha — 400-year-old giants flanking the path",
            "Connected to the Amaterasu cave myth in Japanese mythology",
            "Area renowned for Togakushi soba noodles — considered Japan's best"
        ],
        mustSee: "Walk the full 2 km approach to Okusha (the innermost shrine) — the path narrows into a corridor of massive 400-year-old cedar trees that tower above like cathedral pillars. The randommon gate midway stands wreathed in moss and silence.",
        tips: [
            "Try Togakushi soba at one of the traditional shops — the buckwheat noodles here are legendary",
            "Allow 3-4 hours to visit all five shrines; the Okusha hike alone takes 1 hour round trip",
            "In winter, the area is snowbound and magical but check access conditions",
            "Bus from Nagano Station to Togakushi Okusha takes about 70 minutes"
        ],
        bestSeason: "May-Jun (fresh green), Oct-Nov (autumn foliage), Winter (snow and silence)",
        access: "Alpico bus from Nagano Station to Togakushi Okusha (about 70 min)",
        hours: "Open 24 hours (shrine offices generally 9:00-17:00)",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000004-0000-0000-0000-000000000204")!,
        name: "Suwa Taisha",
        address: "1 Nakasu, Suwa, Nagano",
        description: "One of the oldest shrines in Japan, Suwa Taisha is a complex of four shrine buildings arranged around Lake Suwa, predating even the earliest written records. Uniquely, the shrines have no main hall (honden) — instead, they worship nature directly through sacred trees, mountains, and pillars. Every six years, the explosive Onbashira Festival sees teams of men ride massive logs down steep mountainsides.",
        coordinate: CLLocationCoordinate2D(latitude: 36.0430, longitude: 138.1180),
        stampSlotId: 204,
        category: .taisha,
        tagline: "Japan's oldest shrine — where men ride giant logs down mountains",
        highlights: [
            "One of Japan's oldest shrines — predates written Japanese history",
            "Four shrine buildings arranged around Lake Suwa",
            "No honden (main hall) — worships nature directly through sacred pillars",
            "Onbashira Festival every 6 years — one of Japan's most dangerous festivals"
        ],
        mustSee: "Visit the Kamisha Maemiya and look for the four giant onbashira pillars standing at each corner — these are the massive logs that were cut, dragged, and ridden down mountainsides during the legendary Onbashira Festival.",
        tips: [
            "The Onbashira Festival next occurs in 2028 — plan years ahead as it draws enormous crowds",
            "The four shrines are spread around the lake — Kamisha Maemiya and Shimosha Akimiya are easiest to visit",
            "Free admission to all four shrine locations",
            "Combine with a visit to the Suwa Lake area hot springs"
        ],
        bestSeason: "Onbashira years (every 6 years), Year-round",
        access: "Kamisha Maemiya: 30 min walk or taxi from Chino Station (JR Chuo Line); Shimosha: 10 min walk from Shimosuwa Station",
        hours: "Open 24 hours (shrine office 9:00-16:30)",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000004-0000-0000-0000-000000000205")!,
        name: "Takeda Jinja",
        address: "2611 Kofuchu-cho, Kofu, Yamanashi",
        description: "Built on the ruins of Tsutsujigasaki Mansion, the former residence of the legendary warlord Takeda Shingen, Takeda Jinja enshrines the 'Tiger of Kai' who was one of the most feared daimyo of the Sengoku period. The shrine was established in 1919 to honor Shingen's legacy, and the surrounding grounds preserve the stone walls and moats of his original 16th-century headquarters.",
        coordinate: CLLocationCoordinate2D(latitude: 35.6870, longitude: 138.5700),
        stampSlotId: 205,
        category: .jinja,
        tagline: "The fortress-shrine of Takeda Shingen — Tiger of Kai",
        highlights: [
            "Built on the site of Takeda Shingen's Tsutsujigasaki Mansion",
            "Enshrines one of Japan's most legendary samurai warlords",
            "Remaining stone walls and moats of the original 16th-century fortress",
            "Treasure hall with Takeda clan artifacts and samurai equipment"
        ],
        mustSee: "Walk the perimeter of the old mansion ruins and trace the original moats and stone walls — you are walking the same ground where Takeda Shingen planned his legendary military campaigns over 450 years ago.",
        tips: [
            "The Shingen-ko Festival in April features a massive samurai parade through Kofu — one of Japan's best",
            "Try hoto noodles (flat wheat noodles in miso soup) at nearby restaurants — Shingen's favorite food",
            "The treasure hall has samurai armor and Takeda clan scrolls — ¥300 admission",
            "Free shrine admission; the historical ruins are a pleasant 30-minute walk"
        ],
        bestSeason: "Apr (Shingen-ko Festival & cherry blossoms), Nov (autumn colors)",
        access: "10 min walk or bus from Kofu Station (JR Chuo Line) North Exit",
        hours: "9:00-16:00 (grounds open 24 hours)",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000004-0000-0000-0000-000000000206")!,
        name: "Minobusan Kuon-ji",
        address: "3567 Minobu, Minobu-cho, Minamikoma, Yamanashi",
        description: "The head temple of Nichiren Buddhism, Minobusan Kuon-ji was founded by Nichiren himself in 1281 and has served as the spiritual headquarters of the Nichiren sect for over 700 years. The temple complex sprawls across the slopes of Mt. Minobu, connected by 287 stone steps (Bodhi-in Slope) lined with ancient cedars. In spring, the massive weeping cherry trees on the grounds create one of Japan's most magnificent blossom displays.",
        coordinate: CLLocationCoordinate2D(latitude: 35.3740, longitude: 138.4270),
        stampSlotId: 206,
        category: .tera,
        tagline: "Nichiren's mountain citadel — 287 steps through ancient cedars to enlightenment",
        highlights: [
            "Head temple of Nichiren Buddhism — founded by Nichiren in 1281",
            "287 stone steps (Bodhi-in Slope) through towering cedar forest",
            "Magnificent weeping cherry trees (shidarezakura) in late March",
            "Five-story pagoda and massive main hall on the mountainside"
        ],
        mustSee: "Climb the 287 stone steps of the Bodhi-in Slope — flanked by ancient cedars that form a green tunnel overhead. At the top, the sweeping main hall reveals panoramic mountain views that reward every step.",
        tips: [
            "The weeping cherry trees bloom in late March to early April — among the earliest and most spectacular in the region",
            "The Minobu Ropeway to the summit of Mt. Minobu offers stunning views of Mt. Fuji",
            "Stay overnight in a temple lodging (shukubo) for morning prayers — a profound experience",
            "Allow 2-3 hours for the full temple complex"
        ],
        bestSeason: "Late Mar-Apr (weeping cherry blossoms), Nov (autumn foliage), Year-round",
        access: "Bus from Minobu Station (JR Minobu Line) to Minobusan, about 15 min",
        hours: "5:00-17:00 (Apr-Sep), 5:30-17:00 (Oct-Mar)",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000004-0000-0000-0000-000000000207")!,
        name: "Yahiko Jinja",
        address: "2887-2 Yahiko, Yahiko-mura, Nishikanbara, Niigata",
        description: "The most important shrine in Niigata Prefecture, Yahiko Jinja sits at the base of sacred Mt. Yahiko and has been worshipped for over 2,400 years. The shrine is the Ichinomiya (first shrine) of Echigo Province and enshrines Ame-no-Kagoyama-no-mikoto, who was sent to teach the people of Echigo agriculture, fishing, and salt-making. The massive vermillion torii at the approach and the ropeway to the mountain summit are highlights.",
        coordinate: CLLocationCoordinate2D(latitude: 37.6913, longitude: 138.8237),
        stampSlotId: 207,
        category: .jinja,
        tagline: "Niigata's most sacred shrine at the foot of Mt. Yahiko",
        highlights: [
            "Ichinomiya (first shrine) of Echigo Province — over 2,400 years old",
            "Massive vermillion Ichi-no-torii gate welcoming pilgrims",
            "Mt. Yahiko ropeway to the summit with Sea of Japan panoramas",
            "Chrysanthemum festival in November with thousands of prize blooms"
        ],
        mustSee: "Take the ropeway from behind the shrine to the summit of Mt. Yahiko — on clear days, the panoramic view stretches from the Echigo Plains to the Sea of Japan and even Sado Island on the horizon.",
        tips: [
            "The Chrysanthemum Festival (Kiku Matsuri) in November displays thousands of spectacular blooms",
            "Try Yahiko's local specialty — tochio aburaage (fried tofu) at shops near the shrine",
            "The fire-walking festival (Sagicho) in July is a dramatic sight",
            "Free shrine admission; ropeway ¥1,500 round trip"
        ],
        bestSeason: "Nov (Chrysanthemum Festival & autumn leaves), Apr (cherry blossoms), Year-round",
        access: "15 min walk from Yahiko Station (JR Yahiko Line)",
        hours: "Open 24 hours (shrine office 8:30-16:00; ropeway 9:00-16:30)",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000004-0000-0000-0000-000000000208")!,
        name: "Kitaguchi Hongu Fuji Sengen Jinja",
        address: "5558 Kamiyoshida, Fujiyoshida, Yamanashi",
        description: "The historical starting point for the northern Mt. Fuji climbing route, Kitaguchi Hongu Fuji Sengen Jinja has served as the gateway for Fuji pilgrims for over 1,900 years. The approach road is lined with enormous ancient cedars and stone lanterns, culminating at a grand main hall painted in vivid vermillion. Behind the shrine, the Yoshida Trail begins its ascent to the summit of Japan's most sacred mountain.",
        coordinate: CLLocationCoordinate2D(latitude: 35.4990, longitude: 138.7960),
        stampSlotId: 208,
        category: .jinja,
        tagline: "The northern gateway to Mt. Fuji — where the sacred climb begins",
        highlights: [
            "Traditional northern starting point for Mt. Fuji pilgrimage routes",
            "1,000-year-old cedar trees lining the approach road",
            "Grand vermillion-lacquered main hall and worship buildings",
            "Yoshida Fire Festival in August — one of Japan's three strangest festivals"
        ],
        mustSee: "Walk the ancient cedar-lined approach from the massive torii gate to the main hall — the scale of the thousand-year-old trees dwarfs everything around them and fills the air with a resinous sacred fragrance.",
        tips: [
            "The Yoshida Fire Festival (Yoshida no Hi Matsuri) on August 26-27 lights massive torches along the entire approach road",
            "Start here if you plan to climb Fuji via the traditional Yoshida Trail",
            "The shrine is at the base of the mountain — combine with Fujisan World Heritage Center nearby",
            "Free admission; pleasant grounds for a 30-minute visit"
        ],
        bestSeason: "Late Aug (Fire Festival), Jul-Aug (climbing season), Apr (cherry blossoms)",
        access: "20 min walk from Fujisan Station (Fujikyu Railway) or by local bus",
        hours: "Open 24 hours (shrine office 8:30-17:00)",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000004-0000-0000-0000-000000000209")!,
        name: "Hotaka Jinja",
        address: "5993 Hotaka, Azumino, Nagano",
        description: "Nestled in the heart of the Japanese Alps in Azumino, Hotaka Jinja is dedicated to Hotaka-dake, the deity of the Northern Alps' highest peak. The shrine is the center of a network of three related shrines, including a remarkable inner shrine (Okumiya) perched at the summit of Mt. Oku-Hotaka at 3,190 meters — Japan's highest-altitude shrine. The main shrine in the valley is surrounded by peaceful forests and clear streams.",
        coordinate: CLLocationCoordinate2D(latitude: 36.3380, longitude: 137.8810),
        stampSlotId: 209,
        category: .jinja,
        tagline: "Alpine deity shrine with Japan's highest-altitude inner sanctuary",
        highlights: [
            "Inner shrine (Okumiya) at 3,190m on Mt. Oku-Hotaka — highest shrine in Japan",
            "Dedicated to the mountain deity of the Northern Alps",
            "Peaceful main shrine amid the pristine Azumino valley",
            "Hotaka Festival on September 27 with traditional boat floats"
        ],
        mustSee: "The main shrine grounds are serene and uncrowded — walk the forested approach and reflect that the same deity is enshrined atop a 3,190-meter summit above the clouds. For climbers, the Okumiya at the peak is the ultimate goal.",
        tips: [
            "Experienced climbers can visit the Okumiya on Mt. Oku-Hotaka (3,190m) — it's a serious alpine route",
            "Azumino is famous for wasabi farms — visit Daio Wasabi Farm nearby",
            "The area's clear spring water is considered some of the purest in Japan",
            "Free admission; the main shrine is easily accessible"
        ],
        bestSeason: "Jul-Sep (for summit shrine visits), May (fresh green), Oct (autumn color)",
        access: "10 min by taxi from Hotaka Station (JR Oito Line) or 30 min walk",
        hours: "Open 24 hours (shrine office 9:00-16:30)",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000004-0000-0000-0000-000000000210")!,
        name: "Hakusan Jinja (Niigata)",
        address: "1-1 Ichibanboridori-cho, Chuo, Niigata, Niigata",
        description: "The most prominent shrine in central Niigata City, Hakusan Jinja is dedicated to the deity of Mt. Hakusan and has served as a guardian of the city's port and merchant culture for over 1,000 years. The shrine is particularly popular for its blessings related to romantic relationships and marriage, and its grounds adjoin the beautiful Hakusan Park — one of Japan's first public parks, famous for its wisteria and lotus displays.",
        coordinate: CLLocationCoordinate2D(latitude: 37.9222, longitude: 139.0350),
        stampSlotId: 210,
        category: .jinja,
        tagline: "Niigata's city guardian with wisteria-draped park and love blessings",
        highlights: [
            "Major shrine in central Niigata — popular for love and marriage blessings",
            "Adjacent to Hakusan Park — one of Japan's first public parks",
            "Stunning wisteria trellis in May and lotus blooms in summer",
            "Niigata Soh-Odori dance festival in September fills the shrine surroundings"
        ],
        mustSee: "Visit in May when the wisteria trellis in adjacent Hakusan Park cascades in purple and white — the combination of the ancient shrine and the fragrant hanging flowers is one of Niigata's most beautiful seasonal scenes.",
        tips: [
            "The shrine is a popular spot for hatsumode (New Year) and wedding ceremonies",
            "Hakusan Park's lotus pond is spectacular in July-August",
            "The shrine is centrally located — combine with a visit to Niigata's Furumachi shopping district",
            "Free admission; a pleasant 20-minute visit"
        ],
        bestSeason: "May (wisteria), Jul-Aug (lotus), Jan (hatsumode), Year-round",
        access: "15 min walk from Niigata Station or bus to Hakusan Koen-mae stop",
        hours: "6:00-18:00 (outer grounds open 24 hours)",
        imageURLs: []
    ),

    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    // MARK: - Hokuriku
    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

    Shrine(
        id: UUID(uuidString: "00000004-0000-0000-0000-000000000211")!,
        name: "Eihei-ji",
        address: "5-15 Shihi, Eiheiji-cho, Yoshida, Fukui",
        description: "One of the two head temples of Soto Zen Buddhism, Eihei-ji was founded in 1244 by the great master Dogen Zenji and remains an active training monastery where over 150 monks practice rigorous daily meditation. The temple complex of over 70 buildings cascades up a steep, cedar-forested mountainside, connected by covered corridors that are polished to a mirror sheen by generations of monks. The atmosphere of disciplined silence is palpable.",
        coordinate: CLLocationCoordinate2D(latitude: 36.0570, longitude: 136.3250),
        stampSlotId: 211,
        category: .tera,
        tagline: "Living Zen monastery — 150 monks train in silence among ancient cedars",
        highlights: [
            "One of two head temples of Soto Zen Buddhism — founded by Dogen in 1244",
            "Active training monastery with 150+ monks in daily zazen practice",
            "70+ buildings connected by covered corridors up a cedar-forested mountainside",
            "Immaculate wooden corridors polished by centuries of monks' footsteps"
        ],
        mustSee: "Walk the long covered corridors connecting the seven principal buildings (Shichido Garan) — the wood is polished to a mirror finish by generations of monks. The discipline and silence of an active Zen monastery surround you.",
        tips: [
            "Overnight zazen retreats (sanrō taiken) are available — book weeks in advance for this life-changing experience",
            "Maintain absolute silence inside the corridors — this is a working monastery",
            "Photography restrictions apply in some areas — observe signage carefully",
            "Admission ¥500; allow 1.5-2 hours for a thorough visit"
        ],
        bestSeason: "Year-round (Nov for autumn foliage in the cedars, winter for snow silence)",
        access: "Keifuku bus from Fukui Station (JR Hokuriku Line) to Eiheiji, about 30 min",
        hours: "8:30-16:30 (May-Oct until 17:00)",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000004-0000-0000-0000-000000000212")!,
        name: "Kehi Jingu",
        address: "11-68 Akebonocho, Tsuruga, Fukui",
        description: "Home to one of Japan's three great wooden torii gates, Kehi Jingu has stood as the guardian shrine of Tsuruga Bay for over 1,600 years. The massive 11-meter vermillion torii, originally built in 1645, is designated an Important Cultural Property and frames the shrine's forested approach. Kehi Jingu is one of the most important shrines in the Hokuriku region, enshrining deities of food, agriculture, and safe sea travel.",
        coordinate: CLLocationCoordinate2D(latitude: 35.6570, longitude: 136.0710),
        stampSlotId: 212,
        category: .jingu,
        tagline: "One of Japan's three great torii gates — guardian of Tsuruga Bay",
        highlights: [
            "11-meter wooden torii — one of Japan's three great torii gates",
            "Over 1,600 years of history as the guardian of Hokuriku",
            "Forested grounds with ancient trees in central Tsuruga",
            "Kehi no Matsuri festival in September with spectacular floats"
        ],
        mustSee: "Stand before the great torii gate — at 11 meters tall and built of massive timbers, it is one of only three in Japan to bear the distinction of 'Nihon Sandai Torii' and has welcomed worshippers since 1645.",
        tips: [
            "The Kehi no Matsuri (September 2-15) is one of Hokuriku's biggest festivals with ornate floats",
            "Tsuruga is a pleasant port town — combine with fresh seafood at the Sakanamachi fish market",
            "The shrine is compact and centrally located — 20 minutes is sufficient",
            "Free admission; excellent for a stopover on the way between Kyoto and Kanazawa"
        ],
        bestSeason: "Sep (Kehi Festival), Apr (cherry blossoms), Year-round",
        access: "10 min walk from Tsuruga Station (JR Hokuriku Line / Hokuriku Shinkansen)",
        hours: "6:00-17:00 (outer grounds open 24 hours)",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000004-0000-0000-0000-000000000213")!,
        name: "Shirayama Hime Jinja",
        address: "105-1 Shiramine-machi, Hakusan, Ishikawa",
        description: "The head shrine of over 2,700 Hakusan shrines throughout Japan, Shirayama Hime Jinja is dedicated to the goddess Shirayama-hime-no-kami and serves as the base for the sacred Mt. Hakusan pilgrimage that has continued for over 1,300 years. The shrine sits in a magnificent grove of ancient cedar and cypress trees, and its serene atmosphere reflects the mountain worship tradition (sangaku shinko) at the heart of Hakusan faith.",
        coordinate: CLLocationCoordinate2D(latitude: 36.2985, longitude: 136.5770),
        stampSlotId: 213,
        category: .jinja,
        tagline: "Head of 2,700 Hakusan shrines — gateway to the sacred white mountain",
        highlights: [
            "Head shrine of 2,700+ Hakusan shrines across Japan",
            "Gateway to the 1,300-year Mt. Hakusan pilgrimage",
            "Sacred grove of ancient cedar and cypress trees",
            "Enshrines Shirayama-hime-no-kami — goddess of the white mountain"
        ],
        mustSee: "Walk the tree-lined approach through the ancient cedar grove — the towering trees and filtered light create an atmosphere that perfectly embodies the mountain worship tradition that has drawn pilgrims here for thirteen centuries.",
        tips: [
            "Combine with a drive through the Hakusan Shirakawa-go White Road for stunning mountain scenery",
            "The summer Mt. Hakusan climbing season (Jul-Aug) starts from trailheads accessible via this shrine",
            "The shrine is less visited than major Kanazawa attractions — enjoy the tranquility",
            "Free admission; allow 30-45 minutes"
        ],
        bestSeason: "Jul-Aug (mountain climbing), Apr (cherry blossoms), Nov (autumn foliage)",
        access: "Hokutetsu bus from Kanazawa Station to Ichinomiya (about 70 min) or 40 min by car",
        hours: "Open 24 hours (shrine office 9:00-16:00)",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000004-0000-0000-0000-000000000214")!,
        name: "Oyama Jinja",
        address: "11-1 Oyama-machi, Kanazawa, Ishikawa",
        description: "One of Kanazawa's most distinctive landmarks, Oyama Jinja enshrines Maeda Toshiie, the founder of the powerful Kaga Domain. The shrine is instantly recognizable for its extraordinary Shinmon gate — a three-story structure blending Japanese, Chinese, and European architectural styles, topped with a Dutch stained glass window that once served as a lighthouse for ships in the Sea of Japan.",
        coordinate: CLLocationCoordinate2D(latitude: 36.5620, longitude: 136.6580),
        stampSlotId: 214,
        category: .jinja,
        tagline: "A stained-glass gate where East meets West in samurai Kanazawa",
        highlights: [
            "Unique Shinmon gate blending Japanese, Chinese, and European architecture",
            "Dutch stained glass window atop the gate — former lighthouse beacon",
            "Enshrines Maeda Toshiie, founder of the million-koku Kaga Domain",
            "Beautiful garden with bridges and streams behind the main hall"
        ],
        mustSee: "The Shinmon gate is unlike anything else at any shrine in Japan — three stories tall, mixing wooden Japanese construction with a European-style arched window of stained glass on top. At night, the illuminated glass glows beautifully.",
        tips: [
            "The stained glass gate is illuminated at night — evening visits are especially photogenic",
            "The garden behind the main hall has a pleasant pond with plum and cherry trees",
            "Located between Kanazawa Castle and Katamachi — perfect for a walking route",
            "Free admission; a quick 15-20 minute visit"
        ],
        bestSeason: "Year-round (cherry blossoms in Apr, illuminated gate at night year-round)",
        access: "10 min walk from Kanazawa Station East Exit or 3 min from Minami-cho bus stop",
        hours: "Open 24 hours (shrine office 8:30-18:00)",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000004-0000-0000-0000-000000000215")!,
        name: "Kanazawa Jinja",
        address: "1-3 Marunouchi, Kanazawa, Ishikawa",
        description: "Quietly nestled beside the famous Kenroku-en garden, Kanazawa Jinja is dedicated to the deity of learning and is said to be the origin of the city's name — 'kanazawa' (marsh of gold) refers to a local legend about a farmer washing gold dust in the spring here. The shrine's intimate grounds feature the Kinjo Reizawa spring, plum groves, and a tranquil atmosphere that contrasts with the bustle of nearby tourist sites.",
        coordinate: CLLocationCoordinate2D(latitude: 36.5632, longitude: 136.6657),
        stampSlotId: 215,
        category: .jinja,
        tagline: "The golden spring that gave Kanazawa its name",
        highlights: [
            "Origin of Kanazawa's name — Kinjo Reizawa (golden marsh) spring on the grounds",
            "Adjacent to Kenroku-en, one of Japan's three most beautiful gardens",
            "Dedicated to learning — popular with students before exams",
            "Plum grove and tranquil grounds away from tourist crowds"
        ],
        mustSee: "Find the Kinjo Reizawa spring — a small, clear spring bubbling from the earth that, according to legend, is where a farmer named Togoro washed his potato and found gold dust. This humble spring gave the great city of Kanazawa its name.",
        tips: [
            "Visit immediately before or after Kenroku-en — the shrine is right next door",
            "Much quieter than the garden — a peaceful contrast to the tourist crowds",
            "The plum grove blooms in February-March, earlier than the cherry blossoms",
            "Free admission; 15 minutes is enough for a thorough visit"
        ],
        bestSeason: "Feb-Mar (plum blossoms), Apr (cherry blossoms in Kenroku-en), Year-round",
        access: "5 min walk from Kenroku-en Shita bus stop or 20 min walk from Kanazawa Station",
        hours: "Open 24 hours (shrine office 9:00-17:00)",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000004-0000-0000-0000-000000000216")!,
        name: "Nata-dera",
        address: "122 Natacho-yu, Komatsu, Ishikawa",
        description: "A 1,300-year-old temple built among dramatic natural rock formations and caves in the mountains of southern Ishikawa. Nata-dera was founded in 717 by the monk Taicho and features worship halls built directly into cliff faces, sacred caves containing Buddhist statues, and a stunning landscape where nature and architecture merge seamlessly. Matsuo Basho was so moved by its beauty that he wrote about it in his famous Oku no Hosomichi.",
        coordinate: CLLocationCoordinate2D(latitude: 36.3148, longitude: 136.4430),
        stampSlotId: 216,
        category: .tera,
        tagline: "Worship halls carved into cliff faces — where Basho found poetry",
        highlights: [
            "Halls and caves built directly into dramatic natural rock formations",
            "1,300 years old — praised by Matsuo Basho in Oku no Hosomichi",
            "Fugen-do cave with ancient Buddhist statues in a natural grotto",
            "Kigan Yusenkyo — stunning white rock landscape with red temple halls"
        ],
        mustSee: "Walk through the Fugen-do cave, where Buddhist statues have been placed in natural rock alcoves for centuries — then emerge to see the main hall perched dramatically on the white rock cliff face above. The contrast is breathtaking.",
        tips: [
            "The autumn foliage against the white rock formations is extraordinary — early November is ideal",
            "Wear comfortable shoes — the temple circuit involves uneven stone paths and stairs",
            "Admission ¥600; allow 45-60 minutes for the full circuit walk",
            "About 30 minutes from Komatsu Station by Komatsu bus"
        ],
        bestSeason: "Nov (autumn leaves against white rock), May (fresh green), Year-round",
        access: "Komatsu Bus from Komatsu Station (JR Hokuriku Line) to Natadera, about 30 min",
        hours: "8:15-16:45 (Mar-Nov 8:15-16:00 in winter)",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000004-0000-0000-0000-000000000217")!,
        name: "Zuiryu-ji",
        address: "35 Sekihonmachi, Takaoka, Toyama",
        description: "A Soto Zen temple of extraordinary architectural grandeur, Zuiryu-ji was built in the mid-17th century by the Kaga Maeda clan as a memorial temple for Lord Maeda Toshinaga. The Sanmon gate, Butsuden (Buddha Hall), and Hatto (Lecture Hall) are all designated national treasures — the only such triple national treasure designation in the Hokuriku region. The perfectly symmetrical Zen layout is considered one of the finest examples of Edo-period Buddhist architecture.",
        coordinate: CLLocationCoordinate2D(latitude: 36.7350, longitude: 137.0220),
        stampSlotId: 217,
        category: .tera,
        tagline: "Triple national treasure — the finest Zen architecture in Hokuriku",
        highlights: [
            "Three national treasure buildings — Sanmon gate, Butsuden, and Hatto",
            "Only triple national treasure temple in the Hokuriku region",
            "Perfect Zen architectural symmetry from the Edo period",
            "Built by the wealthy Kaga Maeda clan as a memorial for their lord"
        ],
        mustSee: "Enter through the massive Sanmon gate and look straight ahead — the Butsuden and Hatto are perfectly aligned on a central axis, creating a symmetrical Zen composition of sublime beauty. All three buildings are national treasures.",
        tips: [
            "The temple is illuminated on special evenings (check schedule) — the national treasures glow magnificently",
            "Admission ¥500; allow 30-45 minutes",
            "Only 10 minutes walk from Takaoka Station — an easy half-day trip from Kanazawa or Toyama",
            "The cloister connecting the buildings creates a complete enclosed Zen space"
        ],
        bestSeason: "Year-round (special illumination events in spring and autumn)",
        access: "10 min walk from Takaoka Station South Exit (Ainokaze Toyama Railway / JR Johana Line)",
        hours: "9:00-16:30 (Dec-Jan 9:00-16:00)",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000004-0000-0000-0000-000000000218")!,
        name: "Takaoka Daibutsu (Daibutsu-ji)",
        address: "11-29 Oteimachi, Takaoka, Toyama",
        description: "One of Japan's three great Buddha statues alongside those in Nara and Kamakura, the Takaoka Daibutsu stands over 15 meters tall and was cast using Takaoka's centuries-old copperware tradition. The current bronze statue was completed in 1933 after 30 years of work, replacing wooden predecessors that had been destroyed by fire. Often called the most handsome Buddha in Japan for its refined facial features, it sits serenely in a small park in central Takaoka.",
        coordinate: CLLocationCoordinate2D(latitude: 36.7530, longitude: 137.0250),
        stampSlotId: 218,
        category: .tera,
        tagline: "Japan's most handsome Buddha — cast in Takaoka's legendary bronze",
        highlights: [
            "One of Japan's three great Buddha statues (with Nara and Kamakura)",
            "15-meter bronze statue cast using Takaoka's traditional copperware techniques",
            "Called 'Japan's most handsome Buddha' for its refined, serene expression",
            "Interior houses smaller Buddhist statues and art"
        ],
        mustSee: "Stand directly in front and look up at the Buddha's face — the refined features and serene expression are why locals call it 'Japan's most handsome Buddha.' Enter the pedestal interior to see the Buddhist paintings and smaller statues inside.",
        tips: [
            "The interior of the pedestal is open and free to enter — Buddhist art and smaller statues are displayed inside",
            "Only a 5-minute walk from Zuiryu-ji — visit both in a single trip",
            "The statue is outdoors in a small park — quick to visit (15 minutes)",
            "Free admission; illuminated at night for a different atmosphere"
        ],
        bestSeason: "Year-round (morning light for photography, evening for illumination)",
        access: "10 min walk from Takaoka Station (Ainokaze Toyama Railway)",
        hours: "6:00-18:00 (pedestal interior 9:00-17:00)",
        imageURLs: []
    ),
]
