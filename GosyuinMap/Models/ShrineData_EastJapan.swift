import SwiftUI
import CoreLocation

// MARK: - East Japan (34 shrines, ID 219-252)

let eastJapanShrines: [Shrine] = [

    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    // MARK: - Saitama (ID 219-224)
    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

    Shrine(
        id: UUID(uuidString: "00000005-0000-0000-0000-000000000219")!,
        name: "Musashi Ichinomiya Hikawa Jinja",
        address: "1-407 Takahanacho, Omiya, Saitama",
        description: "The head shrine of over 280 Hikawa shrines spread across the Kanto region, Musashi Ichinomiya Hikawa Jinja is one of the oldest shrines in eastern Japan with a history spanning over 2,400 years. Enshrining the storm deity Susanoo-no-Mikoto, it served as the guardian shrine of the ancient Musashi Province. The two-kilometer approach lined with keyaki zelkova trees is the longest shrine avenue in Japan.",
        coordinate: CLLocationCoordinate2D(latitude: 35.8743, longitude: 139.6289),
        stampSlotId: 219,
        category: .jinja,
        tagline: "Head of 280+ Hikawa shrines and guardian of ancient Musashi Province",
        highlights: [
            "Head shrine of over 280 Hikawa shrines across Kanto",
            "Over 2,400 years of history — one of Japan's oldest shrines",
            "Japan's longest shrine approach at 2 km lined with zelkova trees",
            "Major hatsumode destination with over 2 million New Year visitors"
        ],
        mustSee: "Walk the entire 2-kilometer keyaki-lined approach from the Third Torii to the main hall — it is the longest shrine avenue in Japan and creates a powerful sense of spiritual transition from the busy city into sacred space.",
        tips: [
            "The approach starts near Saitama-Shintoshin Station — walk the full 2 km for the complete experience",
            "Hikawa Shrine's annual festival (August 1-2) features lively floats and processions",
            "The shrine pond garden (Shinchi) is beautiful for quiet reflection",
            "Combine with a walk through Omiya Park, which adjoins the shrine grounds"
        ],
        bestSeason: "Jan (hatsumode), Apr (cherry blossoms along approach), Aug (summer festival)",
        access: "15 min walk from Omiya Station (JR) along the tree-lined approach, or 10 min walk from Kita-Omiya Station",
        hours: "5:30-17:30 (Mar-Oct), 6:00-17:00 (Nov-Feb); grounds open 24 hours",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000005-0000-0000-0000-000000000220")!,
        name: "Chichibu Jinja",
        address: "1-3 Banbamachi, Chichibu, Saitama",
        description: "With a history of over 2,100 years, Chichibu Jinja is the central shrine of the Chichibu region and one of the Chichibu Three Shrines. The shrine is renowned for its spectacular polychrome carvings, including the famous left-handed Genbu (tortoise-and-snake) sculpture attributed to the legendary carver Hidari Jingoro. The Chichibu Night Festival held here every December 2-3 is one of Japan's three great float festivals.",
        coordinate: CLLocationCoordinate2D(latitude: 35.9920, longitude: 139.0850),
        stampSlotId: 220,
        category: .jinja,
        tagline: "2,100 years of history and the legendary left-handed Genbu carving",
        highlights: [
            "Over 2,100 years old — the spiritual heart of Chichibu",
            "Famous left-handed Genbu carving attributed to Hidari Jingoro",
            "Chichibu Night Festival (Dec 2-3) — one of Japan's three great float festivals",
            "Vivid polychrome carvings adorning the main hall"
        ],
        mustSee: "Examine the elaborate carvings on the main hall closely, especially the left-handed Genbu (tortoise-and-snake) — the asymmetric design is said to be a deliberate signature by the master carver Hidari Jingoro.",
        tips: [
            "The Chichibu Night Festival (Dec 2-3) with fireworks and massive floats is a once-in-a-lifetime experience",
            "Combine with visits to Mitsumine and Hodosan shrines for the full Chichibu Three Shrines pilgrimage",
            "Try Chichibu's famous waraji katsu (giant breaded pork cutlet) at nearby restaurants",
            "The Chichibu Meisen silk museum is a short walk away"
        ],
        bestSeason: "Dec 2-3 (Chichibu Night Festival), Apr (shibazakura moss phlox at nearby Hitsujiyama Park)",
        access: "3 min walk from Chichibu Station (Chichibu Railway) or Ohanabatake Station (Seibu Line)",
        hours: "Open daily; office hours 8:30-17:00; grounds open 24 hours",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000005-0000-0000-0000-000000000221")!,
        name: "Mitsumine Jinja",
        address: "298-1 Mitsumine, Otaki, Chichibu, Saitama",
        description: "Perched at 1,100 meters on the summit of Mt. Mitsumine in the Chichibu Mountains, this ancient shrine is one of the few in Japan that venerates wolves (ookami) as divine messengers rather than the usual foxes or deer. The shrine's remote mountain location and mystical fog-shrouded atmosphere make it one of the Kanto region's most powerful spiritual sites. The rare triple torii gate at the entrance is found at very few shrines in Japan.",
        coordinate: CLLocationCoordinate2D(latitude: 35.9260, longitude: 138.9370),
        stampSlotId: 221,
        category: .jinja,
        tagline: "Mountain shrine where wolves are worshipped as divine messengers",
        highlights: [
            "Wolf (ookami) worship — extremely rare among Japanese shrines",
            "Remote mountaintop location at 1,100m with mystical fog atmosphere",
            "Triple torii gate (mitsu-torii) — found at very few shrines in Japan",
            "One of Chichibu's Three Shrines with over 1,900 years of history"
        ],
        mustSee: "Pass through the rare triple torii gate and then look for the wolf statues instead of the usual komainu — the wolves stare out from the mist with an intensity that reflects the wild mountain spirit of this place.",
        tips: [
            "The bus ride from Mitsumineguchi Station is scenic but takes about 75 minutes — plan accordingly",
            "The shrine's white qi amulet (shiro-i-ki mamori) is famous but extremely limited — arrive early on the 1st of each month",
            "Dress warmly even in summer — the mountaintop is significantly cooler than the city",
            "Allow at least 2-3 hours to explore the extensive grounds and surrounding forest trails"
        ],
        bestSeason: "Nov (autumn foliage at altitude), Jun (mystical hydrangea season), winter (snow-covered wolf statues)",
        access: "Bus from Mitsumineguchi Station (Chichibu Railway) to Mitsumine Jinja — 75 min",
        hours: "Open daily; shrine office 9:00-17:00; grounds open 24 hours",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000005-0000-0000-0000-000000000222")!,
        name: "Hodosan Jinja",
        address: "1828 Nagatoro, Nagatoro, Chichibu, Saitama",
        description: "Situated at the base of Mt. Hodo overlooking the scenic Nagatoro Valley, Hodosan Jinja is one of the Chichibu Three Shrines with a history of over 1,900 years. The shrine is famous for its fire festival (hi-matsuri) and the adjacent Hodosan Ropeway that carries visitors to the summit for sweeping views of the Chichibu Mountains. The ornate carvings of the main hall rival those of Nikko Toshogu.",
        coordinate: CLLocationCoordinate2D(latitude: 36.0098, longitude: 139.1003),
        stampSlotId: 222,
        category: .jinja,
        tagline: "Mountain shrine with fire festivals overlooking the Nagatoro Valley",
        highlights: [
            "One of Chichibu's Three Shrines with over 1,900 years of history",
            "Fire Festival (hi-matsuri) held in March with dramatic flame ceremonies",
            "Ornate polychrome carvings rivaling Nikko Toshogu",
            "Adjacent ropeway to Mt. Hodo summit with panoramic Chichibu views"
        ],
        mustSee: "Take the Hodosan Ropeway from the shrine to the summit — the view across the Chichibu Mountains and the winding Arakawa River through Nagatoro Valley is one of Saitama's finest panoramas.",
        tips: [
            "Combine with Nagatoro river boat rides (line-kudari) for a full day trip",
            "The autumn foliage light-up at the shrine in November is spectacular",
            "Visit the Hodosan Plum Garden in early spring for 170 varieties of plum blossoms",
            "The shrine's fire-walking festival in March is open to public participation"
        ],
        bestSeason: "Nov (autumn foliage light-up), Feb-Mar (plum blossoms), Mar (fire festival)",
        access: "10 min walk from Nagatoro Station (Chichibu Railway)",
        hours: "Open daily; shrine office 8:30-17:00; grounds open 24 hours",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000005-0000-0000-0000-000000000223")!,
        name: "Kitain",
        address: "1-20-1 Kosenbamachi, Kawagoe, Saitama",
        description: "Founded in 830 AD, Kitain is the most important Tendai Buddhist temple in the Kanto region and is famous for its 500 Rakan (arhat) statues — 538 stone figures each with a unique facial expression, where visitors try to find the one that resembles them. The temple also preserves the only surviving rooms from Edo Castle, relocated here after a fire in 1638 by order of Shogun Tokugawa Iemitsu, including the chamber where the third Tokugawa shogun was born.",
        coordinate: CLLocationCoordinate2D(latitude: 35.9170, longitude: 139.4890),
        stampSlotId: 223,
        category: .tera,
        tagline: "538 unique stone faces and the only surviving rooms from Edo Castle",
        highlights: [
            "538 Rakan statues — each with a unique expression, no two alike",
            "Only surviving rooms from Edo Castle, including the birth room of the third shogun",
            "Founded in 830 AD — head temple of Kanto Tendai Buddhism",
            "Setsubun bean-throwing festival in February draws massive crowds"
        ],
        mustSee: "Spend time among the 538 Rakan stone statues — Japanese tradition says everyone can find one that looks like themselves or a loved one. The range of expressions from laughing to weeping to contemplating is extraordinary.",
        tips: [
            "The Rakan garden is behind the main hall — don't miss it (separate entrance fee applies)",
            "Combine with a walk through Kawagoe's historic Kurazukuri storehouse district",
            "The Daruma Market on January 3 at Kitain is one of Kawagoe's liveliest events",
            "The spring cherry blossoms in the temple grounds are among Kawagoe's finest"
        ],
        bestSeason: "Jan 3 (Daruma Market), Feb (Setsubun), late Mar-Apr (cherry blossoms)",
        access: "20 min walk from Kawagoe Station (JR/Tobu), or 10 min walk from Hon-Kawagoe Station (Seibu Line)",
        hours: "8:50-16:30 (Mar-Nov), 8:50-16:00 (Dec-Feb); closed Dec 25-Jan 8 for some areas",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000005-0000-0000-0000-000000000224")!,
        name: "Kawagoe Hikawa Jinja",
        address: "2-11-3 Miyashitamachi, Kawagoe, Saitama",
        description: "Over 1,500 years old, Kawagoe Hikawa Jinja is one of the most popular shrines in the Kanto region for marriage blessings and romantic wishes. The shrine is famous for its summer Furin Matsuri (wind chime festival) from July to September, when over 2,000 colorful wind chimes line the shrine corridor creating a mesmerizing visual and auditory experience. The shrine also hosts the Kawagoe Festival floats as its autumn festival.",
        coordinate: CLLocationCoordinate2D(latitude: 35.9300, longitude: 139.4830),
        stampSlotId: 224,
        category: .jinja,
        tagline: "2,000 wind chimes in summer and one of Kanto's best marriage shrines",
        highlights: [
            "Furin Matsuri — over 2,000 wind chimes creating a dreamy summer corridor",
            "One of Kanto's most popular shrines for marriage and love blessings",
            "Over 1,500 years of history as Kawagoe's guardian shrine",
            "Kawagoe Festival (October) — UNESCO Intangible Cultural Heritage float procession"
        ],
        mustSee: "Visit during the Furin Matsuri (July-September) — walking through a corridor of 2,000 wind chimes in different colors, each carrying a written wish that flutters in the breeze, is one of Saitama's most photogenic and magical experiences.",
        tips: [
            "Draw the tai-mikuji (sea bream fortune) from a small fishing pool — a unique and fun omikuji experience",
            "Early morning visits in summer offer the best light for wind chime photography",
            "Combine with the historic Kurazukuri district and Toki no Kane bell tower in Kawagoe",
            "The shrine offers a romantic 'enmusubi' (love connection) stone that couples touch together"
        ],
        bestSeason: "Jul-Sep (Furin wind chime festival), Oct (Kawagoe Festival), Jan (hatsumode)",
        access: "Bus from Kawagoe Station (JR/Tobu) to Hikawa Jinja-mae — 10 min, or 15 min walk from Hon-Kawagoe Station",
        hours: "Open daily; shrine office 8:00-18:00; grounds open 24 hours",
        imageURLs: []
    ),

    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    // MARK: - North Kanto (ID 225-232)
    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

    Shrine(
        id: UUID(uuidString: "00000005-0000-0000-0000-000000000225")!,
        name: "Nikko Futarasan Jinja",
        address: "2307 Sannai, Nikko, Tochigi",
        description: "A UNESCO World Heritage Site and the spiritual guardian of Nikko's sacred mountains, Futarasan Jinja has protected Mt. Nantai, Mt. Nyoho, and Mt. Taro for over 1,200 years. The shrine stands adjacent to the famous Toshogu but predates it by centuries, serving as the origin of mountain worship in Nikko. Its vermillion Shinkyo (Sacred Bridge) spanning the Daiya River gorge is one of Japan's three finest bridges.",
        coordinate: CLLocationCoordinate2D(latitude: 36.7573, longitude: 139.6000),
        stampSlotId: 225,
        category: .jinja,
        tagline: "UNESCO guardian of Nikko's sacred mountains for over 1,200 years",
        highlights: [
            "UNESCO World Heritage Site — origin of mountain worship in Nikko",
            "Shinkyo Sacred Bridge — one of Japan's three finest bridges",
            "Guardian of three sacred peaks: Mt. Nantai, Mt. Nyoho, Mt. Taro",
            "Over 1,200 years old — predates the famous Toshogu by centuries"
        ],
        mustSee: "The Shinkyo (Sacred Bridge) spanning the Daiya River gorge in brilliant vermillion — especially stunning with autumn foliage reflected in the river below. Walk across it for a small fee to feel the spiritual gateway to Nikko's sacred mountains.",
        tips: [
            "Visit alongside Toshogu and Rinno-ji using the Nikko World Heritage combined ticket",
            "The separate Chugushi Shrine on Lake Chuzenji is also part of Futarasan — worth the side trip",
            "Autumn foliage at Shinkyo Bridge (late Oct-early Nov) is world-class photography",
            "The shrine's garden has a haunted lantern (Bake-Doro) — look for the sword cuts on its stone surface"
        ],
        bestSeason: "Oct-Nov (spectacular autumn foliage), May (fresh green), Jan (snow-covered sacred bridge)",
        access: "25 min walk from Nikko Station (JR/Tobu), or bus to Nishi-Sando stop — 10 min",
        hours: "8:00-17:00 (Apr-Oct), 8:00-16:00 (Nov-Mar)",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000005-0000-0000-0000-000000000226")!,
        name: "Banna-ji",
        address: "2220 Iecho, Ashikaga, Tochigi",
        description: "The ancestral temple of the Ashikaga clan who would go on to establish Japan's Muromachi shogunate, Banna-ji was founded in 1196 on the site of the Ashikaga family residence. Its main hall, built in 1299, is designated a National Treasure — one of the finest examples of Kamakura-period Zen architecture in the Kanto region. The temple grounds are surrounded by earthworks and moats from the original samurai residence, giving it a castle-like atmosphere.",
        coordinate: CLLocationCoordinate2D(latitude: 36.3410, longitude: 139.4492),
        stampSlotId: 226,
        category: .tera,
        tagline: "National Treasure temple of the Ashikaga shogun clan since 1196",
        highlights: [
            "National Treasure main hall — finest Kamakura-period Zen architecture in Kanto",
            "Ancestral temple of the Ashikaga shogunate founders",
            "Surrounded by original samurai-residence moats and earthworks",
            "Part of the Ashikaga Gakko (Japan's oldest school) cultural district"
        ],
        mustSee: "The main hall (Hondo) is a National Treasure from 1299 — its restrained Zen elegance and massive thatched roof represent the architectural ideals of the Kamakura warrior class at their purest.",
        tips: [
            "Combine with the adjacent Ashikaga Gakko — Japan's oldest academic institution (15th century)",
            "The temple moats are lined with cherry trees — beautiful in spring",
            "The autumn ginkgo tree in the courtyard turns brilliant gold in November",
            "Ashikaga is also famous for its massive wisteria gardens at Ashikaga Flower Park nearby"
        ],
        bestSeason: "Apr-May (cherry blossoms and wisteria at nearby Flower Park), Nov (autumn ginkgo)",
        access: "10 min walk from Ashikaga Station (JR Ryomo Line)",
        hours: "Open daily; grounds open 24 hours; treasure hall 9:00-16:00",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000005-0000-0000-0000-000000000227")!,
        name: "Haruna Jinja",
        address: "849 Harunasanmachi, Takasaki, Gunma",
        description: "Nestled in a dramatic volcanic gorge on Mt. Haruna, this shrine is surrounded by towering rock formations and ancient cedar trees that create one of the most awe-inspiring sacred landscapes in Japan. Founded over 1,400 years ago, Haruna Jinja is considered one of Gunma's most powerful spiritual sites, where the natural rock pillars and cave formations merge with the shrine buildings. The approach through the cedar forest includes rock tunnels and waterfalls.",
        coordinate: CLLocationCoordinate2D(latitude: 36.4410, longitude: 138.8660),
        stampSlotId: 227,
        category: .jinja,
        tagline: "Shrine carved into volcanic rock formations in a dramatic mountain gorge",
        highlights: [
            "Dramatic volcanic rock formations towering above the shrine buildings",
            "Over 1,400 years of history as one of Gunma's most sacred power spots",
            "Approach through ancient cedar forest with rock tunnels and waterfalls",
            "Main hall built directly against a massive cliff face"
        ],
        mustSee: "Walk the full approach through the cedar forest — passing through natural rock tunnels, beside waterfalls, and beneath towering volcanic pillars — to reach the main hall built into the cliff face. The sense of nature's power is overwhelming.",
        tips: [
            "The approach involves steep stone stairs — wear sturdy shoes",
            "Combine with a visit to nearby Lake Haruna and Mt. Haruna Ropeway",
            "Winter brings icicle formations along the approach — beautiful but slippery",
            "The shrine's seven lucky gods pilgrimage trail is popular for New Year visits"
        ],
        bestSeason: "Nov (autumn foliage in the gorge), May-Jun (fresh green and waterfalls), Jan-Feb (icicle formations)",
        access: "Bus from Takasaki Station (JR) to Haruna Jinja — about 70 min",
        hours: "Open daily; shrine office 8:30-16:00; grounds open 24 hours",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000005-0000-0000-0000-000000000228")!,
        name: "Myogi Jinja",
        address: "6 Myogimachi Myogi, Tomioka, Gunma",
        description: "Set against the jagged volcanic peaks of Mt. Myogi — one of Japan's three most rugged mountains — Myogi Jinja has guarded these dramatic rock spires for over 1,500 years. The shrine is famous for its weeping cherry trees (shidarezakura) that cascade down the mountain approach in spring, creating a striking contrast with the sharp rock formations above. The long stone staircase through the forest to the main hall is both a physical and spiritual ascent.",
        coordinate: CLLocationCoordinate2D(latitude: 36.3130, longitude: 138.7710),
        stampSlotId: 228,
        category: .jinja,
        tagline: "Weeping cherries beneath jagged volcanic peaks — raw mountain power",
        highlights: [
            "Dramatic setting at the base of Mt. Myogi's jagged volcanic rock spires",
            "Famous weeping cherry trees (shidarezakura) along the shrine approach",
            "Over 1,500 years of mountain worship history",
            "Long stone staircase through ancient forest to the main hall"
        ],
        mustSee: "Visit in mid-April when the weeping cherry trees along the approach are in full bloom — the cascade of pink blossoms against the jagged grey volcanic peaks of Mt. Myogi is one of the most dramatic shrine landscapes in Japan.",
        tips: [
            "The stone staircase is steep — take your time and enjoy the forest atmosphere",
            "Autumn foliage at Mt. Myogi is spectacular and frames the shrine beautifully",
            "Hikers can continue past the shrine to Mt. Myogi's challenging climbing routes",
            "Combine with nearby Tomioka Silk Mill (UNESCO World Heritage Site)"
        ],
        bestSeason: "Mid-Apr (weeping cherry blossoms), Nov (autumn foliage against rock spires)",
        access: "Bus from Matsuida Station (JR Shinetsu Line) to Myogi Jinja — 10 min; or taxi from Matsuida",
        hours: "Open daily; shrine office 9:00-17:00; grounds open 24 hours",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000005-0000-0000-0000-000000000229")!,
        name: "Kashima Jingu",
        address: "2306-1 Kyuchu, Kashima, Ibaraki",
        description: "One of the oldest and most powerful shrines in eastern Japan, Kashima Jingu enshrines Takemikazuchi-no-Okami — the deity of martial arts and thunder who is said to have pacified the land of Japan. The shrine's sacred deer park, ancient cedar forest, and the mysterious Kaname-ishi (keystone) said to pin down the giant earthquake-causing catfish make it a deeply atmospheric place. The Kashima sword tradition has been revered by warriors for centuries.",
        coordinate: CLLocationCoordinate2D(latitude: 35.9685, longitude: 140.6317),
        stampSlotId: 229,
        category: .jingu,
        tagline: "Japan's martial arts deity and the keystone that prevents earthquakes",
        highlights: [
            "One of Japan's oldest shrines — home of the martial arts deity Takemikazuchi",
            "Kaname-ishi keystone — said to suppress the earthquake-causing catfish beneath Japan",
            "Sacred deer park and ancient cedar forest with 1,300-year-old trees",
            "Origin of the Kashima sword tradition revered by samurai for centuries"
        ],
        mustSee: "Find the Kaname-ishi (keystone) partially buried in the ground near the rear of the shrine — legend says this stone pins down the giant catfish that causes earthquakes. Despite its small visible surface, the stone is said to extend enormously underground.",
        tips: [
            "Visit the Treasure Hall to see one of Japan's oldest swords — the Futsu-no-mitama-no-tsurugi (National Treasure)",
            "The sacred deer in the deer garden are descendants of those sent to Nara's Kasuga Taisha",
            "Combine with Katori Jingu and Ikisu Jinja for the Eastern Three Shrines (Higashi Sansya) pilgrimage",
            "The annual Kashima Festival in September features a traditional sword ceremony"
        ],
        bestSeason: "Year-round (ancient forest beautiful in all seasons), Sep (Kashima Festival), Jan (hatsumode)",
        access: "10 min bus from Kashima-Jingu Station (JR Kashima Line), or direct highway bus from Tokyo Station — 2 hours",
        hours: "Open daily; treasure hall 8:30-16:00; grounds open 24 hours",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000005-0000-0000-0000-000000000230")!,
        name: "Ikisu Jinja",
        address: "2882 Ikisu, Kamisu, Ibaraki",
        description: "One of the Eastern Three Shrines (Higashi Sansya) along with Kashima Jingu and Katori Jingu, Ikisu Jinja is a tranquil and lesser-known shrine that enshrines Kunado-no-Kami, the deity of crossroads and safe passage. The shrine is famous for its two sacred wells (Nihon no Igami) at the torii gate by the Tone River, where fresh spring water bubbles up from the riverbed — considered one of Japan's miraculous water sources.",
        coordinate: CLLocationCoordinate2D(latitude: 35.8887, longitude: 140.6250),
        stampSlotId: 230,
        category: .jinja,
        tagline: "Sacred spring wells rising from the riverbed at the Eastern Three Shrines",
        highlights: [
            "Part of the Eastern Three Shrines (Higashi Sansya) with Kashima and Katori",
            "Two sacred wells (Nihon no Igami) with miraculous spring water from the riverbed",
            "Enshrines Kunado-no-Kami — deity of crossroads and safe passage",
            "Peaceful, uncrowded atmosphere compared to its famous partner shrines"
        ],
        mustSee: "Walk to the torii gate by the Tone River and look for the two sacred wells (Nihon no Igami) — clear spring water bubbles up from the riverbed through the sand, a natural phenomenon considered divine since ancient times.",
        tips: [
            "Complete the Eastern Three Shrines pilgrimage by visiting Kashima Jingu and Katori Jingu on the same day",
            "The sacred wells are at the river torii, a short walk from the main shrine",
            "This shrine is rarely crowded — a peaceful contrast to the busier Kashima and Katori",
            "The pine-tree-lined approach to the main hall is simple but atmospheric"
        ],
        bestSeason: "Year-round (quiet and contemplative in all seasons)",
        access: "Taxi from Kashima-Jingu Station (JR) — about 20 min; limited bus service available",
        hours: "Open daily; shrine office 8:30-16:30; grounds open 24 hours",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000005-0000-0000-0000-000000000231")!,
        name: "Kasama Inari Jinja",
        address: "1 Kasama, Kasama, Ibaraki",
        description: "One of Japan's three great Inari shrines alongside Fushimi Inari Taisha in Kyoto and Toyokawa Inari in Aichi, Kasama Inari Jinja was founded in 661 AD and draws over 3.5 million visitors during the New Year period. The shrine is surrounded by the town of Kasama, which is also famous for its pottery tradition (Kasama-yaki) and the chrysanthemum festival held every autumn in the shrine grounds with over 10,000 pots of chrysanthemums on display.",
        coordinate: CLLocationCoordinate2D(latitude: 36.3720, longitude: 140.2540),
        stampSlotId: 231,
        category: .inari,
        tagline: "One of Japan's three great Inari shrines with 3.5 million New Year visitors",
        highlights: [
            "One of Japan's three great Inari shrines — founded in 661 AD",
            "Over 3.5 million visitors during the New Year hatsumode period",
            "Chrysanthemum Festival in October-November with 10,000+ pots of flowers",
            "Surrounded by the famous Kasama pottery (Kasama-yaki) district"
        ],
        mustSee: "Visit during the Chrysanthemum Festival (mid-Oct to late Nov) — over 10,000 pots of chrysanthemums in every color and form fill the shrine grounds, including cascading and bonsai-style displays that are works of living art.",
        tips: [
            "Browse the Kasama pottery district nearby — studios and galleries sell beautiful handmade Kasama-yaki ceramics",
            "The shrine's fox statues each have unique expressions — look for the one holding a key",
            "New Year's hatsumode here is extremely crowded (3.5 million visitors) — arrive very early or visit mid-January",
            "Try inari-zushi (fried tofu sushi) — a fitting snack at an Inari shrine"
        ],
        bestSeason: "Oct-Nov (Chrysanthemum Festival), Jan (hatsumode), Apr (wisteria)",
        access: "20 min walk from Kasama Station (JR Mito Line), or shuttle bus during festival periods",
        hours: "Open daily; shrine office 8:00-16:30; grounds open 24 hours",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000005-0000-0000-0000-000000000232")!,
        name: "Rinno-ji",
        address: "2300 Sannai, Nikko, Tochigi",
        description: "The most important temple within the Nikko UNESCO World Heritage complex, Rinno-ji is a Tendai Buddhist temple founded in 766 AD by the monk Shodo Shonin. Its massive Sanbutsudo (Three Buddha Hall) is the largest wooden structure in the Nikko area, housing three gilded 8-meter-tall statues representing the deities of Nikko's three sacred mountains. The temple's Shoyoen Japanese garden is one of the finest in the Kanto region.",
        coordinate: CLLocationCoordinate2D(latitude: 36.7569, longitude: 139.5998),
        stampSlotId: 232,
        category: .tera,
        tagline: "Three gilded 8-meter Buddhas in Nikko's largest wooden hall",
        highlights: [
            "Sanbutsudo — Nikko's largest wooden building with three 8m gilded Buddha statues",
            "UNESCO World Heritage Site — part of the Nikko temple and shrine complex",
            "Founded in 766 AD by Shodo Shonin who opened the Nikko mountains",
            "Shoyoen Japanese garden — one of the finest strolling gardens in Kanto"
        ],
        mustSee: "Enter the Sanbutsudo and stand before the three towering gilded Buddha statues — each 8 meters tall, they represent the deities of Nikko's three sacred mountains. The sheer scale of the golden figures in the dim wooden hall is breathtaking.",
        tips: [
            "Buy the Nikko combined ticket (World Heritage pass) covering Rinno-ji, Toshogu, and Futarasan Jinja",
            "The Shoyoen garden behind the temple is beautiful in autumn and often missed by visitors rushing to Toshogu",
            "The Treasure Hall contains fascinating artifacts from Nikko's 1,250-year religious history",
            "Visit early in the morning before tour groups arrive from Tokyo"
        ],
        bestSeason: "Oct-Nov (autumn foliage in Shoyoen garden), May (fresh green), Jan (snow-covered grounds)",
        access: "20 min walk from Nikko Station (JR/Tobu), or bus to Shinkyo stop — 7 min",
        hours: "8:00-17:00 (Apr-Oct), 8:00-16:00 (Nov-Mar)",
        imageURLs: []
    ),

    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    // MARK: - Tohoku (ID 233-245)
    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

    Shrine(
        id: UUID(uuidString: "00000005-0000-0000-0000-000000000233")!,
        name: "Chuson-ji",
        address: "202 Koromonoseki, Hiraizumi, Nishiiwai, Iwate",
        description: "A UNESCO World Heritage Site, Chuson-ji is the crown jewel of Hiraizumi — the 12th-century capital of the northern Fujiwara clan that rivaled Kyoto in splendor. The Konjikido (Golden Hall) is entirely covered in gold leaf inside and out, sheltering the mummified remains of three generations of Fujiwara lords. Built in 1124, it is the only original structure surviving from Hiraizumi's golden age and represents the Pure Land Buddhist ideal of paradise on earth.",
        coordinate: CLLocationCoordinate2D(latitude: 38.9867, longitude: 141.1061),
        stampSlotId: 233,
        category: .tera,
        tagline: "A golden hall sheltering three mummified lords from a lost northern capital",
        highlights: [
            "Konjikido — entirely gold-leaf covered hall from 1124, a National Treasure",
            "UNESCO World Heritage Site representing Hiraizumi's Pure Land Buddhist culture",
            "Mummified remains of three generations of Fujiwara lords inside the golden hall",
            "Approach through a magnificent 800-year-old cedar-lined avenue"
        ],
        mustSee: "The Konjikido (Golden Hall) — step inside the protective glass enclosure and gaze at the hall covered entirely in gold leaf, inlaid with mother-of-pearl and lacquer. Inside rest the mummified remains of three Fujiwara lords. Nothing else in northern Japan matches its splendor.",
        tips: [
            "Walk the full Tsukimizaka cedar avenue approach — the 800-year-old trees set the perfect atmosphere",
            "The treasure hall (Sankozo) has extraordinary Buddhist art and relics from the Fujiwara era",
            "Combine with Motsu-ji temple nearby for the complete Hiraizumi UNESCO experience",
            "Hiraizumi is easily visited as a day trip from Sendai or Morioka via JR Tohoku Line"
        ],
        bestSeason: "May (Fujiwara Festival with historical procession), Nov (autumn foliage on cedar avenue)",
        access: "25 min walk from Hiraizumi Station (JR Tohoku Line), or Junkan bus to Chuson-ji stop — 5 min",
        hours: "8:30-17:00 (Mar-Nov), 8:30-16:30 (Dec-Feb)",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000005-0000-0000-0000-000000000234")!,
        name: "Motsu-ji",
        address: "58 Osawa, Hiraizumi, Nishiiwai, Iwate",
        description: "A UNESCO World Heritage Site alongside Chuson-ji, Motsu-ji preserves the finest example of a Heian-period Pure Land garden in all of Japan. While the original temple buildings were destroyed by fire, the garden — centered on a large pond representing the ocean of the Pure Land paradise — survives in its original 12th-century form. The Fujiwara clan designed it as an earthly representation of Amida Buddha's western paradise.",
        coordinate: CLLocationCoordinate2D(latitude: 38.9821, longitude: 141.1143),
        stampSlotId: 234,
        category: .tera,
        tagline: "Japan's finest surviving Pure Land paradise garden from the Heian era",
        highlights: [
            "Japan's finest surviving Heian-period Pure Land garden in its original 12th-century form",
            "UNESCO World Heritage Site — part of the Hiraizumi cultural landscape",
            "Large pond garden representing the ocean of Amida Buddha's paradise",
            "Gokusui-no-en poetry party recreated in May with Heian-period costumes"
        ],
        mustSee: "Walk the full perimeter of the garden pond — its composition, with carefully placed rocks, beaches, and peninsulas, has survived unchanged for 900 years. In every direction the garden evokes the Pure Land paradise of Amida Buddha.",
        tips: [
            "The Gokusui-no-en floating poetry party in late May recreates Heian aristocratic culture — worth timing your visit",
            "The Iris Festival in late June fills the garden with 300 varieties of Japanese iris",
            "Temple foundations marked on the ground show the enormous scale of the original complex",
            "Combine with Chuson-ji — the two are about 1.5 km apart and connected by a pleasant walk"
        ],
        bestSeason: "Late May (Gokusui-no-en poetry festival), late Jun (iris festival), Nov (autumn reflections in pond)",
        access: "7 min walk from Hiraizumi Station (JR Tohoku Line)",
        hours: "8:30-17:00 (Mar-Nov), 8:30-16:30 (Dec-Feb)",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000005-0000-0000-0000-000000000235")!,
        name: "Zuigan-ji",
        address: "91 Chonai, Matsushima, Miyagi",
        description: "The most important Zen temple in the Tohoku region, Zuigan-ji was lavishly rebuilt by the legendary warlord Date Masamune in 1609 using the finest materials and craftsmen from Kyoto. Located in Matsushima — one of Japan's three most celebrated scenic views — the temple features gorgeously painted fusuma doors by the Kano school and a mysterious avenue of natural caves carved with Buddhist images by medieval monks.",
        coordinate: CLLocationCoordinate2D(latitude: 38.3685, longitude: 141.0600),
        stampSlotId: 235,
        category: .tera,
        tagline: "Date Masamune's magnificent Zen temple in Japan's most scenic bay",
        highlights: [
            "Rebuilt by the legendary one-eyed warlord Date Masamune in 1609",
            "National Treasure main hall with stunning Kano school fusuma paintings",
            "Cave avenue — natural grottoes carved with Buddhist images by medieval monks",
            "Set in Matsushima — one of Japan's three most celebrated scenic views"
        ],
        mustSee: "Walk through the eerie cave-lined approach avenue — medieval monks carved Buddhist statues and memorial tablets into the natural rock caves over centuries. Then enter the main hall to see the brilliantly painted fusuma sliding doors commissioned by Date Masamune.",
        tips: [
            "Take a Matsushima Bay boat cruise to see the pine-covered islands before visiting the temple",
            "The Seiryu-den treasure museum has Date clan artifacts including Masamune's personal belongings",
            "Try Matsushima's famous oysters — grilled, fried, or in a rice bowl — at the waterfront stalls",
            "The adjacent Entsu-in temple has beautiful moss gardens and autumn illumination"
        ],
        bestSeason: "Nov (autumn foliage), Year-round for Matsushima Bay scenery",
        access: "5 min walk from Matsushima-Kaigan Station (JR Senseki Line)",
        hours: "8:00-17:00 (Apr-Sep), 8:00-16:30 (Oct-Nov, Feb-Mar), 8:00-16:00 (Dec-Jan)",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000005-0000-0000-0000-000000000236")!,
        name: "Shiogama Jinja",
        address: "1-1 Ichinomiya, Shiogama, Miyagi",
        description: "The most important shrine in the Tohoku region and the ichinomiya (highest-ranked shrine) of the former Mutsu Province, Shiogama Jinja sits atop a forested hill overlooking Shiogama Bay and the pine islands of Matsushima. The shrine is the protector of salt-making, fishing, and safe maritime passage, with roots stretching back to the mythological era. Its Hote Matsuri festival in July features a mikoshi (portable shrine) carried by fishermen into the sea.",
        coordinate: CLLocationCoordinate2D(latitude: 38.3215, longitude: 141.0010),
        stampSlotId: 236,
        category: .jinja,
        tagline: "Tohoku's highest-ranked shrine protecting the sea and salt-makers",
        highlights: [
            "Ichinomiya of Mutsu Province — the highest-ranked shrine in Tohoku",
            "Protector of salt-making, fishing, and safe maritime passage",
            "202 stone steps through forest to the hilltop sanctuary overlooking the bay",
            "Hote Matsuri (July) — mikoshi carried into the sea by fishermen"
        ],
        mustSee: "Climb the 202 stone steps through the forest to the main hall at the hilltop — the view from the top across Shiogama Bay to the pine islands of Matsushima is one of Tohoku's finest shrine panoramas.",
        tips: [
            "There is a back road for those who prefer to skip the 202 stone steps",
            "The Hote Matsuri in July is one of Tohoku's most exciting maritime festivals",
            "Shiogama's fish market (Shiogama Suisan Bussan) near the shrine has excellent fresh sushi",
            "Combine with a visit to Matsushima — the two towns are connected by a scenic ferry"
        ],
        bestSeason: "Jul (Hote Matsuri), Apr (cherry blossoms on the hillside), Jan (hatsumode)",
        access: "15 min walk from Hon-Shiogama Station (JR Senseki Line)",
        hours: "5:00-18:00 (Mar-Oct), 5:00-17:00 (Nov-Feb); grounds open 24 hours",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000005-0000-0000-0000-000000000237")!,
        name: "Dewa Sanzan Jinja (Hagurosan)",
        address: "7 Touge, Haguro, Tsuruoka, Yamagata",
        description: "The gateway to the sacred Dewa Three Mountains pilgrimage, Hagurosan's shrine sits atop 2,446 stone steps that climb through one of Japan's most magnificent ancient cedar forests. The climb passes a 600-year-old five-story pagoda — a National Treasure standing alone in the forest — and takes about an hour through towering cedars over 300 years old. The Dewa Sanzan pilgrimage representing birth, death, and rebirth has been practiced by yamabushi mountain ascetics for over 1,400 years.",
        coordinate: CLLocationCoordinate2D(latitude: 38.6930, longitude: 139.9850),
        stampSlotId: 237,
        category: .jinja,
        tagline: "2,446 sacred stone steps through ancient cedars to a mountain shrine",
        highlights: [
            "2,446 stone steps through a magnificent 300-year-old cedar forest",
            "Five-story pagoda (National Treasure) standing alone in the forest",
            "Gateway to the Dewa Three Mountains yamabushi ascetic pilgrimage",
            "Over 1,400 years of mountain worship representing birth, death, and rebirth"
        ],
        mustSee: "The five-story pagoda (Gojunoto) standing alone in the ancient cedar forest partway up the climb — this National Treasure, built around 1372, appears to grow from the forest floor. Its solitary beauty amid the towering cedars is one of the most photographed scenes in Tohoku.",
        tips: [
            "The 2,446 steps take about 60-90 minutes to climb — sturdy shoes and water are essential",
            "Yamabushi experience programs let visitors train as mountain ascetics for a day",
            "Try shojin ryori (Buddhist vegetarian cuisine) at the temple lodgings (shukubo) on the mountain",
            "The paid toll road to the summit is available for those who cannot climb the steps"
        ],
        bestSeason: "Jul-Aug (summit season, mountain wildflowers), Oct-Nov (autumn foliage on the cedar approach)",
        access: "Bus from Tsuruoka Station (JR Uetsu Line) to Haguro Zuishinmon — 35 min",
        hours: "Open daily 24 hours; Sanzan Gosaiden (main hall at summit) 8:30-16:30",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000005-0000-0000-0000-000000000238")!,
        name: "Risshaku-ji (Yamadera)",
        address: "4456-1 Yamadera, Yamagata, Yamagata",
        description: "Perched on a cliff face above the Yamagata Valley, Risshaku-ji — popularly known as Yamadera — is the temple that inspired the great haiku poet Matsuo Basho to compose one of his most famous verses: 'Stillness — the cicada's cry penetrates the rock.' Founded in 860 AD, the temple's 1,015 stone steps climb past cave shrines and cliff-edge halls to a breathtaking panorama that has moved poets and pilgrims for over a millennium.",
        coordinate: CLLocationCoordinate2D(latitude: 38.3130, longitude: 140.4370),
        stampSlotId: 238,
        category: .tera,
        tagline: "1,015 steps to where Basho heard the cicadas and the silence of eternity",
        highlights: [
            "1,015 stone steps climbing a cliff face to panoramic valley views",
            "Inspiration for Basho's famous cicada haiku — a pilgrimage site for poetry lovers",
            "Cave shrines and cliff-edge halls clinging to the rock face",
            "Founded in 860 AD — over 1,100 years of mountain Buddhist practice"
        ],
        mustSee: "Climb to the Godaido observation platform at the top — the panoramic view of the Yamagata Valley far below, framed by the mountains, is one of the most rewarding vistas in Tohoku. Then read Basho's haiku inscribed on the stone monument and listen to the silence.",
        tips: [
            "The 1,015 steps take about 30-45 minutes — pace yourself and enjoy each cave shrine along the way",
            "Visit in early summer to hear the cicadas that inspired Basho's famous poem",
            "Autumn foliage (late October) frames the cliff-side buildings spectacularly",
            "Try imoni (taro and beef stew) at nearby restaurants — Yamagata's signature autumn dish"
        ],
        bestSeason: "Jun-Jul (cicadas and Basho atmosphere), late Oct-Nov (autumn foliage), winter (snow-covered cliffs)",
        access: "Directly adjacent to Yamadera Station (JR Senzan Line) — 20 min from Yamagata Station",
        hours: "8:00-17:00 (May-Nov), 8:00-16:00 (Dec-Apr)",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000005-0000-0000-0000-000000000239")!,
        name: "Iwakiyama Jinja",
        address: "27 Hyakuzawa Higashiiwakinzan, Hirosaki, Aomori",
        description: "The sacred shrine of Mt. Iwaki — the highest mountain in Aomori Prefecture and known as the 'Fuji of Tsugaru' — Iwakiyama Jinja has been the spiritual center of the Tsugaru region for over 1,200 years. The shrine sits at the mountain's base surrounded by ancient cedar forest and serves as the starting point for the sacred mountain pilgrimage. Its beautifully carved vermillion gate and the dramatic backdrop of the conical volcano make it one of Tohoku's most atmospheric shrines.",
        coordinate: CLLocationCoordinate2D(latitude: 40.6000, longitude: 140.3050),
        stampSlotId: 239,
        category: .jinja,
        tagline: "Sacred shrine of the 'Fuji of Tsugaru' — Aomori's holy mountain",
        highlights: [
            "Guardian shrine of Mt. Iwaki — Aomori's highest peak and the 'Fuji of Tsugaru'",
            "Over 1,200 years as the spiritual center of the Tsugaru region",
            "Beautifully carved vermillion gate against a volcanic mountain backdrop",
            "Oyama Sankei mountain pilgrimage festival in August"
        ],
        mustSee: "Stand before the elaborately carved Chinese-style gate (Romon) and look up at the conical peak of Mt. Iwaki rising behind the ancient cedars — the combination of human artistry and volcanic grandeur is the essence of Japanese mountain worship.",
        tips: [
            "The Oyama Sankei festival in August features a procession carrying a portable shrine up the mountain",
            "Combine with a visit to nearby Hirosaki Castle — famous for its cherry blossoms in April",
            "The mountain toll road (Iwaki Skyline) offers panoramic views from the summit",
            "Try Tsugaru apple products at local shops — the region produces Japan's finest apples"
        ],
        bestSeason: "Apr-May (cherry blossoms with snow-capped Mt. Iwaki), Aug (Oyama Sankei festival), Oct (autumn foliage)",
        access: "Bus from Hirosaki Station (JR Ou Line) to Iwakisan Jinja-mae — 40 min",
        hours: "Open daily; shrine office 8:30-17:00; grounds open 24 hours",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000005-0000-0000-0000-000000000240")!,
        name: "Uesugi Jinja",
        address: "1-4-13 Marunouchi, Yonezawa, Yamagata",
        description: "Enshrining the legendary samurai lord Uesugi Kenshin — revered as one of Japan's greatest military commanders and the 'God of War' — this shrine was built within the grounds of Yonezawa Castle in 1876. Kenshin's famous rivalry with Takeda Shingen and his reputation for honor and justice have made him one of Japan's most admired historical figures. The adjacent Keisho-den museum houses priceless Uesugi clan treasures and armor.",
        coordinate: CLLocationCoordinate2D(latitude: 37.9108, longitude: 140.1033),
        stampSlotId: 240,
        category: .jinja,
        tagline: "Shrine of the legendary samurai Uesugi Kenshin — the 'God of War'",
        highlights: [
            "Enshrines Uesugi Kenshin — one of Japan's greatest samurai commanders",
            "Located within the grounds of historic Yonezawa Castle",
            "Keisho-den museum with priceless Uesugi clan armor and artifacts",
            "Uesugi Snow Lantern Festival in February with 300+ snow lanterns"
        ],
        mustSee: "Visit the Keisho-den museum to see Uesugi Kenshin's actual battle armor and the legendary Uesugi clan treasures — then stand before the shrine and contemplate the warrior who chose honor over ambition.",
        tips: [
            "The Uesugi Snow Lantern Festival (mid-February) fills the castle grounds with over 300 snow lanterns — magical at dusk",
            "Yonezawa beef (Yonezawa-gyu) is one of Japan's three great wagyu — eat it while visiting",
            "The Uesugi Matsuri in late April features a recreation of the legendary battle with Takeda Shingen",
            "The castle moat park surrounding the shrine is beautiful for cherry blossom walks in April"
        ],
        bestSeason: "Feb (Uesugi Snow Lantern Festival), late Apr (Uesugi Matsuri), Apr (cherry blossoms)",
        access: "15 min walk from Yonezawa Station (JR Ou/Yamagata Shinkansen)",
        hours: "Open daily; shrine office 9:00-17:00; Keisho-den 9:00-16:00; grounds open 24 hours",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000005-0000-0000-0000-000000000241")!,
        name: "Isasumi Jinja",
        address: "4377 Miyabayashi, Aizumisato, Onuma, Fukushima",
        description: "One of the oldest and most sacred shrines in the Aizu region of Fukushima, Isasumi Jinja traces its origins to the mythological age and was designated as one of the highest-ranked shrines in the ancient Engishiki records. The shrine is famous for its magnificent wisteria garden and for its role as the spiritual guardian of the Aizu warrior clan. Tragically, the original main hall was destroyed by fire in 2008 and has been painstakingly reconstructed.",
        coordinate: CLLocationCoordinate2D(latitude: 37.4550, longitude: 139.9290),
        stampSlotId: 241,
        category: .jinja,
        tagline: "Aizu's most ancient sacred shrine with magnificent wisteria gardens",
        highlights: [
            "One of the oldest shrines in the Aizu region with mythological origins",
            "Magnificent wisteria garden blooming in late spring",
            "Listed in the ancient Engishiki — highest rank among Aizu shrines",
            "Spiritual guardian of the Aizu samurai warrior tradition"
        ],
        mustSee: "Visit in late May when the wisteria garden is in full bloom — cascading purple and white wisteria flowers hanging in long clusters create one of Fukushima's most beautiful spring scenes.",
        tips: [
            "The shrine's wisteria festival runs from mid-May to early June depending on the blooming season",
            "Combine with a visit to the historic Aizu-Wakamatsu samurai district and Tsuruga Castle",
            "The surrounding Okuaizu area has beautiful autumn foliage along the Tadami River",
            "Try Aizu cuisine — kozuyu (clear lacquerware soup) is a traditional Aizu celebration dish"
        ],
        bestSeason: "Late May (wisteria), Nov (autumn foliage), Jan (New Year with snow)",
        access: "Taxi from Aizu-Takada Station (JR Tadami Line) — about 5 min",
        hours: "Open daily; shrine office 9:00-17:00; grounds open 24 hours",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000005-0000-0000-0000-000000000242")!,
        name: "Nanko Jinja",
        address: "7-1 Kakunai, Shirakawa, Fukushima",
        description: "Built beside Nanko Park — recognized as the oldest public park in Japan, established in 1801 by the daimyo Matsudaira Sadanobu — Nanko Jinja enshrines Sadanobu himself and honors his legacy of enlightened governance. The park surrounding the shrine features a beautiful lake with islands, traditional teahouses, and pine trees, and is celebrated as one of the finest cherry blossom and autumn foliage spots in southern Fukushima.",
        coordinate: CLLocationCoordinate2D(latitude: 37.0975, longitude: 140.1870),
        stampSlotId: 242,
        category: .jinja,
        tagline: "Shrine beside Japan's oldest public park, founded by an enlightened lord",
        highlights: [
            "Adjacent to Nanko Park — Japan's oldest public park established in 1801",
            "Enshrines Matsudaira Sadanobu — the daimyo who created the park for all people",
            "Beautiful lake with islands, teahouses, and pine-lined promenades",
            "Outstanding cherry blossoms and autumn foliage around the lakeside"
        ],
        mustSee: "Walk the full perimeter of Nanko Lake after visiting the shrine — the reflections of the pine-covered islands and traditional teahouses in the water embody the aesthetic ideals of Matsudaira Sadanobu, the enlightened lord who opened this space to all citizens in 1801.",
        tips: [
            "The Nanko Park cherry blossom season (mid-April) is one of southern Fukushima's finest",
            "The traditional teahouse Suirakutei on the lake island serves matcha with a view",
            "Shirakawa is the gateway to the Shirakawa Barrier — an ancient border famous in Japanese poetry",
            "Nanko Park's autumn foliage illumination in November is worth seeing"
        ],
        bestSeason: "Mid-Apr (cherry blossoms), Nov (autumn foliage illumination), summer (lotus flowers on lake)",
        access: "15 min walk from Shirakawa Station (JR Tohoku Line / Tohoku Shinkansen Shin-Shirakawa Station — then bus)",
        hours: "Open daily; shrine office 9:00-17:00; Nanko Park open 24 hours",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000005-0000-0000-0000-000000000243")!,
        name: "Osaki Hachimangu",
        address: "4-6-1 Hachiman, Aoba, Sendai, Miyagi",
        description: "Designated a National Treasure, Osaki Hachimangu was built in 1607 by the powerful warlord Date Masamune using the brilliant Momoyama-style architecture of black lacquer and gold leaf decoration. As the guardian shrine of the Date clan, it is the finest example of Date clan splendor in Sendai. The shrine's Dontosai festival on January 14 — where participants run nearly naked through freezing winter streets — is one of Tohoku's most famous winter events.",
        coordinate: CLLocationCoordinate2D(latitude: 38.2710, longitude: 140.8530),
        stampSlotId: 243,
        category: .hachimangu,
        tagline: "National Treasure in black lacquer and gold — Date Masamune's guardian shrine",
        highlights: [
            "National Treasure — finest example of Momoyama-style black lacquer and gold architecture",
            "Built by Date Masamune in 1607 as the guardian shrine of the Date clan",
            "Dontosai festival (Jan 14) — nearly naked participants running through freezing streets",
            "Elaborate interior with carved peacocks, peonies, and dragons in gold and polychrome"
        ],
        mustSee: "Study the exterior of the main hall — the combination of glossy black lacquer, gold fittings, and vivid polychrome carvings of mythical creatures represents the peak of Momoyama-era flamboyant beauty. It is a National Treasure for good reason.",
        tips: [
            "The Dontosai festival on January 14 is one of Tohoku's wildest — burning New Year decorations and hadaka matsuri (near-naked runners)",
            "The shrine is on a hill in a quiet residential area — a peaceful contrast to busy downtown Sendai",
            "Combine with a visit to Zuihoden mausoleum of Date Masamune nearby",
            "Take the Sendai Loople bus — it stops at both Osaki Hachimangu and Zuihoden"
        ],
        bestSeason: "Jan 14 (Dontosai festival), Apr (cherry blossoms), Year-round for architecture",
        access: "15 min walk from Kunimi Station (JR Senzan Line), or Sendai Loople bus to Osaki Hachimangu-mae",
        hours: "Open daily; grounds open 24 hours; shrine office 9:00-17:00",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000005-0000-0000-0000-000000000244")!,
        name: "Taiheizan Miyoshi Jinja",
        address: "1 Hiroomote Sannocho, Akita, Akita",
        description: "The most important shrine in Akita Prefecture, Taiheizan Miyoshi Jinja enshrines the fierce deity Miyoshi Daimyojin — the god of strength and victory — atop Mt. Taihei. The shrine is the spiritual anchor of the Bonden Festival on January 17, when teams of men compete to be the first to carry massive, elaborately decorated bonden (sacred bamboo and cloth poles) up the mountain to the shrine in a raucous and physically intense race.",
        coordinate: CLLocationCoordinate2D(latitude: 39.6880, longitude: 140.0660),
        stampSlotId: 244,
        category: .jinja,
        tagline: "Akita's most sacred shrine and the fierce Bonden Festival mountain race",
        highlights: [
            "Akita's most important shrine enshrining the deity of strength and victory",
            "Bonden Festival (Jan 17) — teams race to carry massive decorated poles up the mountain",
            "Located on Mt. Taihei with commanding views over Akita city",
            "Miyoshi Daimyojin — a fierce warrior deity unique to northern Japan"
        ],
        mustSee: "If you can time your visit for January 17, witness the Bonden Festival — teams of men carrying massive, wildly decorated sacred poles jostle and crash into each other as they race up the icy mountain to the shrine. The intensity is extraordinary.",
        tips: [
            "The city-center worship hall (Sato-miya) in central Akita is more easily accessible than the mountain shrine",
            "January 17 Bonden Festival is one of Akita's three great winter festivals",
            "Combine with Akita's famous Kanto Festival in August — bamboo poles with lanterns balanced vertically",
            "Try kiritanpo (grilled rice sticks in hot pot) — Akita's signature dish"
        ],
        bestSeason: "Jan 17 (Bonden Festival), Aug (Kanto Festival in Akita city), Year-round",
        access: "City center worship hall: 10 min walk from Akita Station (JR); mountain shrine: bus from Akita Station — 30 min",
        hours: "Open daily; shrine office 9:00-16:30; grounds open 24 hours",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000005-0000-0000-0000-000000000245")!,
        name: "Dewa Jinja (Gassan)",
        address: "Gassan, Higashine, Yamagata",
        description: "Perched at the 1,984-meter summit of Mt. Gassan — the highest of the Dewa Three Mountains — Dewa Jinja is a shrine that can only be reached by hiking and is accessible only during the summer months when the snow melts. The mountain represents death and the past life in the Dewa Sanzan pilgrimage of death and rebirth. The summit offers panoramic views across the Shonai Plain to the Sea of Japan and is surrounded by alpine wildflowers and snowfields even in midsummer.",
        coordinate: CLLocationCoordinate2D(latitude: 38.5450, longitude: 140.0200),
        stampSlotId: 245,
        category: .jinja,
        tagline: "Summit shrine at 1,984 meters — accessible only in summer",
        highlights: [
            "Summit shrine at 1,984 meters on the highest of the Dewa Three Mountains",
            "Accessible only July-September when the snow melts enough for the trail",
            "Represents death and the past life in the Dewa Sanzan pilgrimage",
            "Panoramic summit views across the Shonai Plain to the Sea of Japan"
        ],
        mustSee: "Reach the summit shrine and look out across the sea of clouds and alpine meadows — knowing that yamabushi ascetics have climbed this same path for 1,400 years as part of a ritual journey through death and rebirth gives the view profound spiritual weight.",
        tips: [
            "The shrine is only open from July 1 to September 15 — plan accordingly",
            "The hike from Gassan 8th Station (accessible by bus) takes about 2.5-3 hours one way",
            "Bring warm layers and rain gear — weather changes rapidly at the summit even in summer",
            "Combine with Hagurosan (birth) and Yudono (rebirth) for the complete Dewa Sanzan pilgrimage"
        ],
        bestSeason: "Jul-Sep (only period the summit shrine is open; Aug for alpine flowers)",
        access: "Bus from Tsuruoka or Yamagata to Gassan 8th Station (seasonal), then 2.5-3 hour hike to summit",
        hours: "Open July 1 - September 15 only; approximately 6:00-17:00 (weather dependent)",
        imageURLs: []
    ),

    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    // MARK: - Hokkaido (ID 246-249)
    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

    Shrine(
        id: UUID(uuidString: "00000005-0000-0000-0000-000000000246")!,
        name: "Hokkaido Jingu",
        address: "474 Miyagaoka, Chuo, Sapporo, Hokkaido",
        description: "Hokkaido's most important shrine, Hokkaido Jingu was established in 1869 to enshrine the pioneering spirits that settled the northern frontier of Japan during the Meiji era. Set within the vast Maruyama Park — a primeval forest of towering Ezo spruce and Sakhalin fir trees — the shrine draws over 800,000 visitors during hatsumode and is beloved for its cherry blossom season when the park's 1,700 cherry trees bloom alongside the last of the spring snow.",
        coordinate: CLLocationCoordinate2D(latitude: 43.0532, longitude: 141.3099),
        stampSlotId: 246,
        category: .jingu,
        tagline: "Hokkaido's spiritual heart in a primeval forest of northern trees",
        highlights: [
            "Hokkaido's most important shrine — spiritual center of the northern frontier",
            "Set in Maruyama Park's primeval forest of Ezo spruce and Sakhalin fir",
            "Over 800,000 hatsumode visitors — Hokkaido's largest New Year gathering",
            "1,700 cherry trees bloom late (early May) alongside the last spring snow"
        ],
        mustSee: "Visit in early May when Hokkaido's cherry blossoms finally bloom — seeing the 1,700 cherry trees in Maruyama Park bursting into flower while patches of snow still linger on the ground is a uniquely Hokkaido spring experience.",
        tips: [
            "Maruyama Park is home to wild Ezo squirrels and Ezo woodpeckers — keep your eyes open on the forest paths",
            "Combine with the Maruyama Zoo adjacent to the park for a family-friendly full day",
            "New Year hatsumode is extremely crowded — consider visiting January 2-3 for slightly fewer crowds",
            "The shrine's limited-edition seasonal goshuin (stamp books) are popular with collectors"
        ],
        bestSeason: "Early May (late cherry blossoms with snow), Jan (hatsumode), Jun (Hokkaido Shrine Festival)",
        access: "15 min walk from Maruyama-Koen Station (Sapporo Subway Tozai Line)",
        hours: "Open daily; shrine office 9:00-17:00; grounds open from sunrise to sunset (varies seasonally)",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000005-0000-0000-0000-000000000247")!,
        name: "Hakodate Hachimangu",
        address: "2-7-1 Yachigashira, Hakodate, Hokkaido",
        description: "Perched on a hillside overlooking Hakodate Bay, Hakodate Hachimangu is the historic guardian shrine of one of Hokkaido's oldest port cities. Originally established in 1445, it was rebuilt in its current grand form in 1915 after fires. The shrine played a significant role during the Boshin War (1868-1869) and the founding of the short-lived Republic of Ezo. Its elevated location offers sweeping views of the bay and the city, and the annual festival in August is Hakodate's largest celebration.",
        coordinate: CLLocationCoordinate2D(latitude: 41.7538, longitude: 140.7190),
        stampSlotId: 247,
        category: .hachimangu,
        tagline: "Historic guardian shrine overlooking Hakodate's beautiful bay",
        highlights: [
            "Historic shrine overlooking Hakodate Bay from its hillside location",
            "Originally established in 1445 — one of Hokkaido's oldest shrines",
            "Connected to the Boshin War and the Republic of Ezo period",
            "August festival — Hakodate's largest with parade and fireworks"
        ],
        mustSee: "Stand at the shrine's elevated vantage point and look down across Hakodate Bay — the same view that welcomed and guarded sailors, soldiers, and settlers for over 500 years. On a clear day, the Tsugaru Strait and Honshu are visible in the distance.",
        tips: [
            "The August festival features a lively parade through the city and fireworks over the bay",
            "Combine with a visit to Hakodate's morning market (Asaichi) for fresh seafood",
            "The nearby Yachigashira Onsen is one of Hakodate's historic public baths — perfect after the uphill walk",
            "Hakodate's famous night view from Mt. Hakodate is a must — take the ropeway at sunset"
        ],
        bestSeason: "Aug (Hakodate Festival), May (cherry blossoms), Dec-Feb (snow and winter illumination)",
        access: "5 min walk from Yachigashira Station (Hakodate City Tram), or 20 min walk from Hakodate Station",
        hours: "Open daily; shrine office 9:00-17:00; grounds open 24 hours",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000005-0000-0000-0000-000000000248")!,
        name: "Obihiro Jinja",
        address: "2 Higashi-3-jo Minami, Obihiro, Hokkaido",
        description: "The most important shrine of the Tokachi region in central Hokkaido, Obihiro Jinja was established in 1910 as settlers developed the vast Tokachi Plain into Japan's agricultural heartland. The shrine grounds feature beautiful gardens and are surrounded by mature birch and elm trees. It serves as the spiritual anchor for the farming communities of the Tokachi region and is the center of New Year celebrations for the area, drawing large crowds for hatsumode.",
        coordinate: CLLocationCoordinate2D(latitude: 42.9290, longitude: 143.2000),
        stampSlotId: 248,
        category: .jinja,
        tagline: "Spiritual anchor of Tokachi — Hokkaido's agricultural heartland",
        highlights: [
            "Most important shrine of the Tokachi farming region",
            "Established in 1910 during the pioneering settlement of the Tokachi Plain",
            "Surrounded by beautiful birch and elm tree gardens",
            "Center of New Year hatsumode celebrations for the Tokachi region"
        ],
        mustSee: "Walk through the shrine grounds surrounded by Hokkaido's distinctive birch and elm trees — the spacious and serene atmosphere reflects the wide-open spirit of the Tokachi frontier, quite different from the ancient shrine forests of Honshu.",
        tips: [
            "Try Obihiro's famous butadon (grilled pork rice bowl) — the city's signature dish — at restaurants near the station",
            "The Tokachi Obihiro area has excellent craft beer and wine from local farms",
            "Visit the Tokachi Millennium Forest for award-winning landscape architecture",
            "Winter visitors can see the spectacular 'jewelry ice' phenomenon at nearby Toyokoro Beach"
        ],
        bestSeason: "Jan (hatsumode and ice festivals), Jun-Jul (Tokachi summer), Feb (jewelry ice at nearby coast)",
        access: "15 min walk from Obihiro Station (JR Nemuro Line), or 5 min by taxi",
        hours: "Open daily; shrine office 9:00-17:00; grounds open 24 hours",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000005-0000-0000-0000-000000000249")!,
        name: "Kamikawa Jinja",
        address: "Kaguraoka Koen, Asahikawa, Hokkaido",
        description: "The most important shrine of the Kamikawa region in central Hokkaido, Kamikawa Jinja is set within the forested Kaguraoka Park overlooking Asahikawa — Japan's coldest major city where winter temperatures drop below minus 30 degrees Celsius. Established in 1893, the shrine is a center of New Year worship for the region and is surrounded by beautiful cherry blossoms in the late Hokkaido spring. The torii gate framing the city view below is a beloved Asahikawa landmark.",
        coordinate: CLLocationCoordinate2D(latitude: 43.7580, longitude: 142.3860),
        stampSlotId: 249,
        category: .jinja,
        tagline: "Hilltop shrine in Japan's coldest city — guardian of the Kamikawa region",
        highlights: [
            "Most important shrine of the Kamikawa region in central Hokkaido",
            "Set in Kaguraoka Park with panoramic views over Asahikawa",
            "Established in 1893 during the settlement of the northern frontier",
            "Torii gate framing the city view below — a beloved Asahikawa landmark"
        ],
        mustSee: "Stand at the torii gate and look down through it at Asahikawa spread below — on a winter day when the city is blanketed in snow and the temperature drops below minus 20, the spiritual fortitude of the pioneers who built this shrine becomes tangible.",
        tips: [
            "Asahikawa is famous for its ramen — try Asahikawa shoyu (soy sauce) ramen at one of the many local shops",
            "The Asahiyama Zoo nearby is one of Japan's best and features arctic animals in natural habitats",
            "The Asahikawa Winter Festival in February features massive snow sculptures",
            "Kaguraoka Park's cherry blossoms bloom in mid-May — Hokkaido's version of spring hanami"
        ],
        bestSeason: "Mid-May (cherry blossoms in park), Feb (Asahikawa Winter Festival), Jan (hatsumode in deep snow)",
        access: "Bus from Asahikawa Station (JR) to Kaguraoka Koen — 10 min, then 5 min walk uphill",
        hours: "Open daily; shrine office 9:00-17:00; grounds open 24 hours",
        imageURLs: []
    ),

    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    // MARK: - Saitama Additional (ID 250-252)
    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

    Shrine(
        id: UUID(uuidString: "00000005-0000-0000-0000-000000000250")!,
        name: "Hisaizu Jinja",
        address: "1-6-55 Miyamachi, Iwatsuki, Saitama, Saitama",
        description: "An ancient shrine in the historic Iwatsuki district of Saitama, Hisaizu Jinja has been venerated for over 1,500 years as one of the Musashi Province's important shrines recorded in the ancient Engishiki. The shrine is surrounded by a beautiful garden featuring a large sacred pond and is known for its Kuimonogatari Festival. Iwatsuki itself is famous as Japan's center of traditional doll-making (ningyo), and the shrine reflects the refined cultural traditions of the area.",
        coordinate: CLLocationCoordinate2D(latitude: 35.9490, longitude: 139.7250),
        stampSlotId: 250,
        category: .jinja,
        tagline: "Ancient Musashi shrine in Japan's traditional doll-making capital",
        highlights: [
            "Over 1,500 years of history — recorded in the ancient Engishiki",
            "Beautiful sacred pond garden within the shrine grounds",
            "Located in Iwatsuki — Japan's center of traditional doll-making (ningyo)",
            "One of the important shrines of the former Musashi Province"
        ],
        mustSee: "Walk around the sacred pond garden — the quiet reflection of trees and torii in the water creates a contemplative atmosphere that has remained unchanged for centuries in this historic part of Saitama.",
        tips: [
            "Iwatsuki is Japan's doll-making capital — browse the ningyo shops along Ningyo-dori street",
            "The shrine's peacocks roaming the grounds are a unique and charming feature",
            "Combine with Iwatsuki Castle ruins park nearby for a historical half-day",
            "The shrine's spring and autumn festivals feature traditional kagura dance performances"
        ],
        bestSeason: "Mar (Hina Matsuri doll festival in Iwatsuki), Apr (cherry blossoms), Nov (autumn colors)",
        access: "15 min walk from Iwatsuki Station (Tobu Noda Line / Tobu Urban Park Line)",
        hours: "Open daily; shrine office 9:00-16:30; grounds open 24 hours",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000005-0000-0000-0000-000000000251")!,
        name: "Tsuki Jinja",
        address: "1-18-17 Kishimachi, Urawa, Saitama, Saitama",
        description: "One of Japan's most unique shrines, Tsuki Jinja (also called Tsukijinja) is famous for replacing the traditional komainu guardian dogs and other animal motifs with rabbits throughout the shrine grounds. The shrine's name contains the character for 'moon' (tsuki), and rabbits — associated with the moon in Japanese mythology — appear on the water basins, stone carvings, and decorations everywhere. The shrine has no torii gate, another extremely rare feature among Japanese shrines.",
        coordinate: CLLocationCoordinate2D(latitude: 35.8550, longitude: 139.6490),
        stampSlotId: 251,
        category: .jinja,
        tagline: "The rabbit shrine — where bunnies replace guardian dogs everywhere",
        highlights: [
            "Rabbits replace komainu guardian dogs throughout the shrine grounds",
            "One of very few shrines in Japan with no torii gate",
            "Moon-themed shrine name connected to rabbit mythology",
            "Rabbit-shaped water basins, stone carvings, and amulets"
        ],
        mustSee: "Look for rabbits everywhere — they replace the traditional komainu guardian dogs, appear on the water basins, adorn the stone carvings, and even feature on the shrine's amulets and ema. The absence of a torii gate is equally remarkable.",
        tips: [
            "The rabbit amulets and rabbit-shaped omikuji (fortune slips) are popular souvenirs",
            "Visit during the full moon for the most thematic experience",
            "The shrine's flea market on the 12th of each month is popular with antique hunters",
            "Located in central Urawa — combine with the nearby Urawa shopping district"
        ],
        bestSeason: "Year-round (rabbit theme is always present), Sep-Oct (harvest moon period), Jan (hatsumode)",
        access: "10 min walk from Urawa Station (JR Keihin-Tohoku/Utsunomiya/Takasaki Lines)",
        hours: "Open daily; shrine office 9:00-16:30; grounds open 24 hours",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000005-0000-0000-0000-000000000252")!,
        name: "Seitenkyu",
        address: "1 Shimonomiya, Sakado, Saitama",
        description: "A stunning Taiwan-style Taoist temple that is entirely unique among religious sites in Japan, Seitenkyu was built over five years using materials and master craftsmen brought directly from Taiwan and completed in 1995. Every surface is covered in elaborate carvings, colorful ceramic figures, and traditional Taiwanese architectural ornamentation in vivid reds, golds, greens, and blues. The temple enshrines Taoist deities and offers a cultural experience that feels like stepping directly into rural Taiwan.",
        coordinate: CLLocationCoordinate2D(latitude: 35.9395, longitude: 139.3870),
        stampSlotId: 252,
        category: .tera,
        tagline: "A vivid piece of Taiwan in Saitama — colorful Taoist temple like no other",
        highlights: [
            "Authentic Taiwan-style Taoist temple — completely unique in Japan",
            "Built with materials and master craftsmen from Taiwan over five years",
            "Every surface covered in elaborate carvings and colorful ceramic figures",
            "Enshrines Taoist deities in vivid reds, golds, greens, and blues"
        ],
        mustSee: "Step through the entrance gate and take in the explosion of color — the contrast with the typical restrained aesthetic of Japanese shrines and temples is total. Every ceiling panel, pillar, and wall is covered in intricate Taiwanese carvings and vibrant ceramic figures.",
        tips: [
            "The temple looks incredible in photographs — the vivid colors and intricate carvings are extremely photogenic",
            "Free admission — maintained as a cultural and religious institution",
            "The main hall ceiling with its elaborate painted panels is not to be missed",
            "Combine with nearby Kawagoe's historic district for a contrast between Edo and Taiwanese architecture"
        ],
        bestSeason: "Year-round (indoor carvings and architecture are weather-independent), Chinese New Year (special celebrations)",
        access: "Taxi from Wakaba Station (Tobu Tojo Line) — about 10 min; limited bus service available",
        hours: "10:00-16:00; closed Thursdays (except national holidays)",
        imageURLs: []
    )
]
