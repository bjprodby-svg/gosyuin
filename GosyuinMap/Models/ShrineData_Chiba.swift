import SwiftUI
import CoreLocation

// MARK: - Chiba (18 shrines, ID 85-100 + 121-122)

let chibaShrines: [Shrine] = [

    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    // MARK: - Narita / Katori
    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

    Shrine(
        id: UUID(uuidString: "00000003-0000-0000-0000-000000000085")!,
        name: "Naritasan Shinshoji",
        address: "1 Narita, Narita, Chiba",
        description: "One of Japan's most visited temples, Naritasan Shinshoji draws over 10 million worshippers during the New Year period alone — making it one of the top three hatsumode destinations in the country. Founded in 940 AD during the Taira no Masakado rebellion, the temple is renowned for its dramatic goma fire rituals performed daily inside the Great Main Hall. The legendary kabuki actor Ichikawa Danjuro was so devoted to the temple's Fudo Myo-o deity that the Ichikawa acting lineage bears the yago 'Naritaya' in its honor.",
        coordinate: CLLocationCoordinate2D(latitude: 35.7847, longitude: 140.3181),
        stampSlotId: 85,
        category: .daishi,
        tagline: "10 million New Year pilgrims and sacred fire rituals since 940 AD",
        highlights: [
            "Over 10 million visitors at New Year — one of Japan's top 3 hatsumode sites",
            "Daily goma fire rituals with chanting monks in the Great Main Hall",
            "Kabuki connection — the Ichikawa Danjuro lineage bears the name 'Naritaya'",
            "Three-tiered pagoda and Great Peace Pagoda set in beautifully landscaped grounds"
        ],
        mustSee: "Attend the goma fire ritual inside the Great Main Hall — monks chant sutras as sacred flames leap upward to burn away worldly desires. The intensity of the heat and sound is unforgettable.",
        tips: [
            "The Omotesando approach street is lined with excellent unagi (eel) restaurants — a Narita specialty",
            "Just 10 minutes from Narita Airport, making it a perfect first or last stop in Japan",
            "Avoid New Year's week unless you want the full hatsumode crowd experience",
            "The expansive Naritasan Park behind the temple has ponds, waterfalls, and seasonal flowers"
        ],
        bestSeason: "New Year (hatsumode), Feb (plum blossoms in Naritasan Park), Nov (autumn leaves)",
        access: "10 min walk from Narita Station (JR Narita Line) or Keisei-Narita Station (Keisei Line)",
        hours: "Open 24 hours (main hall 6:00-16:00, goma rituals held multiple times daily)",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000003-0000-0000-0000-000000000086")!,
        name: "Katori Jingu",
        address: "1697-1 Katori, Katori, Chiba",
        description: "One of the 'three great shrines of the east' alongside Kashima Jingu and Ise Jingu, Katori Jingu has been a center of martial arts worship for over 2,600 years according to legend — founded in 643 BC. The shrine enshrines Futsunushi-no-Kami, the deity of martial arts and national defense, and its forested grounds include a tranquil deer park echoing the sacred deer tradition of Kashima and Nara. The striking black-lacquered main hall, rebuilt in 1700 by the fifth Tokugawa shogun, is a designated Important Cultural Property.",
        coordinate: CLLocationCoordinate2D(latitude: 35.8839, longitude: 140.5278),
        stampSlotId: 86,
        category: .jingu,
        tagline: "One of the three great shrines of the east — 2,600 years of martial spirit",
        highlights: [
            "One of Japan's 'three great shrines of the east' with Kashima and Ise",
            "Enshrines Futsunushi-no-Kami — the supreme deity of martial arts",
            "Black-lacquered main hall rebuilt in 1700 — Important Cultural Property",
            "Sacred deer park within the forested shrine grounds"
        ],
        mustSee: "Walk through the towering cedar-lined approach to the black-lacquered main hall — the contrast of the dark lacquer against the green forest canopy is stunning and unlike any other shrine in Japan.",
        tips: [
            "Visit alongside Kashima Jingu across the Tone River in Ibaraki for the full 'eastern shrine' experience",
            "The treasure house contains ancient swords and martial arts artifacts",
            "Far less crowded than Tokyo shrines — you may have the grounds nearly to yourself on weekdays",
            "The deer in the park are tame but not as forward as Nara's — a calmer experience"
        ],
        bestSeason: "Apr (cherry blossoms along the approach), Nov (autumn foliage), Year-round",
        access: "Taxi 10 min from Katori Station (JR Narita Line), or bus from Sawara Station",
        hours: "8:30-17:00 (grounds accessible dawn to dusk)",
        imageURLs: []
    ),

    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    // MARK: - Boso Peninsula (South)
    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

    Shrine(
        id: UUID(uuidString: "00000003-0000-0000-0000-000000000087")!,
        name: "Awa Jinja",
        address: "589 Tateyama, Tateyama, Chiba",
        description: "As the ichinomiya (top-ranked shrine) of ancient Awa Province, Awa Jinja has held the highest spiritual authority on the southern tip of the Boso Peninsula for over a thousand years. The shrine enshrines Amenohiwashi-no-Mikoto, the deity who guided the Awa people from Shikoku to this coast in ancient times. Perched on a peaceful hillside overlooking the Pacific Ocean, the shrine offers sweeping views of the sea and a profound sense of stillness far from the bustle of Tokyo.",
        coordinate: CLLocationCoordinate2D(latitude: 34.9917, longitude: 139.8628),
        stampSlotId: 87,
        category: .jinja,
        tagline: "Awa Province's highest-ranked shrine overlooking the Pacific",
        highlights: [
            "Ichinomiya (top-ranked shrine) of ancient Awa Province",
            "Enshrines Amenohiwashi-no-Mikoto — deity of the Awa migration legend",
            "Peaceful hillside setting with panoramic ocean views",
            "One of the Awa no Kuni shrines connecting Chiba to Shikoku mythology"
        ],
        mustSee: "Stand at the shrine grounds and look out toward the Pacific — on clear days you can see across to the Miura Peninsula, and the sound of the waves below blends with the rustling of the sacred grove.",
        tips: [
            "The shrine is well off the tourist trail — expect a quiet, meditative visit",
            "Combine with a trip to Tateyama's beaches and the Boso Flower Line coastal drive",
            "The Yawatano Yabusame horseback archery festival in September is worth timing your visit around",
            "Parking available on-site — a car is the most practical way to reach this shrine"
        ],
        bestSeason: "Sep (Yawatano Yabusame festival), Spring (wildflowers), Year-round",
        access: "Bus or taxi from Tateyama Station (JR Uchibo Line), about 10 min",
        hours: "Open dawn to dusk (free access)",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000003-0000-0000-0000-000000000094")!,
        name: "Tamasaki Jinja",
        address: "3048 Ichinomiya, Ichinomiya, Chiba",
        description: "As the ichinomiya of ancient Kazusa Province, Tamasaki Jinja has been the spiritual heart of central Boso for over 1,200 years. The shrine is most famous for its 'Hadaka Matsuri' (Naked Festival) every September, where thousands of men clad only in loincloths jostle and surge through the streets carrying portable shrines in one of Chiba's most dramatic festivals. Situated near the surfing mecca of Kujukuri Beach, the shrine blends ancient ritual with the laid-back coastal atmosphere of the Boso Peninsula.",
        coordinate: CLLocationCoordinate2D(latitude: 35.3703, longitude: 140.3692),
        stampSlotId: 94,
        category: .jinja,
        tagline: "Kazusa's ichinomiya — home of Chiba's wildest naked festival",
        highlights: [
            "Ichinomiya (top-ranked shrine) of ancient Kazusa Province",
            "Hadaka Matsuri (Naked Festival) in September — one of Chiba's most thrilling events",
            "Over 1,200 years of continuous worship on the Boso coast",
            "Near Kujukuri Beach — the longest beach in Japan"
        ],
        mustSee: "If visiting in September, the Hadaka Matsuri is an extraordinary spectacle — thousands of near-naked men surge through the streets carrying mikoshi while spectators cheer from every doorway and rooftop.",
        tips: [
            "The Hadaka Matsuri is held around the autumnal equinox in September — check exact dates each year",
            "Ichinomiya is also famous as a surfing destination — combine shrine and surf",
            "The shrine is quiet and reflective on non-festival days — a lovely contrast to the festival energy",
            "Access by car is easiest; parking available near the shrine"
        ],
        bestSeason: "Sep (Hadaka Matsuri), Summer (beach season nearby)",
        access: "5 min walk from Kazusa-Ichinomiya Station (JR Sotobo Line)",
        hours: "Open dawn to dusk (free access)",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000003-0000-0000-0000-000000000095")!,
        name: "Nihon-ji (Nokogiriyama)",
        address: "184-4 Motona, Kyonan, Chiba",
        description: "Carved into the dramatic cliffs of Nokogiriyama (Sawtooth Mountain), Nihon-ji is home to the Great Buddha of Nokogiriyama — a 31-meter stone Buddha that is actually larger than the famous one in Kamakura. The temple grounds spread across the mountainside and contain 1,553 individually carved stone Arhat statues, each with a unique expression. The most thrilling spot is 'Jigoku Nozoki' (Hell's Lookout), a cliff ledge jutting out over a sheer drop with views stretching across Tokyo Bay to Mount Fuji.",
        coordinate: CLLocationCoordinate2D(latitude: 35.1583, longitude: 139.8350),
        stampSlotId: 95,
        category: .tera,
        tagline: "A mountain temple with a Buddha bigger than Kamakura's and a cliff called Hell",
        highlights: [
            "31-meter Great Buddha — larger than Kamakura's famous Daibutsu",
            "Jigoku Nozoki (Hell's Lookout) — vertigo-inducing cliff overlook across Tokyo Bay",
            "1,553 individually carved stone Arhat statues scattered across the mountainside",
            "Accessible by the Nokogiriyama Ropeway for dramatic aerial views"
        ],
        mustSee: "Stand at Jigoku Nozoki and peer over the cliff edge — the sheer vertical drop and panoramic view of Tokyo Bay stretching to Mount Fuji will make your heart race. Then descend to the Great Buddha for a sense of profound calm.",
        tips: [
            "Take the Nokogiriyama Ropeway up and walk down through the temple for the best experience",
            "Wear sturdy shoes — the stone paths between Arhat statues are steep and can be slippery",
            "Allow 2-3 hours for the full mountain circuit including all major viewpoints",
            "The ropeway base is a short walk from Hamakanaya Station — accessible from Tokyo via the Uchibo Line"
        ],
        bestSeason: "Nov (autumn foliage on the mountain), Spring (clear days for Mt. Fuji views)",
        access: "Nokogiriyama Ropeway from Hamakanaya area, 3 min walk from Hamakanaya Station (JR Uchibo Line)",
        hours: "8:00-17:00 (ropeway hours vary seasonally)",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000003-0000-0000-0000-000000000096")!,
        name: "Tanjoji",
        address: "183 Kominato, Kamogawa, Chiba",
        description: "Tanjoji marks the exact birthplace of Nichiren, the founder of Nichiren Buddhism and one of the most influential religious figures in Japanese history. Founded in 1276, the temple faces the Pacific Ocean in a beautiful coastal setting where, according to tradition, lotus flowers bloomed in the sea and a spring of fresh water burst from the earth at the moment of Nichiren's birth in 1222. The main hall and its surrounding gardens offer a contemplative atmosphere backed by the sound of ocean waves.",
        coordinate: CLLocationCoordinate2D(latitude: 35.1033, longitude: 140.1039),
        stampSlotId: 96,
        category: .tera,
        tagline: "Where Nichiren was born — lotus flowers bloomed in the sea",
        highlights: [
            "Birthplace of Nichiren — founder of Nichiren Buddhism (born 1222)",
            "Tai-no-Ura: legendary spot where lotuses bloomed in the sea at Nichiren's birth",
            "Beautiful Pacific Ocean setting with waves audible from the temple grounds",
            "Founded 1276 by Nichiren's own disciple to mark his birthplace"
        ],
        mustSee: "Visit the Tai-no-Ura area near the temple where legend says lotus flowers bloomed in the ocean at the moment of Nichiren's birth. The coastal rocks and crashing waves create a powerful atmosphere.",
        tips: [
            "The temple is a pilgrimage site for Nichiren Buddhists — observe the devotional atmosphere respectfully",
            "Combine with Kamogawa SeaWorld or the scenic Boso coastal drive for a full day trip",
            "The area around Kominato is known for excellent seafood — try the local kinmedai (golden eye snapper)",
            "Morning visits are especially atmospheric when mist rises from the ocean"
        ],
        bestSeason: "Feb (Nichiren's birthday celebrations), Year-round (coastal beauty)",
        access: "Bus from Awa-Kominato Station (JR Sotobo Line), 5 min, or 20 min walk along the coast",
        hours: "9:00-17:00",
        imageURLs: []
    ),

    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    // MARK: - Chiba City
    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

    Shrine(
        id: UUID(uuidString: "00000003-0000-0000-0000-000000000088")!,
        name: "Chiba Jinja",
        address: "1-16-1 Inohana, Chuo, Chiba, Chiba",
        description: "The main shrine of Chiba city was founded around 1000 AD by Taira no Tadatsune, the powerful warrior who established the Chiba clan's dominance over the region. What makes Chiba Jinja unique is its worship of Myoken — the North Star deity — a rare astronomical connection that sets it apart from most shrines in Japan. The Chiba clan believed the North Star guided their military fortunes, and this celestial faith is still reflected in the shrine's rituals and iconography today.",
        coordinate: CLLocationCoordinate2D(latitude: 35.6108, longitude: 140.1222),
        stampSlotId: 88,
        category: .jinja,
        tagline: "A warrior shrine guided by the North Star for over 1,000 years",
        highlights: [
            "Founded by Taira no Tadatsune — origin of the powerful Chiba clan",
            "Rare Myoken (North Star deity) worship — unique astronomical connection",
            "Main guardian shrine of Chiba city for over 1,000 years",
            "Located on the historic Inohana hill overlooking Chiba Port"
        ],
        mustSee: "Look for the Myoken (North Star) motifs throughout the shrine — the star iconography in the carvings and decorations reflects a thousand-year-old tradition of celestial worship that is extraordinarily rare in Shinto.",
        tips: [
            "The shrine is on Inohana hill — combine with a stroll through Inohana Park and its castle ruins",
            "The annual Myoken Festival in August features a dramatic portable shrine procession",
            "Chiba Monorail (Chiba-koen Station) offers a fun suspended monorail ride to the shrine area",
            "A good starting point for exploring Chiba city's underrated historical sites"
        ],
        bestSeason: "Aug (Myoken Festival), Apr (cherry blossoms in Inohana Park), Year-round",
        access: "10 min walk from Chiba Station (JR Sobu Line/Chiba Monorail) or 3 min from Chiba-koen Station (Chiba Monorail)",
        hours: "6:00-17:00 (grounds open dawn to dusk)",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000003-0000-0000-0000-000000000091")!,
        name: "Inage Sengen Jinja",
        address: "1-15-10 Inage, Inage, Chiba, Chiba",
        description: "Over 1,200 years old, Inage Sengen Jinja enshrines Konohanasakuya-hime — the beautiful goddess of Mount Fuji and the patron deity of cherry blossoms and safe childbirth. Before extensive land reclamation transformed Chiba's coastline, this shrine stood right on the beach, and on clear days worshippers could see Mount Fuji directly across the water. Though the sea has retreated, the shrine still preserves that ancient connection between the land, the goddess, and the sacred mountain.",
        coordinate: CLLocationCoordinate2D(latitude: 35.6392, longitude: 140.0833),
        stampSlotId: 91,
        category: .jinja,
        tagline: "A 1,200-year-old beach shrine that once gazed across the sea to Mt. Fuji",
        highlights: [
            "Enshrines Konohanasakuya-hime — goddess of Mt. Fuji and cherry blossoms",
            "Over 1,200 years of history on the former Inage coastline",
            "Historically stood on the beach before land reclamation changed the shoreline",
            "Popular for safe childbirth and marriage prayers"
        ],
        mustSee: "Visit during cherry blossom season when the shrine grounds come alive with sakura — a fitting tribute to Konohanasakuya-hime, the goddess of cherry blossoms herself.",
        tips: [
            "The former Inage beach area is now Inage Seaside Park — combine for a half-day outing",
            "The shrine's New Year hatsumode draws large local crowds — arrive early on Jan 1",
            "Look for the Mt. Fuji connection in the shrine carvings and ema plaques",
            "A pleasant residential neighborhood shrine — quiet and reflective on weekdays"
        ],
        bestSeason: "Late Mar-Apr (cherry blossoms for the sakura goddess), New Year",
        access: "15 min walk from Inage Station (JR Sobu Line) or Keisei-Inage Station (Keisei Line)",
        hours: "Open dawn to dusk (free access)",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000003-0000-0000-0000-000000000100")!,
        name: "Kemigawa Jinja",
        address: "1-17-1 Makuhari-cho, Hanamigawa, Chiba, Chiba",
        description: "Over 900 years of history make Kemigawa Jinja one of the oldest shrines in the Hanamigawa district. The shrine is connected to Minamoto no Yoritomo, the founder of the Kamakura shogunate, who is said to have prayed here during his campaigns in the Kanto region. Despite being a quiet neighborhood shrine today, its deep historical roots and long tradition of local guardianship make it a meaningful stop for those exploring Chiba's hidden spiritual heritage.",
        coordinate: CLLocationCoordinate2D(latitude: 35.6478, longitude: 140.0678),
        stampSlotId: 100,
        category: .jinja,
        tagline: "A quiet guardian shrine with Kamakura shogunate roots",
        highlights: [
            "Over 900 years of continuous worship in Hanamigawa district",
            "Connected to Minamoto no Yoritomo — founder of the Kamakura shogunate",
            "Authentic neighborhood shrine atmosphere away from tourist crowds",
            "Long tradition as the guardian shrine of the Kemigawa area"
        ],
        mustSee: "Take a quiet walk through the shrine grounds and appreciate the ancient trees that have watched over this neighborhood for centuries. The simplicity and authenticity here is its own reward.",
        tips: [
            "A genuine local shrine — visitors are rare, so enjoy the peaceful atmosphere",
            "The shrine is walking distance from Makuhari — combine with a visit to the Makuhari Messe area",
            "Local festivals in autumn bring the neighborhood together at the shrine",
            "No English signage — a truly off-the-beaten-path experience"
        ],
        bestSeason: "Autumn (local festival), Apr (cherry blossoms), Year-round",
        access: "15 min walk from Makuhari Station (JR Sobu Line) or Keisei-Makuhari Station (Keisei Line)",
        hours: "Open dawn to dusk (free access)",
        imageURLs: []
    ),

    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    // MARK: - Ichikawa
    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

    Shrine(
        id: UUID(uuidString: "00000003-0000-0000-0000-000000000089")!,
        name: "Katsushika Hachimangu",
        address: "4-2-1 Yawata, Ichikawa, Chiba",
        description: "With over 1,000 years of history, Katsushika Hachimangu is one of the most beloved shrines in the Ichikawa area and a major hatsumode destination each New Year. The shrine's most famous feature is its 'Senbon-icho' — a magnificent thousand-year ginkgo tree that towers over the grounds and turns brilliant gold each autumn. The tree has been designated a natural monument and is considered a living testament to the shrine's ancient origins.",
        coordinate: CLLocationCoordinate2D(latitude: 35.7317, longitude: 139.9344),
        stampSlotId: 89,
        category: .hachimangu,
        tagline: "A thousand-year ginkgo tree blazing gold above an ancient Hachimangu",
        highlights: [
            "Senbon-icho — magnificent thousand-year ginkgo tree (natural monument)",
            "Over 1,000 years of history as Ichikawa's premier shrine",
            "Popular hatsumode destination with festive New Year atmosphere",
            "Hachimangu deity — god of warriors and protector of the community"
        ],
        mustSee: "Visit in late November when the Senbon-icho ginkgo tree turns completely golden — the massive canopy of yellow leaves against the shrine buildings is one of western Chiba's most spectacular autumn sights.",
        tips: [
            "Late November is peak ginkgo season — time your visit for the golden canopy",
            "The shrine is a 10-minute walk from Motoyawata Station — an easy day trip from central Tokyo",
            "New Year's hatsumode here is lively but less extreme than Meiji Jingu",
            "The surrounding Yawata neighborhood has local shops and a pleasant residential character"
        ],
        bestSeason: "Late Nov (ginkgo golden leaves), New Year (hatsumode)",
        access: "10 min walk from Motoyawata Station (JR Sobu Line / Toei Shinjuku Line)",
        hours: "6:00-17:00 (grounds open dawn to dusk)",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000003-0000-0000-0000-000000000090")!,
        name: "Nakayama Hokekyoji",
        address: "2-10-1 Nakayama, Ichikawa, Chiba",
        description: "One of the great temples of the Nichiren sect, Nakayama Hokekyoji was founded in 1260 by Nichiren himself during a period of intense religious upheaval. The temple's five-story pagoda, built in 1622, is the oldest in the Kanto region and has been designated a National Treasure. Every February, the Setsubun festival draws enormous crowds for its dramatic bean-throwing ceremony, while autumn transforms the temple grounds into a dazzling tapestry of red and gold maple leaves.",
        coordinate: CLLocationCoordinate2D(latitude: 35.7267, longitude: 139.9564),
        stampSlotId: 90,
        category: .tera,
        tagline: "Nichiren's own temple with the oldest pagoda in Kanto",
        highlights: [
            "Five-story pagoda (1622) — oldest in the Kanto region and a National Treasure",
            "Founded by Nichiren himself in 1260 — one of the great Nichiren temples",
            "Famous Setsubun (bean-throwing) festival every February",
            "Spectacular autumn maple foliage throughout the temple grounds"
        ],
        mustSee: "Walk the tree-lined approach in November when the maples are ablaze — then look up at the five-story pagoda framed by crimson leaves. It is one of the finest autumn temple scenes in the Tokyo metropolitan area.",
        tips: [
            "Setsubun on February 3 features celebrities throwing lucky beans — arrive early for a good spot",
            "The autumn foliage in mid-to-late November rivals many Kyoto temples",
            "The temple is large — allow at least an hour to explore the various halls and gardens",
            "A 3-minute walk from Shimosa-Nakayama Station makes this an easy trip from Tokyo"
        ],
        bestSeason: "Mid-late Nov (autumn foliage), Feb 3 (Setsubun festival)",
        access: "3 min walk from Shimosa-Nakayama Station (JR Sobu Line)",
        hours: "9:00-16:00 (grounds open dawn to dusk)",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000003-0000-0000-0000-000000000097")!,
        name: "Mamasan Guho-ji",
        address: "4-18-20 Mama, Ichikawa, Chiba",
        description: "Known affectionately as 'Mama Kannon,' Mamasan Guho-ji is Ichikawa's most famous temple and a place woven into the fabric of Japanese literary history. Poets of the Man'yoshu — Japan's oldest poetry anthology compiled in the 8th century — composed verses inspired by this hillside overlooking the Edogawa River. The temple's autumn foliage is legendary, with ancient maples cascading down the slope in waves of crimson and gold that have drawn visitors for centuries.",
        coordinate: CLLocationCoordinate2D(latitude: 35.7339, longitude: 139.9250),
        stampSlotId: 97,
        category: .tera,
        tagline: "Mama Kannon — a poet's temple draped in ancient maple fire",
        highlights: [
            "Beloved as 'Mama Kannon' — Ichikawa's most iconic temple",
            "Connected to Man'yoshu poetry (8th century) — one of Japan's oldest literary sites",
            "Legendary autumn foliage cascading down the hillside",
            "Hillside setting overlooking the Edogawa River plain"
        ],
        mustSee: "Visit in late November when the maple trees lining the hillside paths erupt in crimson — the layers of color viewed from the stone steps are among the most beautiful autumn scenes in Chiba.",
        tips: [
            "Peak autumn foliage is typically mid-to-late November — check koyo forecasts",
            "The temple is on a hill — the climb is gentle but wear comfortable shoes",
            "Combine with Katsushika Hachimangu and Nakayama Hokekyoji for an Ichikawa temple day",
            "The Man'yoshu poetry connection adds a literary dimension — look for the poetry stones on the grounds"
        ],
        bestSeason: "Mid-late Nov (autumn foliage), Apr (cherry blossoms)",
        access: "12 min walk from Ichikawa-Mama Station (Keisei Line) or 15 min from Mama Station (JR Sobu Line)",
        hours: "Open dawn to dusk (free access)",
        imageURLs: []
    ),

    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    // MARK: - Funabashi / Matsudo / Kashiwa
    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

    Shrine(
        id: UUID(uuidString: "00000003-0000-0000-0000-000000000092")!,
        name: "Funabashi Daijingu",
        address: "2-21-1 Miyamoto, Funabashi, Chiba",
        description: "With a legendary history stretching back over 1,900 years, Funabashi Daijingu is one of the oldest shrines in the Kanto region. According to tradition, the hero Yamato Takeru stopped here during his eastern campaign, and the shrine enshrines Amaterasu — the sun goddess herself — giving it the prestigious 'Daijingu' title. The annual grand festival features dramatic portable shrine processions through the streets of Funabashi, drawing thousands of spectators to one of Chiba's most spirited matsuri.",
        coordinate: CLLocationCoordinate2D(latitude: 35.6944, longitude: 139.9853),
        stampSlotId: 92,
        category: .jingu,
        tagline: "1,900 years of sun goddess worship where Yamato Takeru once prayed",
        highlights: [
            "Over 1,900 years old — one of the oldest shrines in the Kanto region",
            "Enshrines Amaterasu — bearing the prestigious 'Daijingu' title",
            "Connected to the Yamato Takeru eastern campaign legend",
            "Annual grand festival with dramatic mikoshi processions through Funabashi"
        ],
        mustSee: "Visit during the October grand festival to see teams of bearers surge through Funabashi's streets carrying massive portable shrines — the energy, the chanting, and the neighborhood pride are infectious.",
        tips: [
            "The October festival (Funabashi Daijingu Matsuri) is Funabashi's biggest event — check exact dates",
            "Just 5 minutes from Funabashi Station — easy to add to any Chiba day trip",
            "The shrine grounds are compact but atmospheric, with large camphor trees",
            "Funabashi is famous for its clams (asari) — try them at a local restaurant after your visit"
        ],
        bestSeason: "Oct (annual grand festival), New Year (hatsumode), Year-round",
        access: "5 min walk from Funabashi Station (JR Sobu Line / Keisei Line)",
        hours: "6:00-17:00 (grounds open dawn to dusk)",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000003-0000-0000-0000-000000000093")!,
        name: "Matsudo Jinja",
        address: "1457 Matsudo, Matsudo, Chiba",
        description: "For over 900 years, Matsudo Jinja has served as the guardian shrine of Matsudo, watching over this Edogawa River town through centuries of change. The shrine is connected to the legend of Togoku Mitsugi — a story of loyalty and devotion that resonates through the history of eastern Japan. Perched on a hill in central Matsudo, the shrine grounds offer a pocket of green tranquility amid the city, with seasonal festivals that bring the whole neighborhood together.",
        coordinate: CLLocationCoordinate2D(latitude: 35.7833, longitude: 139.9006),
        stampSlotId: 93,
        category: .jinja,
        tagline: "Matsudo's 900-year guardian on a green hill above the Edogawa",
        highlights: [
            "Over 900 years of history as Matsudo's main guardian shrine",
            "Connected to the Togoku Mitsugi legend of loyalty and devotion",
            "Hilltop location with green canopy in the heart of Matsudo city",
            "Lively seasonal festivals connecting generations of local families"
        ],
        mustSee: "Climb the stone steps to the hilltop main hall and take in the atmosphere of a true community shrine — the view over the surrounding rooftops and the quiet rustling of trees overhead is deeply calming.",
        tips: [
            "An authentic local shrine experience — few tourists, warm community atmosphere",
            "The autumn festival is a great time to see the shrine at its liveliest",
            "Matsudo is on the JR Joban Line — easy access from Tokyo or Ueno",
            "Combine with a walk along the nearby Edogawa River for a pleasant half-day outing"
        ],
        bestSeason: "Autumn (festival season), Apr (cherry blossoms), Year-round",
        access: "10 min walk from Matsudo Station (JR Joban Line / Shin-Keisei Line)",
        hours: "Open dawn to dusk (free access)",
        imageURLs: []
    ),
    Shrine(
        id: UUID(uuidString: "00000003-0000-0000-0000-000000000098")!,
        name: "Kashiwa Jinja",
        address: "3-2-2 Kashiwa, Kashiwa, Chiba",
        description: "As the main shrine of Kashiwa city, Kashiwa Jinja serves as the spiritual anchor of this bustling commercial hub in northern Chiba. The shrine is the focal point of the annual Kashiwa Matsuri, one of the largest festivals in the region, which fills the streets surrounding the shrine with food stalls, traditional performances, and tens of thousands of celebrants. On New Year's Day, long lines of hatsumode visitors attest to the shrine's deep importance in the daily spiritual life of the community.",
        coordinate: CLLocationCoordinate2D(latitude: 35.8617, longitude: 139.9758),
        stampSlotId: 98,
        category: .jinja,
        tagline: "Kashiwa's beating heart — festivals, prayers, and community spirit",
        highlights: [
            "Main guardian shrine of Kashiwa city",
            "Annual Kashiwa Matsuri — one of northern Chiba's biggest festivals",
            "Popular hatsumode destination drawing long New Year's queues",
            "Central location surrounded by Kashiwa's vibrant shopping streets"
        ],
        mustSee: "Visit during the Kashiwa Matsuri in July when the streets around the shrine transform into a massive festival ground — the combination of taiko drums, portable shrines, and the aroma of festival food is quintessentially Japanese.",
        tips: [
            "The shrine is steps from Kashiwa Station's bustling east exit shopping area",
            "Kashiwa Matsuri in late July is the highlight of the year — check exact dates",
            "A compact shrine that's easy to visit as part of a Kashiwa shopping trip",
            "New Year's hatsumode is popular — expect queues on January 1-3"
        ],
        bestSeason: "Late Jul (Kashiwa Matsuri), New Year (hatsumode)",
        access: "5 min walk from Kashiwa Station (JR Joban Line / Tobu Urban Park Line)",
        hours: "Open dawn to dusk (free access)",
        imageURLs: []
    ),

    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    // MARK: - Narashino
    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

    Shrine(
        id: UUID(uuidString: "00000003-0000-0000-0000-000000000099")!,
        name: "Ohara Jinja",
        address: "1-47-21 Tsudanuma, Narashino, Chiba",
        description: "For over 800 years, Ohara Jinja has stood as the guardian shrine of Narashino, a city nestled between the bustle of Funabashi and Chiba. The shrine's history stretches back to the Kamakura period, and its seasonal festivals continue to mark the rhythm of community life as they have for centuries. With beautiful seasonal decorations and a welcoming atmosphere, Ohara Jinja offers a genuine glimpse into the everyday spiritual practice that sustains Japanese neighborhoods.",
        coordinate: CLLocationCoordinate2D(latitude: 35.6814, longitude: 140.0272),
        stampSlotId: 99,
        category: .jinja,
        tagline: "Narashino's 800-year guardian — where community and tradition meet",
        highlights: [
            "Over 800 years of continuous worship as Narashino's guardian shrine",
            "Beautiful seasonal festivals rooted in Kamakura-period tradition",
            "Welcoming community atmosphere in a residential setting",
            "Seasonal decorations that change with the calendar year"
        ],
        mustSee: "Visit during one of the seasonal festivals to see the shrine at its most vibrant — the community comes together with offerings, performances, and a warmth that embodies the best of neighborhood shrine culture.",
        tips: [
            "The shrine is in the Tsudanuma area — Narashino's main commercial district",
            "A genuine neighborhood shrine experience — quiet contemplation on ordinary days",
            "Combine with a visit to nearby Funabashi Daijingu for a contrast in shrine scale",
            "Tsudanuma Station area has good restaurants for lunch after your visit"
        ],
        bestSeason: "Autumn (festival season), New Year (hatsumode), Year-round",
        access: "10 min walk from Tsudanuma Station (JR Sobu Line / Shin-Keisei Line)",
        hours: "Open dawn to dusk (free access)",
        imageURLs: []
    ),

    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    // MARK: - Chiba Additional (ID 121-122)
    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

    Shrine(
        id: UUID(uuidString: "00000003-0000-0000-0000-000000000121")!,
        name: "Kasamori Kannon (Kasamori-ji)",
        address: "302 Kasamori, Chonan, Chosei-gun, Chiba",
        description: "One of the most architecturally extraordinary temples in the Kanto region, Kasamori Kannon's main hall is built on stilts atop a massive granite outcrop — the 'four-sided suspended' construction (shihomen-kake-zukuri) is unique in all of Japan. Designated an Important Cultural Property, the hall appears to float above the forest canopy, offering breathtaking views of the surrounding Boso hills. Founded in 784, the temple is the 31st station on the famous Bando 33 Kannon pilgrimage and has drawn pilgrims for over 1,200 years.",
        coordinate: CLLocationCoordinate2D(latitude: 35.3781, longitude: 140.2203),
        stampSlotId: 121,
        category: .tera,
        tagline: "A floating temple on a granite cliff — Japan's only four-sided suspended hall",
        highlights: [
            "Japan's only 'four-sided suspended' construction — a temple floating on a cliff",
            "Important Cultural Property main hall built on stilts over a granite outcrop",
            "31st station on the Bando 33 Kannon pilgrimage — 1,200+ years of pilgrims",
            "Panoramic forest views from the elevated hall"
        ],
        mustSee: "Climb the steep stairs to the main hall and step onto the wraparound balcony — you're standing above the treetops on a 75-foot-high granite cliff, with nothing but forest stretching to the horizon. The engineering of building this hall in 1028 is mind-boggling.",
        tips: [
            "The approach through cedar forest is beautiful — the temple appears suddenly above the trees",
            "Stairs to the main hall are steep and narrow — wear appropriate shoes",
            "The black Kannon inside is a hibutsu (hidden buddha) — shown only on special occasions",
            "Combine with a drive through the Boso countryside — the area is beautiful rural Chiba"
        ],
        bestSeason: "Nov (autumn foliage frames the elevated hall), Apr-May (fresh green), Year-round",
        access: "Taxi 15 min from Mobara Station (JR Sotobo Line)",
        hours: "8:00-16:00",
        imageURLs: []
    ),

    Shrine(
        id: UUID(uuidString: "00000003-0000-0000-0000-000000000122")!,
        name: "Sakuragi Jinja",
        address: "1-5-3 Sakuragi, Noda, Chiba",
        description: "One of the most beloved cherry blossom shrines in the Kanto region, Sakuragi Jinja has been dedicated to the cherry tree deity since 851 AD — making it the oldest 'sakura shrine' in Japan. The shrine's name literally means 'cherry tree shrine,' and its grounds feature rare cherry varieties that bloom from late winter through late spring, ensuring nearly three months of continuous blossoms. The shrine's beautifully designed seasonal goshuin (stamp calligraphy) are collector favorites, with cherry-blossom-themed designs that change throughout the year.",
        coordinate: CLLocationCoordinate2D(latitude: 35.9553, longitude: 139.8669),
        stampSlotId: 122,
        category: .jinja,
        tagline: "Japan's oldest cherry tree shrine — 1,175 years of sakura devotion",
        highlights: [
            "Japan's oldest 'sakura shrine' — dedicated to the cherry tree deity since 851 AD",
            "Multiple rare cherry varieties bloom from winter through late spring",
            "Stunning seasonal goshuin designs — among the most collectible in Japan",
            "The shrine name literally means 'Cherry Tree Shrine'"
        ],
        mustSee: "Visit in late March to early April when the main weeping cherry tree at the shrine entrance is in full bloom — illuminated at night, the cascading pink blossoms against the shrine buildings create a scene of pure magic.",
        tips: [
            "The seasonal goshuin (stamp calligraphy) designs are famous — collect different seasonal versions",
            "Rare winter-blooming cherry varieties start as early as January",
            "Noda is also famous for soy sauce — visit the Kikkoman factory nearby",
            "Less crowded than Tokyo cherry blossom spots but equally beautiful"
        ],
        bestSeason: "Late Mar-Apr (peak cherry blossoms), Jan-Feb (winter cherries), Year-round",
        access: "12 min walk from Noda-shi Station (Tobu Urban Park Line)",
        hours: "Open 24 hours (office 9:00-16:30)",
        imageURLs: []
    ),
]
