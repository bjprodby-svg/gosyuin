import SwiftUI
import CoreLocation

// MARK: - West Japan (38 shrines, ID 253-290)

let westJapanShrines: [Shrine] = [

    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    // MARK: - Chugoku
    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

    Shrine(
        id: UUID(uuidString: "00000006-0000-0000-0000-000000000253")!,
        name: "Kibitsu Jinja",
        address: "931 Kibitsu, Kita-ku, Okayama",
        description: "Kibitsu Jinja is the only shrine in Japan built in the unique Kibitsu-zukuri architectural style, designated a National Treasure. It is deeply connected to the legend of Momotaro (Peach Boy), as the deity Kibitsuhiko-no-Mikoto enshrined here is believed to be the historical basis for the folk hero. The 400-meter covered corridor (kairo) stretching through the hillside is one of the most photogenic shrine walkways in western Japan.",
        coordinate: CLLocationCoordinate2D(latitude: 34.6738, longitude: 133.8450),
        stampSlotId: 253,
        category: .jinja,
        tagline: "The shrine that inspired Japan's most beloved folk hero, Momotaro",
        highlights: [
            "Only example of Kibitsu-zukuri architecture — a National Treasure main hall",
            "400-meter covered corridor (kairo) winding through the hillside",
            "Origin shrine of the Momotaro (Peach Boy) legend",
            "Narukama ritual cauldron divination — hear the cauldron roar to know your fortune"
        ],
        mustSee: "Walk the entire 400-meter covered wooden corridor that winds gently down the hillside — it connects the main hall to subsidiary shrines and is especially atmospheric on a rainy day when the sound of rain on the roof fills the passage.",
        tips: [
            "The Narukama divination ritual (a roaring cauldron) can be experienced by appointment — ask at the shrine office",
            "Combine with nearby Kibitsuhiko Jinja for a full Kibi Plain pilgrimage",
            "The main hall's double-gabled roof is unique in Japan — take time to appreciate it from multiple angles",
            "Rent a bicycle at Kibitsuhiko Station to explore the Kibi Plain cycling route connecting several shrines"
        ],
        bestSeason: "Jun-Jul (hydrangea along the corridor), Apr (cherry blossoms), Year-round",
        access: "10 min walk from Kibitsu Station (JR Kibi Line)",
        hours: "5:00-18:00",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000006-0000-0000-0000-000000000254")!,
        name: "Kibitsuhiko Jinja",
        address: "1043 Ichinomiya, Kita-ku, Okayama",
        description: "Kibitsuhiko Jinja is the Ichinomiya (highest-ranking shrine) of the former Bizen Province and the sister shrine to neighboring Kibitsu Jinja. Enshrining the same deity Kibitsuhiko-no-Mikoto, the shrine is known for its elegant stone stairway approach flanked by ancient pine trees. The summer solstice alignment of the shrine's main hall with the rising sun has attracted scholarly interest as evidence of intentional solar worship design.",
        coordinate: CLLocationCoordinate2D(latitude: 34.6680, longitude: 133.8550),
        stampSlotId: 254,
        category: .jinja,
        tagline: "Bizen's Ichinomiya — sister shrine of Kibitsu on the ancient Kibi Plain",
        highlights: [
            "Ichinomiya (first shrine) of Bizen Province — the region's highest-ranking shrine",
            "Graceful stone stairway approach lined with ancient pines",
            "Summer solstice sunrise aligns perfectly with the main hall",
            "Connected to the Momotaro legend alongside Kibitsu Jinja"
        ],
        mustSee: "Climb the stone stairway approach from the main road through the towering pine trees — the quiet, stately ascent gives the shrine a distinctly regal feeling that reflects its status as Bizen's most important shrine.",
        tips: [
            "Only a short walk or bike ride from Kibitsu Jinja — visit both together",
            "The Kibi Plain cycling route (about 17 km) connects this shrine with several others and ancient burial mounds",
            "Less crowded than Kibitsu Jinja, making it ideal for quiet contemplation",
            "The peach motifs throughout reflect the Momotaro connection — look for them on charms and ema"
        ],
        bestSeason: "Jun 21 (summer solstice sunrise alignment), Apr (cherry blossoms), Year-round",
        access: "3 min walk from Bizen-Ichinomiya Station (JR Kibi Line)",
        hours: "6:00-18:00",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000006-0000-0000-0000-000000000255")!,
        name: "Hofu Tenmangu",
        address: "14-1 Matsuzakicho, Hofu, Yamaguchi",
        description: "Hofu Tenmangu is considered one of Japan's three great Tenjin shrines alongside Kitano Tenmangu in Kyoto and Dazaifu Tenmangu in Fukuoka. It was the first shrine built to enshrine Sugawara no Michizane, established in 904 AD — just one year after his death. The shrine sits atop a hill with a dramatic stone stairway, and its plum orchard of over 1,100 trees blooms beautifully each February.",
        coordinate: CLLocationCoordinate2D(latitude: 34.0500, longitude: 131.5750),
        stampSlotId: 255,
        category: .tenmangu,
        tagline: "Japan's first Tenjin shrine — where Michizane's spirit first descended",
        highlights: [
            "One of Japan's three great Tenjin shrines (Nihon San-dai Tenjin)",
            "First shrine built to enshrine Sugawara no Michizane (904 AD)",
            "Dramatic stone stairway approach climbing to the hilltop main hall",
            "Over 1,100 plum trees blooming in February"
        ],
        mustSee: "Climb the long stone stairway to the main hall and turn around — the panoramic view over Hofu city and the Seto Inland Sea from the hilltop is one of the finest shrine views in the Chugoku region.",
        tips: [
            "The plum blossom festival (Ume Matsuri) in February is the highlight of the year",
            "Students flock here before university entrance exams — buy a study success charm",
            "The Love Bridge on the grounds is popular with couples seeking romantic blessings",
            "Free parking available at the base of the hill"
        ],
        bestSeason: "Feb-Mar (plum blossoms), Jan (New Year's hatsumode), Year-round",
        access: "15 min walk from Hofu Station (JR San-yo Line)",
        hours: "6:00-20:00",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000006-0000-0000-0000-000000000256")!,
        name: "Senko-ji",
        address: "15-1 Higashitsuchidocho, Onomichi, Hiroshima",
        description: "Perched on the hilltop overlooking the port town of Onomichi, Senko-ji offers some of the most breathtaking panoramic views of the Seto Inland Sea and its island-dotted expanse. Founded in 806 AD by Kobo Daishi, the temple is famous for its massive rock formations, including the Tama-no-Iwa (Jewel Rock) that glows at sunset. The ropeway ride up the hillside passes through cherry and maple canopies that are spectacular in spring and autumn.",
        coordinate: CLLocationCoordinate2D(latitude: 34.4080, longitude: 133.2010),
        stampSlotId: 256,
        category: .tera,
        tagline: "Hilltop temple with the finest Inland Sea panorama in Japan",
        highlights: [
            "Panoramic views of the Seto Inland Sea and Shimanami Kaido islands",
            "Tama-no-Iwa (Jewel Rock) — a massive boulder that glows red at sunset",
            "Ropeway ride through cherry blossom and maple canopies",
            "Part of Onomichi's famous hillside temple walk (25 temples)"
        ],
        mustSee: "Take the ropeway up and walk to the observatory platform — the sweeping view of the Seto Inland Sea dotted with islands stretching to the Shimanami Kaido bridges is unforgettable, especially at sunset.",
        tips: [
            "The ropeway runs every 15 minutes and costs 500 yen one way — walk down through the temple trail instead of riding back",
            "Combine with the Onomichi Temple Walk, a hillside path connecting 25 temples",
            "Onomichi is a famous cat town — look for cats sunning themselves along the temple paths",
            "The Shimanami Kaido cycling route starts from Onomichi — a world-class island-hopping ride"
        ],
        bestSeason: "Apr (cherry blossoms from the ropeway), Nov (autumn maple), Year-round for views",
        access: "15 min walk from Onomichi Station (JR San-yo Line) to ropeway base",
        hours: "9:00-17:15 (ropeway), temple grounds open dawn to dusk",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000006-0000-0000-0000-000000000257")!,
        name: "Miho Jinja",
        address: "608 Mihoseki-cho, Matsue, Shimane",
        description: "Located on the tip of the Miho Peninsula in Shimane, Miho Jinja is the head shrine for Ebisu worship throughout Japan, enshrining Kotoshironushi-no-Kami (identified with Ebisu, the god of fishing and commerce). The shrine is renowned for its sacred kagura music performances, and its collection of over 1,000 musical instruments has earned it the nickname 'the shrine of music.' The harbor setting with fishing boats bobbing nearby gives it a uniquely maritime atmosphere.",
        coordinate: CLLocationCoordinate2D(latitude: 35.5620, longitude: 133.3140),
        stampSlotId: 257,
        category: .jinja,
        tagline: "Head of all Ebisu shrines — where sacred music meets the sea",
        highlights: [
            "Head shrine of all Ebisu shrines in Japan — center of Ebisu worship",
            "Sacred kagura music performances with ancient instruments",
            "Collection of over 1,000 musical instruments — the 'shrine of music'",
            "Scenic harbor location at the tip of Miho Peninsula"
        ],
        mustSee: "Attend a kagura music performance if possible — the ancient instruments and ritual dance in this seaside shrine create an atmosphere found nowhere else in Japan. Check with the shrine office for performance schedules.",
        tips: [
            "The Aofushigaki-torii approach to the shrine runs through a corridor of aged pine trees along the coast",
            "Combine with a visit to Izumo Taisha (about 40 min drive) for a complete Shimane shrine pilgrimage",
            "The nearby Mihonoseki lighthouse offers stunning coastal views",
            "Try fresh seafood at the harbor — the fishing village is famous for crab and squid"
        ],
        bestSeason: "May (maritime festivals), Dec 3 (Morotabune sacred boat festival), Year-round",
        access: "40 min by bus from Matsue Station (JR San-in Line) to Mihonoseki",
        hours: "8:30-17:00",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000006-0000-0000-0000-000000000258")!,
        name: "Yaegaki Jinja",
        address: "227 Sakusacho, Matsue, Shimane",
        description: "Yaegaki Jinja is one of Japan's most famous marriage shrines, dedicated to the love story of Susanoo and Kushinadahime from the Izumo creation myths. The shrine's Mirror Pond (Kagami no Ike) fortune-telling ritual is its most popular attraction: visitors place a thin paper fortune with a coin on the water's surface — if it sinks quickly and stays nearby, love will come soon from someone close by. The shrine's paintings of Susanoo and Kushinadahime are among the oldest shrine paintings in Japan.",
        coordinate: CLLocationCoordinate2D(latitude: 35.4090, longitude: 133.1010),
        stampSlotId: 258,
        category: .jinja,
        tagline: "Japan's beloved marriage shrine with its famous mirror pond fortune",
        highlights: [
            "Mirror Pond (Kagami no Ike) love fortune-telling with floating paper",
            "Enshrines the mythical love story of Susanoo and Kushinadahime",
            "Some of the oldest shrine paintings in Japan (designated Important Cultural Properties)",
            "One of the most powerful marriage-blessing shrines in the Izumo region"
        ],
        mustSee: "Try the Mirror Pond fortune: place the thin paper fortune (with a coin on top) on the water's surface and watch — if it sinks quickly and stays near you, love will come soon from someone nearby. If it drifts far before sinking, your future partner may come from afar.",
        tips: [
            "The love fortune papers (100 yen) are available at the shrine office — do not skip this experience",
            "The pond is in the forest behind the main hall, about a 5-minute walk",
            "Combine with Kamosu Jinja and Izumo Taisha for a full Shimane shrine pilgrimage",
            "Couples visiting together can buy matching marriage charms (en-musubi omamori)"
        ],
        bestSeason: "Year-round (love fortunes work rain or shine), Apr (cherry blossoms around the pond)",
        access: "20 min by bus from Matsue Station (JR San-in Line) to Yaegaki Jinja",
        hours: "9:00-17:00",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000006-0000-0000-0000-000000000259")!,
        name: "Ruriko-ji",
        address: "2-1-1 Koudanicho, Yamaguchi, Yamaguchi",
        description: "Ruriko-ji is home to one of Japan's three most celebrated five-story pagodas, designated a National Treasure. Built in 1442 during the Muromachi period by the Ouchi clan, the elegant pagoda stands reflected in a tranquil garden pond against a backdrop of forested hills. The temple grounds also serve as the resting place of the Mori clan lords who ruled the region during the feudal era.",
        coordinate: CLLocationCoordinate2D(latitude: 34.1850, longitude: 131.4750),
        stampSlotId: 259,
        category: .tera,
        tagline: "A National Treasure pagoda mirrored in Yamaguchi's tranquil garden",
        highlights: [
            "National Treasure five-story pagoda — one of Japan's three most beautiful",
            "Elegant reflection of the pagoda in the garden pond",
            "Muromachi-period (1442) architecture of the Ouchi clan",
            "Mori clan lords' burial grounds within the temple precincts"
        ],
        mustSee: "Stand at the edge of the garden pond in the late afternoon when the National Treasure pagoda is reflected perfectly in the still water — it is considered one of the most elegant pagoda views in all of Japan.",
        tips: [
            "Yamaguchi was once called the 'Kyoto of the West' — the Ouchi lords modeled the city after Kyoto",
            "The autumn foliage around the pagoda pond is spectacular in mid-November",
            "Admission is 200 yen for the grounds; the treasure house is an additional 300 yen",
            "Combine with a visit to the Xavier Memorial Church nearby — Yamaguchi was one of the first places Christianity was introduced in Japan"
        ],
        bestSeason: "Nov (autumn foliage reflected in the pond), Apr (cherry blossoms), Year-round",
        access: "20 min walk from Yamaguchi Station (JR Yamaguchi Line) or 5 min by bus",
        hours: "9:00-17:00 (grounds accessible dawn to dusk)",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000006-0000-0000-0000-000000000260")!,
        name: "Izumo Daijingu",
        address: "Miyamae-cho, Chitose, Kameoka, Kyoto",
        description: "Known as 'Moto-Izumo' (the Original Izumo), Izumo Daijingu in Kameoka is believed by some scholars to predate even the famous Izumo Taisha in Shimane. The shrine enshrines Okuninushi-no-Mikoto, the deity of nation-building and matchmaking, and sits at the base of sacred Mount Mikage. The ancient forest surrounding the shrine contains massive rocks believed to be the dwelling places of deities, creating an atmosphere of primordial spiritual power.",
        coordinate: CLLocationCoordinate2D(latitude: 35.1020, longitude: 135.5350),
        stampSlotId: 260,
        category: .jinja,
        tagline: "The 'Original Izumo' — possibly older than Izumo Taisha itself",
        highlights: [
            "Claimed to be more ancient than the famous Izumo Taisha in Shimane",
            "Sacred Mount Mikage rising behind the shrine with massive divine rocks (iwakura)",
            "Powerful matchmaking and en-musubi (relationship tying) blessings",
            "Ancient forest with an atmosphere of untouched primordial spirituality"
        ],
        mustSee: "Hike up the path behind the main hall to the sacred rock formations (iwakura) on Mount Mikage — these massive boulders, believed to be the seats of gods, create an atmosphere of raw spiritual power unlike any manicured shrine garden.",
        tips: [
            "Located in Kameoka on the Kyoto-Shimane border — accessible from Kyoto as a day trip",
            "The shrine is less visited than Izumo Taisha, offering a much more intimate and quiet experience",
            "Water from the sacred spring is considered to have purifying properties",
            "The autumn foliage on Mount Mikage is outstanding in November"
        ],
        bestSeason: "Nov (autumn foliage on Mount Mikage), Year-round",
        access: "10 min by taxi from Chitose Station (JR San-in Line) or 15 min by bus",
        hours: "Open 24 hours (shrine office 9:00-17:00)",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000006-0000-0000-0000-000000000261")!,
        name: "Akama Jingu",
        address: "4-1 Amidaijimachi, Shimonoseki, Yamaguchi",
        description: "Akama Jingu is a striking vermillion shrine built on the shores of the Kanmon Strait in Shimonoseki, enshrining the child Emperor Antoku who drowned at age eight during the decisive naval Battle of Dan-no-ura in 1185. The shrine's vibrant red Dragon Palace Gate (Suiten-mon) was designed to evoke the undersea palace from Japanese mythology, reflecting the belief that the young emperor's spirit resides beneath the waves. The adjacent memorial cemetery contains the graves of the Heike warriors who perished in the battle.",
        coordinate: CLLocationCoordinate2D(latitude: 33.9590, longitude: 130.9480),
        stampSlotId: 261,
        category: .jingu,
        tagline: "A crimson sea-gate shrine for a child emperor lost beneath the waves",
        highlights: [
            "Striking Dragon Palace Gate (Suiten-mon) in vivid vermillion facing the strait",
            "Enshrines 8-year-old Emperor Antoku, who perished in the Battle of Dan-no-ura",
            "Heike warrior memorial cemetery — graves of the fallen Taira clan",
            "Sentei Matsuri festival in May reenacts the tragic 1185 naval battle"
        ],
        mustSee: "Stand before the Suiten-mon (Dragon Palace Gate) facing the Kanmon Strait — the bright red gate set against the blue water evokes the mythical undersea palace and the tragic fate of the child emperor beneath these very waves.",
        tips: [
            "The Sentei Matsuri on May 2-4 features a grand procession and reenactment of the Battle of Dan-no-ura",
            "The Hoichi Hall (Hoichi-do) commemorates the ghost story 'Hoichi the Earless' set at this shrine",
            "Walk along the strait to see the Kanmon Bridge connecting Honshu and Kyushu",
            "Shimonoseki is famous for fugu (pufferfish) — try it at the nearby Karato Market"
        ],
        bestSeason: "May 2-4 (Sentei Matsuri), Year-round",
        access: "10 min by bus from Shimonoseki Station (JR San-yo Line) to Akama Jingu-mae",
        hours: "9:00-17:00 (grounds accessible dawn to dusk)",
        imageURLs: []
    ),

    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    // MARK: - Shikoku
    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

    Shrine(
        id: UUID(uuidString: "00000006-0000-0000-0000-000000000262")!,
        name: "Kotohira-gu",
        address: "892-1 Kotohira-cho, Nakatado-gun, Kagawa",
        description: "Kotohira-gu, affectionately known as 'Konpira-san,' is famous throughout Japan for its extraordinarily long stone staircase — 1,368 steps to the inner shrine at the summit. Dedicated to Omononushi-no-Kami, the guardian deity of seafarers, it has been one of Japan's most popular pilgrimage destinations since the Edo period. The main shrine at 785 steps offers sweeping views over the Sanuki Plain, while the truly dedicated continue to the inner shrine 583 steps further.",
        coordinate: CLLocationCoordinate2D(latitude: 34.1787, longitude: 133.8187),
        stampSlotId: 262,
        category: .jinja,
        tagline: "1,368 stone steps to heaven — Japan's most famous staircase shrine",
        highlights: [
            "1,368 stone steps to the inner shrine — Japan's most famous staircase",
            "Main shrine at 785 steps with panoramic views of the Sanuki Plain",
            "Guardian deity of seafarers — worshipped by sailors for centuries",
            "Edo-period pilgrimage tradition still alive with porters and palanquins"
        ],
        mustSee: "Climb to the main shrine at step 785 and take in the panoramic view of the Sanuki Plain below — then, if your legs allow, push on 583 more steps to the inner shrine (Oku-sha) where the most spectacular cliffside view awaits.",
        tips: [
            "The first 785 steps to the main shrine take about 30-40 minutes at a steady pace",
            "Palanquin bearers (kago-ya) will carry you partway for a fee — a traditional Edo-era service",
            "Try the famous Sanuki udon noodles in the town at the base of the stairs",
            "Walking sticks are available for rent at the bottom — highly recommended for the descent"
        ],
        bestSeason: "Apr (cherry blossoms along the stairway), Nov (autumn colors), spring and autumn for comfortable climbing",
        access: "10 min walk from Kotohira Station (JR Dosan Line) or Kotoden-Kotohira Station",
        hours: "6:00-17:00 (main shrine area)",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000006-0000-0000-0000-000000000263")!,
        name: "Zentsu-ji",
        address: "3-3-1 Zentsuji-cho, Zentsuji, Kagawa",
        description: "Zentsu-ji is the birthplace of Kukai (Kobo Daishi), the founder of Shingon Buddhism and one of the most important figures in Japanese religious history. As Temple #75 on the Shikoku 88 Temple Pilgrimage, it holds special significance as the largest temple on the circuit. The Kaidan Meguri (underground passage) beneath the main hall lets visitors walk in complete darkness, symbolizing spiritual rebirth through Kobo Daishi's teachings.",
        coordinate: CLLocationCoordinate2D(latitude: 34.2250, longitude: 133.7790),
        stampSlotId: 263,
        category: .tera,
        tagline: "Birthplace of Kobo Daishi — the cradle of Shingon Buddhism",
        highlights: [
            "Birthplace of Kukai (Kobo Daishi), founder of Shingon Buddhism",
            "Temple #75 on the Shikoku 88 Temple Pilgrimage — the largest temple on the circuit",
            "Kaidan Meguri underground passage walk in total darkness",
            "Five-story pagoda and massive temple complex spanning two precincts"
        ],
        mustSee: "Experience the Kaidan Meguri — a pitch-dark underground passage beneath the main hall where you follow a railing in total blindness, touching a Buddhist mandala lock at the center. It symbolizes dying and being reborn through Kobo Daishi's grace.",
        tips: [
            "The Kaidan Meguri costs 500 yen and takes about 10 minutes — it can be disorienting in the darkness",
            "The temple spans two precincts (east and west) connected by a long corridor — allow 60-90 minutes",
            "The five-story pagoda was rebuilt in 1845 and is one of the tallest in Shikoku",
            "Combine with Kotohira-gu (15 min away) for a full day in western Kagawa"
        ],
        bestSeason: "Apr (cherry blossoms), Nov (autumn foliage), Year-round",
        access: "15 min walk from Zentsuji Station (JR Dosan Line)",
        hours: "7:00-17:00",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000006-0000-0000-0000-000000000264")!,
        name: "Ishite-ji",
        address: "2-9-21 Ishite, Matsuyama, Ehime",
        description: "Ishite-ji (Temple #51 on the Shikoku Pilgrimage) is one of the most unusual temples in Japan, featuring a mysterious cave tunnel that burrows through a hillside into a surreal underground passage filled with Buddhist statues, lanterns, and spiritual artwork. The temple's Niomon gate is a National Treasure from the Kamakura period. Named after the legend of a child born clutching a stone inscribed with the name of pilgrimage founder Emon Saburo, the temple blurs the line between the sacred and the fantastical.",
        coordinate: CLLocationCoordinate2D(latitude: 33.8530, longitude: 132.7960),
        stampSlotId: 264,
        category: .tera,
        tagline: "A cave tunnel into the surreal — Shikoku's most mysterious temple",
        highlights: [
            "Mysterious cave tunnel filled with Buddhist statues and eerie lighting",
            "Niomon gate — a National Treasure from the Kamakura period",
            "Temple #51 on the Shikoku 88 Temple Pilgrimage",
            "Named after the stone-clutching child of the Emon Saburo legend"
        ],
        mustSee: "Walk through the cave tunnel behind the main hall — it burrows through the hillside into a dimly lit underground passage packed with Buddhist statues, carvings, and lanterns. It emerges on the other side of the hill in a surprising garden.",
        tips: [
            "The cave tunnel is free and open during temple hours — bring a small flashlight for the darker sections",
            "Combine with a visit to Dogo Onsen (5 min by bus), one of Japan's oldest hot springs",
            "The Niomon gate dates to 1318 and is considered one of the finest in Shikoku",
            "The temple complex is sprawling and eclectic — allow at least 45 minutes to explore fully"
        ],
        bestSeason: "Year-round (the cave is especially atmospheric on rainy days)",
        access: "15 min by bus from Matsuyama Station or Dogo Onsen Station to Ishite-ji-mae",
        hours: "7:00-17:00",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000006-0000-0000-0000-000000000265")!,
        name: "Oyamazumi Jinja",
        address: "3327 Miyaura, Omishima-cho, Imabari, Ehime",
        description: "Located on the island of Omishima along the Shimanami Kaido cycling route, Oyamazumi Jinja houses the greatest collection of samurai armor and weapons in Japan — over 80% of all nationally designated armor and helmet treasures are kept here. The shrine is dedicated to Oyamatsumi-no-Kami, the deity of mountains, seas, and war, and has been the spiritual guardian of warriors since ancient times. A 2,600-year-old sacred camphor tree stands in the precincts as a natural monument.",
        coordinate: CLLocationCoordinate2D(latitude: 34.2489, longitude: 133.0023),
        stampSlotId: 265,
        category: .jinja,
        tagline: "Japan's greatest samurai armor treasury on a sacred island",
        highlights: [
            "Houses over 80% of Japan's nationally designated samurai armor and weapons",
            "2,600-year-old sacred camphor tree — one of the oldest living things in Japan",
            "Island shrine on the Shimanami Kaido cycling route",
            "Deity of mountains, seas, and war — worshipped by warriors for millennia"
        ],
        mustSee: "Visit the treasure hall museum — the sheer volume of samurai armor, helmets, swords, and weapons spanning over 1,000 years is staggering. Many pieces were donated by victorious warriors returning from battle and cannot be seen anywhere else.",
        tips: [
            "The treasure hall (1,000 yen) contains National Treasure-class armor — allow at least 45 minutes",
            "The shrine is on Omishima island along the Shimanami Kaido — perfect for a cycling day trip",
            "The 2,600-year-old camphor tree in the precincts is awe-inspiring — one of the oldest in Japan",
            "Ferries from Imabari or access via the Shimanami Kaido bridges by car or bicycle"
        ],
        bestSeason: "Apr (cherry blossoms), Year-round (museum is excellent in any weather)",
        access: "25 min by bus from Omishima BS (Shimanami Kaido bus) or ferry from Imabari Port",
        hours: "8:15-17:00 (treasure hall closes 16:30)",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000006-0000-0000-0000-000000000266")!,
        name: "Ryozen-ji",
        address: "126 Bando Tsukahana, Naruto, Tokushima",
        description: "Ryozen-ji is Temple #1 on the famous Shikoku 88 Temple Pilgrimage, making it the symbolic starting point for one of the world's great pilgrimage routes. Thousands of henro (pilgrims) begin their 1,200-kilometer journey here each year, receiving their white pilgrim vest, conical hat, and walking staff at the temple's pilgrimage supply shop. The temple's atmosphere buzzes with the excitement and trepidation of those about to embark on a life-changing spiritual walk.",
        coordinate: CLLocationCoordinate2D(latitude: 34.1570, longitude: 134.5070),
        stampSlotId: 266,
        category: .tera,
        tagline: "Where the 1,200 km Shikoku Pilgrimage begins",
        highlights: [
            "Temple #1 — the official starting point of the Shikoku 88 Temple Pilgrimage",
            "Pilgrims outfit themselves here with white vest, hat, and walking staff",
            "1,200-kilometer circular route beginning and ending in Tokushima",
            "Buzzing atmosphere of anticipation from pilgrims starting their journey"
        ],
        mustSee: "Watch pilgrims being outfitted with their white vests, conical sedge hats, and kongozue staffs at the pilgrimage supply shop — the moment they step through the gate to begin their 88-temple, 1,200 km journey is deeply moving.",
        tips: [
            "Even non-pilgrims can purchase a stamp book (nokyocho) and collect the temple seal here",
            "The pilgrimage supply shop sells everything needed — full pilgrim outfit costs about 10,000 yen",
            "Try the Naruto whirlpool boat tour nearby (30 min drive) for a Tokushima nature experience",
            "The temple is also the traditional ending point — returning pilgrims report their completion here"
        ],
        bestSeason: "Mar-May (spring pilgrimage season), Oct-Nov (autumn pilgrimage season)",
        access: "20 min by bus from Bando Station (JR Naruto Line) or 10 min by taxi",
        hours: "7:00-17:00",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000006-0000-0000-0000-000000000267")!,
        name: "Okubo-ji",
        address: "96 Tawa Maeyama, Sanuki, Kagawa",
        description: "Okubo-ji is Temple #88, the final destination of the Shikoku 88 Temple Pilgrimage. For henro who have walked the entire 1,200-kilometer circuit, arriving at this mountain temple is an overwhelming emotional experience. The Daishi Hall is filled with walking staffs left behind by completed pilgrims who no longer need them, and the walls are covered with prayers and gratitude messages. Surrounded by dense forest at the base of Mount Nyotai, the temple exudes a sense of hard-earned peace.",
        coordinate: CLLocationCoordinate2D(latitude: 34.1980, longitude: 134.2050),
        stampSlotId: 267,
        category: .tera,
        tagline: "The final step — where 1,200 kilometers of pilgrimage reaches its end",
        highlights: [
            "Temple #88 — the emotional completion point of the Shikoku Pilgrimage",
            "Daishi Hall filled with pilgrims' walking staffs and gratitude messages",
            "Mountain setting surrounded by dense ancient forest at Mount Nyotai",
            "Profound atmosphere of peace and spiritual accomplishment"
        ],
        mustSee: "Visit the Daishi Hall where completed pilgrims leave their kongozue walking staffs — hundreds of staffs lean against the walls alongside handwritten letters of gratitude. The emotion embedded in this room is palpable.",
        tips: [
            "Even if you haven't walked the entire pilgrimage, visiting #88 to witness the pilgrims' completion is moving",
            "The mountain approach road is narrow and winding — take care if driving",
            "The temple stamp (nokyo) for #88 carries special significance — a fitting conclusion to a stamp book",
            "After completing #88, tradition says you should return to #1 (Ryozen-ji) to report your completion"
        ],
        bestSeason: "Mar-May and Oct-Nov (pilgrimage seasons), Year-round",
        access: "40 min by community bus from Nagao Station (Takamatsu-Kotohira Electric Railway) or taxi",
        hours: "7:00-17:00",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000006-0000-0000-0000-000000000268")!,
        name: "Iwaya-ji",
        address: "1468 Nanakawa Hata, Kumakogen, Kamiukena-gun, Ehime",
        description: "Temple #45 on the Shikoku Pilgrimage, Iwaya-ji is dramatically carved into a sheer cliff face deep in the mountains of Ehime Prefecture. The main hall is built directly against the overhanging rock wall, and massive boulders frame the approach like natural cathedral pillars. Kobo Daishi is said to have practiced fierce ascetic training on these cliffs, and wooden ladders and chains still cling to the rock face for those brave enough to attempt the original climbing route.",
        coordinate: CLLocationCoordinate2D(latitude: 33.7140, longitude: 132.9900),
        stampSlotId: 268,
        category: .tera,
        tagline: "A cliff-face temple where Kobo Daishi trained among the boulders",
        highlights: [
            "Main hall built directly into a towering cliff face",
            "Massive boulders framing the approach like natural cathedral pillars",
            "Kobo Daishi's ascetic training site with original ladders and chains",
            "Temple #45 on the Shikoku 88 Temple Pilgrimage — one of the most dramatic"
        ],
        mustSee: "Stand beneath the main hall and look up at the overhanging cliff face towering above — the way the wooden temple is wedged into the rock is a testament to extreme devotion. The scale of the boulders along the approach is awe-inspiring.",
        tips: [
            "The mountain road to the temple is narrow and steep — drive carefully or take a taxi",
            "Wear sturdy shoes — the approach involves uneven stone steps and natural rock",
            "The climbing chains on the cliff face are for experienced climbers only — extremely dangerous",
            "One of the most remote temples on the pilgrimage — allow extra travel time"
        ],
        bestSeason: "May-Jun (fresh green forest), Oct-Nov (autumn foliage), avoid winter ice",
        access: "45 min by taxi from Kumakogen Town center or by car on Route 12",
        hours: "7:00-17:00",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000006-0000-0000-0000-000000000269")!,
        name: "Yashima-ji",
        address: "1808 Yashima Higashimachi, Takamatsu, Kagawa",
        description: "Perched atop the flat-topped Yashima plateau overlooking Takamatsu and the Seto Inland Sea, Yashima-ji (Temple #84 on the Shikoku Pilgrimage) combines stunning natural scenery with the history of the Genpei War's Battle of Yashima in 1185. The temple is famous for its collection of tanuki (raccoon dog) statues — hundreds of ceramic tanuki in various poses line the approach, reflecting the local legend that tanuki transformed into monks to help build the temple.",
        coordinate: CLLocationCoordinate2D(latitude: 34.3630, longitude: 134.1010),
        stampSlotId: 269,
        category: .tera,
        tagline: "Hilltop temple of tanuki statues with sweeping Inland Sea views",
        highlights: [
            "Panoramic views of the Seto Inland Sea from the Yashima plateau",
            "Hundreds of tanuki (raccoon dog) statues lining the approach",
            "Historic site of the 1185 Battle of Yashima (Genpei War)",
            "Temple #84 on the Shikoku 88 Temple Pilgrimage"
        ],
        mustSee: "Walk to the observation platform at the edge of the Yashima plateau — the sweeping panorama of Takamatsu city, the Seto Inland Sea islands, and the Great Seto Bridge in the distance is one of the finest views in Shikoku.",
        tips: [
            "A shuttle bus runs from JR Yashima Station to the mountaintop, or you can hike up (about 40 min)",
            "The kawarake clay disc throwing tradition lets you toss discs off the cliff for good luck",
            "Visit the Yashima Battle memorial sites nearby to learn about the Genpei War history",
            "The nearby Shikoku Mura open-air museum showcases traditional Shikoku village architecture"
        ],
        bestSeason: "Year-round (views are best on clear days), Apr (cherry blossoms), Nov (autumn colors)",
        access: "Shuttle bus from Yashima Station (JR Kotoku Line) to mountaintop, 10 min",
        hours: "7:00-17:00",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000006-0000-0000-0000-000000000270")!,
        name: "Unpen-ji",
        address: "763-2 Hakuchi, Miyoshi, Tokushima",
        description: "At 927 meters above sea level, Unpen-ji is the highest temple on the Shikoku 88 Temple Pilgrimage (Temple #66), earning it the nickname 'the temple above the clouds.' The main hall sits among dense mountain forest often shrouded in mist, and the approach features 500 colorful arhat (rakan) statues with individually expressive faces scattered through the woods. A ropeway carries visitors up the mountain, offering spectacular views of the Iya Valley and surrounding peaks.",
        coordinate: CLLocationCoordinate2D(latitude: 34.0180, longitude: 133.7840),
        stampSlotId: 270,
        category: .tera,
        tagline: "The highest temple on the pilgrimage — above the clouds at 927 meters",
        highlights: [
            "Highest temple on the Shikoku Pilgrimage at 927 meters elevation",
            "500 colorful arhat (rakan) statues with unique expressive faces",
            "Often shrouded in mountain mist — the 'temple above the clouds'",
            "Ropeway ride with spectacular mountain and valley views"
        ],
        mustSee: "Walk among the 500 arhat statues scattered through the misty forest — each has a uniquely carved and painted face expressing different emotions. In the fog, they appear almost alive among the trees.",
        tips: [
            "The ropeway (2,200 yen round trip) runs from the Kagawa side and takes about 7 minutes",
            "Bring warm clothing — temperatures at the summit can be 5-10 degrees cooler than below",
            "Mist and cloud cover are common — this adds to the mystical atmosphere",
            "The temple is on the border of Tokushima and Kagawa prefectures"
        ],
        bestSeason: "Jun-Jul (hydrangea), Oct-Nov (autumn foliage above the clouds), spring for clear views",
        access: "Ropeway from Unpenji Ropeway Station (15 min drive from Ikeda IC on Tokushima Expressway)",
        hours: "7:00-17:00 (ropeway 7:20-17:00, seasonal variations)",
        imageURLs: []
    ),

    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    // MARK: - Kyushu
    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

    Shrine(
        id: UUID(uuidString: "00000006-0000-0000-0000-000000000271")!,
        name: "Munakata Taisha",
        address: "2331 Tahiru, Munakata, Fukuoka",
        description: "Munakata Taisha is a UNESCO World Heritage Site comprising three shrines dedicated to three goddess sisters who protect seafarers crossing between Japan and the Asian continent. The most sacred of the three, Okitsumiya on the remote island of Okinoshima, is one of the most restricted religious sites in the world — women are entirely prohibited from the island, and male visitors must undergo a purification ritual in the sea. The accessible mainland Hetsu-miya shrine contains the Shinpokan treasure house with over 80,000 ritual artifacts from ancient maritime offerings.",
        coordinate: CLLocationCoordinate2D(latitude: 33.8300, longitude: 130.5140),
        stampSlotId: 271,
        category: .taisha,
        tagline: "UNESCO site of three sea goddesses guarding the ancient sea route",
        highlights: [
            "UNESCO World Heritage Site — 'the Shosoin of the Sea'",
            "Three shrines dedicated to three goddess sisters protecting seafarers",
            "Shinpokan treasure house with 80,000 ancient ritual artifacts",
            "Okinoshima — one of the most restricted sacred islands in the world"
        ],
        mustSee: "Visit the Shinpokan treasure house at the mainland Hetsu-miya shrine — the 80,000 ritual objects (many National Treasures) recovered from Okinoshima island represent over 500 years of ancient maritime offerings and are breathtaking in their quantity and quality.",
        tips: [
            "Most visitors can only access Hetsu-miya (mainland) and Nakatsu-miya (Oshima island)",
            "Okinoshima is off-limits except for a few selected men each May 27 — the island itself is a god",
            "The ferry to Oshima island (Nakatsu-miya) takes 25 minutes from Kono-minato port",
            "Located between Fukuoka and Kitakyushu — about 1 hour from either city"
        ],
        bestSeason: "Year-round (museum is excellent in any weather), Oct 1-3 (Munakata Autumn Grand Festival)",
        access: "10 min by bus from Togo Station (JR Kagoshima Line) to Munakata Taisha-mae",
        hours: "Open 24 hours (Shinpokan treasure house 9:00-16:30)",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000006-0000-0000-0000-000000000272")!,
        name: "Kushida Jinja",
        address: "1-41 Kamikawabata-machi, Hakata, Fukuoka",
        description: "Known affectionately as 'Okushida-san,' Kushida Jinja has been the guardian shrine of Hakata for over 1,250 years and is the spiritual home of the Hakata Gion Yamakasa festival — one of Japan's most exciting and physically intense festivals. Each July, teams of men in loincloths race through the streets carrying massive, elaborately decorated floats (kakiyama) weighing over a ton. A permanent display float is on view year-round inside the shrine grounds.",
        coordinate: CLLocationCoordinate2D(latitude: 33.5910, longitude: 130.4088),
        stampSlotId: 272,
        category: .jinja,
        tagline: "Hakata's guardian and home of Japan's most thrilling float race",
        highlights: [
            "Spiritual home of Hakata Gion Yamakasa festival (July 1-15)",
            "Year-round display of a massive decorated kazari-yama float",
            "Guardian of Hakata for over 1,250 years",
            "Hakata Machiya Folk Museum next door for local craft demonstrations"
        ],
        mustSee: "See the permanent kazari-yama display float inside the shrine compound — these towering, elaborately decorated structures stand over 10 meters tall and give you a sense of the incredible scale of the Yamakasa festival floats.",
        tips: [
            "The Yamakasa climax on July 15 at 4:59 AM — the Oiyama race — is electrifying, but arrive very early",
            "Setsubun festival in February features a massive bean-throwing ceremony from the stage",
            "Located in the heart of Hakata's entertainment district — combine with yatai food stall dining",
            "Free entry; the shrine is compact and can be visited in 20-30 minutes"
        ],
        bestSeason: "Jul 1-15 (Yamakasa Festival, climax Jul 15), Feb (Setsubun), Year-round",
        access: "8 min walk from Gion Station (Fukuoka Subway Kuko Line) or Nakasu-Kawabata Station",
        hours: "Open 24 hours (shrine office 9:00-17:00)",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000006-0000-0000-0000-000000000273")!,
        name: "Usa Jingu",
        address: "2859 Minami-Usa, Usa, Oita",
        description: "Usa Jingu is the head shrine of all 44,000 Hachiman shrines across Japan, making it one of the most historically significant shrines in the country. Founded in 725 AD, it enshrines Emperor Ojin as the deity Hachiman — the god of archery and war who later became a protector of the nation. The shrine's unique architecture features paired main halls (joined by a corridor) in the distinctive Hachiman-zukuri style, and its location atop a forested hill gives it a commanding, regal atmosphere.",
        coordinate: CLLocationCoordinate2D(latitude: 33.5280, longitude: 131.3730),
        stampSlotId: 273,
        category: .jingu,
        tagline: "Head of all 44,000 Hachiman shrines in Japan",
        highlights: [
            "Head shrine (sohonsha) of all 44,000 Hachiman shrines nationwide",
            "Unique Hachiman-zukuri paired main halls connected by a corridor",
            "Founded in 725 AD — over 1,300 years of unbroken worship",
            "Forested hilltop setting with a grand stairway approach"
        ],
        mustSee: "Climb the stone stairway through the forest to the paired main halls at the top — the distinctive Hachiman-zukuri architecture, with two halls joined by a corridor, is the prototype for all Hachiman shrines in Japan.",
        tips: [
            "The shrine uses a unique two-bow, four-clap, one-bow prayer style instead of the usual two claps",
            "The Kunimi no Oka viewpoint nearby offers panoramic views of the Kunisaki Peninsula",
            "Combine with a visit to Kunisaki Peninsula's ancient stone Buddhist sites for a full Oita day",
            "The approach passes through ancient forest — walk slowly and enjoy the atmosphere"
        ],
        bestSeason: "Year-round, Oct (autumn festival with mikoshi procession)",
        access: "10 min by bus from Usa Station (JR Nippo Line) to Usa Jingu",
        hours: "5:30-21:00 (Apr-Sep), 6:00-21:00 (Oct-Mar)",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000006-0000-0000-0000-000000000274")!,
        name: "Hikosan Jingu",
        address: "1 Hikosan, Soeda-machi, Tagawa-gun, Fukuoka",
        description: "Hikosan Jingu sits atop Mount Hiko, one of the three most sacred mountains of Shugendo (mountain asceticism) in Japan alongside Kumano and Haguro. For over 1,300 years, yamabushi (mountain monks) have trained on these slopes, and the mountain's spiritual energy is considered exceptionally powerful. The approach features an extraordinary copper torii gate and ancient cedar forest, while the upper shrine near the summit requires a challenging mountain hike.",
        coordinate: CLLocationCoordinate2D(latitude: 33.4770, longitude: 130.9310),
        stampSlotId: 274,
        category: .jingu,
        tagline: "Sacred mountain of the yamabushi — Kyushu's center of mountain asceticism",
        highlights: [
            "One of Japan's three great Shugendo sacred mountains",
            "Over 1,300 years of yamabushi mountain monk training",
            "Magnificent copper torii gate and ancient cedar forest approach",
            "Upper shrine near the 1,200m summit with panoramic mountain views"
        ],
        mustSee: "Hike through the ancient cedar forest from the lower shrine to the upper shrine — the towering trees, stone steps worn smooth by centuries of yamabushi footsteps, and increasingly wild mountain atmosphere create a profound sense of entering sacred space.",
        tips: [
            "The lower shrine is accessible by car; the upper shrine requires a 90-minute mountain hike",
            "A slope car (slope-railway) assists with part of the climb to the lower shrine area",
            "Autumn foliage on Mount Hiko is considered among the finest in Kyushu (early to mid-November)",
            "Shugendo fire-walking ceremonies are held several times a year — check the schedule"
        ],
        bestSeason: "Nov (spectacular mountain autumn foliage), May (fresh green), Year-round for training atmosphere",
        access: "20 min by bus from Hikosan Station (JR Hitahikosan Line) to the lower trailhead",
        hours: "Open 24 hours (shrine office 9:00-17:00)",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000006-0000-0000-0000-000000000275")!,
        name: "Yutoku Inari Jinja",
        address: "1692 Fureda Otsu, Kashima, Saga",
        description: "Yutoku Inari Jinja is one of Japan's three great Inari shrines, alongside Fushimi Inari in Kyoto and Kasama Inari in Ibaraki. What sets it apart is its dramatic cliff-face architecture — the main hall is built on stilts jutting out from a steep mountainside, creating a vertiginous spectacle similar to Kyoto's Kiyomizu-dera but in vivid vermillion. The shrine draws nearly 3 million visitors during the New Year's period alone, making it one of the most popular in Kyushu.",
        coordinate: CLLocationCoordinate2D(latitude: 33.0590, longitude: 130.0910),
        stampSlotId: 275,
        category: .inari,
        tagline: "One of Japan's three great Inari shrines — a vermillion cliff spectacle",
        highlights: [
            "One of Japan's three great Inari shrines",
            "Dramatic stilted main hall built into a cliff face — 'Kiyomizu of Kyushu'",
            "Nearly 3 million visitors during New Year's hatsumode",
            "Elevator to the hilltop observatory with sweeping views of the Ariake Sea"
        ],
        mustSee: "Take the elevator (300 yen) to the hilltop observatory for a bird's-eye view of the entire vermillion shrine complex clinging to the cliff face below — then walk down through the shrine's multiple levels to the main hall.",
        tips: [
            "The Japanese Garden (Tokuzen Garden) at the base is beautifully designed — don't skip it",
            "Hatsumode (New Year's visit) draws enormous crowds — January 1-3 requires patience",
            "The shrine is a 15-minute detour from the Nagasaki-Saga expressway — easy to add to a road trip",
            "Try the local kashima dango (rice dumplings) sold at shops along the approach"
        ],
        bestSeason: "Jan (New Year's hatsumode), Apr (cherry blossoms), Nov (autumn foliage in the garden)",
        access: "10 min by bus or taxi from Hizen-Kashima Station (JR Nagasaki Line)",
        hours: "Open 24 hours (elevator and garden 8:30-16:30)",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000006-0000-0000-0000-000000000276")!,
        name: "Suwa Jinja Nagasaki",
        address: "18-15 Kamibashimachi, Nagasaki",
        description: "Perched on a hilltop overlooking Nagasaki, Suwa Jinja has served as the city's main guardian shrine since 1625, protecting it through centuries of foreign contact, persecution, and atomic devastation. The shrine is most famous as the home of the Nagasaki Kunchi festival, a vibrant October celebration blending Japanese, Chinese, and Dutch cultural influences — reflecting Nagasaki's unique history as Japan's window to the world during two centuries of national isolation.",
        coordinate: CLLocationCoordinate2D(latitude: 32.7480, longitude: 129.8810),
        stampSlotId: 276,
        category: .jinja,
        tagline: "Nagasaki's guardian — where Japanese, Chinese, and Dutch cultures merge in festival",
        highlights: [
            "Home of Nagasaki Kunchi festival — a fusion of Japanese, Chinese, and Dutch traditions",
            "Guardian of Nagasaki for nearly 400 years through extraordinary historical upheaval",
            "Hilltop location with panoramic views over Nagasaki harbor",
            "73 stone steps — the same stairs featured in the Kunchi dragon dance"
        ],
        mustSee: "Climb the 73 stone steps to the main shrine and look back down over Nagasaki harbor — this is the same stairway where the spectacular dragon dance descends during the Kunchi festival, and the view captures the entire city's history.",
        tips: [
            "Nagasaki Kunchi festival (October 7-9) features the famous dragon dance on these stairs — a must-see",
            "The shrine's unique komainu (guardian dogs) include one that reverses bad luck when you rub it",
            "Combine with nearby Nagasaki attractions — Peace Park, Glover Garden, and Chinatown",
            "The Suwa no Mori nature park behind the shrine offers quiet woodland walks"
        ],
        bestSeason: "Oct 7-9 (Nagasaki Kunchi Festival), Year-round",
        access: "3 min walk from Suwa-jinja Station (Nagasaki Streetcar Line 3 or 4)",
        hours: "Open 24 hours (shrine office 9:00-17:00)",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000006-0000-0000-0000-000000000277")!,
        name: "Kato Jinja",
        address: "2-1 Honmaru, Chuo-ku, Kumamoto",
        description: "Located within the grounds of Kumamoto Castle, Kato Jinja enshrines Kato Kiyomasa, the legendary feudal lord and master castle builder who constructed Kumamoto Castle in 1607. The shrine offers one of the best vantage points for viewing the castle's impressive stone walls and towers. After the devastating 2016 Kumamoto earthquakes, the shrine became a symbol of resilience as visitors came to pray for the city's recovery while watching the castle's painstaking restoration progress.",
        coordinate: CLLocationCoordinate2D(latitude: 32.8060, longitude: 130.7080),
        stampSlotId: 277,
        category: .jinja,
        tagline: "Shrine of the castle builder — watching over Kumamoto's resurrection",
        highlights: [
            "Enshrines Kato Kiyomasa, legendary builder of Kumamoto Castle",
            "Located within Kumamoto Castle grounds with excellent castle views",
            "Symbol of resilience after the 2016 Kumamoto earthquakes",
            "Best accessible viewpoint for the castle during ongoing restoration"
        ],
        mustSee: "From the shrine grounds, look up at Kumamoto Castle's massive stone walls and restored tower — this is the closest freely accessible viewpoint and gives you a direct sense of the scale and engineering genius of Kato Kiyomasa's masterwork.",
        tips: [
            "The shrine is free to enter even when parts of the castle grounds are under restoration",
            "Kumamoto Castle's restoration from the 2016 earthquake damage is an ongoing engineering marvel worth witnessing",
            "The ginkgo tree in the shrine grounds was allegedly planted by Kiyomasa himself — 400 years old",
            "Combine with a walk along the castle's outer walls and nearby Shimada Museum"
        ],
        bestSeason: "Apr (cherry blossoms around the castle), Year-round",
        access: "5 min walk from Kumamotojo-mae tram stop (Kumamoto City Tram)",
        hours: "Open 24 hours (shrine office 8:30-17:00)",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000006-0000-0000-0000-000000000278")!,
        name: "Aso Jinja",
        address: "3083-1 Ichinomiya-machi Miyaji, Aso, Kumamoto",
        description: "One of the oldest shrines in Japan with over 2,300 years of history, Aso Jinja sits at the foot of Mount Aso — the largest active volcanic caldera in the world. The shrine enshrines Takeiwatatsu-no-Mikoto, the grandson of the mythical first emperor Jimmu, and 12 related deities. After the 2016 Kumamoto earthquake severely damaged the iconic two-story Romon gate and haiden worship hall, the shrine underwent a major restoration that was completed in 2023, allowing visitors to once again admire its architectural grandeur.",
        coordinate: CLLocationCoordinate2D(latitude: 32.9490, longitude: 131.1210),
        stampSlotId: 278,
        category: .jinja,
        tagline: "Ancient shrine at the foot of the world's largest volcanic caldera",
        highlights: [
            "Over 2,300 years of history — one of Japan's oldest shrines",
            "Located at the base of Mount Aso, the world's largest active caldera",
            "Restored Romon gate and haiden worship hall after 2016 earthquake damage",
            "Enshrines the grandson of Japan's mythical first emperor"
        ],
        mustSee: "Stand before the magnificently restored Romon gate — its reconstruction from near-total collapse after the 2016 earthquake is a testament to the enduring devotion of the Aso community. The volcanic peaks of Mount Aso rise dramatically behind the shrine.",
        tips: [
            "The Romon gate restoration was completed in December 2023 — it now looks as grand as it did before the earthquake",
            "Combine with a drive to the Mount Aso crater (30 min) for one of the most dramatic volcanic landscapes in Japan",
            "The natural spring water (Jinja no Mizukumi) at the shrine is famous — bring a bottle to fill",
            "The Aso area has excellent onsen (hot springs) — stay overnight for the full volcanic experience"
        ],
        bestSeason: "Apr-May (fresh green grasslands), Oct-Nov (autumn susuki grass on Aso), Year-round",
        access: "10 min walk from Miyaji Station (JR Hohi Line)",
        hours: "6:00-18:00 (shrine office 9:00-17:00)",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000006-0000-0000-0000-000000000279")!,
        name: "Takachiho Jinja",
        address: "1037 Mitai, Takachiho-cho, Nishiusuki-gun, Miyazaki",
        description: "Takachiho Jinja is the spiritual heart of one of Japan's most sacred mythological landscapes — the place where the grandson of sun goddess Amaterasu is said to have descended from heaven to rule the earth. The shrine, surrounded by 800-year-old cedar trees, has been a center of worship for over 1,900 years. Every evening, the shrine hosts a performance of Yokagura — sacred night dances depicting scenes from Japanese mythology that have been performed continuously for centuries.",
        coordinate: CLLocationCoordinate2D(latitude: 32.7130, longitude: 131.3070),
        stampSlotId: 279,
        category: .jinja,
        tagline: "Where the gods descended to earth — the cradle of Japanese mythology",
        highlights: [
            "Site where Ninigi-no-Mikoto descended from heaven in Japanese mythology",
            "Nightly Yokagura sacred dance performances depicting creation myths",
            "800-year-old cedar trees surrounding the shrine precincts",
            "Over 1,900 years of worship in Japan's most mythologically significant landscape"
        ],
        mustSee: "Attend the nightly Yokagura dance performance (8 PM, 1,000 yen) — masked dancers perform four episodes from the Japanese creation myths in the shrine's kagura hall. It is one of the most authentic and moving traditional performances in Japan.",
        tips: [
            "Yokagura performances run nightly at 8 PM year-round — arrive 15-20 minutes early for seating",
            "Walk to nearby Takachiho Gorge (10 min) to see the spectacular 80-meter columnar basalt cliffs and waterfall",
            "Boat rides on the Takachiho Gorge river are extremely popular — book early or arrive at opening",
            "The area is remote — consider staying overnight to fully experience both the gorge and the evening kagura"
        ],
        bestSeason: "Year-round (nightly kagura), Nov (autumn foliage in Takachiho Gorge)",
        access: "10 min walk from Takachiho Bus Center (bus from Kumamoto or Nobeoka, 2.5-3 hours)",
        hours: "Open 24 hours (Yokagura performances at 20:00 nightly)",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000006-0000-0000-0000-000000000280")!,
        name: "Amanoiwato Jinja",
        address: "1073-1 Iwato, Takachiho-cho, Nishiusuki-gun, Miyazaki",
        description: "Amanoiwato Jinja marks the sacred cave (Ama-no-Iwato) where, according to Japanese mythology, the sun goddess Amaterasu hid herself, plunging the world into darkness. The other gods devised a plan to lure her out through music and dance, and when she peeked out, light returned to the world. The cave itself can only be viewed from a special prayer point guided by a shrine priest — photography is forbidden. Nearby Amano-Yasukawara, a shallow river cave where the gods are said to have deliberated their plan, is one of the most hauntingly atmospheric spots in Japan.",
        coordinate: CLLocationCoordinate2D(latitude: 32.7350, longitude: 131.3550),
        stampSlotId: 280,
        category: .jinja,
        tagline: "The cave where the sun goddess hid — and the world went dark",
        highlights: [
            "Sacred cave where Amaterasu (sun goddess) hid, plunging the world into darkness",
            "Guided viewing of the actual cave with a shrine priest (no photography)",
            "Amano-Yasukawara cave — hauntingly beautiful deliberation site of the gods",
            "Central shrine of Japan's most important creation myth"
        ],
        mustSee: "Walk downstream to Amano-Yasukawara — a shallow cave beneath an overhanging cliff where thousands of stacked stone cairns fill the space. According to myth, the gods gathered here to plan how to lure Amaterasu from her cave. The atmosphere is profoundly otherworldly.",
        tips: [
            "Ask at the shrine office for a guided viewing of the cave — a priest will escort you to a sacred overlook point",
            "The cave viewing is free but photography is strictly prohibited — respect this deeply held rule",
            "Amano-Yasukawara is a 10-minute walk along the river from the shrine — do not skip it",
            "Combine with Takachiho Jinja (15 min drive) for the complete mythology experience"
        ],
        bestSeason: "Year-round (the cave and Yasukawara are atmospheric in any season)",
        access: "10 min by taxi from Takachiho Bus Center, or 30 min walk",
        hours: "Open 24 hours (guided cave viewing 8:30-17:00)",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000006-0000-0000-0000-000000000281")!,
        name: "Miyazaki Jingu",
        address: "2-4-1 Jingu, Miyazaki",
        description: "Miyazaki Jingu enshrines Emperor Jimmu, the mythical first emperor of Japan who is said to have begun his eastern campaign to unify Japan from this very region. Set within a vast sacred forest of towering cedars, camphor trees, and Japanese pines, the shrine has an atmosphere of ancient, undisturbed tranquility. The grounds also contain the Miyazaki Prefectural Museum of Nature and History, and a grove of wild miniature horses unique to Miyazaki graze near the shrine.",
        coordinate: CLLocationCoordinate2D(latitude: 31.9370, longitude: 131.4350),
        stampSlotId: 281,
        category: .jingu,
        tagline: "Shrine of Japan's first emperor — where the nation's founding myth begins",
        highlights: [
            "Enshrines Emperor Jimmu, the mythical founder of Japan",
            "Vast sacred forest of ancient cedars and camphor trees",
            "Miyazaki-jingu Grand Festival in October with horseback archery (yabusame)",
            "Wild Misaki miniature horses grazing near the shrine grounds"
        ],
        mustSee: "Walk the long approach through the ancient forest to the main hall — the towering cedars and camphor trees create a cathedral-like canopy overhead, and the deep quiet evokes the mythical origins of the Japanese nation.",
        tips: [
            "The Grand Festival in late October features dramatic yabusame (horseback archery) along the approach road",
            "The forest walk from the main road to the shrine takes about 15 minutes and is deeply peaceful",
            "The Miyazaki Prefectural Museum on the grounds is free and excellent for understanding local history",
            "Miyazaki's famous chicken nanban (fried chicken with tartar sauce) is a must-try local dish"
        ],
        bestSeason: "Oct (Grand Festival with yabusame), Apr (cherry blossoms in the forest), Year-round",
        access: "10 min walk from Miyazaki-Jingu Station (JR Nippo Line)",
        hours: "Open 24 hours (shrine office 9:00-17:00)",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000006-0000-0000-0000-000000000282")!,
        name: "Udo Jingu",
        address: "3232 Miyaura, Nichinan, Miyazaki",
        description: "Udo Jingu is one of Japan's most uniquely situated shrines — its main hall is built inside a natural sea cave on a cliff overlooking the Pacific Ocean. According to mythology, the cave is where the mother of Japan's first emperor gave birth, and the breast-shaped rocks (Ochichi-iwa) inside the cave are said to still drip nourishing water. Visitors throw undama (lucky clay balls) at a rope-marked rock on a turtle-shaped stone below the cliff — landing one inside the rope ring is said to grant a wish.",
        coordinate: CLLocationCoordinate2D(latitude: 31.6430, longitude: 131.4190),
        stampSlotId: 282,
        category: .jingu,
        tagline: "A sea cave shrine on the Pacific cliffs where legends were born",
        highlights: [
            "Main hall built inside a natural sea cave on a Pacific Ocean cliff",
            "Undama clay ball throwing ritual — land one in the rope ring for good luck",
            "Ochichi-iwa (breast-shaped rocks) dripping sacred water inside the cave",
            "Dramatic Pacific coastline with wave-carved rock formations"
        ],
        mustSee: "Enter the cave shrine and witness the main hall nestled inside the rock, with the Ochichi-iwa formation dripping water. Then try throwing undama clay balls (5 for 100 yen) at the turtle-shaped rock target below the cliff — men throw left-handed, women right-handed.",
        tips: [
            "The approach descends steep stairs down the cliff face — wear non-slip shoes",
            "Men throw undama with the left hand, women with the right — part of the tradition",
            "The coastal drive along the Nichinan Coast (Route 220) to and from the shrine is spectacular",
            "Combine with nearby Sun Messe Nichinan (replica Moai statues) for a unique Miyazaki day"
        ],
        bestSeason: "Year-round (Pacific views are always dramatic), spring and autumn for comfortable weather",
        access: "20 min by bus from Aburatsu Station (JR Nichinan Line) to Udo Jingu",
        hours: "6:00-18:00 (Apr-Sep 6:00-19:00)",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000006-0000-0000-0000-000000000283")!,
        name: "Aoshima Jinja",
        address: "2-13-1 Aoshima, Miyazaki",
        description: "Aoshima Jinja sits on tiny Aoshima Island, a subtropical islet just 1.5 kilometers in circumference, connected to the mainland by a pedestrian bridge. The island is completely surrounded by the 'Devil's Washboard' (Oni no Sentakuita) — dramatic wave-cut rock platforms of layered sandstone and mudstone that extend in concentric rings around the island. The shrine, nestled in a dense subtropical forest of Betel palms and ferns, enshrines the deity of marriage and safe voyages.",
        coordinate: CLLocationCoordinate2D(latitude: 31.8020, longitude: 131.4700),
        stampSlotId: 283,
        category: .jinja,
        tagline: "Subtropical island shrine encircled by the Devil's Washboard rocks",
        highlights: [
            "Tiny subtropical island shrine connected by a pedestrian bridge",
            "Oni no Sentakuita (Devil's Washboard) — dramatic concentric rock formations",
            "Dense subtropical forest of Betel palms surrounding the shrine",
            "Powerful blessings for marriage and romantic relationships"
        ],
        mustSee: "Cross the bridge to the island and walk around the perimeter to see the Devil's Washboard rock formations at low tide — the concentric wave-cut platforms extending outward from the island are a geological wonder and a surreal, almost alien landscape.",
        tips: [
            "Check the tide schedule — the Devil's Washboard formations are most impressive at low tide",
            "The subtropical forest in the island's interior is lush and tropical — unlike anywhere else in mainland Japan",
            "The shrine's en-musubi (marriage blessing) charms are popular — ring the bell for romantic luck",
            "Combine with a visit to Udo Jingu (30 min drive south) for a complete Miyazaki coastal shrine day"
        ],
        bestSeason: "Year-round (subtropical climate), Apr-Jun for comfortable weather",
        access: "10 min walk from Aoshima Station (JR Nichinan Line)",
        hours: "Open 24 hours (shrine office 8:00-17:00)",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000006-0000-0000-0000-000000000284")!,
        name: "Kirishima Jingu",
        address: "2608-5 Kirishima Taguchi, Kirishima, Kagoshima",
        description: "Kirishima Jingu is the mythological shrine where Ninigi-no-Mikoto, grandson of the sun goddess Amaterasu, is said to have descended from heaven to earth, marking the divine origin of the Japanese imperial line. The current shrine, rebuilt in 1715 by the Shimazu clan lords, sits at 500 meters elevation on the slopes of the Kirishima volcanic range and is surrounded by ancient cedar forest. The vivid vermillion main hall with its elaborate carvings is considered one of the finest examples of shrine architecture in southern Japan.",
        coordinate: CLLocationCoordinate2D(latitude: 31.8565, longitude: 130.8710),
        stampSlotId: 284,
        category: .jingu,
        tagline: "Where the gods descended — the mythical birthplace of the imperial line",
        highlights: [
            "Mythological site of the divine descent (tenson korin) from heaven to earth",
            "Vivid vermillion main hall rebuilt by the Shimazu clan in 1715",
            "500m elevation on the slopes of the sacred Kirishima volcanic range",
            "Ancient sacred cedar trees including a legendary 800-year-old specimen"
        ],
        mustSee: "Stand before the vermillion main hall framed by ancient cedars on the volcanic mountainside and contemplate that, according to Japanese mythology, this is where heaven met earth — the gods' landing point on the sacred peaks above.",
        tips: [
            "The Kirishima mountain range offers excellent hiking — Takachiho Peak (1,574m) is a popular day hike from nearby",
            "Kirishima Onsen hot springs town (10 min drive) has excellent volcanic hot spring baths",
            "The sacred Sakaki tree (himorogi) in the shrine grounds is said to be the descendant of the one the gods planted",
            "Combine with the Kirishima Geopark for volcanic landscapes and crater lakes"
        ],
        bestSeason: "May-Jun (Miyama Kirishima azalea blooming on the mountains), Nov (autumn foliage), Year-round",
        access: "15 min by bus from Kirishima-Jingu Station (JR Nippo Line)",
        hours: "Open 24 hours (shrine office 8:00-17:00)",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000006-0000-0000-0000-000000000285")!,
        name: "Terukuni Jinja",
        address: "19-35 Terukuni-cho, Kagoshima",
        description: "Terukuni Jinja is Kagoshima's most important shrine, enshrining Shimazu Nariakira — the visionary 28th lord of the Satsuma domain whose modernization efforts helped lay the groundwork for the Meiji Restoration and Japan's transformation into a modern nation. The shrine sits in the heart of Kagoshima city with Sakurajima volcano as its dramatic backdrop, and its annual Rokugatsudo lantern festival in July fills the shrine with thousands of colorful paper lanterns.",
        coordinate: CLLocationCoordinate2D(latitude: 31.5960, longitude: 130.5520),
        stampSlotId: 285,
        category: .jinja,
        tagline: "Kagoshima's main shrine — honoring the visionary lord who modernized Japan",
        highlights: [
            "Enshrines Shimazu Nariakira, visionary lord of Satsuma who helped spark the Meiji Restoration",
            "Sakurajima volcano as a dramatic natural backdrop",
            "Rokugatsudo Festival in July — thousands of colorful paper lanterns",
            "Central Kagoshima location — the spiritual heart of the Satsuma domain"
        ],
        mustSee: "Visit during the Rokugatsudo Festival (mid-July) when thousands of brightly decorated paper lanterns transform the shrine grounds into a magical, glowing wonderland — one of the most beautiful summer festival sights in Kyushu.",
        tips: [
            "The Rokugatsudo Festival runs for about two weeks in mid-July — evening visits are most atmospheric",
            "The nearby Sengan-en garden (former Shimazu clan villa) is a must-visit for Kagoshima history",
            "Try local Kagoshima kurobuta (black pork) tonkatsu at restaurants near the shrine",
            "Sakurajima ferry terminal is a short tram ride away — take the ferry for the iconic volcanic island experience"
        ],
        bestSeason: "Jul (Rokugatsudo Festival), Year-round (Sakurajima views are always dramatic)",
        access: "5 min walk from Tenmonkan-dori tram stop (Kagoshima City Tram)",
        hours: "Open 24 hours (shrine office 8:30-17:00)",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000006-0000-0000-0000-000000000286")!,
        name: "Izumi Jinja",
        address: "8-1 Suizenji-koen, Chuo-ku, Kumamoto",
        description: "Izumi Jinja is a tranquil shrine set within Kumamoto's celebrated Suizenji Jojuen Garden, a 350-year-old strolling garden designed to represent the 53 stations of the old Tokaido road in miniature. The garden's centerpiece is a miniature Mount Fuji made of sculpted turf, reflected in a spring-fed pond of crystal-clear water. The shrine enshrines the Hosokawa clan lords who created and maintained this garden masterpiece for generations.",
        coordinate: CLLocationCoordinate2D(latitude: 32.7870, longitude: 130.7260),
        stampSlotId: 286,
        category: .jinja,
        tagline: "Shrine in Kumamoto's gem — a miniature Tokaido road in a strolling garden",
        highlights: [
            "Set within the beautiful Suizenji Jojuen strolling garden",
            "Miniature Mount Fuji sculpted from turf, reflected in a spring-fed pond",
            "350-year-old garden representing the 53 stations of the Tokaido road",
            "Crystal-clear spring water (komyo-sui) feeding the garden pond"
        ],
        mustSee: "Walk the garden circuit past the miniature Mount Fuji and look across the spring-fed pond — the perfect reflection of the turf cone in the crystal-clear water is one of the most serene and photogenic garden scenes in Kyushu.",
        tips: [
            "Garden admission is 400 yen — allow about 40 minutes for the full circuit walk",
            "The spring water is considered sacred and exceptionally pure — you can drink from the source",
            "Combine with Kato Jinja and Kumamoto Castle for a full Kumamoto historical day",
            "The garden's miniature landscapes are best appreciated slowly — take your time with each scene"
        ],
        bestSeason: "Year-round (each season brings different colors to the garden), Mar-Apr (cherry blossoms), Nov (autumn foliage)",
        access: "3 min walk from Suizenji-koen Station (Kumamoto City Tram)",
        hours: "7:30-18:00 (Mar-Oct), 8:30-17:00 (Nov-Feb)",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000006-0000-0000-0000-000000000287")!,
        name: "Shikanoshima Jinja",
        address: "877 Shikanoshima, Higashi-ku, Fukuoka",
        description: "Shikanoshima Jinja (also known as Shikaumi Jinja) is an ancient shrine on Shikanoshima Island in Hakata Bay, dedicated to the Watatsumi sea deities. The island is famous as the discovery site of the gold seal (Kin-in) bestowed by the Chinese Han Dynasty in 57 AD — one of the most important archaeological finds in Japanese history. The shrine has protected seafarers for over 1,800 years and its seaside location offers sweeping views of Hakata Bay and the Fukuoka coastline.",
        coordinate: CLLocationCoordinate2D(latitude: 33.6650, longitude: 130.3540),
        stampSlotId: 287,
        category: .jinja,
        tagline: "Ancient sea deity shrine on the island where the gold seal was found",
        highlights: [
            "Ancient sea deity shrine with over 1,800 years of history",
            "Island where the famous Han Dynasty gold seal (57 AD) was discovered",
            "Watatsumi sea god worship — protector of fishermen and seafarers",
            "Sweeping views of Hakata Bay from the island shrine"
        ],
        mustSee: "Visit the shrine on the hillside and look out over Hakata Bay — then walk to the Gold Seal Park on the island's northern tip where a monument marks the exact spot where the priceless Han Dynasty gold seal was unearthed in 1784.",
        tips: [
            "Shikanoshima is connected to the mainland by a road across a sandbar — accessible by car or bus",
            "The Gold Seal (Kin-in) itself is displayed at the Fukuoka City Museum, not on the island",
            "Fresh seafood restaurants on the island serve excellent sashimi and grilled fish",
            "The island can be circumnavigated by bicycle in about 1-2 hours — rental bikes available"
        ],
        bestSeason: "Year-round (ocean views), Summer for beach activities nearby",
        access: "30 min by bus from Hakata Station (Nishitetsu Bus) to Shikanoshima",
        hours: "Open 24 hours (shrine office 9:00-17:00)",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000006-0000-0000-0000-000000000288")!,
        name: "Sumiyoshi Jinja Hakata",
        address: "3-1-51 Sumiyoshi, Hakata, Fukuoka",
        description: "Sumiyoshi Jinja in Hakata is believed to be the oldest Sumiyoshi shrine in Japan, predating even the famous Sumiyoshi Taisha in Osaka. Founded during Empress Jingu's legendary campaign to Korea in the 3rd century, it enshrines the three Sumiyoshi sea deities alongside the empress herself. The shrine's main hall, built in the distinctive Sumiyoshi-zukuri style with a straight roof line (unlike typical curved shrine roofs), is one of the purest examples of ancient shrine architecture in Japan.",
        coordinate: CLLocationCoordinate2D(latitude: 33.5950, longitude: 130.4000),
        stampSlotId: 288,
        category: .jinja,
        tagline: "The oldest Sumiyoshi shrine — ancient architecture in the heart of Hakata",
        highlights: [
            "Believed to be the oldest Sumiyoshi shrine in Japan — predating Osaka's",
            "Founded during Empress Jingu's legendary Korean campaign (3rd century)",
            "Pure Sumiyoshi-zukuri architecture with characteristic straight roof lines",
            "Quiet sanctuary in the heart of bustling Hakata"
        ],
        mustSee: "Study the main hall's Sumiyoshi-zukuri architectural style — the perfectly straight roof line (without the curved eaves seen at most shrines) represents one of the oldest and purest forms of shrine architecture preserved in Japan.",
        tips: [
            "The shrine is in central Hakata and can be visited quickly between other Fukuoka sightseeing",
            "The annual Sumiyoshi Festival in October features a portable shrine procession through Hakata",
            "A quiet refuge from the bustle of nearby Hakata Station — perfect for a moment of calm",
            "Combine with nearby Canal City Hakata shopping complex and Kushida Jinja for a Hakata walk"
        ],
        bestSeason: "Oct (Sumiyoshi Festival), Year-round",
        access: "10 min walk from Hakata Station (JR San-yo Shinkansen / Fukuoka Subway)",
        hours: "Open 24 hours (shrine office 9:00-17:00)",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000006-0000-0000-0000-000000000289")!,
        name: "Kashii-gu",
        address: "4-16-1 Kashii, Higashi-ku, Fukuoka",
        description: "Kashii-gu is one of Japan's most important imperial shrines, enshrining Emperor Chuai and Empress Jingu in a precinct of extraordinary natural beauty. The long approach road, lined with towering camphor and cedar trees, leads to ancient buildings set in a dense sacred forest. The shrine is unique in that it is one of only a handful in Japan where the Chokusei-sha designation has been granted — meaning the emperor personally sends an imperial envoy for the annual festival.",
        coordinate: CLLocationCoordinate2D(latitude: 33.6560, longitude: 130.4520),
        stampSlotId: 289,
        category: .jinja,
        tagline: "One of Japan's great imperial shrines in a towering camphor forest",
        highlights: [
            "One of Japan's most important imperial shrines (Chokusei-sha designation)",
            "Enshrines Emperor Chuai and the legendary Empress Jingu",
            "Magnificent camphor and cedar-lined approach road",
            "Dense sacred forest creating a cathedral-like atmosphere"
        ],
        mustSee: "Walk the long approach road through the towering camphor trees — the ancient forest canopy overhead creates a cathedral-like atmosphere that intensifies as you approach the main shrine buildings hidden deep within.",
        tips: [
            "The shrine is less visited than central Fukuoka shrines — ideal for a quiet, contemplative experience",
            "The camphor trees along the approach are among the oldest in Fukuoka Prefecture",
            "The Chokusei-sha annual festival (October) includes an imperial envoy — a rare and solemn event",
            "Combine with a visit to nearby Umi-no-Nakamichi Seaside Park for a family-friendly day"
        ],
        bestSeason: "Year-round (the forest is beautiful in every season), Apr (cherry blossoms), Nov (autumn colors)",
        access: "5 min walk from Kashii-gu-mae Station (Nishitetsu Kaizuka Line) or 10 min from JR Kashii Station",
        hours: "Open 24 hours (shrine office 9:00-17:00)",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000006-0000-0000-0000-000000000290")!,
        name: "Komyozen-ji",
        address: "2-16-1 Saifu, Dazaifu, Fukuoka",
        description: "Known as the 'Moss Temple of Kyushu,' Komyozen-ji is a small Zen temple tucked directly behind Dazaifu Tenmangu that most visitors walk right past. The temple's front garden is a stunning karesansui (dry rock garden) of raked white gravel and carefully placed stones, while the rear garden is a lush moss garden so green and dense it rivals Kyoto's famous Saihoji. The temple was founded in 1273 and remains a working Zen meditation center.",
        coordinate: CLLocationCoordinate2D(latitude: 33.5210, longitude: 130.5320),
        stampSlotId: 290,
        category: .tera,
        tagline: "The 'Moss Temple of Kyushu' — a hidden Zen gem behind Dazaifu",
        highlights: [
            "Front karesansui dry rock garden of raked white gravel and stones",
            "Rear moss garden rivaling Kyoto's famous Saihoji in lush green density",
            "Hidden gem directly behind Dazaifu Tenmangu — overlooked by most visitors",
            "Working Zen meditation center founded in 1273"
        ],
        mustSee: "Sit on the veranda of the main hall and gaze at the rear moss garden — the carpet of emerald green moss, punctuated by carefully placed stones and shaded by maples, is one of the most peaceful views in all of Kyushu. In autumn, fallen red maple leaves on the green moss create a natural masterpiece.",
        tips: [
            "Admission is 200 yen — a bargain for one of Kyushu's most beautiful gardens",
            "Located immediately behind Dazaifu Tenmangu — most visitors miss it entirely",
            "The moss garden is at its most vivid green after rain — a rainy day visit is recommended",
            "Photography of the rear garden from the veranda is permitted — take your time composing"
        ],
        bestSeason: "Jun-Jul (moss at peak green after rainy season), Nov (red maple leaves on green moss)",
        access: "7 min walk from Dazaifu Station (Nishitetsu Dazaifu Line), just behind Dazaifu Tenmangu",
        hours: "9:30-16:30 (closed during special Zen retreats)",
        imageURLs: []
    )
]
