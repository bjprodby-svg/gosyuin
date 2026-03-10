import SwiftUI
import CoreLocation

// MARK: - Kansai Region (78 shrines, ID 27-44, 131-190)
// 18 base entries (27-44) + 60 additional entries (131-190)

let kansaiShrines: [Shrine] = [

    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    // MARK: - Kyoto
    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

    Shrine(
        id: UUID(uuidString: "00000002-0000-0000-0000-000000000027")!,
        name: "Fushimi Inari Taisha",
        address: "68 Fukakusa Yabunouchicho, Fushimi, Kyoto",
        description: "Ten thousand vermillion torii gates wind up a forested mountain south of Kyoto — a sight so otherworldly it feels like entering another dimension. Fushimi Inari Taisha is the head shrine of approximately 30,000 Inari shrines across Japan, dedicated to the fox deity of rice, sake, and prosperity. The full mountain hike takes about two hours and rewards you with quietude and sweeping city views.",
        coordinate: CLLocationCoordinate2D(latitude: 34.9671, longitude: 135.7727),
        stampSlotId: 27,
        category: .inari,
        tagline: "10,000 vermillion torii gates climbing into the mist",
        highlights: [
            "Thousands of torii gates forming continuous tunnels up the mountain",
            "Head shrine of ~30,000 Inari shrines across Japan",
            "Fox (kitsune) messenger statues wearing red bibs throughout the grounds",
            "2-hour summit hike with panoramic views of Kyoto"
        ],
        mustSee: "Walk the first two torii tunnels immediately past the main hall at dawn — the gates glow amber in the early light and the crowds haven't arrived yet. Pure magic.",
        tips: [
            "Arrive before 7 AM to experience the tunnels without crowds",
            "The full summit hike is 4 km — wear comfortable shoes and bring water",
            "The densest and most photogenic torii section is in the first 20 minutes of climbing",
            "Entrance is free and open 24 hours — sunrise and dusk visits are spectacular"
        ],
        bestSeason: "Year-round (early morning any season, autumn colors in November)",
        access: "2 min walk from Inari Station (JR Nara Line) or Fushimi-Inari Station (Keihan Line)",
        hours: "Open 24 hours (free access)",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000002-0000-0000-0000-000000000028")!,
        name: "Kinkaku-ji (Golden Pavilion)",
        address: "1 Kinkakujicho, Kita, Kyoto",
        description: "Three stories of pure gold leaf reflected in a perfectly still mirror pond — Kinkaku-ji is arguably Japan's most iconic image. Originally a retirement villa for shogun Ashikaga Yoshimitsu in 1397, it was converted into a Zen temple after his death. Each floor blends a different architectural style, and the gold-clad structure surrounded by the Kyoko-chi pond represents paradise on earth.",
        coordinate: CLLocationCoordinate2D(latitude: 35.0394, longitude: 135.7292),
        stampSlotId: 28,
        category: .tera,
        tagline: "Three floors of gold leaf shimmering over a mirror pond",
        highlights: [
            "Top two floors covered entirely in pure gold leaf",
            "Kyoko-chi mirror pond reflecting the golden pavilion perfectly",
            "Three architectural styles stacked — shinden, samurai, Zen",
            "UNESCO World Heritage Site and Japan's most recognized landmark"
        ],
        mustSee: "Stand at the main viewing platform across the pond at the golden hour before closing — the low sun turns the gold almost orange, and if the water is calm, the reflection doubles the pavilion.",
        tips: [
            "Visit as soon as it opens at 9 AM or in the last hour before closing to reduce crowds",
            "The garden circuit walk around the pond takes about 30 minutes",
            "The tea ceremony area near the exit serves matcha — a lovely end to the visit",
            "Snow days are magical — the white snow against the gold is breathtaking"
        ],
        bestSeason: "Winter snowfall (rare but stunning), Autumn (red maple framing gold)",
        access: "Bus 101 or 204 from Kyoto Station to Kinkakuji-michi stop (30 min)",
        hours: "9:00-17:00 (year-round)",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000002-0000-0000-0000-000000000029")!,
        name: "Kiyomizu-dera",
        address: "1-294 Kiyomizu, Higashiyama, Kyoto",
        description: "Built on a hillside without a single nail, Kiyomizu-dera's famous wooden stage juts out 13 meters over the treetops of Higashiyama with a stunning view of Kyoto. The temple was founded in 778 AD, and the current main hall dates from 1633. Below the stage, three streams of sacred water pour from the waterfall — each grants a different wish to those who drink from it.",
        coordinate: CLLocationCoordinate2D(latitude: 34.9948, longitude: 135.7851),
        stampSlotId: 29,
        category: .tera,
        tagline: "A wooden stage cantilevered over Kyoto with no single nail",
        highlights: [
            "Iconic wooden stage (butai) projecting 13m over the hillside",
            "Otowa waterfall — three sacred streams granting health, love, or longevity",
            "Night illuminations in spring and autumn — otherworldly",
            "UNESCO World Heritage Site with views across all of Kyoto"
        ],
        mustSee: "Walk out onto the wooden stage (butai) and look across the treetops toward Kyoto. Then descend to the Otowa waterfall and use the long ladles to drink from one of the three streams.",
        tips: [
            "Choose only ONE of the three waterfall streams — drinking from all is considered greedy",
            "Night illumination events in March and November are extraordinary — book ahead",
            "The stone-paved streets below (Sannenzaka, Ninenzaka) are perfect for traditional crafts and snacks",
            "Admission \u{00A5}400; combine with a stroll through Higashiyama"
        ],
        bestSeason: "Late Mar-Apr (cherry blossoms on the hillside), Nov (autumn maple illumination)",
        access: "Bus 206 from Kyoto Station to Kiyomizu-michi stop, then 10 min uphill walk",
        hours: "6:00-18:00 (extended during illumination events)",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000002-0000-0000-0000-000000000030")!,
        name: "Yasaka Jinja",
        address: "625 Gionmachi Kitagawa, Higashiyama, Kyoto",
        description: "At the end of Kyoto's most famous geisha district, Yasaka Jinja lights up brilliantly at night with lanterns swaying above its vermillion gate. Known as 'Gion-san' by locals, it has been the guardian shrine of the Gion district for over 1,350 years. Every July it hosts the Gion Matsuri — Japan's most famous festival, featuring enormous decorated floats paraded through central Kyoto.",
        coordinate: CLLocationCoordinate2D(latitude: 35.0036, longitude: 135.7785),
        stampSlotId: 30,
        category: .jinja,
        tagline: "Guardian of Gion — at the heart of Japan's greatest festival",
        highlights: [
            "Host of Gion Matsuri — Japan's most spectacular festival (all July)",
            "Night lantern atmosphere in the middle of the Gion geisha district",
            "Open 24 hours — one of the best midnight shrine experiences in Kyoto",
            "Ema Hall filled with wishes tied to wooden plaques year-round"
        ],
        mustSee: "Visit at midnight when the lanterns glow and the crowds thin. Walk from Gion Corner through the stone torii and into the lantern-lit main courtyard — the atmosphere is unforgettable.",
        tips: [
            "Open 24 hours and free — perfect for an evening or early morning visit",
            "In July, the Gion Matsuri transforms all of central Kyoto — experience the Yoi-yama (eve parade) on July 16 and the main Yamahoko procession on July 17",
            "The okera-bi sacred fire on New Year's Eve draws thousands",
            "Combine with a walk through Hanamikoji Street to spot geiko"
        ],
        bestSeason: "Jul (Gion Matsuri), Jan 1 (New Year), Year-round nights",
        access: "5 min walk from Gion-Shijo Station (Keihan Line)",
        hours: "Open 24 hours (free access)",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000002-0000-0000-0000-000000000031")!,
        name: "Shimogamo Jinja",
        address: "59 Shimogamo Izumigawacho, Sakyo, Kyoto",
        description: "One of Kyoto's oldest and most atmospheric shrines, Shimogamo Jinja sits at the confluence of two rivers in a primeval forest called Tadasu no Mori — a forest untouched since ancient times. As one of the two Kamo shrines and a UNESCO World Heritage Site, it has been worshipped since before Kyoto became Japan's capital in 794 AD.",
        coordinate: CLLocationCoordinate2D(latitude: 35.0378, longitude: 135.7722),
        stampSlotId: 31,
        category: .jinja,
        tagline: "Ancient shrine in a primeval forest older than Kyoto itself",
        highlights: [
            "Tadasu no Mori — primeval forest untouched for over 1,000 years",
            "UNESCO World Heritage Site, one of Japan's oldest active shrines",
            "Mitarashi-ike sacred pond — wade in during the July Mitarashi Festival",
            "Gorgeous riverside approach from the forest to the main hall"
        ],
        mustSee: "Walk the full length of Tadasu no Mori — the straight forest path to the shrine gates feels like walking through a portal to ancient Japan. The trees here are over 200 years old.",
        tips: [
            "The Mitarashi Matsuri in late July lets you wade barefoot in the sacred pond — a deeply unusual and moving ritual",
            "Combine with Kamigamo Jinja to visit both Kamo shrines in one day",
            "The forest is always quiet — visit any time for peaceful contemplation",
            "Aoi Matsuri procession starts here on May 15 and is one of Kyoto's three great festivals"
        ],
        bestSeason: "May (Aoi Matsuri), Jul (Mitarashi Festival), Autumn colors",
        access: "10 min walk from Demachiyanagi Station (Keihan/Eizan Line)",
        hours: "6:30-17:00 (inner shrine varies)",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000002-0000-0000-0000-000000000032")!,
        name: "Kamigamo Jinja",
        address: "339 Kamigamo Motoyama, Kita, Kyoto",
        description: "The oldest shrine in Kyoto, Kamigamo Jinja has stood at the foot of Koyama mountain since before Kyoto became Japan's capital. Two iconic white sand cones (tatezuna) stand in the approach courtyard — a mysterious ritual installation whose exact symbolism is still debated. The broad, grass-lined approach along the Nishigamo River is one of the most tranquil walks in all of Kyoto.",
        coordinate: CLLocationCoordinate2D(latitude: 35.0593, longitude: 135.7522),
        stampSlotId: 32,
        category: .jinja,
        tagline: "Kyoto's oldest shrine and its mysterious twin sand cones",
        highlights: [
            "Kyoto's oldest active shrine — predates the city itself",
            "Two white tatezuna sand cones — a unique ritual landscape",
            "Broad grass approach along the river — Kyoto's most peaceful promenade",
            "UNESCO World Heritage Site, Ichinomiya of Yamashiro Province"
        ],
        mustSee: "Stand before the two conical white sand mounds (tatezuna) in the inner courtyard — they are thought to represent the sacred mountain Koyama and have been maintained here for over 1,000 years.",
        tips: [
            "The shrine is less visited than Shimogamo — perfect for a quiet morning",
            "The Nishigamo riverside walk outside the shrine is especially beautiful in spring",
            "Aoi Matsuri procession ends here after departing Shimogamo on May 15",
            "Free to enter the outer grounds; inner courtyard has a small fee"
        ],
        bestSeason: "May (Aoi Matsuri), Apr (cherry blossoms along the river)",
        access: "4 min walk from Kamigamo Jinja-mae bus stop (Kyoto City Bus 4 or 46)",
        hours: "5:30-17:00",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000002-0000-0000-0000-000000000033")!,
        name: "Kitano Tenmangu",
        address: "Bakurocho, Kamigyo, Kyoto",
        description: "Dedicated to Sugawara no Michizane, Japan's deified god of scholarship, Kitano Tenmangu is the mother shrine of all Tenmangu shrines across Japan. Founded in 947 AD, its plum orchard — 1,500 trees planted because Michizane loved plum blossoms — erupts into color every February in one of Kyoto's most cherished seasonal events. The flea market on the 25th of every month draws Kyoto's antique-hunters.",
        coordinate: CLLocationCoordinate2D(latitude: 35.0328, longitude: 135.7352),
        stampSlotId: 33,
        category: .tenmangu,
        tagline: "Mother of all learning shrines, with 1,500 plum trees in bloom",
        highlights: [
            "Head shrine of all Tenmangu shrines in Japan — the original god of learning",
            "1,500 plum trees blooming February through March",
            "Tenjin-san flea market on the 25th of every month",
            "Momiji garden (\u{00A5}1,200) with stunning maple illuminations in November"
        ],
        mustSee: "The plum blossom garden in February — 1,500 trees in white and pink with the shrine hall as a backdrop. It's less famous than cherry blossoms but arguably more elegant.",
        tips: [
            "The 25th of each month is Tenjin-san market day — arrive early for the best vintage finds",
            "The maple garden (Momiji-en) opens only in November for \u{00A5}1,200 with matcha — extraordinary",
            "Students leave ema plaques before university entrance exams (Jan\u{2013}Feb) — the hall is plastered with wishes",
            "Located in northwest Kyoto — pair with Kinkaku-ji (10 min by bus)"
        ],
        bestSeason: "Feb-Mar (plum blossoms), Nov (maple illumination)",
        access: "5 min walk from Kitano-Hakubaicho bus stop (Kyoto City Bus 50 or 101)",
        hours: "5:00-17:00 (outer grounds open until sunset)",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000002-0000-0000-0000-000000000034")!,
        name: "Heian Jingu",
        address: "97 Okazaki Nishitennocho, Sakyo, Kyoto",
        description: "Built in 1895 to commemorate 1,100 years since Kyoto became Japan's capital, Heian Jingu is a two-thirds scale replica of the original Heian-period Imperial Palace. The 10,000 sq meter stroll garden surrounding it is considered one of Kyoto's finest — a paradise of seasonal blooms, stone bridges over ponds, and stepping stones across lily-covered water.",
        coordinate: CLLocationCoordinate2D(latitude: 35.0161, longitude: 135.7822),
        stampSlotId: 34,
        category: .jingu,
        tagline: "A Heian Imperial Palace reborn with Kyoto's finest garden",
        highlights: [
            "Dramatic taiheikaku (covered bridge) gate — the iconic red arch of eastern Kyoto",
            "10,000 sq m stroll garden with cherry blossoms, irises, and water lilies",
            "Replica of the original 8th-century Heian Palace at 2/3 scale",
            "Host of Jidai Matsuri — Festival of Ages procession (Oct 22)"
        ],
        mustSee: "The garden (\u{00A5}600) in late April when the weeping cherry trees arch over the stepping stones across the pond — one of the most beautiful spring scenes in all of Japan.",
        tips: [
            "The garden is open year-round and each season brings different blooms — iris in June, water lily in July, maple in November",
            "Jidai Matsuri on October 22 features a 2 km procession of historical costumes from every era",
            "The massive 24.4m torii gate at the entrance is the largest in Kyoto",
            "Combine with the Okazaki Museum area (National Museum of Modern Art, Zoo)"
        ],
        bestSeason: "Late Apr (weeping cherry in garden), Jun (iris), Nov (maple)",
        access: "15 min walk from Higashiyama Station (Tozai Line) or bus 5 to Okazaki-koen",
        hours: "6:00-17:30 (garden 8:30-17:30, seasonal variations)",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000002-0000-0000-0000-000000000035")!,
        name: "Nijo Castle (Nijo-jo)",
        address: "541 Nijojo-cho, Nakagyo, Kyoto",
        description: "Built in 1603 as Tokugawa Ieyasu's Kyoto residence, Nijo Castle is one of the finest examples of Edo-period palatial architecture in Japan. The Ninomaru Palace inside features rooms lavishly decorated with gold-leaf paintings and the famous 'nightingale floors' — wooden corridors engineered to squeak like birds with every footstep to alert against intruders.",
        coordinate: CLLocationCoordinate2D(latitude: 35.0142, longitude: 135.7481),
        stampSlotId: 35,
        category: .jinja,
        tagline: "The shogun's Kyoto fortress with floors that sing like birds",
        highlights: [
            "Nightingale floors (uguisubari) — squeak deliberately to detect intruders",
            "Ninomaru Palace: gold-leaf screen paintings in every room",
            "UNESCO World Heritage Site, symbol of Tokugawa power",
            "Cherry blossom and plum groves in the gardens — spectacular in spring"
        ],
        mustSee: "Walk slowly through the Ninomaru Palace corridors and listen to the nightingale floors squeak with each step — an ingenious 400-year-old security system you can still experience today.",
        tips: [
            "An audio guide (\u{00A5}500) is strongly recommended for the Ninomaru Palace to understand the room paintings",
            "Spring plum (Feb) and cherry (late Mar) blooms in the gardens are world-class",
            "The outer garden (free) has seasonal illuminations in spring and autumn evenings",
            "Allow 90 minutes for the full palace and garden circuit"
        ],
        bestSeason: "Late Mar (cherry blossoms), Feb (plum), Nov (autumn leaves illumination)",
        access: "3 min walk from Nijo-jo-mae Station (Tozai Line)",
        hours: "8:45-17:00 (closed Tue in Jan, Jul, Aug, Dec)",
        imageURLs: []
    ),

    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    // MARK: - Osaka
    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

    Shrine(
        id: UUID(uuidString: "00000002-0000-0000-0000-000000000036")!,
        name: "Sumiyoshi Taisha",
        address: "2-9-89 Sumiyoshi, Sumiyoshi, Osaka",
        description: "One of Japan's oldest and most architecturally distinctive shrines, Sumiyoshi Taisha has given its name to the Sumiyoshi-zukuri architectural style — a style that predates the introduction of Chinese influence in Japanese religious architecture. The shrine's four main halls line up in a row inside the forested precincts, and the arched drum bridge (sori-hashi) over the pond is one of Osaka's most iconic sights.",
        coordinate: CLLocationCoordinate2D(latitude: 34.6120, longitude: 135.4929),
        stampSlotId: 36,
        category: .taisha,
        tagline: "Japan's most ancient architectural style preserved in Osaka",
        highlights: [
            "Four main halls in the unique Sumiyoshi-zukuri architectural style",
            "Sori-hashi arched drum bridge — one of Osaka's most photographed spots",
            "Otaue Matsuri rice planting festival (Jun 14) — one of Japan's three great festivals",
            "Over 2,000 years of history as the head shrine of all Sumiyoshi shrines"
        ],
        mustSee: "Cross the dramatically arched drum bridge (sori-hashi) — it's nearly a vertical curve and requires real effort to climb, but the view from the top across the pond is worth it.",
        tips: [
            "The Otaue Matsuri rice-planting ceremony on June 14 is a rare and ancient spectacle",
            "Visit during Hatsumode (New Year) when millions crowd the shrine — one of Japan's biggest",
            "The approach market on the first day of each month is a local institution",
            "Explore the forested back trails behind the four halls for quiet contemplation"
        ],
        bestSeason: "Jun 14 (rice festival), Jan (New Year's hatsumode), Year-round",
        access: "5 min walk from Sumiyoshi-Taisha Station (Nankai Main Line)",
        hours: "6:00-17:00 (Apr-Sep 6:00-18:00)",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000002-0000-0000-0000-000000000037")!,
        name: "Osaka Tenmangu",
        address: "2-1-8 Tenjinbashi, Kita, Osaka",
        description: "Osaka's beloved Tenmangu shrine sits at the northern end of the world's longest covered shopping arcade. Founded in 949 AD to enshrine Sugawara no Michizane, it hosts the Tenjin Matsuri — one of Japan's three greatest festivals — which fills the Okawa River with 100 illuminated boats and lights up the sky with fireworks viewed by over 1.3 million people.",
        coordinate: CLLocationCoordinate2D(latitude: 34.6931, longitude: 135.5097),
        stampSlotId: 37,
        category: .tenmangu,
        tagline: "Heart of the Tenjin Festival — Osaka's grandest celebration",
        highlights: [
            "Tenjin Matsuri (Jul 24-25) — 100 illuminated river boats and 5,000 fireworks",
            "Deity of learning — students from across Osaka pray for exam success",
            "Adjacent to Tenjinbashisuji — world's longest covered shopping arcade",
            "Sacred plum orchard blooming beautifully in February"
        ],
        mustSee: "If visiting in late July, book riverside seats for Tenjin Matsuri — 100 illuminated boats gliding down the Okawa River at dusk, followed by fireworks, is one of Japan's most spectacular festival experiences.",
        tips: [
            "Tenjin Matsuri on July 24-25 is extraordinary — arrive by 5 PM for the best riverbank spots",
            "The shrine is free and quick to visit — combine with a walk through Tenjinbashisuji arcade",
            "Buy a study success ema or pencil charm as a gift for students",
            "The plum blossoms in February are lovely and uncrowded"
        ],
        bestSeason: "Jul 24-25 (Tenjin Matsuri), Feb (plum blossoms)",
        access: "10 min walk from Minami-Morimachi Station (Sakaisuji Line)",
        hours: "9:00-17:00 (outer grounds 24h)",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000002-0000-0000-0000-000000000038")!,
        name: "Namba Yasaka Jinja",
        address: "2-9-19 Motomachi, Naniwa, Osaka",
        description: "One of Osaka's most surreal and unforgettable sights: a 12-meter lion's head building whose open mouth forms the entrance to the main stage. This colossal lion deity structure, used for traditional performing arts, makes Namba Yasaka Jinja unlike any other shrine in Japan. Hidden in a quiet residential neighborhood just minutes from the Dotonbori neon district, it's one of Osaka's best surprises.",
        coordinate: CLLocationCoordinate2D(latitude: 34.6647, longitude: 135.5002),
        stampSlotId: 38,
        category: .jinja,
        tagline: "A 12-meter lion head shrine that devours evil — and tourists",
        highlights: [
            "12-meter oni (lion) head — the most unique shrine structure in Japan",
            "Ema-covered walls with wishes by thousands of locals and visitors",
            "Hidden in the backstreets of Namba — a genuine local discovery",
            "Lion's mouth said to devour bad luck and bring business success"
        ],
        mustSee: "Stand directly in front of the colossal lion head building — the sheer scale and strangeness of it is jaw-dropping. The open mouth frames the stage altar inside.",
        tips: [
            "From Dotonbori it's a 10-minute walk south through residential streets — not on most tourist maps",
            "The lion head is most impressive lit up at night during festival periods",
            "Toka Ebisu festival in January is lively with lucky rakes and good-luck foods",
            "Excellent for an unusual Instagram shot — very few Western tourists know about it"
        ],
        bestSeason: "Jan (Ebisu Festival), Year-round",
        access: "10 min walk from Namba Station (various lines) or Namba-Namba Station (Sennichimae Line)",
        hours: "24h (outer grounds free)",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000002-0000-0000-0000-000000000039")!,
        name: "Imamiya Ebisu Jinja",
        address: "1-6-10 Ebisunishi, Naniwa, Osaka",
        description: "Known as 'Osaka's Ebisu,' this shrine is the headquarters of the Toka Ebisu festival that transforms western Namba every January 9-11. It enshrines Ebisu, the god of commerce and fishing, making it the patron of Osaka's merchant culture. The Fukumusume (fortune maidens) who distribute lucky bamboo decorations during the festival have become a beloved Osaka institution.",
        coordinate: CLLocationCoordinate2D(latitude: 34.6646, longitude: 135.4983),
        stampSlotId: 39,
        category: .jinja,
        tagline: "Osaka's merchant heart — the god of business since ancient times",
        highlights: [
            "Toka Ebisu (Jan 9-11) — over 1 million visitors in three days",
            "Fukummusume fortune maidens distributing lucky bamboo",
            "Enshrines Ebisu, the patron god of merchants and commerce",
            "Located in the historic Namba merchant quarter"
        ],
        mustSee: "If visiting in January, witness the Toka Ebisu — the streets around the shrine fill with over a million people, food stalls, and the ceremonial distribution of lucky bamboo branches by the Fukummusume maidens.",
        tips: [
            "Toka Ebisu on January 10 is the peak day — arrive early or it becomes impossible to move",
            "Buy a lucky bamboo (fukusasa) decorated with small auspicious ornaments for \u{00A5}1,000",
            "The shrine is adjacent to Namba Yasaka Jinja — visit both in one walk",
            "Osaka merchants traditionally visit here first thing every new year"
        ],
        bestSeason: "Jan 9-11 (Toka Ebisu Festival)",
        access: "10 min walk from Namba Station (various lines)",
        hours: "9:00-17:00 (outer grounds open earlier during festivals)",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000002-0000-0000-0000-000000000040")!,
        name: "Shitennoji",
        address: "1-11-18 Shitennoji, Tennoji, Osaka",
        description: "Built in 593 AD by Prince Shotoku — the father of Japanese Buddhism — Shitennoji is the oldest officially administered Buddhist temple in Japan and the origin of Japanese Buddhist architecture. The central precinct with its five-story pagoda, golden hall, and covered cloister has been faithfully reconstructed in the exact ancient layout that would have existed 1,400 years ago.",
        coordinate: CLLocationCoordinate2D(latitude: 34.6544, longitude: 135.5163),
        stampSlotId: 40,
        category: .tera,
        tagline: "Japan's oldest Buddhist temple, built by Prince Shotoku in 593 AD",
        highlights: [
            "Oldest officially administered temple in Japan — founded 593 AD",
            "Classic Shitennoji-garan layout preserved for 1,400 years",
            "The flea market (Taisho-ichi) on the 21st and 22nd of each month",
            "Treasure house containing original artifacts from the 6th century"
        ],
        mustSee: "Enter through the stone torii (unusual for a Buddhist temple — a remnant of the ancient fusion of Shinto and Buddhism) and walk the central precinct to the golden hall and five-story pagoda.",
        tips: [
            "The flea market on the 21st is one of Osaka's best for antiques and vintage goods",
            "The inner precinct requires a \u{00A5}300 ticket; the outer grounds are free",
            "Combine with Tennoji Zoo and Abeno Harukas observation deck for a full Tennoji day",
            "The Garan main precinct is best at dusk when lit up against the sky"
        ],
        bestSeason: "Mar-Apr (cherry blossoms), Nov (autumn colors), 21st of each month (market)",
        access: "10 min walk from Shitennoji-mae Yuhigaoka Station (Tanimachi Line)",
        hours: "8:30-16:30 (inner precinct)",
        imageURLs: []
    ),

    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    // MARK: - Nara
    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

    Shrine(
        id: UUID(uuidString: "00000002-0000-0000-0000-000000000041")!,
        name: "Kasuga Taisha",
        address: "160 Kasuganocho, Nara",
        description: "Deep inside Nara's sacred deer park, Kasuga Taisha glows with over 3,000 stone and bronze lanterns that have been donated by worshippers since the 8th century. Founded in 768 AD, it is the tutelary shrine of the Fujiwara clan — the most powerful aristocratic family of ancient Japan. Twice a year, every lantern is lit simultaneously during the Mantoro festivals, turning the shrine into a sea of golden light.",
        coordinate: CLLocationCoordinate2D(latitude: 34.6810, longitude: 135.8484),
        stampSlotId: 41,
        category: .taisha,
        tagline: "3,000 lanterns glow in Nara's sacred deer-filled forest",
        highlights: [
            "3,000 stone and bronze lanterns lining every path and corridor",
            "Mantoro Festival (Feb & Aug) — all 3,000 lanterns lit simultaneously",
            "Walking through sacred deer in the primeval Kasugayama forest",
            "UNESCO World Heritage Site and Ichinomiya of Yamato Province"
        ],
        mustSee: "The inner corridor of hanging bronze lanterns (tsuridoro) — walk slowly down this dim, lantern-lined passage and let your eyes adjust to the golden glow filtering through the hanging lamps.",
        tips: [
            "Mantoro Festival on Feb 3 and Aug 14-15 — the single most atmospheric event in Nara",
            "Sacred deer roam freely throughout the approach — bring no food (they will follow you)",
            "The Kasugayama primeval forest behind the shrine is a UNESCO-protected ancient woodland",
            "Combined ticket with Nara National Museum and Todai-ji saves money"
        ],
        bestSeason: "Feb 3 (Setsubun Mantoro), Aug 14-15 (Obon Mantoro), Year-round",
        access: "25 min walk from Kintetsu Nara Station or 10 min by city bus",
        hours: "6:00-17:30 (Apr-Sep 6:00-18:00)",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000002-0000-0000-0000-000000000042")!,
        name: "Todai-ji",
        address: "406-1 Zoshicho, Nara",
        description: "The world's largest wooden building houses Japan's largest bronze Buddha — a 15-meter, 500-ton Daibutsu that has presided over Nara for over 1,250 years. Built by Emperor Shomu in 752 AD as the head temple of all provincial temples in Japan, Todai-ji's Daibutsuden hall is so enormous it can be seen from across the entire deer park.",
        coordinate: CLLocationCoordinate2D(latitude: 34.6888, longitude: 135.8398),
        stampSlotId: 42,
        category: .tera,
        tagline: "The world's largest wooden building and Japan's greatest Buddha",
        highlights: [
            "Daibutsuden — world's largest wooden structure (57m wide, 48m tall)",
            "15-meter bronze Great Buddha (Daibutsu) — 500 tons cast in 752 AD",
            "Sacred deer roaming freely around the Great South Gate",
            "Squeeze through a pillar hole the size of the Buddha's nostril for good luck"
        ],
        mustSee: "Inside the Daibutsuden, find the wooden pillar with a square hole cut through it — the hole is the same size as one of the Buddha's nostrils. Squeezing through it is said to guarantee enlightenment.",
        tips: [
            "The Great South Gate (Nandaimon) with its enormous nio guardian statues is a masterpiece — don't rush past it",
            "Deer bow their heads to receive senbei crackers — buy a pack from the vendors",
            "Visit at opening (8 AM) to experience the Daibutsu without crowds",
            "Admission \u{00A5}600, allow 1 hour minimum"
        ],
        bestSeason: "Spring (deer fawns in May) and Autumn (maple colors throughout the park)",
        access: "5 min walk from Todai-ji Daibutsuden bus stop from Kintetsu Nara Station",
        hours: "7:30-17:30 (Nov-Feb 8:00-17:00)",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000002-0000-0000-0000-000000000043")!,
        name: "Yakushi-ji",
        address: "457 Nishinokyocho, Nara",
        description: "Emperor Tenmu vowed to build this temple in 680 AD to pray for his empress's recovery from illness — and when she was healed, he made it one of the seven great temples of Nara. Yakushi-ji is famous for its East Pagoda, a singular masterpiece that has stood for over 1,300 years, and its collection of magnificent Tang-dynasty-influenced Buddhist sculpture.",
        coordinate: CLLocationCoordinate2D(latitude: 34.6698, longitude: 135.7844),
        stampSlotId: 43,
        category: .tera,
        tagline: "A 1,300-year-old pagoda built from an emperor's prayer of healing",
        highlights: [
            "East Pagoda — one of the oldest and most beautiful pagodas in Japan (1,300 years old)",
            "Sho Kannon standing statue — a masterpiece of Hakuho-period sculpture",
            "Nishino-kyo area: quieter and less visited than central Nara",
            "Lotus flowers blooming in the temple ponds in summer"
        ],
        mustSee: "The East Pagoda (Toto) — its alternating small roofs (mokoshi) create an illusion of six stories from what is architecturally a three-story pagoda. It is considered a frozen melody in wood and tile.",
        tips: [
            "Combine with nearby Toshodai-ji (5 min walk) for a Nishino-kyo half day",
            "The lecture hall contains rare Tang-dynasty-influenced murals",
            "Much quieter than Todai-ji — a rewarding off-the-beaten-path choice",
            "Admission \u{00A5}1,100 includes the treasure hall"
        ],
        bestSeason: "Summer (lotus ponds), Autumn (light and color around the old pagoda)",
        access: "1 min walk from Nishinokyo Station (Kintetsu Kashihara Line)",
        hours: "8:30-17:00",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000002-0000-0000-0000-000000000044")!,
        name: "Kofuku-ji",
        address: "48 Noborioji-cho, Nara",
        description: "For over 1,300 years, the five-story pagoda of Kofuku-ji has been the defining silhouette of Nara — its reflection shimmering in the Sarusawa Pond below. As the family temple of the mighty Fujiwara clan, it once had 175 buildings and controlled much of central Japan. Today its treasure house contains some of the most extraordinary Buddhist sculpture in East Asia.",
        coordinate: CLLocationCoordinate2D(latitude: 34.6851, longitude: 135.8328),
        stampSlotId: 44,
        category: .tera,
        tagline: "The five-story pagoda silhouette that has defined Nara for 1,300 years",
        highlights: [
            "Five-story pagoda (50m) reflected in Sarusawa Pond — Nara's signature image",
            "Chukondo Central Golden Hall — rebuilt in 2018 after centuries",
            "National Treasure Museum with Ashura statue — arguably Japan's most beautiful sculpture",
            "UNESCO World Heritage Site in the heart of Nara's historic center"
        ],
        mustSee: "The Ashura (fighting demon) statue in the National Treasure Hall — three faces, six arms, a 1,300-year-old dry lacquer masterpiece of emotional intensity. Among Japan's greatest artworks.",
        tips: [
            "The National Treasure Hall (\u{00A5}700) is small but contains world-class Buddhist art",
            "The pagoda and Sarusawa Pond are best at dusk when the reflection is most dramatic",
            "Walk from Kintetsu Nara Station in 5 minutes — perfectly positioned for starting a Nara walk",
            "Deer from the nearby park wander freely around the temple grounds"
        ],
        bestSeason: "Year-round (spring cherry blossoms, autumn maple reflection in the pond)",
        access: "5 min walk from Kintetsu Nara Station",
        hours: "9:00-17:00 (National Treasure Hall)",
        imageURLs: []
    ),

    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    // MARK: - Kyoto (Additional)
    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

    Shrine(
        id: UUID(uuidString: "00000002-0000-0000-0000-000000000131")!,
        name: "Kinkaku-ji",
        address: "1 Kinkakujicho, Kita, Kyoto",
        description: "The Golden Pavilion is one of Japan's most iconic images — a three-story zen temple covered entirely in gold leaf, reflected perfectly in the mirror pond below. Originally built in 1397 as a retirement villa for Shogun Ashikaga Yoshimitsu, it was famously burned down by a disturbed monk in 1950 and faithfully rebuilt.",
        coordinate: CLLocationCoordinate2D(latitude: 35.0394, longitude: 135.7292),
        stampSlotId: 131,
        category: .tera,
        tagline: "A golden pavilion floating on a mirror pond",
        highlights: [
            "Three-story pavilion covered entirely in gold leaf",
            "Mirror pond reflection — Japan's most photographed temple",
            "UNESCO World Heritage Site and Rinzai Zen temple",
            "Surrounding stroll garden with tea houses and sacred springs"
        ],
        mustSee: "The view from across the mirror pond — on a still day the golden pavilion is reflected perfectly in the water, creating a symmetry that seems impossible.",
        tips: [
            "Arrive at opening (9 AM) for the best light and smallest crowds",
            "The path is one-way — you cannot go back for a second look",
            "Matcha tea and sweets available at the exit garden teahouse",
            "Winter snow on the golden roof is rare but extraordinarily beautiful"
        ],
        bestSeason: "Nov (autumn maples frame the gold), rare snow days in Jan-Feb",
        access: "Bus 101/205 from Kyoto Station to Kinkakuji-michi (40 min)",
        hours: "9:00-17:00",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000002-0000-0000-0000-000000000132")!,
        name: "Ginkaku-ji",
        address: "2 Ginkakujicho, Sakyo, Kyoto",
        description: "The Silver Pavilion was never actually covered in silver — Shogun Ashikaga Yoshimasa died before completing it — but its understated beauty embodies the wabi-sabi aesthetic of imperfect elegance. The immaculate sand garden with its iconic cone-shaped sand mound and the moss garden are among Kyoto's finest.",
        coordinate: CLLocationCoordinate2D(latitude: 35.0270, longitude: 135.7983),
        stampSlotId: 132,
        category: .tera,
        tagline: "Wabi-sabi perfection — the pavilion that never needed silver",
        highlights: [
            "Kogetsudai sand cone and Ginshadan sand garden raked in wave patterns",
            "Philosopher's Path starts here — Kyoto's most beloved walk",
            "Moss garden regarded as one of Kyoto's most beautiful",
            "UNESCO World Heritage Site"
        ],
        mustSee: "The Kogetsudai — a perfectly shaped cone of white sand said to represent Mount Fuji, designed to reflect moonlight into the garden.",
        tips: [
            "Walk the Philosopher's Path south from here to Nanzen-ji for a perfect half-day",
            "Morning visits have better light on the sand garden",
            "The upper garden trail offers excellent views over the temple and city",
            "Admission \u{00A5}500"
        ],
        bestSeason: "Nov (autumn maples), Jun (moss garden at its greenest)",
        access: "Bus 17/100 from Kyoto Station to Ginkakuji-michi (35 min)",
        hours: "8:30-17:00 (Dec-Feb 9:00-16:30)",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000002-0000-0000-0000-000000000133")!,
        name: "Kiyomizu-dera",
        address: "1-294 Kiyomizu, Higashiyama, Kyoto",
        description: "Built on a steep hillside with a massive wooden stage that juts out 13 meters over the valley below, Kiyomizu-dera offers one of Japan's most dramatic temple views. Founded in 778 AD, the main hall's stage was constructed without a single nail — using only interlocking wooden beams in a feat of ancient engineering.",
        coordinate: CLLocationCoordinate2D(latitude: 35.0050, longitude: 135.7850),
        stampSlotId: 133,
        category: .tera,
        tagline: "A wooden stage suspended over the valley — Kyoto's most dramatic view",
        highlights: [
            "13-meter wooden stage built without a single nail",
            "Otowa waterfall — drink from three streams for health, longevity, and success in studies",
            "Panoramic view of Kyoto from the stage",
            "UNESCO World Heritage Site founded in 778 AD"
        ],
        mustSee: "Stand on the wooden stage and look out over the sea of cherry or maple trees to the Kyoto skyline — the phrase 'jumping off the stage at Kiyomizu' means taking a leap of faith.",
        tips: [
            "Evening illuminations in spring and autumn are magical — check dates",
            "The approach streets (Ninenzaka, Sannenzaka) are lined with traditional shops",
            "Early morning (6 AM, free entry) is the most peaceful time",
            "The three-story pagoda is best seen from below on the approach"
        ],
        bestSeason: "Late Nov (autumn leaves), Late Mar-Apr (cherry blossoms)",
        access: "Bus 100/206 from Kyoto Station to Kiyomizu-michi, then 10 min walk uphill",
        hours: "6:00-18:00 (extended during illuminations)",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000002-0000-0000-0000-000000000134")!,
        name: "Tofuku-ji",
        address: "15-778 Honmachi, Higashiyama, Kyoto",
        description: "Tofuku-ji is Kyoto's supreme autumn temple. The Tsutenkyo Bridge spanning a maple-filled ravine turns into a river of red and orange in November, creating one of the most breathtaking autumn spectacles in all of Japan. The temple's massive Sanmon gate is the oldest Zen gate in Japan.",
        coordinate: CLLocationCoordinate2D(latitude: 34.9762, longitude: 135.7740),
        stampSlotId: 134,
        category: .tera,
        tagline: "A bridge over a river of autumn fire",
        highlights: [
            "Tsutenkyo Bridge over 2,000 maple trees — peak autumn in Kyoto",
            "Oldest Zen Sanmon gate in Japan (National Treasure)",
            "Hojo garden by Mirei Shigemori — modernist Zen rock garden",
            "One of the Kyoto Gozan (Five Great Zen Temples)"
        ],
        mustSee: "The view from Tsutenkyo Bridge during peak autumn — the valley below is a carpet of 2,000 maples in every shade of red, orange, and gold.",
        tips: [
            "Mid-to-late November is peak — arrive at opening (8:30 AM) to avoid the worst crowds",
            "The Hojo garden with its checkerboard moss-and-stone pattern is a modernist masterpiece",
            "Photography from the bridge is prohibited during peak autumn",
            "Combine with nearby Fushimi Inari — just one station away"
        ],
        bestSeason: "Mid-late Nov (peak autumn — one of Japan's best)",
        access: "10 min walk from Tofukuji Station (JR/Keihan)",
        hours: "8:30-16:30 (Nov 8:30-16:00)",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000002-0000-0000-0000-000000000135")!,
        name: "Nanzen-ji",
        address: "Nanzenji Fukuchicho, Sakyo, Kyoto",
        description: "The head temple of the Rinzai Zen sect and the highest-ranking of all Zen temples in Japan. Nanzen-ji's colossal Sanmon gate offers sweeping views of the city, and the brick Roman-style aqueduct running through the temple grounds is one of Kyoto's most surprising and photogenic sights.",
        coordinate: CLLocationCoordinate2D(latitude: 35.0113, longitude: 135.7933),
        stampSlotId: 135,
        category: .tera,
        tagline: "Japan's highest-ranking Zen temple with a surprise Roman aqueduct",
        highlights: [
            "Sanmon gate with panoramic Kyoto views from the top",
            "Suirokaku aqueduct — a brick Roman-style waterway through the Zen grounds",
            "Tiger painting sliding doors in the Hojo — by Kano Tanyu",
            "Tenjuan sub-temple garden — one of Kyoto's most serene"
        ],
        mustSee: "Climb the Sanmon gate and look out — this is the view that inspired the famous kabuki line 'Zekkei kana' (What a magnificent view!).",
        tips: [
            "The aqueduct is free to visit and perfect for photos at any time",
            "The Hojo garden (\u{00A5}600) with its leaping tiger painting is worth the admission",
            "End of the Philosopher's Path walk from Ginkaku-ji",
            "Autumn colors here are excellent and less crowded than Tofuku-ji"
        ],
        bestSeason: "Nov (autumn), Year-round for the aqueduct",
        access: "10 min walk from Keage Station (Tozai Line)",
        hours: "8:40-17:00 (Dec-Feb 8:40-16:30)",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000002-0000-0000-0000-000000000136")!,
        name: "Ryoan-ji",
        address: "13 Ryoanji Goryonoshitacho, Ukyo, Kyoto",
        description: "The most famous rock garden in the world — fifteen stones arranged on a bed of raked white gravel, designed so that from any vantage point at least one stone is always hidden. Ryoan-ji's garden has puzzled and inspired visitors for over 500 years, and its meaning remains deliberately unresolved.",
        coordinate: CLLocationCoordinate2D(latitude: 35.0345, longitude: 135.7185),
        stampSlotId: 136,
        category: .tera,
        tagline: "Fifteen stones, infinite meaning — the world's most famous Zen garden",
        highlights: [
            "15 stones on raked gravel — you can never see all 15 at once",
            "UNESCO World Heritage Site",
            "Mirror pond garden with seasonal reflections",
            "Oil-walled earthen wall that has developed a patina over 500 years"
        ],
        mustSee: "Sit on the wooden veranda facing the rock garden and count the stones — from any seated position you can only see 14 of the 15. Only enlightenment reveals them all.",
        tips: [
            "Arrive at opening for quiet contemplation — the veranda gets packed by 10 AM",
            "The mirror pond on the temple approach is beautiful in autumn",
            "Walk to nearby Kinkaku-ji (20 min) for a combined visit",
            "Admission \u{00A5}500"
        ],
        bestSeason: "Year-round (the rock garden is season-independent)",
        access: "Bus 59 from Kyoto Station to Ryoanji-mae (40 min)",
        hours: "8:00-17:00 (Dec-Feb 8:30-16:30)",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000002-0000-0000-0000-000000000137")!,
        name: "Tenryu-ji",
        address: "68 Sagatenryuji Susukinobabacho, Ukyo, Kyoto",
        description: "The head temple of the Tenryu branch of Rinzai Zen, Tenryu-ji is Arashiyama's most important temple. Its garden, designed by the legendary Muso Soseki in the 14th century, is one of the earliest and finest examples of borrowed scenery — the mountains behind the temple are incorporated seamlessly into the garden composition.",
        coordinate: CLLocationCoordinate2D(latitude: 35.0156, longitude: 135.6748),
        stampSlotId: 137,
        category: .tera,
        tagline: "Arashiyama's crown jewel — where the garden borrows the mountain",
        highlights: [
            "Sogenchi garden — one of Japan's finest 'borrowed scenery' gardens",
            "First-ranked of the Kyoto Gozan (Five Great Zen Temples)",
            "Gateway to the famous Arashiyama Bamboo Grove",
            "UNESCO World Heritage Site"
        ],
        mustSee: "The Sogenchi garden viewed from the main hall — the pond, rocks, and carefully placed trees flow seamlessly into the Arashiyama mountains behind, erasing the boundary between garden and nature.",
        tips: [
            "Enter through the north gate to access the bamboo grove directly from the temple",
            "Morning is best before Arashiyama tour groups arrive",
            "The garden-only ticket (\u{00A5}500) is sufficient; interior access is extra",
            "Combine with bamboo grove + Togetsukyo Bridge for a full Arashiyama morning"
        ],
        bestSeason: "Nov (autumn maples), Apr (cherry blossoms), Year-round",
        access: "Randen Arashiyama Station or JR Saga-Arashiyama Station (10 min walk)",
        hours: "8:30-17:00",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000002-0000-0000-0000-000000000138")!,
        name: "Daitoku-ji",
        address: "53 Murasakino Daitokujicho, Kita, Kyoto",
        description: "A walled compound of 24 sub-temples that is the spiritual heart of Japanese tea culture. Daitoku-ji is where Sen no Rikyu perfected the tea ceremony and where some of Kyoto's most exquisite hidden gardens lie behind closed gates. Several sub-temples open seasonally, revealing gardens of extraordinary beauty.",
        coordinate: CLLocationCoordinate2D(latitude: 35.0434, longitude: 135.7454),
        stampSlotId: 138,
        category: .tera,
        tagline: "The birthplace of tea culture — 24 hidden Zen gardens behind walls",
        highlights: [
            "Birthplace of the Japanese tea ceremony under Sen no Rikyu",
            "24 sub-temples, several with world-class Zen gardens",
            "Daisen-in garden — a three-dimensional landscape painting in rocks",
            "Koto-in — Kyoto's most beloved autumn sub-temple"
        ],
        mustSee: "Koto-in sub-temple in autumn — the maple-lined approach and moss garden turn into pure crimson. One of Kyoto's most emotional autumn experiences.",
        tips: [
            "Check which sub-temples are open before visiting — most are normally closed",
            "Koto-in and Daisen-in are the most frequently open and most rewarding",
            "Very few tourists compared to major temples — a local favorite",
            "The compound is large — allow 2 hours if multiple sub-temples are open"
        ],
        bestSeason: "Nov (Koto-in autumn), Year-round for Daisen-in",
        access: "Bus 206 from Kyoto Station to Daitokuji-mae (30 min)",
        hours: "Varies by sub-temple, typically 9:00-16:30",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000002-0000-0000-0000-000000000139")!,
        name: "Myoshin-ji",
        address: "1 Myoshinji-cho, Hanazono, Ukyo, Kyoto",
        description: "The largest Zen temple complex in Japan, Myoshin-ji is a vast compound of 46 sub-temples spread across a forested neighborhood. The main hall ceiling features a dramatic dragon painting by Kano Tanyu that appears to follow you as you walk beneath it — known as the 'dragon glaring in eight directions.'",
        coordinate: CLLocationCoordinate2D(latitude: 35.0267, longitude: 135.7215),
        stampSlotId: 139,
        category: .tera,
        tagline: "Japan's largest Zen compound — 46 temples in a hidden city",
        highlights: [
            "46 sub-temples — the largest Zen complex in Japan",
            "'Eight-direction glaring dragon' ceiling painting by Kano Tanyu",
            "Japan's oldest bell (698 AD) — National Treasure",
            "Taizo-in garden — one of the finest Zen gardens in Kyoto"
        ],
        mustSee: "Stand beneath the Unryu-zu dragon painting in the Hatto and walk around — the dragon's eyes follow you in every direction.",
        tips: [
            "The main temple tour (dragon painting + bell) requires a guided tour (\u{00A5}700)",
            "Taizo-in sub-temple is always open and has a superb garden",
            "Very quiet even in peak season — feels like a private Kyoto",
            "Near Randen Myoshinji Station for easy access"
        ],
        bestSeason: "Year-round",
        access: "5 min walk from Myoshinji Station (Randen/Keifuku Line)",
        hours: "9:00-16:00 (guided tours of main hall)",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000002-0000-0000-0000-000000000140")!,
        name: "Kennin-ji",
        address: "584 Komatsucho, Higashiyama, Kyoto",
        description: "Kyoto's oldest Zen temple, founded in 1202 by Eisai — the monk who brought Zen Buddhism and tea from China to Japan. The Twin Dragons ceiling painting (2002) is a modern masterpiece that fills the entire dharma hall ceiling, and the Fujin Raijin (Wind and Thunder Gods) screen by Tawaraya Sotatsu is one of the most famous paintings in Japanese art.",
        coordinate: CLLocationCoordinate2D(latitude: 35.0014, longitude: 135.7720),
        stampSlotId: 140,
        category: .tera,
        tagline: "Kyoto's oldest Zen temple — twin dragons on the ceiling",
        highlights: [
            "Twin Dragons ceiling painting — a dramatic modern masterpiece",
            "Fujin Raijin (Wind and Thunder Gods) screen — iconic Japanese art",
            "Founded 1202 — the oldest Zen temple in Kyoto",
            "Circle-Triangle-Square garden — Zen philosophy in shapes"
        ],
        mustSee: "Lie on your back beneath the Twin Dragons ceiling painting in the dharma hall — the two massive dragons coil and surge across the entire ceiling.",
        tips: [
            "Located right in Gion — easy to combine with Yasaka Jinja and Hanamikoji geisha district",
            "Photography allowed inside — rare for Kyoto temples",
            "The garden O-Circle-Triangle-Square is a clever Zen teaching tool",
            "Admission \u{00A5}600"
        ],
        bestSeason: "Year-round",
        access: "10 min walk from Gion-Shijo Station (Keihan) or Kawaramachi Station (Hankyu)",
        hours: "10:00-17:00",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000002-0000-0000-0000-000000000141")!,
        name: "Nishi Hongan-ji",
        address: "Horikawa-dori Hanayacho-sagaru, Shimogyo, Kyoto",
        description: "The mother temple of the Jodo Shinshu Honganji branch — the largest Buddhist denomination in Japan. The Goeiden (Founder's Hall) is one of the largest wooden structures in the world, and the ornate Karamon Chinese-style gate is so elaborately carved it is called the 'Gate you could stare at all day.'",
        coordinate: CLLocationCoordinate2D(latitude: 34.9914, longitude: 135.7515),
        stampSlotId: 141,
        category: .tera,
        tagline: "A wooden hall so vast it swallows the sky — and a gate you'd stare at forever",
        highlights: [
            "Goeiden (Founder's Hall) — one of the world's largest wooden buildings",
            "Karamon gate — so detailed it's called 'the gate of a whole day's viewing'",
            "Hiunkaku — a three-story pavilion rivaling Kinkaku-ji in beauty",
            "UNESCO World Heritage Site"
        ],
        mustSee: "The Karamon gate — every surface is covered in impossibly detailed carvings of phoenixes, dragons, and Chinese lions. Give yourself time to look at every panel.",
        tips: [
            "Free admission — one of Kyoto's best free cultural experiences",
            "5 min walk from Kyoto Station — perfect first or last Kyoto stop",
            "The Hiunkaku pavilion is only open during special viewings",
            "Morning chanting sessions are open to the public"
        ],
        bestSeason: "Year-round",
        access: "5 min walk from Kyoto Station (north exit)",
        hours: "5:30-17:00",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000002-0000-0000-0000-000000000142")!,
        name: "Higashi Hongan-ji",
        address: "Karasuma-dori Shichijo-agaru, Shimogyo, Kyoto",
        description: "The eastern counterpart to Nishi Hongan-ji, Higashi Hongan-ji houses the largest wooden structure in Kyoto — the Goeiden hall, rebuilt in 1895 using ropes woven from the hair of female devotees who donated their tresses to haul the massive timbers. The adjacent Shosei-en garden is a hidden oasis designed in the 17th century.",
        coordinate: CLLocationCoordinate2D(latitude: 34.9912, longitude: 135.7583),
        stampSlotId: 142,
        category: .tera,
        tagline: "Kyoto's largest wooden hall — rebuilt with ropes of human hair",
        highlights: [
            "Largest wooden structure in Kyoto — Goeiden rebuilt 1895",
            "Hair ropes donated by female devotees displayed inside",
            "Shosei-en garden — a serene hidden garden a block away",
            "Massive moat and walls creating a fortress-like atmosphere"
        ],
        mustSee: "Inside the Goeiden, look for the thick ropes made from human hair — donated by thousands of women to pull the giant timbers during reconstruction.",
        tips: [
            "Free admission to the main halls",
            "Shosei-en garden (\u{00A5}500) is a short walk east and very peaceful",
            "Directly north of Kyoto Station — hard to miss",
            "Autumn illumination events at Shosei-en are atmospheric"
        ],
        bestSeason: "Year-round (Nov for Shosei-en garden illumination)",
        access: "3 min walk from Kyoto Station (Karasuma central exit)",
        hours: "5:50-17:30",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000002-0000-0000-0000-000000000143")!,
        name: "Kitano Tenmangu",
        address: "Bakurocho, Kamigyo, Kyoto",
        description: "The original Tenmangu shrine, built in 947 AD to appease the angry spirit of Sugawara no Michizane. Kitano Tenmangu is the head shrine of all 12,000 Tenmangu shrines across Japan. Its plum orchard of 1,500 trees bursts into bloom every February, and students across western Japan flock here before exams.",
        coordinate: CLLocationCoordinate2D(latitude: 35.0312, longitude: 135.7352),
        stampSlotId: 143,
        category: .tenmangu,
        tagline: "The original shrine of learning — 1,500 plum trees in bloom",
        highlights: [
            "Head shrine of all 12,000 Tenmangu shrines in Japan",
            "1,500 plum trees blooming Feb-Mar — the Baien plum garden",
            "Zuishin-mon gate and ornate Momoyama-style main hall",
            "Monthly flea market on the 25th of every month (Tenjin-san)"
        ],
        mustSee: "Visit during the February plum blossom festival — the 1,500 plum trees in bloom, with matcha served under the blossoms, is one of Kyoto's most beautiful spring preludes.",
        tips: [
            "The Tenjin-san flea market on the 25th is one of Kyoto's best — antiques, food, crafts",
            "Rub the bronze ox statue's head for academic success",
            "The plum garden (\u{00A5}1,000 with tea) is open Feb-Mar only",
            "Combine with nearby Kamishichiken geisha district"
        ],
        bestSeason: "Feb-Mar (plum blossoms), 25th monthly (flea market)",
        access: "Bus 50/101 from Kyoto Station to Kitano Tenmangu-mae (30 min)",
        hours: "5:00-17:30",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000002-0000-0000-0000-000000000144")!,
        name: "Yasaka Jinja",
        address: "625 Gionmachi Kitagawa, Higashiyama, Kyoto",
        description: "Standing at the eastern end of Shijo-dori in the heart of Gion, Yasaka Jinja is Kyoto's most visited shrine and the home of the Gion Matsuri — one of Japan's three greatest festivals. The festival's massive floats have paraded through Kyoto streets every July for over 1,100 years.",
        coordinate: CLLocationCoordinate2D(latitude: 35.0036, longitude: 135.7785),
        stampSlotId: 144,
        category: .jinja,
        tagline: "The heart of Gion — home of Japan's most magnificent festival",
        highlights: [
            "Home of Gion Matsuri (July) — one of Japan's three greatest festivals",
            "Located at the heart of the Gion geisha district",
            "Maruyama Park behind the shrine — Kyoto's best cherry blossom spot",
            "Open 24 hours — beautiful lit up at night"
        ],
        mustSee: "Visit at night when the shrine lanterns glow warmly against the dark — then walk through the Gion streets where you might spot a geiko or maiko.",
        tips: [
            "Gion Matsuri (Jul 17 & 24 float processions) is unmissable if you're in Kyoto",
            "Maruyama Park's weeping cherry tree (late March) is Kyoto's most famous",
            "Free admission, open 24 hours — perfect for evening exploration",
            "Walk south through Gion's narrow streets for the full atmosphere"
        ],
        bestSeason: "Jul (Gion Matsuri), Late Mar (cherry blossoms), Year-round",
        access: "5 min walk from Gion-Shijo Station (Keihan)",
        hours: "Open 24 hours",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000002-0000-0000-0000-000000000145")!,
        name: "Heian Jingu",
        address: "Okazaki Nishitennocho, Sakyo, Kyoto",
        description: "Built in 1895 to celebrate the 1,100th anniversary of Kyoto's founding, Heian Jingu is a partial replica of the original Imperial Palace. The massive vermillion torii gate is one of the largest in Japan, and the four seasons garden behind the shrine is a hidden masterpiece of Meiji-era landscape design.",
        coordinate: CLLocationCoordinate2D(latitude: 35.0161, longitude: 135.7816),
        stampSlotId: 145,
        category: .jingu,
        tagline: "A replica of the ancient Imperial Palace beneath Japan's largest torii",
        highlights: [
            "One of Japan's largest torii gates — 24 meters tall, vermillion",
            "Shin-en garden — weeping cherry trees reflected in the pond",
            "Replica of the original Heian-kyo Imperial Palace",
            "Jidai Matsuri (Oct 22) — costumed historical procession through Kyoto"
        ],
        mustSee: "The Shin-en garden in April — the weeping cherry trees (beni-shidare-zakura) drooping over the pond create one of Kyoto's most romantic spring scenes.",
        tips: [
            "The Shin-en garden (\u{00A5}600) is the real highlight — don't skip it",
            "Jidai Matsuri on October 22 — a procession of 2,000 people in historical costumes",
            "The main shrine area is free — only the garden requires admission",
            "Combine with the nearby Kyoto National Museum of Modern Art"
        ],
        bestSeason: "Apr (weeping cherry), Oct 22 (Jidai Matsuri)",
        access: "10 min walk from Higashiyama Station (Tozai Line)",
        hours: "6:00-18:00 (garden 8:30-17:30)",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000002-0000-0000-0000-000000000146")!,
        name: "Shimogamo Jinja",
        address: "59 Shimogamo Izumigawacho, Sakyo, Kyoto",
        description: "One of Kyoto's oldest shrines, predating the city itself. Shimogamo Jinja sits in the Tadasu no Mori — a primeval forest that has existed for over 2,000 years in the heart of the city. The forest and shrine together are a UNESCO World Heritage Site.",
        coordinate: CLLocationCoordinate2D(latitude: 35.0388, longitude: 135.7727),
        stampSlotId: 146,
        category: .jinja,
        tagline: "A 2,000-year-old primeval forest shrine in the heart of Kyoto",
        highlights: [
            "Tadasu no Mori — 2,000-year-old primeval forest in central Kyoto",
            "Aoi Matsuri (May 15) — one of Kyoto's three great festivals",
            "Mitarashi Matsuri (Jul) — wade through sacred water to purify your soul",
            "UNESCO World Heritage Site"
        ],
        mustSee: "Walk through Tadasu no Mori — the ancient forest path leading to the shrine is a walk through time itself.",
        tips: [
            "The Mitarashi-sha sub-shrine has a unique water divination fortune (float the paper in water)",
            "Combine with Kamigamo Jinja for the paired shrine experience",
            "The approach through the forest is as important as the shrine itself",
            "Free admission to the main shrine"
        ],
        bestSeason: "May 15 (Aoi Matsuri), Jul (Mitarashi), Year-round",
        access: "5 min walk from Demachiyanagi Station (Keihan/Eizan)",
        hours: "6:30-17:00",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000002-0000-0000-0000-000000000147")!,
        name: "Kamigamo Jinja",
        address: "339 Kamigamo Motoyama, Kita, Kyoto",
        description: "One of Japan's oldest Shinto shrines, Kamigamo Jinja has been a place of worship since the 7th century. The cone-shaped sand mounds (tatesuna) at the entrance represent sacred mountains and are a unique Shinto art form found nowhere else. The shrine's setting along the Kamo River is serene.",
        coordinate: CLLocationCoordinate2D(latitude: 35.0594, longitude: 135.7527),
        stampSlotId: 147,
        category: .jinja,
        tagline: "Sacred sand cones guarding one of Japan's oldest shrines",
        highlights: [
            "Tatesuna sand cones — unique sacred sand mounds at the entrance",
            "One of Japan's oldest shrines — worship since the 7th century",
            "Paired with Shimogamo Jinja as UNESCO World Heritage Sites",
            "Kamo River setting with a peaceful residential atmosphere"
        ],
        mustSee: "The paired tatesuna sand cones — perfectly formed conical mounds of white sand flanking the worship hall, representing the sacred mountains where the deity descended.",
        tips: [
            "Much quieter than other Kyoto shrines — a peaceful local atmosphere",
            "The cherry tree near the first torii (Saio-zakura) is magnificent in April",
            "Monthly craft market on the 4th Sunday",
            "Combine with Shimogamo Jinja by walking along the Kamo River"
        ],
        bestSeason: "Apr (cherry), May 15 (Aoi Matsuri), Year-round",
        access: "Bus 4 from Kyoto Station to Kamigamo Jinja-mae (40 min)",
        hours: "5:30-17:00",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000002-0000-0000-0000-000000000148")!,
        name: "Kifune Jinja",
        address: "180 Kuramakibunecho, Sakyo, Kyoto",
        description: "Nestled in a mountain valley north of Kyoto, Kifune Jinja is the head shrine of water deities and one of the most atmospheric shrines in Japan. The stone stairway lined with vermillion lanterns cutting through the forest is one of Kyoto's most iconic images, especially when dusted with snow.",
        coordinate: CLLocationCoordinate2D(latitude: 35.1215, longitude: 135.7627),
        stampSlotId: 148,
        category: .jinja,
        tagline: "A vermillion lantern stairway through the mountain forest",
        highlights: [
            "Iconic lantern-lined stone stairway through the forest",
            "Water divination fortune — float paper on the sacred stream",
            "Head shrine of all water deities in Japan",
            "Summer kawadoko dining — tables set over the river"
        ],
        mustSee: "The stone stairway lined with vermillion lanterns — in winter snow or summer green, it is one of the most atmospheric approaches in all of Japan.",
        tips: [
            "Summer kawadoko dining (May-Sep) — eat over the cool river. Reserve well in advance",
            "Combine with Kurama-dera — hike over the mountain between the two (1 hour)",
            "Snow days in winter transform the lantern stairway into a fairy tale",
            "The water fortune (mizuura) — dip blank paper in the stream to reveal your fortune"
        ],
        bestSeason: "Jan-Feb (snow + lanterns), Jul-Aug (kawadoko), Nov (autumn)",
        access: "Eizan Railway to Kibuneguchi Station, then bus or 30 min walk",
        hours: "6:00-18:00 (Dec-Apr 6:00-17:00)",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000002-0000-0000-0000-000000000149")!,
        name: "Kurama-dera",
        address: "1074 Kuramahonmachi, Sakyo, Kyoto",
        description: "Perched high on a sacred mountain accessible by cable car or a steep forest hike, Kurama-dera is where the young Minamoto no Yoshitsune — Japan's greatest warrior — trained with the mountain's tengu demons. The temple's energy spot on the main terrace is said to be a powerful spiritual power point.",
        coordinate: CLLocationCoordinate2D(latitude: 35.1183, longitude: 135.7706),
        stampSlotId: 149,
        category: .tera,
        tagline: "Where Japan's greatest warrior trained with mountain demons",
        highlights: [
            "Mountain-top temple with panoramic views and spiritual energy",
            "Training ground of legendary warrior Yoshitsune",
            "Kurama Fire Festival (Oct 22) — one of Kyoto's wildest festivals",
            "Mountain hike trail connecting to Kifune Jinja"
        ],
        mustSee: "Stand on the energy spot (marked by a triangle pattern in the stone) on the main terrace — look up at the mountain and feel the spiritual energy of the Kurama tengu.",
        tips: [
            "Take the cable car up, hike down through the forest to Kifune Jinja (1 hour)",
            "The Kurama Fire Festival (Oct 22) is extraordinary but incredibly crowded",
            "Kurama Onsen at the base of the mountain for a post-hike soak",
            "Admission \u{00A5}300"
        ],
        bestSeason: "Oct 22 (Fire Festival), Nov (autumn), Year-round",
        access: "Eizan Railway to Kurama Station (30 min from Demachiyanagi)",
        hours: "9:00-16:30",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000002-0000-0000-0000-000000000150")!,
        name: "Byodo-in",
        address: "116 Uji Renge, Uji, Kyoto",
        description: "The Phoenix Hall of Byodo-in is so beautiful it appears on the Japanese 10-yen coin and the 10,000-yen bill. Built in 1053 as a representation of the Buddhist Western Paradise on earth, its symmetrical wings reflected in the pond make it one of the most perfect compositions in Japanese architecture.",
        coordinate: CLLocationCoordinate2D(latitude: 34.8894, longitude: 135.8076),
        stampSlotId: 150,
        category: .tera,
        tagline: "The temple on the 10-yen coin — a vision of paradise on earth",
        highlights: [
            "Phoenix Hall (Hoo-do) — appears on the 10-yen coin",
            "Perfect reflection in the lotus pond",
            "Amida Buddha statue by master sculptor Jocho — National Treasure",
            "Cloud-riding Bodhisattva sculptures floating on the walls"
        ],
        mustSee: "The Phoenix Hall from across the pond — its reflection in the still water creates perfect symmetry. Compare it to the 10-yen coin in your pocket.",
        tips: [
            "Interior tours of Phoenix Hall sell out — buy timed tickets at the museum first",
            "The museum has the original cloud-riding Bodhisattva sculptures — don't skip it",
            "Uji is famous for matcha — visit a tea house on Byodo-in Omotesando street",
            "Combine with the Tale of Genji Museum nearby"
        ],
        bestSeason: "Apr (wisteria and cherry), Nov (autumn), Year-round",
        access: "10 min walk from Uji Station (JR/Keihan)",
        hours: "8:30-17:30",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000002-0000-0000-0000-000000000151")!,
        name: "Daigo-ji",
        address: "22 Daigohigashiojicho, Fushimi, Kyoto",
        description: "Daigo-ji's five-story pagoda, built in 951, is the oldest building in Kyoto. The temple is famous for the legendary cherry blossom viewing party held here by warlord Toyotomi Hideyoshi in 1598, when he brought 1,300 guests and 700 cherry trees to create the most extravagant hanami in Japanese history.",
        coordinate: CLLocationCoordinate2D(latitude: 34.9511, longitude: 135.8206),
        stampSlotId: 151,
        category: .tera,
        tagline: "The oldest pagoda in Kyoto — where Hideyoshi threw history's greatest hanami",
        highlights: [
            "Five-story pagoda (951 AD) — the oldest building in Kyoto",
            "Site of Hideyoshi's legendary 1598 cherry blossom party",
            "Sanboin garden — designed by Hideyoshi himself",
            "UNESCO World Heritage Site"
        ],
        mustSee: "Sanboin garden — Hideyoshi personally designed this garden, moving 700 stones and planting hundreds of trees. The result is a masterwork of power expressed through landscape.",
        tips: [
            "Cherry blossom season (early April) is spectacular — Hideyoshi's legacy lives on",
            "The upper temple (Kami-Daigo) requires a serious 1-hour mountain hike",
            "Sanboin garden (\u{00A5}600) is the highlight — don't miss it",
            "Less crowded than central Kyoto temples"
        ],
        bestSeason: "Late Mar-early Apr (cherry blossoms), Nov (autumn)",
        access: "10 min walk from Daigo Station (Tozai Line)",
        hours: "9:00-17:00",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000002-0000-0000-0000-000000000152")!,
        name: "Sanjusangendo",
        address: "657 Sanjusangendohall-mawaricho, Higashiyama, Kyoto",
        description: "The longest wooden structure in Japan houses 1,001 life-size gilded statues of the Thousand-Armed Kannon — each subtly different — creating one of the most overwhelming visual experiences in Japanese art. The central seated Kannon is a masterwork by Tankei, the greatest sculptor of the Kamakura period.",
        coordinate: CLLocationCoordinate2D(latitude: 34.9879, longitude: 135.7716),
        stampSlotId: 152,
        category: .tera,
        tagline: "1,001 golden Kannon — an army of compassion in the longest wooden hall",
        highlights: [
            "1,001 life-size gilded Kannon statues — each face unique",
            "120-meter-long hall — the longest wooden structure in Japan",
            "28 guardian deity statues — masterworks of Kamakura sculpture",
            "Annual Toshiya archery contest (Jan) from one end of the hall"
        ],
        mustSee: "Walk slowly past all 1,001 golden Kannon statues — it's said that everyone will find one face that resembles someone they know or have lost.",
        tips: [
            "No photography inside — take your time to absorb the scale",
            "The annual archery contest in January (Toshiya) is a spectacular event",
            "Near Kyoto National Museum — combine for a cultural morning",
            "Admission \u{00A5}600"
        ],
        bestSeason: "Year-round (indoor), Jan (archery festival)",
        access: "10 min walk from Kyoto Station or bus to Sanjusangendo-mae",
        hours: "8:00-17:00 (Nov-Mar 9:00-16:00)",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000002-0000-0000-0000-000000000153")!,
        name: "To-ji",
        address: "1 Kujocho, Minami, Kyoto",
        description: "To-ji's five-story pagoda — at 55 meters, the tallest wooden pagoda in Japan — has been Kyoto's landmark since the 8th century. The temple was entrusted to Kukai (Kobo Daishi), the founder of Shingon Buddhism, and its monthly flea market on the 21st is one of Kyoto's best-loved traditions.",
        coordinate: CLLocationCoordinate2D(latitude: 34.9803, longitude: 135.7477),
        stampSlotId: 153,
        category: .tera,
        tagline: "Japan's tallest wooden pagoda — landmark of Kyoto for 1,200 years",
        highlights: [
            "55-meter five-story pagoda — tallest wooden pagoda in Japan",
            "Lecture Hall with 21 Buddhist statues arranged as a 3D mandala",
            "Kobo-san flea market on the 21st of every month",
            "UNESCO World Heritage Site"
        ],
        mustSee: "The Lecture Hall's 21 Buddhist statues arranged as a three-dimensional mandala — Kukai's vision of the Buddhist cosmos made physical.",
        tips: [
            "The Kobo-san market on the 21st is Kyoto's best flea market — arrive early",
            "The pagoda is beautifully lit at night — visible from the street for free",
            "Spring cherry blossoms reflected with the pagoda is a classic Kyoto image",
            "15 min walk from Kyoto Station"
        ],
        bestSeason: "Late Mar (cherry blossoms + pagoda), 21st monthly (flea market)",
        access: "15 min walk from Kyoto Station or 5 min from Toji Station (Kintetsu)",
        hours: "8:00-17:00",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000002-0000-0000-0000-000000000154")!,
        name: "Eikan-do",
        address: "48 Eikando-cho, Sakyo, Kyoto",
        description: "Known as 'the temple of autumn leaves,' Eikan-do is widely considered the single best autumn foliage destination in Kyoto. The temple is also famous for its unusual 'looking back' Amida Buddha — a statue turned at the waist to glance over its shoulder, a pose unique in Buddhist sculpture.",
        coordinate: CLLocationCoordinate2D(latitude: 35.0148, longitude: 135.7936),
        stampSlotId: 154,
        category: .tera,
        tagline: "Kyoto's most beautiful autumn — the temple of looking-back Buddha",
        highlights: [
            "Kyoto's #1 autumn foliage destination — 3,000 maple trees",
            "Mikaeri Amida — the unique 'looking back' Buddha statue",
            "Evening illumination in November — maples reflected in the pond",
            "Multi-level temple complex climbing the hillside"
        ],
        mustSee: "November evening illumination — the maples lit from below, reflected in the pond, create a scene of almost unbearable beauty.",
        tips: [
            "November evening illumination is Kyoto's most popular — expect long queues",
            "Arrive before 5 PM for the transition from daylight to illuminated maples",
            "The Mikaeri Amida is in the Amida Hall — don't miss this unique statue",
            "Combine with nearby Nanzen-ji"
        ],
        bestSeason: "Mid-late Nov (peak autumn — Kyoto's best)",
        access: "10 min walk from Keage Station (Tozai Line)",
        hours: "9:00-17:00 (Nov illumination 17:30-21:00)",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000002-0000-0000-0000-000000000155")!,
        name: "Kodai-ji",
        address: "526 Shimokawara-cho, Higashiyama, Kyoto",
        description: "Built in 1606 by Nene — the wife of Toyotomi Hideyoshi — as a memorial temple for her beloved husband, Kodai-ji is one of Kyoto's most romantic temples. The bamboo grove, reflecting pond, and teahouses designed by Sen no Rikyu's disciple create an atmosphere of love and loss. The evening illuminations are among Kyoto's finest.",
        coordinate: CLLocationCoordinate2D(latitude: 35.0001, longitude: 135.7802),
        stampSlotId: 155,
        category: .tera,
        tagline: "A widow's love letter in bamboo, stone, and moonlight",
        highlights: [
            "Built by Nene as a memorial to her husband Hideyoshi",
            "Bamboo grove and reflecting ponds — intimate and romantic",
            "Evening illuminations with modern projection art",
            "Tea houses designed by students of Sen no Rikyu"
        ],
        mustSee: "The evening illumination — Kodai-ji combines traditional maple lighting with modern projection art on the rock garden, creating something unique in Kyoto.",
        tips: [
            "Spring and autumn evening illuminations are Kodai-ji's signature events",
            "Less crowded than Kiyomizu-dera — right between Yasaka and Kiyomizu",
            "The bamboo grove here is smaller but far less crowded than Arashiyama's",
            "Admission \u{00A5}600"
        ],
        bestSeason: "Nov (autumn illumination), Late Mar (spring illumination)",
        access: "10 min walk from Gion-Shijo Station (Keihan)",
        hours: "9:00-17:30 (illumination evenings 17:00-22:00)",
        imageURLs: []
    ),

    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    // MARK: - Osaka (Additional)
    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

    Shrine(
        id: UUID(uuidString: "00000002-0000-0000-0000-000000000156")!,
        name: "Sumiyoshi Taisha",
        address: "2-9-89 Sumiyoshi, Sumiyoshi, Osaka",
        description: "One of Japan's oldest shrines with a unique architectural style that predates Chinese influence. The arched drum bridge (Taikobashi) over the pond is one of Osaka's most recognizable landmarks. All Sumiyoshi shrines across Japan trace their origin here.",
        coordinate: CLLocationCoordinate2D(latitude: 34.6128, longitude: 135.4929),
        stampSlotId: 156,
        category: .taisha,
        tagline: "Japan's oldest shrine architecture — the origin of all Sumiyoshi",
        highlights: [
            "Sumiyoshi-zukuri style — the oldest shrine architecture in Japan",
            "Taikobashi drum bridge — Osaka's iconic arched bridge",
            "Otaue rice planting festival (Jun 14)",
            "Head shrine of all 2,300 Sumiyoshi shrines nationwide"
        ],
        mustSee: "Cross the dramatically arched Taikobashi drum bridge — its steep curve challenges your balance and rewards with a beautiful view of the shrine precinct.",
        tips: [
            "New Year's hatsumode draws millions — one of Japan's top 3 New Year shrines",
            "The monthly market on the first day attracts locals",
            "Much more authentic atmosphere than tourist-heavy shrines",
            "Free admission"
        ],
        bestSeason: "Jun 14 (rice festival), Jan (hatsumode), Year-round",
        access: "3 min walk from Sumiyoshi-Taisha Station (Nankai Line)",
        hours: "6:00-17:00",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000002-0000-0000-0000-000000000157")!,
        name: "Shitennoji",
        address: "1-11-18 Shitennoji, Tennoji, Osaka",
        description: "Japan's oldest officially administered Buddhist temple, founded in 593 AD by Prince Shotoku. The classic temple layout has been faithfully maintained for over 1,400 years. The flea market held on the 21st and 22nd of each month fills the grounds with hundreds of stalls.",
        coordinate: CLLocationCoordinate2D(latitude: 34.6544, longitude: 135.5163),
        stampSlotId: 157,
        category: .tera,
        tagline: "Japan's oldest Buddhist temple — 1,400 years of continuous worship",
        highlights: [
            "Founded 593 AD — Japan's oldest official Buddhist temple",
            "Classic Shitennoji-garan layout preserved for 1,400 years",
            "Monthly flea market (21st-22nd) — one of Osaka's best",
            "Five-story pagoda and golden hall in the central precinct"
        ],
        mustSee: "The central precinct with its orderly arrangement of pagoda, golden hall, and lecture hall — the original template for Buddhist temple layouts across Japan.",
        tips: [
            "The flea market on the 21st has excellent vintage and antique finds",
            "Inner precinct \u{00A5}300; outer grounds free",
            "Combine with Tennoji Zoo and Abeno Harukas",
            "Less touristy than Kyoto temples — a genuine local experience"
        ],
        bestSeason: "Year-round, 21st monthly (flea market)",
        access: "10 min walk from Shitennoji-mae Yuhigaoka Station (Tanimachi Line)",
        hours: "8:30-16:30",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000002-0000-0000-0000-000000000158")!,
        name: "Osaka Tenmangu",
        address: "2-1-8 Tenjinbashi, Kita, Osaka",
        description: "Home of the Tenjin Matsuri — one of Japan's three greatest festivals, with 100 illuminated boats on the Okawa River and spectacular fireworks every July 24-25. The shrine sits at the north end of Tenjinbashisuji, the world's longest covered shopping arcade.",
        coordinate: CLLocationCoordinate2D(latitude: 34.6931, longitude: 135.5097),
        stampSlotId: 158,
        category: .tenmangu,
        tagline: "Heart of the Tenjin Festival — Osaka's most spectacular summer night",
        highlights: [
            "Tenjin Matsuri (Jul 24-25) — 100 boats and fireworks on the Okawa River",
            "Adjacent to world's longest covered shopping arcade",
            "Deity of learning — students pray for exam success",
            "Sacred plum orchard blooming in February"
        ],
        mustSee: "If visiting in late July, the Tenjin Matsuri boat procession and fireworks are one of Japan's most unforgettable festival experiences.",
        tips: [
            "Tenjin Matsuri on July 24-25 — arrive by 5 PM for riverside spots",
            "Combine with a walk through the 2.6km Tenjinbashisuji arcade",
            "February plum blossoms are lovely and uncrowded",
            "Free admission"
        ],
        bestSeason: "Jul 24-25 (Tenjin Matsuri), Feb (plum blossoms)",
        access: "10 min walk from Minami-Morimachi Station (Sakaisuji Line)",
        hours: "9:00-17:00",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000002-0000-0000-0000-000000000159")!,
        name: "Imamiya Ebisu Jinja",
        address: "1-6-10 Ebisunishi, Naniwa, Osaka",
        description: "The patron shrine of Osaka's merchant culture, dedicated to Ebisu the god of commerce. The Toka Ebisu festival (Jan 9-11) transforms the surrounding streets with over a million visitors and the famous Fukumusume fortune maidens distributing lucky bamboo branches.",
        coordinate: CLLocationCoordinate2D(latitude: 34.6524, longitude: 135.5058),
        stampSlotId: 159,
        category: .jinja,
        tagline: "Osaka's merchant soul — where the god of business lives",
        highlights: [
            "Toka Ebisu (Jan 9-11) — over 1 million visitors in three days",
            "Fukumusume fortune maidens distributing lucky bamboo",
            "Enshrines Ebisu, patron of merchants and commerce",
            "Heart of the historic Namba merchant quarter"
        ],
        mustSee: "The Toka Ebisu on January 10 — the energy of a million Osaka merchants praying for business success is electric.",
        tips: [
            "Toka Ebisu on Jan 10 is the peak — arrive early",
            "Buy a lucky bamboo (fukusasa) with ornaments",
            "Near Namba — an easy add-on to any Namba visit",
            "Free admission"
        ],
        bestSeason: "Jan 9-11 (Toka Ebisu Festival)",
        access: "10 min walk from Namba Station",
        hours: "9:00-17:00",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000002-0000-0000-0000-000000000160")!,
        name: "Tamatsukuri Inari",
        address: "3-8-14 Tamatsukuri, Chuo, Osaka",
        description: "One of Osaka's oldest Inari shrines with over 2,000 years of history. Known for its unique 'Inari-age' prayer method and its beautiful vermillion torii gates in the heart of the city. Said to be especially powerful for business success and romantic relationships.",
        coordinate: CLLocationCoordinate2D(latitude: 34.6708, longitude: 135.5275),
        stampSlotId: 160,
        category: .inari,
        tagline: "2,000 years of Inari worship in the heart of Osaka",
        highlights: [
            "Over 2,000 years of history — one of Osaka's oldest shrines",
            "Vermillion torii gates in central Osaka",
            "Powerful for business and romance blessings",
            "Connected to Osaka Castle area"
        ],
        mustSee: "The rows of vermillion torii gates leading through the compact but atmospheric precinct.",
        tips: [
            "Near Osaka Castle — combine for a half-day cultural walk",
            "Much less crowded than Fushimi Inari but has similar atmosphere",
            "Local favorite for business blessing ema",
            "Free admission"
        ],
        bestSeason: "Year-round",
        access: "5 min walk from Tamatsukuri Station (JR/Osaka Metro)",
        hours: "Open 24 hours",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000002-0000-0000-0000-000000000161")!,
        name: "Hozen-ji",
        address: "1-2-16 Namba, Chuo, Osaka",
        description: "A tiny moss-covered temple hidden in the neon-lit alley of Hozenji Yokocho, just steps from the bustling Dotonbori. Visitors pour water over the moss-covered Fudo Myo-o statue to make wishes — the centuries of water offerings have covered the stone deity in a thick blanket of green moss.",
        coordinate: CLLocationCoordinate2D(latitude: 34.6686, longitude: 135.5017),
        stampSlotId: 161,
        category: .tera,
        tagline: "A moss-covered deity hidden in Osaka's neon-lit alley",
        highlights: [
            "Moss-covered Fudo Myo-o statue — centuries of water offerings",
            "Hidden in atmospheric Hozenji Yokocho alley near Dotonbori",
            "Contrast of quiet devotion amid neon-lit nightlife",
            "Featured in the novel 'Meoto Zenzai' by Oda Sakunosuke"
        ],
        mustSee: "Pour water over the moss-covered Fudo Myo-o and make a wish — the contrast of this quiet, green, moss-draped statue in the middle of Osaka's brightest nightlife district is unforgettable.",
        tips: [
            "Visit at night for the atmospheric lantern-lit alley",
            "Right next to Dotonbori — a 2-minute detour",
            "The surrounding Hozenji Yokocho has excellent small restaurants",
            "Free, open 24 hours"
        ],
        bestSeason: "Year-round (especially atmospheric at night)",
        access: "5 min walk from Namba Station",
        hours: "Open 24 hours",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000002-0000-0000-0000-000000000162")!,
        name: "Domyoji Tenmangu",
        address: "1-16-40 Domyoji, Fujiidera, Osaka",
        description: "One of the three great Tenmangu shrines, closely connected to Sugawara no Michizane's aunt. Famous for its plum garden with 800 trees of 80 varieties, making it one of the best plum blossom viewing spots in the Kansai region. Houses a National Treasure wooden seated statue of Michizane.",
        coordinate: CLLocationCoordinate2D(latitude: 34.5715, longitude: 135.6024),
        stampSlotId: 162,
        category: .tenmangu,
        tagline: "800 plum trees and a National Treasure portrait of the god of learning",
        highlights: [
            "800 plum trees of 80 varieties — Kansai's best ume viewing",
            "National Treasure wooden statue of Sugawara no Michizane",
            "One of the three great Tenmangu shrines",
            "Connected to Michizane's aunt's residence"
        ],
        mustSee: "The plum garden in full bloom (February-March) — 800 trees in pink, white, and red create a carpet of fragrance and color.",
        tips: [
            "February-March plum festival is the highlight",
            "Less crowded than Kitano Tenmangu in Kyoto",
            "Near the Furuichi ancient tomb cluster",
            "Admission to plum garden: \u{00A5}300 during festival"
        ],
        bestSeason: "Feb-Mar (plum blossoms)",
        access: "5 min walk from Domyoji Station (Kintetsu Minami-Osaka Line)",
        hours: "9:00-17:00",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000002-0000-0000-0000-000000000163")!,
        name: "Hiraoka Jinja",
        address: "1-1-1 Dejimahonmachi, Higashi-Osaka, Osaka",
        description: "One of the oldest shrines in the Kansai region, Hiraoka Jinja was the first shrine established by the Fujiwara clan before they moved to Nara's Kasuga Taisha. Known as the 'origin of Kasuga Taisha,' it predates its more famous offspring and retains a powerful, ancient atmosphere.",
        coordinate: CLLocationCoordinate2D(latitude: 34.6738, longitude: 135.6561),
        stampSlotId: 163,
        category: .jinja,
        tagline: "The origin shrine of the Fujiwara — before Kasuga Taisha",
        highlights: [
            "Origin shrine of Kasuga Taisha — established before Nara",
            "Ancient Fujiwara clan's first tutelary shrine",
            "Autumn foliage garden — hidden gem of eastern Osaka",
            "Powerful atmosphere of deep antiquity"
        ],
        mustSee: "The ancient forest atmosphere — standing here you can feel why the Fujiwara chose this spot, before they created Kasuga Taisha in Nara.",
        tips: [
            "Autumn foliage here is excellent and uncrowded",
            "Combine with a hike in the Ikoma mountains",
            "Very few tourists — a genuine local shrine experience",
            "Free admission"
        ],
        bestSeason: "Nov (autumn foliage), Year-round",
        access: "15 min walk from Hiraoka Station (Kintetsu Nara Line)",
        hours: "Open 24 hours",
        imageURLs: []
    ),

    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    // MARK: - Nara (Additional)
    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

    Shrine(
        id: UUID(uuidString: "00000002-0000-0000-0000-000000000164")!,
        name: "Todai-ji",
        address: "406-1 Zoshicho, Nara",
        description: "The world's largest wooden building houses a 15-meter, 500-ton bronze Great Buddha (Daibutsu) that has watched over Nara for 1,250 years. Built by Emperor Shomu in 752 AD, the sheer scale of the Daibutsuden hall is overwhelming.",
        coordinate: CLLocationCoordinate2D(latitude: 34.6888, longitude: 135.8398),
        stampSlotId: 164,
        category: .tera,
        tagline: "The world's largest wooden building and Japan's greatest Buddha",
        highlights: [
            "15-meter bronze Great Buddha — 500 tons, cast in 752 AD",
            "Daibutsuden — world's largest wooden structure",
            "Great South Gate with massive Nio guardian statues",
            "Squeeze through the 'nostril pillar' for good luck"
        ],
        mustSee: "Find the wooden pillar with the hole the same size as the Buddha's nostril — squeezing through is said to guarantee enlightenment in your next life.",
        tips: [
            "Deer bow for senbei crackers around the entrance",
            "Visit at opening (7:30 AM) for the Daibutsu without crowds",
            "The Nio guardians at the Great South Gate are masterworks — don't rush past",
            "Admission \u{00A5}600"
        ],
        bestSeason: "Spring (May deer fawns), Autumn (maple colors)",
        access: "Bus from Kintetsu Nara Station to Todai-ji Daibutsuden — 5 min walk",
        hours: "7:30-17:30 (Nov-Feb 8:00-17:00)",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000002-0000-0000-0000-000000000165")!,
        name: "Kasuga Taisha",
        address: "160 Kasuganocho, Nara",
        description: "Over 3,000 stone and bronze lanterns line every path of this ancient shrine deep within Nara's sacred deer park. Founded in 768 AD as the Fujiwara clan's tutelary shrine, its Mantoro festivals (Feb 3 & Aug 14-15) light every lantern simultaneously — a sea of golden light.",
        coordinate: CLLocationCoordinate2D(latitude: 34.6810, longitude: 135.8484),
        stampSlotId: 165,
        category: .taisha,
        tagline: "3,000 lanterns glowing in the sacred deer forest",
        highlights: [
            "3,000 stone and bronze lanterns along every path",
            "Mantoro Festival — all lanterns lit simultaneously",
            "Kasugayama primeval forest — UNESCO protected ancient woodland",
            "Sacred deer wander freely throughout"
        ],
        mustSee: "The inner corridor of hanging bronze lanterns — walk slowly through the dim, golden-lit passage.",
        tips: [
            "Mantoro Festival on Feb 3 and Aug 14-15 is unmissable",
            "The primeval forest behind the shrine is UNESCO-protected",
            "25 min walk from Kintetsu Nara or 10 min by bus",
            "Free entry to outer grounds; inner shrine \u{00A5}500"
        ],
        bestSeason: "Feb 3 (Setsubun Mantoro), Aug (Obon Mantoro)",
        access: "25 min walk from Kintetsu Nara Station or bus",
        hours: "6:00-17:30 (Apr-Sep 6:00-18:00)",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000002-0000-0000-0000-000000000166")!,
        name: "Horyu-ji",
        address: "1-1 Horyuji Sannai, Ikaruga, Nara",
        description: "The world's oldest surviving wooden buildings. Founded by Prince Shotoku in 607 AD, Horyu-ji's main hall and five-story pagoda have stood for over 1,400 years — a UNESCO World Heritage Site that represents the dawn of Japanese Buddhist architecture.",
        coordinate: CLLocationCoordinate2D(latitude: 34.6145, longitude: 135.7345),
        stampSlotId: 166,
        category: .tera,
        tagline: "The world's oldest wooden buildings — 1,400 years of standing timber",
        highlights: [
            "World's oldest surviving wooden structures (607 AD)",
            "Five-story pagoda — the oldest in Japan",
            "Yumedono (Dream Hall) — Prince Shotoku's meditation hall",
            "UNESCO World Heritage Site — first in Japan"
        ],
        mustSee: "Stand before the five-story pagoda in the Western Precinct — you are looking at wood that has stood since before the Vikings, before Charlemagne, before the Tang Dynasty reached its peak.",
        tips: [
            "Allow 2 hours for the full Western and Eastern precincts",
            "The Treasure Hall has extraordinary 7th century Buddhist art",
            "About 30 min from central Nara by train",
            "Admission \u{00A5}1,500 (includes all areas)"
        ],
        bestSeason: "Year-round",
        access: "20 min walk from Horyuji Station (JR Yamatoji Line)",
        hours: "8:00-17:00 (Nov-Feb 8:00-16:30)",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000002-0000-0000-0000-000000000167")!,
        name: "Yakushi-ji",
        address: "457 Nishinokyocho, Nara",
        description: "Home to one of Japan's oldest pagodas — the East Pagoda has stood for 1,300 years. Built to pray for an empress's recovery from illness, Yakushi-ji is famous for its Tang-dynasty influenced sculpture and the 'frozen music' rhythm of its pagoda rooflines.",
        coordinate: CLLocationCoordinate2D(latitude: 34.6698, longitude: 135.7844),
        stampSlotId: 167,
        category: .tera,
        tagline: "A 1,300-year-old pagoda — frozen music in wood and tile",
        highlights: [
            "East Pagoda — 1,300 years old, a masterpiece of ancient architecture",
            "Sho Kannon statue — supreme Hakuho-period sculpture",
            "Nishino-kyo area — quieter side of Nara",
            "Summer lotus ponds in bloom"
        ],
        mustSee: "The East Pagoda — its alternating mokoshi roofs create an illusion of six stories from three, called 'frozen music' for its rhythmic beauty.",
        tips: [
            "Combine with Toshodai-ji — 5 min walk away",
            "Quieter than Todai-ji — a more contemplative experience",
            "Admission \u{00A5}1,100 includes treasure hall",
            "Lotus ponds bloom beautifully in July-August"
        ],
        bestSeason: "Summer (lotus), Autumn (light on the old pagoda)",
        access: "1 min walk from Nishinokyo Station (Kintetsu Kashihara Line)",
        hours: "8:30-17:00",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000002-0000-0000-0000-000000000168")!,
        name: "Toshodai-ji",
        address: "13-46 Gojomachi, Nara",
        description: "Founded by the blind Chinese monk Ganjin who crossed the sea six times — losing his sight to salt spray — to bring Buddhist precepts to Japan. The Golden Hall is the finest surviving example of Nara-period architecture, and the temple's moss garden has an ancient, timeless beauty.",
        coordinate: CLLocationCoordinate2D(latitude: 34.6755, longitude: 135.7840),
        stampSlotId: 168,
        category: .tera,
        tagline: "A blind monk's gift to Japan — the purest Nara-period architecture",
        highlights: [
            "Golden Hall — finest surviving Nara-period building",
            "Founded by Ganjin who braved 6 sea crossings, losing his sight",
            "Moss garden with ancient, timeless beauty",
            "Ganjin's lacquer portrait — Japan's oldest portrait sculpture"
        ],
        mustSee: "The Golden Hall — its Greek-column-like entasis pillars and clean proportions represent the purest form of 8th-century Japanese architecture.",
        tips: [
            "Ganjin's portrait is displayed only on June 6 — his memorial day",
            "Combine with nearby Yakushi-ji for a quiet half-day",
            "The moss garden is best in the rainy season (June)",
            "Admission \u{00A5}1,000"
        ],
        bestSeason: "Jun (moss garden + Ganjin memorial), Year-round",
        access: "10 min walk from Nishinokyo Station (Kintetsu)",
        hours: "8:30-17:00",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000002-0000-0000-0000-000000000169")!,
        name: "Hase-dera",
        address: "731-1 Hase, Sakurai, Nara",
        description: "Known as the 'Flower Temple,' Hase-dera's hillside location provides a succession of blooms throughout the year — peonies in spring, hydrangeas in early summer, and autumn maples. The 399-step covered stairway climbing the mountain is lined with hanging lanterns.",
        coordinate: CLLocationCoordinate2D(latitude: 34.5363, longitude: 135.9004),
        stampSlotId: 169,
        category: .tera,
        tagline: "The Flower Temple — 399 lantern-lit steps up the mountain",
        highlights: [
            "399-step covered stairway with hanging lanterns",
            "7,000 peony bushes blooming in April-May",
            "11-meter wooden Kannon — one of Japan's largest",
            "Year-round flowers — peonies, hydrangeas, maples"
        ],
        mustSee: "The 399-step covered stairway (Nobori-ro) climbing through hanging lanterns — the view from the top back over the valley is magnificent.",
        tips: [
            "Late April-early May peony season is the highlight",
            "The 11-meter Kannon is impressive — one of Japan's largest wooden statues",
            "Combine with Murou-ji for a full mountain temple day",
            "Admission \u{00A5}500"
        ],
        bestSeason: "Late Apr-May (peonies), Jun (hydrangeas), Nov (autumn)",
        access: "15 min walk from Hasedera Station (Kintetsu Osaka Line)",
        hours: "8:30-17:00",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000002-0000-0000-0000-000000000170")!,
        name: "Tanzan Jinja",
        address: "319 Tonomine, Sakurai, Nara",
        description: "Hidden deep in the mountains south of Nara, Tanzan Jinja is arguably the single best autumn foliage destination in the Kansai region — 3,000 maple trees engulf the pagoda and shrine buildings in a blaze of crimson. The 13-story pagoda is the only one of its kind in Japan.",
        coordinate: CLLocationCoordinate2D(latitude: 34.4739, longitude: 135.8568),
        stampSlotId: 170,
        category: .jinja,
        tagline: "3,000 maples and Japan's only 13-story pagoda — Kansai's best autumn",
        highlights: [
            "3,000 maple trees — considered Kansai's finest autumn colors",
            "Japan's only 13-story wooden pagoda",
            "Hidden mountain location — feels like a secret discovery",
            "Connected to the founding of Japan's first centralized government"
        ],
        mustSee: "The 13-story pagoda framed by blazing autumn maples — this is the photograph that will define your Japan trip.",
        tips: [
            "Mid-to-late November is peak — worth the effort to get here",
            "Access is by bus from Sakurai Station — check the schedule",
            "Much less crowded than Kyoto autumn spots",
            "Admission \u{00A5}600"
        ],
        bestSeason: "Mid-late Nov (peak autumn — Kansai's best)",
        access: "25 min by bus from Sakurai Station (JR/Kintetsu)",
        hours: "8:30-16:30",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000002-0000-0000-0000-000000000171")!,
        name: "Asuka-dera",
        address: "682 Asuka, Asuka, Nara",
        description: "Japan's oldest temple, founded in 596 AD — three years after Shitennoji. The Great Buddha here, cast in 609 AD, is the oldest known Buddha statue in Japan. The surrounding Asuka village feels like stepping back to the very origins of Japanese civilization.",
        coordinate: CLLocationCoordinate2D(latitude: 34.4746, longitude: 135.8207),
        stampSlotId: 171,
        category: .tera,
        tagline: "Japan's oldest Buddha in Japan's oldest village",
        highlights: [
            "Japan's oldest temple (596 AD) and oldest Buddha statue (609 AD)",
            "Asuka Great Buddha — the dawn of Japanese Buddhist art",
            "Surrounding Asuka village — the birthplace of Japanese civilization",
            "Simple, powerful atmosphere of extreme antiquity"
        ],
        mustSee: "The Asuka Great Buddha — rough, powerful, and over 1,400 years old. You are looking at the oldest surviving Buddha in Japan.",
        tips: [
            "Rent a bicycle in Asuka to explore the ancient stone monuments and tombs",
            "Combine with Tachibana-dera, Ishibutai Kofun, and other Asuka sites",
            "The village atmosphere is rural and timeless",
            "Admission \u{00A5}350"
        ],
        bestSeason: "Year-round (Apr cherry blossoms in the fields)",
        access: "10 min walk from Asuka Station (Kintetsu Yoshino Line)",
        hours: "9:00-17:30",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000002-0000-0000-0000-000000000172")!,
        name: "Muro-ji",
        address: "78 Murou, Uda, Nara",
        description: "Known as 'Women's Koyasan' because it welcomed female worshippers when Koyasan banned them. The five-story pagoda is the smallest outdoor pagoda in Japan — just 16 meters tall — and is considered one of the most elegant. The mountain setting with ancient cedars creates an atmosphere of profound serenity.",
        coordinate: CLLocationCoordinate2D(latitude: 34.5366, longitude: 136.0408),
        stampSlotId: 172,
        category: .tera,
        tagline: "Women's Koyasan — the smallest and most elegant pagoda in Japan",
        highlights: [
            "Japan's smallest outdoor five-story pagoda — 16 meters of elegance",
            "'Women's Koyasan' — welcomed women when Koyasan excluded them",
            "Ancient cedar forest atmosphere",
            "Shakunage (rhododendron) blooming along the stone stairs in April-May"
        ],
        mustSee: "The tiny five-story pagoda nestled among giant cedars — its miniature perfection against the massive trees creates a powerful sense of scale.",
        tips: [
            "Late April rhododendrons along the stone stairway are spectacular",
            "The dragon cave (Ryuana) at the top of the stairs is worth the climb",
            "Access requires a bus from Muroguchi-Ono Station",
            "Admission \u{00A5}600"
        ],
        bestSeason: "Late Apr-May (rhododendrons), Nov (autumn colors)",
        access: "15 min by bus from Muroguchi-Ono Station (Kintetsu Osaka Line)",
        hours: "8:30-17:00",
        imageURLs: []
    ),

    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    // MARK: - Shiga
    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

    Shrine(
        id: UUID(uuidString: "00000002-0000-0000-0000-000000000173")!,
        name: "Enryaku-ji",
        address: "4220 Sakamotohonmachi, Otsu, Shiga",
        description: "Perched atop Mount Hiei overlooking both Kyoto and Lake Biwa, Enryaku-ji is the mother temple of Tendai Buddhism and one of the most important temples in Japanese history. Founded by Saicho in 788 AD, it has been the training ground for the founders of most major Japanese Buddhist sects.",
        coordinate: CLLocationCoordinate2D(latitude: 35.0702, longitude: 135.8411),
        stampSlotId: 173,
        category: .tera,
        tagline: "The mountain monastery that shaped all of Japanese Buddhism",
        highlights: [
            "Mother temple of Tendai Buddhism — atop Mount Hiei",
            "Training ground for founders of Japanese Buddhist sects",
            "Konponchu-do main hall with the 'inextinguishable dharma lamp' burning for 1,200 years",
            "UNESCO World Heritage Site with panoramic views"
        ],
        mustSee: "The eternal flame in the Konponchu-do — these lamps have burned continuously for 1,200 years without ever going out.",
        tips: [
            "Take the cable car from Sakamoto for scenic Lake Biwa views",
            "The temple complex is vast — allow 3+ hours for all three areas",
            "November autumn colors against Lake Biwa views are spectacular",
            "Combined ticket \u{00A5}1,000 for all areas"
        ],
        bestSeason: "Nov (autumn + Lake Biwa views), Year-round",
        access: "Cable car from Sakamoto Station (Keihan) or drive",
        hours: "8:30-16:30 (varies by season)",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000002-0000-0000-0000-000000000174")!,
        name: "Miidera",
        address: "246 Onjo-ji-cho, Otsu, Shiga",
        description: "Also known as Onjo-ji, Miidera is the head temple of the Tendai Jimon sect and has rivaled Enryaku-ji for over 1,000 years. Its bell, said to have been dragged down from Enryaku-ji by the warrior monk Benkei, is one of Japan's three famous bells.",
        coordinate: CLLocationCoordinate2D(latitude: 35.0136, longitude: 135.8525),
        stampSlotId: 174,
        category: .tera,
        tagline: "The temple of the bell Benkei stole — rival of Mount Hiei",
        highlights: [
            "One of Japan's three famous bells — 'Benkei's dragged bell'",
            "Panoramic views over Lake Biwa from the hilltop",
            "1,000+ year rivalry with Enryaku-ji",
            "Cherry blossom tunnel along the canal in spring"
        ],
        mustSee: "Ring the Benkei Bell (\u{00A5}300) — the bell that the legendary warrior monk supposedly dragged down from Mount Hiei.",
        tips: [
            "Spring cherry blossoms along the Lake Biwa Canal are spectacular",
            "Less crowded than Kyoto but equally rewarding",
            "Combine with a boat cruise on Lake Biwa",
            "Admission \u{00A5}600"
        ],
        bestSeason: "Apr (cherry blossoms), Nov (autumn)",
        access: "10 min walk from Miidera Station (Keihan Ishiyama-Sakamoto Line)",
        hours: "8:00-17:00",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000002-0000-0000-0000-000000000175")!,
        name: "Taga Taisha",
        address: "604 Taga, Taga, Shiga",
        description: "One of Japan's most ancient shrines, dedicated to the creator gods Izanagi and Izanami. Known for blessings of longevity and matchmaking, Taga Taisha has been a destination for pilgrims praying for long life since ancient times.",
        coordinate: CLLocationCoordinate2D(latitude: 35.2262, longitude: 136.2919),
        stampSlotId: 175,
        category: .taisha,
        tagline: "The shrine of longevity — where the creator gods dwell",
        highlights: [
            "Enshrines Izanagi and Izanami — the creator gods of Japan",
            "Famous for longevity and long-life blessings",
            "Taiko-bashi drum bridge — stone arched bridge",
            "Ancient pilgrimage destination in Shiga's countryside"
        ],
        mustSee: "The Taiko-bashi stone bridge — crossing it is said to add years to your life.",
        tips: [
            "The saying 'Ise wa Ise, Taga wa Taga' shows this shrine's equal status with Ise",
            "Quiet countryside setting — very different from Kyoto shrines",
            "Combine with Hikone Castle and Lake Biwa",
            "Free admission"
        ],
        bestSeason: "Apr (cherry), Year-round",
        access: "10 min walk from Taga-Taisha-mae Station (Ohmi Railway)",
        hours: "Open 24 hours",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000002-0000-0000-0000-000000000176")!,
        name: "Hiyoshi Taisha",
        address: "5-1-1 Sakamoto, Otsu, Shiga",
        description: "The head shrine of all 3,800 Hie and Sanno shrines across Japan. Located at the base of Mount Hiei, Hiyoshi Taisha's autumn foliage is among Shiga's finest. The monkey is the shrine's sacred messenger — stone monkey statues are everywhere.",
        coordinate: CLLocationCoordinate2D(latitude: 35.0714, longitude: 135.8691),
        stampSlotId: 176,
        category: .taisha,
        tagline: "Head of 3,800 shrines — where monkeys are the divine messengers",
        highlights: [
            "Head shrine of all 3,800 Hie/Sanno shrines in Japan",
            "Sacred monkey messenger — stone monkey statues throughout",
            "Spectacular autumn foliage — Shiga's best",
            "At the foot of Mount Hiei"
        ],
        mustSee: "The autumn foliage — over 3,000 maples turning crimson around the ancient shrine buildings create one of Shiga's most beautiful scenes.",
        tips: [
            "November autumn colors here rival Kyoto with far fewer crowds",
            "Combine with Enryaku-ji on Mount Hiei above",
            "The Sanno Festival (April) features dramatic mikoshi processions",
            "Admission \u{00A5}300"
        ],
        bestSeason: "Nov (autumn), Apr (Sanno Festival)",
        access: "10 min walk from Sakamoto-Hieizanguchi Station (JR Kosei Line)",
        hours: "9:00-16:30",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000002-0000-0000-0000-000000000177")!,
        name: "Ishiyama-dera",
        address: "1-1-1 Ishiyama-dera, Otsu, Shiga",
        description: "Famous as the place where Murasaki Shikibu began writing The Tale of Genji — the world's first novel — while gazing at the moon reflected in Lake Biwa. The temple's natural rock formations and seasonal flowers make it one of Shiga's most beautiful temples.",
        coordinate: CLLocationCoordinate2D(latitude: 34.9578, longitude: 135.9050),
        stampSlotId: 177,
        category: .tera,
        tagline: "Where the world's first novel was born — under the moonlight of Lake Biwa",
        highlights: [
            "Birthplace of The Tale of Genji — world's first novel",
            "Moon viewing over Lake Biwa — inspired Lady Murasaki",
            "Natural rock formations (wollastonite) throughout the grounds",
            "Seasonal flowers: plum, cherry, autumn maple, peony"
        ],
        mustSee: "The Genji Room — where Murasaki Shikibu sat gazing at the autumn moon over Lake Biwa and was inspired to write the opening of the world's first novel.",
        tips: [
            "Full moon nights in autumn are especially atmospheric — special events sometimes held",
            "The plum blossoms (February) and autumn maples (November) are both excellent",
            "Combine with Miidera for a temple-rich Lake Biwa day",
            "Admission \u{00A5}600"
        ],
        bestSeason: "Nov (autumn + moon), Feb (plum), Year-round",
        access: "10 min walk from Ishiyama-dera Station (Keihan Line)",
        hours: "8:00-16:30",
        imageURLs: []
    ),

    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    // MARK: - Hyogo
    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

    Shrine(
        id: UUID(uuidString: "00000002-0000-0000-0000-000000000178")!,
        name: "Ikuta Jinja",
        address: "1-2-1 Shimoyamatedori, Chuo, Kobe, Hyogo",
        description: "One of Japan's oldest shrines, Ikuta Jinja has stood in the heart of Kobe since before recorded history. The surrounding forest survived the 1995 earthquake and is considered a miracle of resilience. It is Kobe's most important shrine for hatsumode and weddings.",
        coordinate: CLLocationCoordinate2D(latitude: 34.6965, longitude: 135.1928),
        stampSlotId: 178,
        category: .jinja,
        tagline: "Kobe's ancient heart — the shrine that survived the great earthquake",
        highlights: [
            "One of Japan's oldest shrines — predating recorded history",
            "Survived the 1995 Kobe earthquake — symbol of resilience",
            "Sacred forest (Ikuta no Mori) in central Kobe",
            "Kobe's most popular shrine for New Year's and weddings"
        ],
        mustSee: "The sacred forest behind the shrine — an oasis of ancient trees in the middle of one of Japan's most modern cities.",
        tips: [
            "In the heart of Sannomiya — perfect starting point for Kobe exploration",
            "New Year's hatsumode draws enormous crowds",
            "The name 'Kobe' itself derives from the shrine's kambe (families serving the shrine)",
            "Free admission"
        ],
        bestSeason: "Jan (hatsumode), Year-round",
        access: "5 min walk from Sannomiya Station",
        hours: "Open 24 hours (office 9:00-17:00)",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000002-0000-0000-0000-000000000179")!,
        name: "Nagata Jinja",
        address: "3-1-1 Nagata-cho, Nagata, Kobe, Hyogo",
        description: "Nagata Jinja has been Kobe's guardian shrine for over 1,800 years and played a central role in the community's recovery after the devastating 1995 earthquake. The nearby Nagata-cho district is the heart of Kobe's vibrant Korean and multicultural community.",
        coordinate: CLLocationCoordinate2D(latitude: 34.6614, longitude: 135.1530),
        stampSlotId: 179,
        category: .jinja,
        tagline: "Kobe's 1,800-year guardian — reborn from the earthquake",
        highlights: [
            "1,800-year history as Kobe's guardian shrine",
            "Rebuilt after the 1995 earthquake — symbol of recovery",
            "Annual Tsuina-shiki fire festival (February)",
            "Heart of multicultural Nagata district"
        ],
        mustSee: "The rebuilt main hall — a testament to the community's determination to restore their shrine after the earthquake.",
        tips: [
            "The Tsuina-shiki fire festival in February is dramatic",
            "Try Nagata's famous sobameshi (yakisoba mixed with rice) nearby",
            "Less touristy — a genuine local Kobe experience",
            "Free admission"
        ],
        bestSeason: "Feb (fire festival), Year-round",
        access: "5 min walk from Nagata Station (Kobe Municipal Subway)",
        hours: "Open 24 hours",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000002-0000-0000-0000-000000000180")!,
        name: "Engyoji",
        address: "2968 Shosha, Himeji, Hyogo",
        description: "Perched on Mount Shosha overlooking Himeji, Engyoji is where 'The Last Samurai' was filmed. The mountaintop temple complex, accessible by ropeway, has a thousand-year history and feels like stepping into a samurai-era film set with its weathered wooden halls and mountain forest setting.",
        coordinate: CLLocationCoordinate2D(latitude: 34.8847, longitude: 134.6362),
        stampSlotId: 180,
        category: .tera,
        tagline: "The Last Samurai's temple — a mountain monastery above Himeji",
        highlights: [
            "Filming location for 'The Last Samurai' with Tom Cruise",
            "Mountaintop temple complex accessible by ropeway",
            "Maniden hall perched dramatically on the cliff edge",
            "1,000-year-old training monastery"
        ],
        mustSee: "The Maniden hall — built into the mountainside on stilts, this dramatic structure is where The Last Samurai scenes were filmed.",
        tips: [
            "Take the Mount Shosha Ropeway (\u{00A5}1,000 round trip)",
            "Combine with Himeji Castle for a full-day Himeji itinerary",
            "Allow 2-3 hours for the full mountaintop circuit",
            "Temple admission \u{00A5}500"
        ],
        bestSeason: "Nov (autumn), Year-round",
        access: "Bus from Himeji Station to ropeway + ropeway up (30 min total)",
        hours: "8:30-17:00",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000002-0000-0000-0000-000000000181")!,
        name: "Taisan-ji",
        address: "1 Taisanji, Nishi, Kobe, Hyogo",
        description: "A 1,300-year-old mountain temple with a National Treasure main hall — one of only a handful of Kamakura-period buildings surviving in the Kansai region. The setting, on a forested hillside overlooking Kobe, offers a peaceful escape from the city below.",
        coordinate: CLLocationCoordinate2D(latitude: 34.7207, longitude: 135.0697),
        stampSlotId: 181,
        category: .tera,
        tagline: "A hidden National Treasure on the mountain above Kobe",
        highlights: [
            "National Treasure main hall — rare Kamakura-period architecture",
            "1,300-year history on Kobe's mountainside",
            "Peaceful forest setting above the city",
            "Rarely visited by tourists — genuine hidden gem"
        ],
        mustSee: "The National Treasure main hall — an incredibly rare surviving example of Kamakura-period temple architecture.",
        tips: [
            "Very few tourists — one of Kobe's best-kept secrets",
            "Accessible by bus from Kobe's Maiko area",
            "Combine with nearby Akashi Kaikyo Bridge views",
            "Free admission to grounds"
        ],
        bestSeason: "Year-round",
        access: "Bus from JR Tarumi Station to Taisan-ji (15 min)",
        hours: "8:30-17:00",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000002-0000-0000-0000-000000000182")!,
        name: "Nishinomiya Jinja",
        address: "1-17 Shakocho, Nishinomiya, Hyogo",
        description: "The head shrine of all 3,500 Ebisu shrines across Japan and home to the famous Toka Ebisu festival and the New Year's 'Fukuotoko' race — where men sprint to be the first to reach the main hall and claim the title of 'Luckiest Man of the Year.'",
        coordinate: CLLocationCoordinate2D(latitude: 34.7377, longitude: 135.3375),
        stampSlotId: 182,
        category: .jinja,
        tagline: "Race to be the luckiest man — head shrine of 3,500 Ebisu",
        highlights: [
            "Head shrine of all 3,500 Ebisu shrines in Japan",
            "Fukuotoko race — sprint to be the 'Luckiest Man of the Year'",
            "Toka Ebisu festival (Jan 9-11)",
            "Beautiful grounds between Osaka and Kobe"
        ],
        mustSee: "If visiting in January, the Fukuotoko race on January 10 — men sprint 230 meters to be first through the gate and earn the title 'Luckiest Man of the Year.'",
        tips: [
            "The Fukuotoko race (Jan 10, 6 AM) is broadcast on national TV",
            "Between Osaka and Kobe — easy day trip from either city",
            "Free admission",
            "Near Hanshin Koshien Stadium — combine if there's a game"
        ],
        bestSeason: "Jan 9-11 (Toka Ebisu + Fukuotoko race)",
        access: "5 min walk from Nishinomiya Station (Hanshin Line)",
        hours: "Open 24 hours",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000002-0000-0000-0000-000000000183")!,
        name: "Suma-dera",
        address: "2-12-1 Sumadera-cho, Suma, Kobe, Hyogo",
        description: "A seaside temple connected to the Tale of Genji and the site of the historic Battle of Ichi-no-Tani (1184) between the Minamoto and Taira clans. The temple grounds contain warrior memorials and offer views across Osaka Bay.",
        coordinate: CLLocationCoordinate2D(latitude: 34.6475, longitude: 135.1163),
        stampSlotId: 183,
        category: .tera,
        tagline: "Where samurai history meets the sea — the Battle of Ichi-no-Tani",
        highlights: [
            "Site of the Battle of Ichi-no-Tani (1184)",
            "Connected to The Tale of Genji's Suma exile",
            "Warrior memorials from the Genpei War",
            "Views over Osaka Bay from the temple grounds"
        ],
        mustSee: "The warrior memorials — Atsumori's flute and Kumagai's armor tell the story of one of Japan's most famous battlefield encounters.",
        tips: [
            "Near Suma Beach — combine for a seaside day",
            "Less crowded than Kobe's central attractions",
            "A moving place for those interested in samurai history",
            "Admission \u{00A5}400"
        ],
        bestSeason: "Year-round",
        access: "5 min walk from Sumadera Station (Sanyo Railway)",
        hours: "8:30-17:00",
        imageURLs: []
    ),

    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    // MARK: - Wakayama
    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

    Shrine(
        id: UUID(uuidString: "00000002-0000-0000-0000-000000000184")!,
        name: "Kumano Hongu Taisha",
        address: "1110 Hongu, Tanabe, Wakayama",
        description: "The spiritual heart of the Kumano Kodo pilgrimage route and one of Japan's three great Kumano shrines. The Oyunohara — the original shrine site marked by Japan's largest torii gate (34 meters) standing alone in a rice paddy — is one of Japan's most powerful spiritual landscapes.",
        coordinate: CLLocationCoordinate2D(latitude: 33.8408, longitude: 135.7730),
        stampSlotId: 184,
        category: .taisha,
        tagline: "Japan's largest torii in a rice paddy — the heart of the Kumano pilgrimage",
        highlights: [
            "Terminus of the Kumano Kodo pilgrimage route",
            "Oyunohara — Japan's largest torii gate (34m) in a field",
            "One of the three Kumano grand shrines",
            "UNESCO World Heritage Sacred Site"
        ],
        mustSee: "Walk to Oyunohara — the original shrine site where Japan's largest torii gate stands alone in a rice paddy. The sheer scale and isolation create an overwhelming spiritual presence.",
        tips: [
            "Walk at least part of the Kumano Kodo trail to arrive on foot — the experience is transformative",
            "Oyunohara is a 10-minute walk from the current shrine — don't miss it",
            "Bus from Shingu or Tanabe — plan transport carefully in this remote area",
            "Free admission"
        ],
        bestSeason: "Year-round (spring and autumn for Kumano Kodo hiking)",
        access: "Bus from Shingu Station (2 hours) or Kii-Tanabe Station",
        hours: "Open 24 hours (office 8:00-17:00)",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000002-0000-0000-0000-000000000185")!,
        name: "Kumano Nachi Taisha",
        address: "1 Nachisan, Nachikatsuura, Wakayama",
        description: "Standing beside the Nachi Falls — at 133 meters, the tallest single-drop waterfall in Japan — Kumano Nachi Taisha's vermillion pagoda framed against the white cascade is one of the most iconic images of spiritual Japan. The falls themselves are worshipped as a deity.",
        coordinate: CLLocationCoordinate2D(latitude: 33.6700, longitude: 135.8908),
        stampSlotId: 185,
        category: .taisha,
        tagline: "The vermillion pagoda beside Japan's tallest waterfall",
        highlights: [
            "Nachi Falls (133m) — Japan's tallest single-drop waterfall",
            "Vermillion pagoda + waterfall — Japan's most iconic spiritual image",
            "One of the three Kumano grand shrines",
            "Nachi Fire Festival (Jul 14) — Japan's most dramatic fire festival"
        ],
        mustSee: "The three-story pagoda with Nachi Falls in the background — this single image captures the essence of Japanese spirituality more than perhaps any other.",
        tips: [
            "The Nachi Fire Festival (Jul 14) features twelve massive torches carried down the stone steps",
            "Walk the Daimon-zaka stone stairway — 267 steps flanked by ancient cedars",
            "The waterfall viewing platform (\u{00A5}300) gets you close to the base",
            "Combine with Kumano Hongu Taisha and Hayatama Taisha for the Kumano Sanzan"
        ],
        bestSeason: "Jul 14 (Fire Festival), Year-round",
        access: "Bus from Kii-Katsuura Station to Nachisan (30 min)",
        hours: "8:30-16:30",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000002-0000-0000-0000-000000000186")!,
        name: "Kumano Hayatama Taisha",
        address: "1 Shingu, Shingu, Wakayama",
        description: "The third of the Kumano Sanzan grand shrines, Kumano Hayatama Taisha sits at the mouth of the Kumano River. Its nagi tree — an enormous 1,000-year-old camphor — is considered a divine natural monument. The shrine is known for its connections to rebirth and new beginnings.",
        coordinate: CLLocationCoordinate2D(latitude: 33.7300, longitude: 135.9866),
        stampSlotId: 186,
        category: .taisha,
        tagline: "The shrine of new beginnings at the mouth of the sacred Kumano River",
        highlights: [
            "Third of the Kumano Sanzan grand shrines",
            "1,000-year-old sacred nagi tree — natural monument",
            "Blessings of rebirth and new beginnings",
            "Kumano River boat pilgrimage route nearby"
        ],
        mustSee: "The sacred nagi tree — over 1,000 years old and enormous, this single tree is worshipped as a divine entity.",
        tips: [
            "The easiest of the three Kumano shrines to access — right in Shingu city",
            "Nagi leaf amulets are unique to this shrine — the indestructible leaf symbolizes strong bonds",
            "Take the Kumano River boat tour from nearby Hitari for the pilgrim experience",
            "Free admission"
        ],
        bestSeason: "Year-round",
        access: "15 min walk from Shingu Station (JR Kisei Line)",
        hours: "Open 24 hours (office 8:00-17:00)",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000002-0000-0000-0000-000000000187")!,
        name: "Koyasan Kongobu-ji",
        address: "132 Koyasan, Koya, Wakayama",
        description: "The head temple of Shingon Buddhism, founded by Kobo Daishi (Kukai) in 816 AD atop the sacred Mount Koya. Kongobu-ji's rock garden — the largest in Japan — represents two dragons emerging from a sea of clouds. The mountaintop temple town is one of Japan's most extraordinary spiritual destinations.",
        coordinate: CLLocationCoordinate2D(latitude: 34.2131, longitude: 135.5832),
        stampSlotId: 187,
        category: .tera,
        tagline: "The mountaintop monastery — Japan's largest rock garden in the clouds",
        highlights: [
            "Head temple of Shingon Buddhism — founded 816 AD",
            "Banryutei — Japan's largest rock garden (2,340 sq meters)",
            "Mountaintop temple town with 117 sub-temples",
            "UNESCO World Heritage Site"
        ],
        mustSee: "The Banryutei rock garden — Japan's largest at 2,340 square meters, representing two dragons emerging from clouds of white gravel.",
        tips: [
            "Stay overnight in a temple lodging (shukubo) for the full Koya experience",
            "Morning prayer services at temple lodgings are unforgettable",
            "The Danjo Garan complex with its vermillion pagoda is a must-see",
            "Admission \u{00A5}1,000"
        ],
        bestSeason: "Year-round (Nov autumn, Oct-Nov especially atmospheric)",
        access: "Nankai Railway to Gokurakubashi + cable car + bus (2h from Osaka)",
        hours: "8:30-17:00",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000002-0000-0000-0000-000000000188")!,
        name: "Koyasan Okunoin",
        address: "Koyasan, Koya, Wakayama",
        description: "The most sacred site on Mount Koya — a 2-kilometer cemetery path through ancient cedar forest leading to the mausoleum of Kobo Daishi (Kukai), who is believed to be in eternal meditation rather than dead. Over 200,000 tombstones of samurai, monks, and common people line this extraordinary path.",
        coordinate: CLLocationCoordinate2D(latitude: 34.2172, longitude: 135.6044),
        stampSlotId: 188,
        category: .tera,
        tagline: "200,000 tombstones in an ancient forest — where Kukai meditates eternally",
        highlights: [
            "2km cemetery path through ancient cedar forest",
            "200,000+ tombstones spanning 1,200 years",
            "Mausoleum of Kobo Daishi — believed to be in eternal meditation",
            "Torodo (Lantern Hall) with 10,000 eternal flames"
        ],
        mustSee: "Walk the cemetery path at dusk or dawn — the moss-covered tombstones, towering cedars, and stone lanterns create the most atmospheric walk in all of Japan.",
        tips: [
            "Night walking tours are available and extraordinarily atmospheric",
            "The path starts at Ichinohashi bridge — walk the full 2km",
            "Famous tombstones include major corporations (Panasonic, Yakult) and samurai clans",
            "Free admission, open 24 hours"
        ],
        bestSeason: "Year-round (any season, any time of day)",
        access: "Bus from Koyasan cable car station to Okunoin-mae",
        hours: "Open 24 hours (Torodo 8:30-17:00)",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000002-0000-0000-0000-000000000189")!,
        name: "Kimiidera",
        address: "1201 Kimiideracho, Wakayama",
        description: "A hillside temple famous for its early-blooming cherry trees — the first to bloom in the Kansai region each spring. The view from the temple terrace over Wakayama city and the sea has made it a beloved cherry blossom destination for centuries.",
        coordinate: CLLocationCoordinate2D(latitude: 34.1872, longitude: 135.1788),
        stampSlotId: 189,
        category: .tera,
        tagline: "Kansai's first cherry blossoms — overlooking the city and sea",
        highlights: [
            "Earliest cherry blossoms in Kansai — blooming late March",
            "Panoramic views over Wakayama city and the Pacific",
            "Hilltop terrace with sweeping scenery",
            "Western Japan Pilgrimage Route Temple #2"
        ],
        mustSee: "The cherry blossoms from the main terrace — the view of pink blossoms, city rooftops, and the glittering sea beyond is stunning.",
        tips: [
            "Late March for cherry blossoms — before Kyoto and Osaka peak",
            "About 30 min from Osaka by train",
            "Combine with Wakayama Castle nearby",
            "Admission \u{00A5}400"
        ],
        bestSeason: "Late Mar (earliest cherry blossoms in Kansai)",
        access: "10 min walk from Kimiidera Station (JR Kisei Line)",
        hours: "8:00-17:00",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000002-0000-0000-0000-000000000190")!,
        name: "Kokawa-dera",
        address: "787 Kokawa, Kinokawa, Wakayama",
        description: "Temple #3 on the Western Japan Pilgrimage Route, Kokawa-dera is famous for its painted ceiling depicting 1,124 flowers — each unique — covering the entire ceiling of the main hall. The temple's rural setting in the Kinokawa valley provides a peaceful, off-the-beaten-path experience.",
        coordinate: CLLocationCoordinate2D(latitude: 34.2800, longitude: 135.4075),
        stampSlotId: 190,
        category: .tera,
        tagline: "1,124 painted flowers on the ceiling — each one unique",
        highlights: [
            "Ceiling painting of 1,124 unique flowers — a botanical treasure",
            "Western Japan Pilgrimage Route Temple #3",
            "Peaceful rural setting in Kinokawa valley",
            "Connected to the legend of a boy saved by Kannon"
        ],
        mustSee: "Look up at the ceiling of the main hall — 1,124 flowers, each painted differently, cover the entire ceiling in a botanical wonderland.",
        tips: [
            "The ceiling painting is best seen on bright days when light enters the hall",
            "Combine with a visit to Negoro-ji nearby",
            "Rural and uncrowded — a genuine hidden gem",
            "Admission \u{00A5}400"
        ],
        bestSeason: "Year-round",
        access: "20 min by bus from Kokawa Station (JR Wakayama Line)",
        hours: "8:00-17:00",
        imageURLs: []
    ),
]
