import SwiftUI

struct StampDefinition: Identifiable, Hashable {
    let id: Int
    let name: String
    let icon: String
    let color: Color
    let subtitle: String
    let stampSymbol: String
    let imageName: String?

    init(id: Int, name: String, icon: String, color: Color, subtitle: String, stampSymbol: String, imageName: String? = nil) {
        self.id = id
        self.name = name
        self.icon = icon
        self.color = color
        self.subtitle = subtitle
        self.stampSymbol = stampSymbol
        self.imageName = imageName
    }

    static let all: [StampDefinition] = [
        // Vermillion (Shrine Red)
        StampDefinition(id: 1,  name: "Meiji Jingu",       icon: "building.columns.fill", color: Color(red: 0.80, green: 0.15, blue: 0.15),
                        subtitle: "Shibuya, Yoyogi",     stampSymbol: "\u{26E9}", imageName: "stamp_meiji_jingu"),
        StampDefinition(id: 2,  name: "Senso-ji",          icon: "flame.fill",            color: Color(red: 0.85, green: 0.20, blue: 0.10),
                        subtitle: "Taito, Asakusa",       stampSymbol: "\u{1F3EF}", imageName: "stamp_sensoji"),
        StampDefinition(id: 3,  name: "Yasukuni Jinja",    icon: "flag.fill",             color: Color(red: 0.75, green: 0.12, blue: 0.20),
                        subtitle: "Chiyoda, Kudan",       stampSymbol: "\u{26E9}", imageName: "stamp_yasukuni"),

        // Matcha Green
        StampDefinition(id: 4,  name: "Kanda Myojin",      icon: "leaf.fill",             color: Color(red: 0.20, green: 0.55, blue: 0.30),
                        subtitle: "Chiyoda, Sotokanda",   stampSymbol: "\u{1F343}", imageName: "stamp_kanda_myojin"),
        StampDefinition(id: 5,  name: "Hie Jinja",         icon: "tree.fill",             color: Color(red: 0.15, green: 0.50, blue: 0.25),
                        subtitle: "Chiyoda, Nagatacho",   stampSymbol: "\u{1F333}", imageName: "stamp_hie_jinja"),
        StampDefinition(id: 6,  name: "Nezu Jinja",        icon: "camera.macro",          color: Color(red: 0.30, green: 0.60, blue: 0.35),
                        subtitle: "Bunkyo, Nezu",         stampSymbol: "\u{1F338}", imageName: "stamp_nezu_jinja"),

        // Indigo Blue
        StampDefinition(id: 7,  name: "Tokyo Daijingu",    icon: "moon.stars.fill",       color: Color(red: 0.15, green: 0.30, blue: 0.60),
                        subtitle: "Chiyoda, Fujimi",      stampSymbol: "\u{1F319}", imageName: "stamp_tokyo_daijingu"),
        StampDefinition(id: 8,  name: "Yushima Tenmangu",  icon: "graduationcap.fill",    color: Color(red: 0.20, green: 0.35, blue: 0.65),
                        subtitle: "Bunkyo, Yushima",      stampSymbol: "\u{1F3D3}", imageName: "stamp_yushima_tenmangu"),

        // Tokyo (Additional)
        StampDefinition(id: 9,  name: "Gotoku-ji",         icon: "cat.fill",              color: Color(red: 0.50, green: 0.35, blue: 0.20),
                        subtitle: "Setagaya, Gotokuji",   stampSymbol: "\u{1F431}", imageName: "stamp_gotokuji"),
        StampDefinition(id: 10, name: "Zojo-ji",            icon: "flame.fill",            color: Color(red: 0.20, green: 0.35, blue: 0.60),
                        subtitle: "Minato, Shibakoen",    stampSymbol: "\u{1F3EF}", imageName: "stamp_zojoji"),
        StampDefinition(id: 11, name: "Tomioka Hachimangu", icon: "figure.wrestling",      color: Color(red: 0.75, green: 0.15, blue: 0.15),
                        subtitle: "Koto, Tomioka",        stampSymbol: "\u{26E9}", imageName: "stamp_tomioka"),
        StampDefinition(id: 12, name: "Atago Jinja",        icon: "stairs",                color: Color(red: 0.20, green: 0.50, blue: 0.30),
                        subtitle: "Minato, Atago",        stampSymbol: "\u{26E9}", imageName: "stamp_atago"),
        StampDefinition(id: 13, name: "Hanazono Jinja",     icon: "sparkles",              color: Color(red: 0.80, green: 0.20, blue: 0.30),
                        subtitle: "Shinjuku",             stampSymbol: "\u{26E9}", imageName: "stamp_hanazono"),
        StampDefinition(id: 14, name: "Asakusa Jinja",      icon: "party.popper.fill",     color: Color(red: 0.85, green: 0.25, blue: 0.15),
                        subtitle: "Taito, Asakusa",       stampSymbol: "\u{26E9}", imageName: "stamp_asakusa_jinja"),
        StampDefinition(id: 15, name: "Sengaku-ji",         icon: "shield.fill",           color: Color(red: 0.30, green: 0.30, blue: 0.50),
                        subtitle: "Minato, Takanawa",     stampSymbol: "\u{2694}\u{FE0F}", imageName: "stamp_sengakuji"),
        StampDefinition(id: 16, name: "Jindai-ji",          icon: "leaf.fill",             color: Color(red: 0.25, green: 0.55, blue: 0.25),
                        subtitle: "Chofu, Jindaiji",      stampSymbol: "\u{1F35C}", imageName: "stamp_jindaiji"),
        StampDefinition(id: 17, name: "Nogi Jinja",         icon: "star.fill",             color: Color(red: 0.45, green: 0.40, blue: 0.35),
                        subtitle: "Minato, Akasaka",      stampSymbol: "\u{26E9}", imageName: "stamp_nogi"),
        StampDefinition(id: 18, name: "Akasaka Hikawa",     icon: "tree.fill",             color: Color(red: 0.18, green: 0.48, blue: 0.28),
                        subtitle: "Minato, Akasaka",      stampSymbol: "\u{26E9}", imageName: "stamp_akasaka_hikawa"),

        // Kanagawa
        StampDefinition(id: 19, name: "Tsurugaoka Hachiman", icon: "flag.fill",            color: Color(red: 0.70, green: 0.15, blue: 0.15),
                        subtitle: "Kamakura",             stampSymbol: "\u{26E9}", imageName: "stamp_tsurugaoka"),
        StampDefinition(id: 20, name: "Kotoku-in",          icon: "figure.seated.seatbelt",color: Color(red: 0.45, green: 0.55, blue: 0.35),
                        subtitle: "Kamakura, Hase",       stampSymbol: "\u{1F9D8}", imageName: "stamp_kotokuin"),
        StampDefinition(id: 21, name: "Hasedera",           icon: "camera.macro",          color: Color(red: 0.35, green: 0.50, blue: 0.70),
                        subtitle: "Kamakura, Hase",       stampSymbol: "\u{1F338}", imageName: "stamp_hasedera"),
        StampDefinition(id: 22, name: "Enoshima Jinja",     icon: "water.waves",           color: Color(red: 0.15, green: 0.45, blue: 0.70),
                        subtitle: "Fujisawa, Enoshima",   stampSymbol: "\u{1F30A}", imageName: "stamp_enoshima"),
        StampDefinition(id: 23, name: "Kawasaki Daishi",     icon: "flame.fill",            color: Color(red: 0.80, green: 0.30, blue: 0.10),
                        subtitle: "Kawasaki",             stampSymbol: "\u{1F3EF}", imageName: "stamp_kawasaki_daishi"),
        StampDefinition(id: 24, name: "Kencho-ji",          icon: "mountain.2.fill",       color: Color(red: 0.30, green: 0.50, blue: 0.30),
                        subtitle: "Kamakura",             stampSymbol: "\u{1F343}", imageName: "stamp_kenchoji"),
        StampDefinition(id: 25, name: "Hokoku-ji",          icon: "leaf.fill",             color: Color(red: 0.20, green: 0.60, blue: 0.30),
                        subtitle: "Kamakura, Jomyoji",    stampSymbol: "\u{1F38D}", imageName: "stamp_hokokuji"),
        StampDefinition(id: 26, name: "Samukawa Jinja",     icon: "shield.checkered",      color: Color(red: 0.55, green: 0.40, blue: 0.20),
                        subtitle: "Samukawa, Kanagawa",   stampSymbol: "\u{26E9}", imageName: "stamp_samukawa"),

        // Kyoto
        StampDefinition(id: 27, name: "Fushimi Inari Taisha", icon: "flame.fill",           color: Color(red: 0.80, green: 0.15, blue: 0.10),
                        subtitle: "Fushimi, Kyoto",        stampSymbol: "\u{26E9}", imageName: "stamp_fushimi_inari"),
        StampDefinition(id: 28, name: "Kinkaku-ji",           icon: "sparkles",              color: Color(red: 0.75, green: 0.60, blue: 0.10),
                        subtitle: "Kita, Kyoto",           stampSymbol: "\u{1F3EF}", imageName: "stamp_kinkakuji"),
        StampDefinition(id: 29, name: "Kiyomizu-dera",        icon: "mountain.2.fill",       color: Color(red: 0.55, green: 0.30, blue: 0.55),
                        subtitle: "Higashiyama, Kyoto",    stampSymbol: "\u{1F338}", imageName: "stamp_kiyomizudera"),
        StampDefinition(id: 30, name: "Yasaka Jinja",         icon: "lantern.2.fill",        color: Color(red: 0.78, green: 0.12, blue: 0.18),
                        subtitle: "Gion, Kyoto",           stampSymbol: "\u{1F3EF}", imageName: "stamp_yasaka"),
        StampDefinition(id: 31, name: "Shimogamo Jinja",      icon: "leaf.fill",             color: Color(red: 0.15, green: 0.50, blue: 0.25),
                        subtitle: "Sakyo, Kyoto",          stampSymbol: "\u{1F333}", imageName: "stamp_shimogamo"),
        StampDefinition(id: 32, name: "Kamigamo Jinja",       icon: "wind",                  color: Color(red: 0.20, green: 0.55, blue: 0.30),
                        subtitle: "Kita, Kyoto",           stampSymbol: "\u{26E9}", imageName: "stamp_kamigamo"),
        StampDefinition(id: 33, name: "Kitano Tenmangu",      icon: "graduationcap.fill",    color: Color(red: 0.55, green: 0.25, blue: 0.52),
                        subtitle: "Kamigyo, Kyoto",        stampSymbol: "\u{2602}\u{FE0F}", imageName: "stamp_kitano_tenmangu"),
        StampDefinition(id: 34, name: "Heian Jingu",          icon: "crown.fill",            color: Color(red: 0.15, green: 0.30, blue: 0.65),
                        subtitle: "Sakyo, Kyoto",          stampSymbol: "\u{1F3EF}", imageName: "stamp_heian_jingu"),
        StampDefinition(id: 35, name: "Nijo Castle",          icon: "building.2.fill",       color: Color(red: 0.30, green: 0.28, blue: 0.55),
                        subtitle: "Nakagyo, Kyoto",        stampSymbol: "\u{1F3EF}", imageName: "stamp_nijo_castle"),

        // Osaka
        StampDefinition(id: 36, name: "Sumiyoshi Taisha",     icon: "drop.fill",             color: Color(red: 0.20, green: 0.50, blue: 0.35),
                        subtitle: "Sumiyoshi, Osaka",      stampSymbol: "\u{26E9}", imageName: "stamp_sumiyoshi"),
        StampDefinition(id: 37, name: "Osaka Tenmangu",       icon: "graduationcap.fill",    color: Color(red: 0.50, green: 0.22, blue: 0.50),
                        subtitle: "Kita, Osaka",           stampSymbol: "\u{1F4AB}", imageName: "stamp_osaka_tenmangu"),
        StampDefinition(id: 38, name: "Namba Yasaka Jinja",   icon: "mouth.fill",            color: Color(red: 0.80, green: 0.20, blue: 0.10),
                        subtitle: "Naniwa, Osaka",         stampSymbol: "\u{1F981}", imageName: "stamp_namba_yasaka"),
        StampDefinition(id: 39, name: "Imamiya Ebisu Jinja",  icon: "cart.fill",             color: Color(red: 0.70, green: 0.45, blue: 0.10),
                        subtitle: "Naniwa, Osaka",         stampSymbol: "\u{1F340}", imageName: "stamp_imamiya_ebisu"),
        StampDefinition(id: 40, name: "Shitennoji",           icon: "building.columns.fill", color: Color(red: 0.20, green: 0.35, blue: 0.60),
                        subtitle: "Tennoji, Osaka",        stampSymbol: "\u{1F3EF}", imageName: "stamp_shitennoji"),

        // Nara
        StampDefinition(id: 41, name: "Kasuga Taisha",        icon: "light.cylindrical.ceiling.fill", color: Color(red: 0.75, green: 0.50, blue: 0.10),
                        subtitle: "Nara Park, Nara",       stampSymbol: "\u{1FA94}", imageName: "stamp_kasuga_taisha"),
        StampDefinition(id: 42, name: "Todai-ji",             icon: "figure.seated.seatbelt",color: Color(red: 0.25, green: 0.45, blue: 0.30),
                        subtitle: "Zoshi, Nara",           stampSymbol: "\u{1F9D8}", imageName: "stamp_todaiji"),
        StampDefinition(id: 43, name: "Yakushi-ji",           icon: "medical.thermometer.fill", color: Color(red: 0.40, green: 0.55, blue: 0.65),
                        subtitle: "Nishinokyo, Nara",      stampSymbol: "\u{1F3EF}", imageName: "stamp_yakushiji"),
        StampDefinition(id: 44, name: "Kofuku-ji",            icon: "building.fill",         color: Color(red: 0.55, green: 0.35, blue: 0.20),
                        subtitle: "Noborioji, Nara",       stampSymbol: "\u{26E9}", imageName: "stamp_kofukuji"),

        // Other Regions
        StampDefinition(id: 45, name: "Ise Jingu",            icon: "crown.fill",            color: Color(red: 0.60, green: 0.45, blue: 0.15),
                        subtitle: "Ise, Mie",              stampSymbol: "\u{2728}", imageName: "stamp_ise_jingu"),
        StampDefinition(id: 46, name: "Itsukushima Jinja",    icon: "water.waves",           color: Color(red: 0.80, green: 0.15, blue: 0.15),
                        subtitle: "Miyajima, Hiroshima",   stampSymbol: "\u{26E9}", imageName: "stamp_itsukushima"),
        StampDefinition(id: 47, name: "Izumo Taisha",         icon: "heart.fill",            color: Color(red: 0.20, green: 0.45, blue: 0.65),
                        subtitle: "Izumo, Shimane",        stampSymbol: "\u{1F49E}", imageName: "stamp_izumo_taisha"),
        StampDefinition(id: 48, name: "Dazaifu Tenmangu",     icon: "graduationcap.fill",    color: Color(red: 0.45, green: 0.20, blue: 0.48),
                        subtitle: "Dazaifu, Fukuoka",      stampSymbol: "\u{1F33A}", imageName: "stamp_dazaifu"),
        StampDefinition(id: 49, name: "Toshogu (Nikko)",      icon: "paintpalette.fill",     color: Color(red: 0.65, green: 0.35, blue: 0.10),
                        subtitle: "Nikko, Tochigi",        stampSymbol: "\u{1F412}", imageName: "stamp_nikko_toshogu"),
        StampDefinition(id: 50, name: "Hakozaki Hachimangu",  icon: "shield.fill",           color: Color(red: 0.70, green: 0.12, blue: 0.20),
                        subtitle: "Higashi, Fukuoka",      stampSymbol: "\u{26E9}", imageName: "stamp_hakozaki"),

        // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
        // Tokyo (Additional, ID 51-72)
        // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

        StampDefinition(id: 51, name: "Shibamata Taishakuten", icon: "film.fill",             color: Color(red: 0.55, green: 0.35, blue: 0.20),
                        subtitle: "Katsushika",             stampSymbol: "\u{1F3EF}", imageName: "stamp_shibamata"),
        StampDefinition(id: 52, name: "Ikegami Honmon-ji",    icon: "flame.fill",            color: Color(red: 0.20, green: 0.30, blue: 0.55),
                        subtitle: "Ota, Ikegami",           stampSymbol: "\u{1F3EF}", imageName: "stamp_ikegami"),
        StampDefinition(id: 53, name: "Oji Jinja",            icon: "fox.fill",              color: Color(red: 0.75, green: 0.20, blue: 0.15),
                        subtitle: "Kita, Oji",              stampSymbol: "\u{26E9}", imageName: "stamp_oji"),
        StampDefinition(id: 54, name: "Oji Inari Jinja",      icon: "flame",                 color: Color(red: 0.80, green: 0.25, blue: 0.10),
                        subtitle: "Kita, Oji",              stampSymbol: "\u{1F98A}", imageName: "stamp_oji_inari"),
        StampDefinition(id: 55, name: "Toyokawa Inari",       icon: "flame",                 color: Color(red: 0.75, green: 0.18, blue: 0.18),
                        subtitle: "Minato, Akasaka",         stampSymbol: "\u{1F98A}", imageName: "stamp_toyokawa_inari_tokyo"),
        StampDefinition(id: 56, name: "Shiba Toshogu",        icon: "paintpalette.fill",     color: Color(red: 0.60, green: 0.40, blue: 0.12),
                        subtitle: "Minato, Shiba",           stampSymbol: "\u{26E9}", imageName: "stamp_shiba_toshogu"),
        StampDefinition(id: 57, name: "Namiyoke Inari",       icon: "water.waves",           color: Color(red: 0.15, green: 0.40, blue: 0.65),
                        subtitle: "Chuo, Tsukiji",           stampSymbol: "\u{1F30A}", imageName: "stamp_namiyoke_inari"),
        StampDefinition(id: 58, name: "Okunitama Jinja",      icon: "building.columns.fill", color: Color(red: 0.70, green: 0.15, blue: 0.15),
                        subtitle: "Fuchu",                   stampSymbol: "\u{26E9}", imageName: "stamp_okunitama"),
        StampDefinition(id: 59, name: "Musashi Mitake Jinja", icon: "mountain.2.fill",       color: Color(red: 0.25, green: 0.50, blue: 0.30),
                        subtitle: "Ome, Mt. Mitake",         stampSymbol: "\u{26F0}\u{FE0F}", imageName: "stamp_musashi_mitake"),
        StampDefinition(id: 60, name: "Kishimojin-do",        icon: "figure.and.child.holdinghands", color: Color(red: 0.70, green: 0.30, blue: 0.50),
                        subtitle: "Toshima, Zoshigaya",      stampSymbol: "\u{1F3EF}", imageName: "stamp_kishimojin"),
        StampDefinition(id: 61, name: "Tennoji",              icon: "house.lodge.fill",      color: Color(red: 0.30, green: 0.25, blue: 0.55),
                        subtitle: "Taito, Yanaka",           stampSymbol: "\u{1F3EF}", imageName: "stamp_tennoji_yanaka"),
        StampDefinition(id: 62, name: "Fukagawa Fudo-do",     icon: "flame.fill",            color: Color(red: 0.80, green: 0.30, blue: 0.10),
                        subtitle: "Koto, Fukagawa",          stampSymbol: "\u{1F525}", imageName: "stamp_fukagawa_fudo"),
        StampDefinition(id: 63, name: "Suitengu",             icon: "drop.fill",             color: Color(red: 0.15, green: 0.35, blue: 0.65),
                        subtitle: "Chuo, Nihonbashi",        stampSymbol: "\u{1F4A7}", imageName: "stamp_suitengu"),
        StampDefinition(id: 64, name: "Togo Jinja",           icon: "anchor",                color: Color(red: 0.20, green: 0.30, blue: 0.55),
                        subtitle: "Shibuya, Harajuku",       stampSymbol: "\u{2693}", imageName: "stamp_togo_jinja"),
        StampDefinition(id: 65, name: "Takao-san Yakuo-in",   icon: "mountain.2.fill",       color: Color(red: 0.20, green: 0.50, blue: 0.25),
                        subtitle: "Hachioji, Mt. Takao",     stampSymbol: "\u{1F3D4}\u{FE0F}", imageName: "stamp_takao_yakuoin"),
        StampDefinition(id: 66, name: "Konno Hachimangu",     icon: "shield.fill",           color: Color(red: 0.60, green: 0.12, blue: 0.15),
                        subtitle: "Shibuya",                 stampSymbol: "\u{1F6E1}\u{FE0F}", imageName: "stamp_konno_hachimangu"),
        StampDefinition(id: 67, name: "Imado Jinja",          icon: "cat.fill",              color: Color(red: 0.80, green: 0.40, blue: 0.50),
                        subtitle: "Taito, Asakusa",          stampSymbol: "\u{1F431}", imageName: "stamp_imado_jinja"),
        StampDefinition(id: 68, name: "Toranomon Kotohiragu", icon: "building.columns.fill", color: Color(red: 0.55, green: 0.40, blue: 0.15),
                        subtitle: "Minato, Toranomon",       stampSymbol: "\u{26E9}", imageName: "stamp_toranomon_kotohira"),
        StampDefinition(id: 69, name: "Matsuchiyama Shoden",  icon: "carrot.fill",           color: Color(red: 0.80, green: 0.20, blue: 0.20),
                        subtitle: "Taito, Asakusa",          stampSymbol: "\u{1F955}", imageName: "stamp_matsuchiyama"),
        StampDefinition(id: 70, name: "Kameido Tenjin",       icon: "graduationcap.fill",    color: Color(red: 0.45, green: 0.20, blue: 0.50),
                        subtitle: "Koto, Kameido",           stampSymbol: "\u{1F338}", imageName: "stamp_kameido_tenjin"),
        StampDefinition(id: 71, name: "Koami Jinja",          icon: "banknote.fill",         color: Color(red: 0.70, green: 0.55, blue: 0.10),
                        subtitle: "Chuo, Nihonbashi",        stampSymbol: "\u{1F4B0}", imageName: "stamp_koami_jinja"),
        StampDefinition(id: 72, name: "Yushima Seido",        icon: "book.fill",             color: Color(red: 0.25, green: 0.30, blue: 0.50),
                        subtitle: "Bunkyo, Yushima",         stampSymbol: "\u{1F4DA}", imageName: "stamp_yushima_seido"),

        // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
        // Kanagawa (Additional, ID 73-84)
        // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

        StampDefinition(id: 73, name: "Engaku-ji",            icon: "bell.fill",             color: Color(red: 0.35, green: 0.50, blue: 0.30),
                        subtitle: "Kita-Kamakura",           stampSymbol: "\u{1F514}", imageName: "stamp_engakuji"),
        StampDefinition(id: 74, name: "Jochi-ji",             icon: "leaf.fill",             color: Color(red: 0.25, green: 0.55, blue: 0.30),
                        subtitle: "Kita-Kamakura",           stampSymbol: "\u{1F343}", imageName: "stamp_jochiji"),
        StampDefinition(id: 75, name: "Zuisen-ji",            icon: "camera.macro",          color: Color(red: 0.50, green: 0.30, blue: 0.55),
                        subtitle: "Kamakura",                stampSymbol: "\u{1F338}", imageName: "stamp_zuisenji"),
        StampDefinition(id: 76, name: "Sugimoto-dera",        icon: "stairs",                color: Color(red: 0.40, green: 0.50, blue: 0.25),
                        subtitle: "Kamakura",                stampSymbol: "\u{1F3EF}", imageName: "stamp_sugimotodera"),
        StampDefinition(id: 77, name: "Meigetsuin",           icon: "camera.macro",          color: Color(red: 0.30, green: 0.45, blue: 0.70),
                        subtitle: "Kita-Kamakura",           stampSymbol: "\u{1F4AE}", imageName: "stamp_meigetsuin"),
        StampDefinition(id: 78, name: "Tokei-ji",             icon: "camera.macro",          color: Color(red: 0.55, green: 0.40, blue: 0.60),
                        subtitle: "Kita-Kamakura",           stampSymbol: "\u{1F338}", imageName: "stamp_tokeiji"),
        StampDefinition(id: 79, name: "Ofuna Kannon-ji",      icon: "figure.seated.seatbelt",color: Color(red: 0.70, green: 0.70, blue: 0.70),
                        subtitle: "Kamakura, Ofuna",         stampSymbol: "\u{1F9D8}", imageName: "stamp_ofuna_kannon"),
        StampDefinition(id: 80, name: "Iseyama Kotai Jingu",  icon: "crown.fill",            color: Color(red: 0.60, green: 0.45, blue: 0.15),
                        subtitle: "Yokohama, Nishi",         stampSymbol: "\u{2728}", imageName: "stamp_iseyama"),
        StampDefinition(id: 81, name: "Soji-ji",              icon: "house.lodge.fill",      color: Color(red: 0.20, green: 0.35, blue: 0.55),
                        subtitle: "Yokohama, Tsurumi",       stampSymbol: "\u{1F3EF}", imageName: "stamp_sojiji"),
        StampDefinition(id: 82, name: "Hakone Jinja",         icon: "tree.fill",             color: Color(red: 0.15, green: 0.50, blue: 0.30),
                        subtitle: "Hakone",                  stampSymbol: "\u{26E9}", imageName: "stamp_hakone"),
        StampDefinition(id: 83, name: "Kuzuharaoka Jinja",    icon: "heart.fill",            color: Color(red: 0.75, green: 0.25, blue: 0.40),
                        subtitle: "Kamakura",                stampSymbol: "\u{1F497}", imageName: "stamp_kuzuharaoka"),
        StampDefinition(id: 84, name: "Sasuke Inari Jinja",   icon: "flame",                 color: Color(red: 0.80, green: 0.20, blue: 0.10),
                        subtitle: "Kamakura",                stampSymbol: "\u{1F98A}", imageName: "stamp_sasuke_inari"),

        // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
        // Chiba (ID 85-100)
        // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

        StampDefinition(id: 85, name: "Naritasan Shinshoji",  icon: "flame.fill",            color: Color(red: 0.80, green: 0.30, blue: 0.10),
                        subtitle: "Narita",                  stampSymbol: "\u{1F525}", imageName: "stamp_naritasan"),
        StampDefinition(id: 86, name: "Katori Jingu",         icon: "crown.fill",            color: Color(red: 0.55, green: 0.40, blue: 0.15),
                        subtitle: "Katori",                  stampSymbol: "\u{2728}", imageName: "stamp_katori_jingu"),
        StampDefinition(id: 87, name: "Awa Jinja",            icon: "water.waves",           color: Color(red: 0.15, green: 0.40, blue: 0.60),
                        subtitle: "Tateyama",                stampSymbol: "\u{1F30A}", imageName: "stamp_awa_jinja"),
        StampDefinition(id: 88, name: "Chiba Jinja",          icon: "star.fill",             color: Color(red: 0.20, green: 0.30, blue: 0.60),
                        subtitle: "Chiba",                   stampSymbol: "\u{2B50}", imageName: "stamp_chiba_jinja"),
        StampDefinition(id: 89, name: "Katsushika Hachimangu",icon: "shield.fill",           color: Color(red: 0.60, green: 0.12, blue: 0.18),
                        subtitle: "Ichikawa",                stampSymbol: "\u{1F6E1}\u{FE0F}", imageName: "stamp_katsushika_hachiman"),
        StampDefinition(id: 90, name: "Nakayama Hokekyoji",   icon: "book.fill",             color: Color(red: 0.25, green: 0.35, blue: 0.55),
                        subtitle: "Ichikawa",                stampSymbol: "\u{1F4D6}", imageName: "stamp_nakayama_hokekyoji"),
        StampDefinition(id: 91, name: "Inage Sengen Jinja",   icon: "mountain.2.fill",       color: Color(red: 0.70, green: 0.20, blue: 0.30),
                        subtitle: "Chiba, Inage",            stampSymbol: "\u{1F5FB}", imageName: "stamp_inage_sengen"),
        StampDefinition(id: 92, name: "Funabashi Daijingu",   icon: "crown.fill",            color: Color(red: 0.65, green: 0.45, blue: 0.10),
                        subtitle: "Funabashi",               stampSymbol: "\u{2728}", imageName: "stamp_funabashi_daijingu"),
        StampDefinition(id: 93, name: "Matsudo Jinja",        icon: "building.columns.fill", color: Color(red: 0.70, green: 0.18, blue: 0.18),
                        subtitle: "Matsudo",                 stampSymbol: "\u{26E9}", imageName: "stamp_matsudo_jinja"),
        StampDefinition(id: 94, name: "Tamasaki Jinja",       icon: "figure.wave",           color: Color(red: 0.75, green: 0.25, blue: 0.20),
                        subtitle: "Ichinomiya",              stampSymbol: "\u{26E9}", imageName: "stamp_tamasaki"),
        StampDefinition(id: 95, name: "Nihon-ji",             icon: "figure.seated.seatbelt",color: Color(red: 0.30, green: 0.50, blue: 0.25),
                        subtitle: "Nokogiriyama",            stampSymbol: "\u{1F9D8}", imageName: "stamp_nihonaji"),
        StampDefinition(id: 96, name: "Tanjoji",              icon: "sunrise.fill",          color: Color(red: 0.80, green: 0.45, blue: 0.10),
                        subtitle: "Kamogawa",                stampSymbol: "\u{1F305}", imageName: "stamp_tanjoji"),
        StampDefinition(id: 97, name: "Mamasan Guho-ji",      icon: "camera.macro",          color: Color(red: 0.55, green: 0.30, blue: 0.50),
                        subtitle: "Ichikawa, Mama",          stampSymbol: "\u{1F338}", imageName: "stamp_mamasan_guhoji"),
        StampDefinition(id: 98, name: "Kashiwa Jinja",        icon: "leaf.fill",             color: Color(red: 0.25, green: 0.50, blue: 0.25),
                        subtitle: "Kashiwa",                 stampSymbol: "\u{1F343}", imageName: "stamp_kashiwa_jinja"),
        StampDefinition(id: 99, name: "Ohara Jinja",          icon: "building.columns.fill", color: Color(red: 0.65, green: 0.15, blue: 0.20),
                        subtitle: "Narashino",               stampSymbol: "\u{26E9}", imageName: "stamp_ohara_jinja"),
        StampDefinition(id: 100, name: "Kemigawa Jinja",      icon: "building.columns.fill", color: Color(red: 0.60, green: 0.18, blue: 0.22),
                        subtitle: "Chiba, Hanamigawa",       stampSymbol: "\u{26E9}", imageName: "stamp_kemigawa_jinja"),

        // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
        // Tokyo (Additional, ID 101-112)
        // 東京十社完結 + 五色不動 + 主要寺社
        // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

        // 東京十社 (残り3社)
        StampDefinition(id: 101, name: "Shiba Daijingu",         icon: "building.columns.fill", color: Color(red: 0.75, green: 0.18, blue: 0.18),
                        subtitle: "Minato, Shiba",              stampSymbol: "\u{26E9}", imageName: "stamp_shiba_daijingu"),
        StampDefinition(id: 102, name: "Hakusan Jinja",          icon: "camera.macro",          color: Color(red: 0.55, green: 0.35, blue: 0.55),
                        subtitle: "Bunkyo, Hakusan",            stampSymbol: "\u{1F338}", imageName: "stamp_hakusan_jinja"),
        StampDefinition(id: 103, name: "Shinagawa Jinja",        icon: "flag.fill",             color: Color(red: 0.70, green: 0.15, blue: 0.20),
                        subtitle: "Shinagawa, Kitashinagawa",   stampSymbol: "\u{26E9}", imageName: "stamp_shinagawa_jinja"),

        // 五色不動 — 目黒不動
        StampDefinition(id: 104, name: "Ryusen-ji",              icon: "flame.fill",            color: Color(red: 0.30, green: 0.22, blue: 0.55),
                        subtitle: "Meguro, Shimomeguro",        stampSymbol: "\u{1F525}", imageName: "stamp_ryusenji"),

        // 主要寺社
        StampDefinition(id: 105, name: "Gokoku-ji",              icon: "building.columns.fill", color: Color(red: 0.22, green: 0.30, blue: 0.55),
                        subtitle: "Bunkyo, Otsuka",             stampSymbol: "\u{1F3EF}", imageName: "stamp_gokokuji"),
        StampDefinition(id: 106, name: "Fukutoku Jinja",         icon: "sparkles",              color: Color(red: 0.70, green: 0.55, blue: 0.12),
                        subtitle: "Chuo, Nihonbashi Muromachi",  stampSymbol: "\u{2728}", imageName: "stamp_fukutoku"),
        StampDefinition(id: 107, name: "Akagi Jinja",            icon: "building.2.fill",       color: Color(red: 0.22, green: 0.32, blue: 0.60),
                        subtitle: "Shinjuku, Kagurazaka",       stampSymbol: "\u{26E9}", imageName: "stamp_akagi_jinja"),
        StampDefinition(id: 108, name: "Anamori Inari Jinja",    icon: "flame",                 color: Color(red: 0.80, green: 0.22, blue: 0.15),
                        subtitle: "Ota, Haneda",                stampSymbol: "\u{1F98A}", imageName: "stamp_anamori_inari"),
        StampDefinition(id: 109, name: "Takahatafudo Kongoji",   icon: "flame.fill",            color: Color(red: 0.75, green: 0.28, blue: 0.12),
                        subtitle: "Hino",                       stampSymbol: "\u{1F525}", imageName: "stamp_takahatafudo"),
        StampDefinition(id: 110, name: "Ueno Toshogu",           icon: "paintpalette.fill",     color: Color(red: 0.65, green: 0.50, blue: 0.12),
                        subtitle: "Taito, Ueno",                stampSymbol: "\u{26E9}", imageName: "stamp_ueno_toshogu"),
        StampDefinition(id: 111, name: "Koganji",                icon: "heart.circle.fill",     color: Color(red: 0.55, green: 0.35, blue: 0.22),
                        subtitle: "Toshima, Sugamo",            stampSymbol: "\u{1F3EF}", imageName: "stamp_koganji"),
        StampDefinition(id: 112, name: "Juniso Kumano Jinja",    icon: "tree.fill",             color: Color(red: 0.20, green: 0.48, blue: 0.28),
                        subtitle: "Shinjuku, Nishishinjuku",    stampSymbol: "\u{26E9}", imageName: "stamp_juniso_kumano"),

        // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
        // Kanagawa (Additional, ID 113-120)
        // 鎌倉五山完結 + 主要神社
        // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

        StampDefinition(id: 113, name: "Oyama Afuri Jinja",      icon: "mountain.2.fill",       color: Color(red: 0.18, green: 0.35, blue: 0.60),
                        subtitle: "Isehara, Oyama",             stampSymbol: "\u{26F0}\u{FE0F}", imageName: "stamp_oyama_afuri"),
        StampDefinition(id: 114, name: "Hotoku Ninomiya Jinja",  icon: "book.fill",             color: Color(red: 0.50, green: 0.35, blue: 0.20),
                        subtitle: "Odawara",                    stampSymbol: "\u{1F4DA}", imageName: "stamp_hotoku_ninomiya"),
        StampDefinition(id: 115, name: "Hiratsuka Hachimangu",   icon: "flag.fill",             color: Color(red: 0.65, green: 0.15, blue: 0.15),
                        subtitle: "Hiratsuka",                  stampSymbol: "\u{26E9}", imageName: "stamp_hiratsuka_hachiman"),
        StampDefinition(id: 116, name: "Hakone Kuzuryu Jinja",   icon: "drop.fill",             color: Color(red: 0.15, green: 0.40, blue: 0.65),
                        subtitle: "Hakone, Moto-Hakone",        stampSymbol: "\u{1F409}", imageName: "stamp_hakone_kuzuryu"),

        // 鎌倉五山 (残り2寺: 第三位・第五位)
        StampDefinition(id: 117, name: "Jufuku-ji",              icon: "leaf.fill",             color: Color(red: 0.25, green: 0.50, blue: 0.30),
                        subtitle: "Kamakura, Ogigayatsu",       stampSymbol: "\u{1F343}", imageName: "stamp_jufukuji"),
        StampDefinition(id: 118, name: "Jomyo-ji",               icon: "leaf.fill",             color: Color(red: 0.30, green: 0.55, blue: 0.28),
                        subtitle: "Kamakura, Jomyoji",          stampSymbol: "\u{1F375}", imageName: "stamp_jomyoji"),

        StampDefinition(id: 119, name: "Morito Jinja",           icon: "water.waves",           color: Color(red: 0.15, green: 0.45, blue: 0.65),
                        subtitle: "Hayama",                     stampSymbol: "\u{1F30A}", imageName: "stamp_morito"),
        StampDefinition(id: 120, name: "Hashirimizu Jinja",      icon: "sailboat.fill",         color: Color(red: 0.20, green: 0.38, blue: 0.60),
                        subtitle: "Yokosuka",                   stampSymbol: "\u{26F5}", imageName: "stamp_hashirimizu"),

        // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
        // Chiba (Additional, ID 121-122)
        // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

        StampDefinition(id: 121, name: "Kasamori Kannon",        icon: "building.fill",         color: Color(red: 0.50, green: 0.35, blue: 0.22),
                        subtitle: "Chonan",                     stampSymbol: "\u{1F3EF}", imageName: "stamp_kasamori_kannon"),
        StampDefinition(id: 122, name: "Sakuragi Jinja",         icon: "camera.macro",          color: Color(red: 0.75, green: 0.40, blue: 0.50),
                        subtitle: "Noda",                       stampSymbol: "\u{1F338}", imageName: "stamp_sakuragi_jinja"),

        // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
        // Kanagawa — Kawasaki (ID 123-130)
        // 高津区・多摩区・川崎区
        // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

        StampDefinition(id: 123, name: "Mizonokuchi Jinja",      icon: "building.columns.fill", color: Color(red: 0.70, green: 0.18, blue: 0.18),
                        subtitle: "Kawasaki, Takatsu",          stampSymbol: "\u{26E9}", imageName: "stamp_mizonokuchi"),
        StampDefinition(id: 124, name: "Yokoji",                 icon: "house.lodge.fill",      color: Color(red: 0.30, green: 0.40, blue: 0.55),
                        subtitle: "Kawasaki, Takatsu",          stampSymbol: "\u{1F3EF}", imageName: "stamp_yokoji"),
        StampDefinition(id: 125, name: "Kuji Jinja",             icon: "building.columns.fill", color: Color(red: 0.60, green: 0.20, blue: 0.20),
                        subtitle: "Kawasaki, Takatsu",          stampSymbol: "\u{26E9}", imageName: "stamp_kuji_jinja"),
        StampDefinition(id: 126, name: "Nagao Jinja",            icon: "leaf.fill",             color: Color(red: 0.22, green: 0.50, blue: 0.28),
                        subtitle: "Kawasaki, Tama",             stampSymbol: "\u{1F343}", imageName: "stamp_nagao_jinja"),
        StampDefinition(id: 127, name: "Myorakuji",              icon: "camera.macro",          color: Color(red: 0.35, green: 0.45, blue: 0.70),
                        subtitle: "Kawasaki, Tama",             stampSymbol: "\u{1F4AE}", imageName: "stamp_myorakuji"),
        StampDefinition(id: 128, name: "Inage Jinja",            icon: "flame.fill",            color: Color(red: 0.75, green: 0.22, blue: 0.15),
                        subtitle: "Kawasaki",                   stampSymbol: "\u{26E9}", imageName: "stamp_inage_jinja_kawasaki"),
        StampDefinition(id: 129, name: "Hie Daijinja",           icon: "tree.fill",             color: Color(red: 0.18, green: 0.48, blue: 0.25),
                        subtitle: "Kawasaki, Takatsu",          stampSymbol: "\u{1F333}", imageName: "stamp_hie_daijinja"),
        StampDefinition(id: 130, name: "Noborito Inari",         icon: "flame",                 color: Color(red: 0.80, green: 0.20, blue: 0.12),
                        subtitle: "Kawasaki, Tama",             stampSymbol: "\u{1F98A}", imageName: "stamp_noborito_inari"),

        // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
        // Kyoto (Additional, ID 131-155)
        // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

        StampDefinition(id: 131, name: "Kinkaku-ji",             icon: "sparkles",              color: Color(red: 0.80, green: 0.65, blue: 0.10),
                        subtitle: "Kyoto, Kita",                stampSymbol: "\u{2728}", imageName: "stamp_kinkakuji_kyoto"),
        StampDefinition(id: 132, name: "Ginkaku-ji",             icon: "moon.fill",             color: Color(red: 0.55, green: 0.55, blue: 0.55),
                        subtitle: "Kyoto, Sakyo",               stampSymbol: "\u{1F319}", imageName: "stamp_ginkakuji"),
        StampDefinition(id: 133, name: "Kiyomizu-dera",          icon: "water.waves",           color: Color(red: 0.70, green: 0.18, blue: 0.15),
                        subtitle: "Kyoto, Higashiyama",         stampSymbol: "\u{1F3EF}", imageName: "stamp_kiyomizudera_kyoto"),
        StampDefinition(id: 134, name: "Tofuku-ji",              icon: "leaf.fill",             color: Color(red: 0.80, green: 0.35, blue: 0.10),
                        subtitle: "Kyoto, Higashiyama",         stampSymbol: "\u{1F341}", imageName: "stamp_tofukuji"),
        StampDefinition(id: 135, name: "Nanzen-ji",              icon: "building.fill",         color: Color(red: 0.30, green: 0.45, blue: 0.25),
                        subtitle: "Kyoto, Sakyo",               stampSymbol: "\u{1F3EF}", imageName: "stamp_nanzenji"),
        StampDefinition(id: 136, name: "Ryoan-ji",               icon: "circle.grid.3x3",      color: Color(red: 0.50, green: 0.50, blue: 0.45),
                        subtitle: "Kyoto, Ukyo",                stampSymbol: "\u{1FAA8}", imageName: "stamp_ryoanji"),
        StampDefinition(id: 137, name: "Tenryu-ji",              icon: "cloud.fill",            color: Color(red: 0.25, green: 0.50, blue: 0.35),
                        subtitle: "Kyoto, Ukyo",                stampSymbol: "\u{1F409}", imageName: "stamp_tenryuji"),
        StampDefinition(id: 138, name: "Daitoku-ji",             icon: "cup.and.saucer.fill",   color: Color(red: 0.35, green: 0.30, blue: 0.25),
                        subtitle: "Kyoto, Kita",                stampSymbol: "\u{1F375}", imageName: "stamp_daitokuji"),
        StampDefinition(id: 139, name: "Myoshin-ji",             icon: "house.lodge.fill",      color: Color(red: 0.40, green: 0.35, blue: 0.30),
                        subtitle: "Kyoto, Ukyo",                stampSymbol: "\u{1F3EF}", imageName: "stamp_myoshinji"),
        StampDefinition(id: 140, name: "Kennin-ji",              icon: "wind",                  color: Color(red: 0.30, green: 0.40, blue: 0.55),
                        subtitle: "Kyoto, Higashiyama",         stampSymbol: "\u{1F32C}", imageName: "stamp_kenninaji"),
        StampDefinition(id: 141, name: "Nishi Hongan-ji",        icon: "building.columns.fill", color: Color(red: 0.55, green: 0.40, blue: 0.20),
                        subtitle: "Kyoto, Shimogyo",            stampSymbol: "\u{1F3DB}", imageName: "stamp_nishi_honganji"),
        StampDefinition(id: 142, name: "Higashi Hongan-ji",      icon: "building.columns.fill", color: Color(red: 0.50, green: 0.35, blue: 0.18),
                        subtitle: "Kyoto, Shimogyo",            stampSymbol: "\u{1F3DB}", imageName: "stamp_higashi_honganji"),
        StampDefinition(id: 143, name: "Kitano Tenmangu",        icon: "graduationcap.fill",    color: Color(red: 0.55, green: 0.25, blue: 0.52),
                        subtitle: "Kyoto, Kamigyo",             stampSymbol: "\u{1F3D3}", imageName: "stamp_kitano_tenmangu_kyoto"),
        StampDefinition(id: 144, name: "Yasaka Jinja",           icon: "flame.fill",            color: Color(red: 0.75, green: 0.15, blue: 0.15),
                        subtitle: "Kyoto, Higashiyama",         stampSymbol: "\u{26E9}", imageName: "stamp_yasaka_kyoto"),
        StampDefinition(id: 145, name: "Heian Jingu",            icon: "crown.fill",            color: Color(red: 0.70, green: 0.20, blue: 0.20),
                        subtitle: "Kyoto, Sakyo",               stampSymbol: "\u{1F451}", imageName: "stamp_heian_jingu_kyoto"),
        StampDefinition(id: 146, name: "Shimogamo Jinja",        icon: "tree.fill",             color: Color(red: 0.20, green: 0.50, blue: 0.28),
                        subtitle: "Kyoto, Sakyo",               stampSymbol: "\u{1F333}", imageName: "stamp_shimogamo_kyoto"),
        StampDefinition(id: 147, name: "Kamigamo Jinja",         icon: "leaf.fill",             color: Color(red: 0.22, green: 0.55, blue: 0.30),
                        subtitle: "Kyoto, Kita",                stampSymbol: "\u{1F343}", imageName: "stamp_kamigamo_kyoto"),
        StampDefinition(id: 148, name: "Kifune Jinja",           icon: "water.waves",           color: Color(red: 0.15, green: 0.40, blue: 0.65),
                        subtitle: "Kyoto, Sakyo",               stampSymbol: "\u{1F30A}", imageName: "stamp_kifune"),
        StampDefinition(id: 149, name: "Kurama-dera",            icon: "mountain.2.fill",       color: Color(red: 0.35, green: 0.50, blue: 0.30),
                        subtitle: "Kyoto, Sakyo",               stampSymbol: "\u{26F0}", imageName: "stamp_kurama"),
        StampDefinition(id: 150, name: "Byodo-in",               icon: "bird.fill",             color: Color(red: 0.45, green: 0.25, blue: 0.55),
                        subtitle: "Uji, Kyoto",                 stampSymbol: "\u{1F426}", imageName: "stamp_byodoin"),
        StampDefinition(id: 151, name: "Daigo-ji",               icon: "camera.macro",          color: Color(red: 0.70, green: 0.40, blue: 0.50),
                        subtitle: "Kyoto, Fushimi",             stampSymbol: "\u{1F338}", imageName: "stamp_daigoji"),
        StampDefinition(id: 152, name: "Sanjusangendo",          icon: "figure.stand",          color: Color(red: 0.60, green: 0.30, blue: 0.15),
                        subtitle: "Kyoto, Higashiyama",         stampSymbol: "\u{1F9D8}", imageName: "stamp_sanjusangendo"),
        StampDefinition(id: 153, name: "To-ji",                  icon: "building.2.fill",       color: Color(red: 0.50, green: 0.35, blue: 0.25),
                        subtitle: "Kyoto, Minami",              stampSymbol: "\u{1F3EF}", imageName: "stamp_toji"),
        StampDefinition(id: 154, name: "Eikan-do",               icon: "leaf.fill",             color: Color(red: 0.80, green: 0.40, blue: 0.10),
                        subtitle: "Kyoto, Sakyo",               stampSymbol: "\u{1F341}", imageName: "stamp_eikando"),
        StampDefinition(id: 155, name: "Kodai-ji",               icon: "moon.stars.fill",       color: Color(red: 0.25, green: 0.30, blue: 0.50),
                        subtitle: "Kyoto, Higashiyama",         stampSymbol: "\u{1F303}", imageName: "stamp_kodaiji"),

        // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
        // Osaka (Additional, ID 156-163)
        // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

        StampDefinition(id: 156, name: "Sumiyoshi Taisha",       icon: "mountain.2.fill",       color: Color(red: 0.20, green: 0.50, blue: 0.30),
                        subtitle: "Osaka, Sumiyoshi",           stampSymbol: "\u{26E9}", imageName: "stamp_sumiyoshi_osaka"),
        StampDefinition(id: 157, name: "Shitennoji",             icon: "building.columns.fill", color: Color(red: 0.65, green: 0.30, blue: 0.15),
                        subtitle: "Osaka, Tennoji",             stampSymbol: "\u{1F3EF}", imageName: "stamp_shitennoji_osaka"),
        StampDefinition(id: 158, name: "Osaka Tenmangu",         icon: "graduationcap.fill",    color: Color(red: 0.55, green: 0.25, blue: 0.52),
                        subtitle: "Osaka, Kita",                stampSymbol: "\u{1F3D3}", imageName: "stamp_osaka_tenmangu_2"),
        StampDefinition(id: 159, name: "Imamiya Ebisu Jinja",    icon: "fish.fill",             color: Color(red: 0.70, green: 0.50, blue: 0.10),
                        subtitle: "Osaka, Naniwa",              stampSymbol: "\u{1F41F}", imageName: "stamp_imamiya_ebisu_osaka"),
        StampDefinition(id: 160, name: "Tamatsukuri Inari",      icon: "flame",                 color: Color(red: 0.80, green: 0.22, blue: 0.15),
                        subtitle: "Osaka, Chuo",                stampSymbol: "\u{1F98A}", imageName: "stamp_tamatsukuri_inari"),
        StampDefinition(id: 161, name: "Hozen-ji",               icon: "drop.fill",             color: Color(red: 0.25, green: 0.40, blue: 0.55),
                        subtitle: "Osaka, Chuo",                stampSymbol: "\u{1F4A7}", imageName: "stamp_hozenji"),
        StampDefinition(id: 162, name: "Domyoji Tenmangu",       icon: "graduationcap.fill",    color: Color(red: 0.50, green: 0.22, blue: 0.48),
                        subtitle: "Fujiidera, Osaka",           stampSymbol: "\u{1F338}", imageName: "stamp_domyoji_tenmangu"),
        StampDefinition(id: 163, name: "Hiraoka Jinja",          icon: "building.columns.fill", color: Color(red: 0.65, green: 0.18, blue: 0.18),
                        subtitle: "Higashi-Osaka",              stampSymbol: "\u{26E9}", imageName: "stamp_hiraoka"),

        // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
        // Nara (Additional, ID 164-172)
        // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

        StampDefinition(id: 164, name: "Todai-ji",               icon: "figure.seated.side",    color: Color(red: 0.60, green: 0.35, blue: 0.15),
                        subtitle: "Nara",                       stampSymbol: "\u{1F9D8}", imageName: "stamp_todaiji_nara"),
        StampDefinition(id: 165, name: "Kasuga Taisha",          icon: "lamp.desk.fill",        color: Color(red: 0.75, green: 0.18, blue: 0.12),
                        subtitle: "Nara",                       stampSymbol: "\u{1F3EE}", imageName: "stamp_kasuga_nara"),
        StampDefinition(id: 166, name: "Horyu-ji",               icon: "building.2.fill",       color: Color(red: 0.50, green: 0.40, blue: 0.25),
                        subtitle: "Ikaruga, Nara",              stampSymbol: "\u{1F3EF}", imageName: "stamp_horyuji"),
        StampDefinition(id: 167, name: "Yakushi-ji",             icon: "cross.fill",            color: Color(red: 0.45, green: 0.30, blue: 0.55),
                        subtitle: "Nara, Nishinokyo",           stampSymbol: "\u{2695}", imageName: "stamp_yakushiji_nara"),
        StampDefinition(id: 168, name: "Toshodai-ji",            icon: "building.fill",         color: Color(red: 0.40, green: 0.35, blue: 0.30),
                        subtitle: "Nara, Nishinokyo",           stampSymbol: "\u{1F3EF}", imageName: "stamp_toshodaiji"),
        StampDefinition(id: 169, name: "Hase-dera",              icon: "camera.macro",          color: Color(red: 0.65, green: 0.35, blue: 0.50),
                        subtitle: "Sakurai, Nara",              stampSymbol: "\u{1F338}", imageName: "stamp_hasedera_nara"),
        StampDefinition(id: 170, name: "Tanzan Jinja",           icon: "leaf.fill",             color: Color(red: 0.80, green: 0.35, blue: 0.10),
                        subtitle: "Sakurai, Nara",              stampSymbol: "\u{1F341}", imageName: "stamp_tanzan"),
        StampDefinition(id: 171, name: "Asuka-dera",             icon: "hourglass",             color: Color(red: 0.50, green: 0.40, blue: 0.30),
                        subtitle: "Asuka, Nara",                stampSymbol: "\u{231B}", imageName: "stamp_asuka_dera"),
        StampDefinition(id: 172, name: "Muro-ji",                icon: "tree.fill",             color: Color(red: 0.22, green: 0.50, blue: 0.30),
                        subtitle: "Uda, Nara",                  stampSymbol: "\u{1F332}", imageName: "stamp_muroji"),

        // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
        // Shiga (ID 173-177)
        // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

        StampDefinition(id: 173, name: "Enryaku-ji",             icon: "mountain.2.fill",       color: Color(red: 0.35, green: 0.45, blue: 0.25),
                        subtitle: "Otsu, Shiga",                stampSymbol: "\u{26F0}", imageName: "stamp_enryakuji"),
        StampDefinition(id: 174, name: "Miidera",                icon: "bell.fill",             color: Color(red: 0.45, green: 0.35, blue: 0.55),
                        subtitle: "Otsu, Shiga",                stampSymbol: "\u{1F514}", imageName: "stamp_miidera"),
        StampDefinition(id: 175, name: "Taga Taisha",            icon: "heart.fill",            color: Color(red: 0.70, green: 0.20, blue: 0.30),
                        subtitle: "Taga, Shiga",                stampSymbol: "\u{2764}", imageName: "stamp_taga_taisha"),
        StampDefinition(id: 176, name: "Hiyoshi Taisha",         icon: "tree.fill",             color: Color(red: 0.20, green: 0.50, blue: 0.25),
                        subtitle: "Otsu, Shiga",                stampSymbol: "\u{1F333}", imageName: "stamp_hiyoshi_taisha"),
        StampDefinition(id: 177, name: "Ishiyama-dera",          icon: "book.fill",             color: Color(red: 0.50, green: 0.35, blue: 0.55),
                        subtitle: "Otsu, Shiga",                stampSymbol: "\u{1F4D6}", imageName: "stamp_ishiyamadera"),

        // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
        // Hyogo (ID 178-183)
        // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

        StampDefinition(id: 178, name: "Ikuta Jinja",            icon: "heart.fill",            color: Color(red: 0.75, green: 0.15, blue: 0.25),
                        subtitle: "Kobe, Hyogo",                stampSymbol: "\u{26E9}", imageName: "stamp_ikuta"),
        StampDefinition(id: 179, name: "Nagata Jinja",           icon: "building.columns.fill", color: Color(red: 0.65, green: 0.18, blue: 0.18),
                        subtitle: "Kobe, Hyogo",                stampSymbol: "\u{26E9}", imageName: "stamp_nagata"),
        StampDefinition(id: 180, name: "Engyoji",                icon: "mountain.2.fill",       color: Color(red: 0.35, green: 0.50, blue: 0.30),
                        subtitle: "Himeji, Hyogo",              stampSymbol: "\u{26F0}", imageName: "stamp_engyoji"),
        StampDefinition(id: 181, name: "Taisan-ji",              icon: "building.2.fill",       color: Color(red: 0.50, green: 0.35, blue: 0.22),
                        subtitle: "Kobe, Hyogo",                stampSymbol: "\u{1F3EF}", imageName: "stamp_taisanji"),
        StampDefinition(id: 182, name: "Nishinomiya Jinja",      icon: "fish.fill",             color: Color(red: 0.65, green: 0.50, blue: 0.12),
                        subtitle: "Nishinomiya, Hyogo",         stampSymbol: "\u{1F41F}", imageName: "stamp_nishinomiya"),
        StampDefinition(id: 183, name: "Suma-dera",              icon: "water.waves",           color: Color(red: 0.20, green: 0.40, blue: 0.60),
                        subtitle: "Kobe, Hyogo",                stampSymbol: "\u{1F30A}", imageName: "stamp_sumadera"),

        // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
        // Wakayama (ID 184-190)
        // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

        StampDefinition(id: 184, name: "Kumano Hongu Taisha",    icon: "flame.fill",            color: Color(red: 0.70, green: 0.18, blue: 0.12),
                        subtitle: "Tanabe, Wakayama",           stampSymbol: "\u{1F525}", imageName: "stamp_kumano_hongu"),
        StampDefinition(id: 185, name: "Kumano Nachi Taisha",    icon: "water.waves",           color: Color(red: 0.15, green: 0.45, blue: 0.65),
                        subtitle: "Nachikatsuura, Wakayama",    stampSymbol: "\u{1F30A}", imageName: "stamp_kumano_nachi"),
        StampDefinition(id: 186, name: "Kumano Hayatama Taisha", icon: "bolt.fill",             color: Color(red: 0.75, green: 0.22, blue: 0.15),
                        subtitle: "Shingu, Wakayama",           stampSymbol: "\u{26A1}", imageName: "stamp_kumano_hayatama"),
        StampDefinition(id: 187, name: "Koyasan Kongobu-ji",     icon: "building.fill",         color: Color(red: 0.50, green: 0.30, blue: 0.55),
                        subtitle: "Koya, Wakayama",             stampSymbol: "\u{1F3EF}", imageName: "stamp_koyasan_kongobuji"),
        StampDefinition(id: 188, name: "Koyasan Okunoin",        icon: "moon.stars.fill",       color: Color(red: 0.20, green: 0.25, blue: 0.45),
                        subtitle: "Koya, Wakayama",             stampSymbol: "\u{1F303}", imageName: "stamp_koyasan_okunoin"),
        StampDefinition(id: 189, name: "Kimiidera",              icon: "camera.macro",          color: Color(red: 0.65, green: 0.35, blue: 0.50),
                        subtitle: "Wakayama",                   stampSymbol: "\u{1F338}", imageName: "stamp_kimiidera"),
        StampDefinition(id: 190, name: "Kokawa-dera",            icon: "house.lodge.fill",      color: Color(red: 0.45, green: 0.35, blue: 0.30),
                        subtitle: "Kinokawa, Wakayama",         stampSymbol: "\u{1F3EF}", imageName: "stamp_kokawa_dera"),

        // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
        // Chubu — Tokai (ID 191-201)
        // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

        StampDefinition(id: 191, name: "Atsuta Jingu",           icon: "crown.fill",            color: Color(red: 0.70, green: 0.55, blue: 0.10),
                        subtitle: "Nagoya, Aichi",              stampSymbol: "\u{1F451}", imageName: "stamp_atsuta_jingu"),
        StampDefinition(id: 192, name: "Toyokawa Inari",         icon: "flame",                 color: Color(red: 0.80, green: 0.22, blue: 0.15),
                        subtitle: "Toyokawa, Aichi",            stampSymbol: "\u{1F98A}", imageName: "stamp_toyokawa_inari"),
        StampDefinition(id: 193, name: "Osu Kannon",             icon: "figure.seated.side",    color: Color(red: 0.60, green: 0.30, blue: 0.50),
                        subtitle: "Nagoya, Aichi",              stampSymbol: "\u{1F9D8}", imageName: "stamp_osu_kannon"),
        StampDefinition(id: 194, name: "Masumida Jinja",         icon: "building.columns.fill", color: Color(red: 0.65, green: 0.18, blue: 0.18),
                        subtitle: "Ichinomiya, Aichi",          stampSymbol: "\u{26E9}", imageName: "stamp_masumida"),
        StampDefinition(id: 195, name: "Tsushima Jinja",         icon: "building.columns.fill", color: Color(red: 0.60, green: 0.20, blue: 0.20),
                        subtitle: "Tsushima, Aichi",            stampSymbol: "\u{26E9}", imageName: "stamp_tsushima"),
        StampDefinition(id: 196, name: "Inuyama Naritasan",      icon: "house.lodge.fill",      color: Color(red: 0.55, green: 0.35, blue: 0.20),
                        subtitle: "Inuyama, Aichi",             stampSymbol: "\u{1F3EF}", imageName: "stamp_inuyama_naritasan"),
        StampDefinition(id: 197, name: "Fujisan Hongu Sengen Taisha", icon: "mountain.2.fill",  color: Color(red: 0.20, green: 0.50, blue: 0.70),
                        subtitle: "Fujinomiya, Shizuoka",       stampSymbol: "\u{1F5FB}", imageName: "stamp_fujisan_sengen"),
        StampDefinition(id: 198, name: "Kunozan Toshogu",        icon: "sparkles",              color: Color(red: 0.75, green: 0.60, blue: 0.12),
                        subtitle: "Shizuoka",                   stampSymbol: "\u{2728}", imageName: "stamp_kunouzan_toshogu"),
        StampDefinition(id: 199, name: "Mishima Taisha",         icon: "shield.fill",           color: Color(red: 0.60, green: 0.15, blue: 0.18),
                        subtitle: "Mishima, Shizuoka",          stampSymbol: "\u{1F6E1}", imageName: "stamp_mishima_taisha"),
        StampDefinition(id: 200, name: "Hattasan Sonei-ji",      icon: "house.lodge.fill",      color: Color(red: 0.50, green: 0.35, blue: 0.25),
                        subtitle: "Fukuroi, Shizuoka",          stampSymbol: "\u{1F3EF}", imageName: "stamp_hattasan"),
        StampDefinition(id: 201, name: "Kinomiya Jinja",         icon: "tree.fill",             color: Color(red: 0.18, green: 0.50, blue: 0.25),
                        subtitle: "Atami, Shizuoka",            stampSymbol: "\u{1F333}", imageName: "stamp_kinomiya"),

        // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
        // Chubu — Koshinetsu (ID 202-210)
        // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

        StampDefinition(id: 202, name: "Zenko-ji",               icon: "building.columns.fill", color: Color(red: 0.55, green: 0.40, blue: 0.20),
                        subtitle: "Nagano",                     stampSymbol: "\u{1F3EF}", imageName: "stamp_zenkoji"),
        StampDefinition(id: 203, name: "Togakushi Jinja",        icon: "mountain.2.fill",       color: Color(red: 0.25, green: 0.50, blue: 0.35),
                        subtitle: "Nagano",                     stampSymbol: "\u{26F0}", imageName: "stamp_togakushi"),
        StampDefinition(id: 204, name: "Suwa Taisha",            icon: "wind",                  color: Color(red: 0.30, green: 0.45, blue: 0.60),
                        subtitle: "Suwa, Nagano",               stampSymbol: "\u{1F32C}", imageName: "stamp_suwa_taisha"),
        StampDefinition(id: 205, name: "Takeda Jinja",           icon: "shield.fill",           color: Color(red: 0.60, green: 0.15, blue: 0.15),
                        subtitle: "Kofu, Yamanashi",            stampSymbol: "\u{1F6E1}", imageName: "stamp_takeda_jinja"),
        StampDefinition(id: 206, name: "Minobusan Kuon-ji",      icon: "building.fill",         color: Color(red: 0.45, green: 0.30, blue: 0.55),
                        subtitle: "Minobu, Yamanashi",          stampSymbol: "\u{1F3EF}", imageName: "stamp_minobusan"),
        StampDefinition(id: 207, name: "Yahiko Jinja",           icon: "leaf.fill",             color: Color(red: 0.22, green: 0.55, blue: 0.30),
                        subtitle: "Yahiko, Niigata",            stampSymbol: "\u{1F343}", imageName: "stamp_yahiko"),
        StampDefinition(id: 208, name: "Kitaguchi Hongu Fuji Sengen Jinja", icon: "mountain.2.fill", color: Color(red: 0.25, green: 0.45, blue: 0.65),
                        subtitle: "Fujiyoshida, Yamanashi",     stampSymbol: "\u{1F5FB}", imageName: "stamp_kitaguchi_sengen"),
        StampDefinition(id: 209, name: "Hotaka Jinja",           icon: "mountain.2.fill",       color: Color(red: 0.30, green: 0.50, blue: 0.40),
                        subtitle: "Azumino, Nagano",            stampSymbol: "\u{26F0}", imageName: "stamp_hotaka"),
        StampDefinition(id: 210, name: "Hakusan Jinja (Niigata)", icon: "building.columns.fill", color: Color(red: 0.60, green: 0.20, blue: 0.20),
                        subtitle: "Niigata",                    stampSymbol: "\u{26E9}", imageName: "stamp_hakusan_niigata"),

        // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
        // Chubu — Hokuriku (ID 211-218)
        // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

        StampDefinition(id: 211, name: "Eihei-ji",               icon: "figure.mind.and.body",  color: Color(red: 0.30, green: 0.40, blue: 0.25),
                        subtitle: "Eiheiji, Fukui",             stampSymbol: "\u{1F9D8}", imageName: "stamp_eiheiji"),
        StampDefinition(id: 212, name: "Kehi Jingu",             icon: "crown.fill",            color: Color(red: 0.65, green: 0.50, blue: 0.12),
                        subtitle: "Tsuruga, Fukui",             stampSymbol: "\u{1F451}", imageName: "stamp_kehi_jingu"),
        StampDefinition(id: 213, name: "Shirayama Hime Jinja",   icon: "snow",                  color: Color(red: 0.40, green: 0.55, blue: 0.70),
                        subtitle: "Hakusan, Ishikawa",          stampSymbol: "\u{2744}", imageName: "stamp_shirayama_hime"),
        StampDefinition(id: 214, name: "Oyama Jinja",            icon: "building.columns.fill", color: Color(red: 0.50, green: 0.35, blue: 0.20),
                        subtitle: "Kanazawa, Ishikawa",         stampSymbol: "\u{26E9}", imageName: "stamp_oyama_jinja"),
        StampDefinition(id: 215, name: "Kanazawa Jinja",         icon: "building.columns.fill", color: Color(red: 0.55, green: 0.22, blue: 0.22),
                        subtitle: "Kanazawa, Ishikawa",         stampSymbol: "\u{26E9}", imageName: "stamp_kanazawa_jinja"),
        StampDefinition(id: 216, name: "Nata-dera",              icon: "flame.fill",            color: Color(red: 0.70, green: 0.30, blue: 0.15),
                        subtitle: "Komatsu, Ishikawa",          stampSymbol: "\u{1F525}", imageName: "stamp_natadera"),
        StampDefinition(id: 217, name: "Zuiryu-ji",              icon: "building.fill",         color: Color(red: 0.40, green: 0.35, blue: 0.50),
                        subtitle: "Takaoka, Toyama",            stampSymbol: "\u{1F3EF}", imageName: "stamp_zuiryuji"),
        StampDefinition(id: 218, name: "Takaoka Daibutsu",       icon: "figure.seated.side",    color: Color(red: 0.55, green: 0.40, blue: 0.25),
                        subtitle: "Takaoka, Toyama",            stampSymbol: "\u{1F9D8}", imageName: "stamp_takaoka_daibutsu"),

        // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
        // East Japan — Saitama (ID 219-224)
        // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

        StampDefinition(id: 219, name: "Musashi Ichinomiya Hikawa Jinja", icon: "building.columns.fill", color: Color(red: 0.70, green: 0.18, blue: 0.18),
                        subtitle: "Omiya, Saitama",             stampSymbol: "\u{26E9}", imageName: "stamp_hikawa_omiya"),
        StampDefinition(id: 220, name: "Chichibu Jinja",         icon: "mountain.2.fill",       color: Color(red: 0.30, green: 0.50, blue: 0.35),
                        subtitle: "Chichibu, Saitama",          stampSymbol: "\u{26F0}", imageName: "stamp_chichibu"),
        StampDefinition(id: 221, name: "Mitsumine Jinja",        icon: "cloud.fill",            color: Color(red: 0.25, green: 0.45, blue: 0.60),
                        subtitle: "Chichibu, Saitama",          stampSymbol: "\u{2601}", imageName: "stamp_mitsumine"),
        StampDefinition(id: 222, name: "Hodosan Jinja",          icon: "flame.fill",            color: Color(red: 0.75, green: 0.20, blue: 0.12),
                        subtitle: "Nagatoro, Saitama",          stampSymbol: "\u{1F525}", imageName: "stamp_hodosan"),
        StampDefinition(id: 223, name: "Kitain",                 icon: "house.lodge.fill",      color: Color(red: 0.50, green: 0.35, blue: 0.55),
                        subtitle: "Kawagoe, Saitama",           stampSymbol: "\u{1F3EF}", imageName: "stamp_kitain"),
        StampDefinition(id: 224, name: "Kawagoe Hikawa Jinja",   icon: "heart.fill",            color: Color(red: 0.70, green: 0.20, blue: 0.35),
                        subtitle: "Kawagoe, Saitama",           stampSymbol: "\u{2764}", imageName: "stamp_kawagoe_hikawa"),

        // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
        // East Japan — North Kanto (ID 225-232)
        // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

        StampDefinition(id: 225, name: "Nikko Futarasan Jinja",  icon: "mountain.2.fill",       color: Color(red: 0.25, green: 0.50, blue: 0.35),
                        subtitle: "Nikko, Tochigi",             stampSymbol: "\u{26F0}", imageName: "stamp_futarasan"),
        StampDefinition(id: 226, name: "Banna-ji",               icon: "book.fill",             color: Color(red: 0.45, green: 0.35, blue: 0.25),
                        subtitle: "Ashikaga, Tochigi",          stampSymbol: "\u{1F4D6}", imageName: "stamp_bannaji"),
        StampDefinition(id: 227, name: "Haruna Jinja",           icon: "water.waves",           color: Color(red: 0.20, green: 0.45, blue: 0.60),
                        subtitle: "Takasaki, Gunma",            stampSymbol: "\u{1F30A}", imageName: "stamp_haruna"),
        StampDefinition(id: 228, name: "Myogi Jinja",            icon: "mountain.2.fill",       color: Color(red: 0.35, green: 0.45, blue: 0.30),
                        subtitle: "Tomioka, Gunma",             stampSymbol: "\u{26F0}", imageName: "stamp_myogi"),
        StampDefinition(id: 229, name: "Kashima Jingu",          icon: "figure.fencing",        color: Color(red: 0.60, green: 0.15, blue: 0.20),
                        subtitle: "Kashima, Ibaraki",           stampSymbol: "\u{2694}", imageName: "stamp_kashima_jingu"),
        StampDefinition(id: 230, name: "Ikisu Jinja",            icon: "building.columns.fill", color: Color(red: 0.55, green: 0.20, blue: 0.20),
                        subtitle: "Kamisu, Ibaraki",            stampSymbol: "\u{26E9}", imageName: "stamp_ikisu"),
        StampDefinition(id: 231, name: "Kasama Inari Jinja",     icon: "flame",                 color: Color(red: 0.80, green: 0.22, blue: 0.15),
                        subtitle: "Kasama, Ibaraki",            stampSymbol: "\u{1F98A}", imageName: "stamp_kasama_inari"),
        StampDefinition(id: 232, name: "Rinno-ji",               icon: "building.fill",         color: Color(red: 0.45, green: 0.30, blue: 0.55),
                        subtitle: "Nikko, Tochigi",             stampSymbol: "\u{1F3EF}", imageName: "stamp_rinnoji"),

        // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
        // East Japan — Tohoku (ID 233-245)
        // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

        StampDefinition(id: 233, name: "Chuson-ji",              icon: "sparkles",              color: Color(red: 0.75, green: 0.60, blue: 0.12),
                        subtitle: "Hiraizumi, Iwate",           stampSymbol: "\u{2728}", imageName: "stamp_chusonji"),
        StampDefinition(id: 234, name: "Motsu-ji",               icon: "leaf.fill",             color: Color(red: 0.22, green: 0.55, blue: 0.30),
                        subtitle: "Hiraizumi, Iwate",           stampSymbol: "\u{1F343}", imageName: "stamp_motsuji"),
        StampDefinition(id: 235, name: "Zuigan-ji",              icon: "tree.fill",             color: Color(red: 0.20, green: 0.50, blue: 0.28),
                        subtitle: "Matsushima, Miyagi",         stampSymbol: "\u{1F332}", imageName: "stamp_zuiganji"),
        StampDefinition(id: 236, name: "Shiogama Jinja",         icon: "water.waves",           color: Color(red: 0.20, green: 0.40, blue: 0.60),
                        subtitle: "Shiogama, Miyagi",           stampSymbol: "\u{1F30A}", imageName: "stamp_shiogama"),
        StampDefinition(id: 237, name: "Dewa Sanzan Jinja",      icon: "mountain.2.fill",       color: Color(red: 0.30, green: 0.50, blue: 0.35),
                        subtitle: "Tsuruoka, Yamagata",         stampSymbol: "\u{26F0}", imageName: "stamp_dewa_sanzan"),
        StampDefinition(id: 238, name: "Risshaku-ji (Yamadera)", icon: "mountain.2.fill",       color: Color(red: 0.35, green: 0.45, blue: 0.30),
                        subtitle: "Yamagata",                   stampSymbol: "\u{26F0}", imageName: "stamp_yamadera"),
        StampDefinition(id: 239, name: "Iwakiyama Jinja",        icon: "snow",                  color: Color(red: 0.35, green: 0.50, blue: 0.65),
                        subtitle: "Hirosaki, Aomori",           stampSymbol: "\u{2744}", imageName: "stamp_iwakiyama"),
        StampDefinition(id: 240, name: "Uesugi Jinja",           icon: "shield.fill",           color: Color(red: 0.55, green: 0.15, blue: 0.18),
                        subtitle: "Yonezawa, Yamagata",         stampSymbol: "\u{1F6E1}", imageName: "stamp_uesugi"),
        StampDefinition(id: 241, name: "Isasumi Jinja",          icon: "building.columns.fill", color: Color(red: 0.60, green: 0.20, blue: 0.20),
                        subtitle: "Aizumisato, Fukushima",      stampSymbol: "\u{26E9}", imageName: "stamp_isasumi"),
        StampDefinition(id: 242, name: "Nanko Jinja",            icon: "camera.macro",          color: Color(red: 0.65, green: 0.35, blue: 0.50),
                        subtitle: "Shirakawa, Fukushima",       stampSymbol: "\u{1F338}", imageName: "stamp_nanko"),
        StampDefinition(id: 243, name: "Osaki Hachimangu",       icon: "shield.fill",           color: Color(red: 0.60, green: 0.12, blue: 0.15),
                        subtitle: "Sendai, Miyagi",             stampSymbol: "\u{1F6E1}", imageName: "stamp_osaki_hachimangu"),
        StampDefinition(id: 244, name: "Taiheizan Miyoshi Jinja", icon: "building.columns.fill", color: Color(red: 0.55, green: 0.22, blue: 0.22),
                        subtitle: "Akita",                      stampSymbol: "\u{26E9}", imageName: "stamp_taiheizan"),
        StampDefinition(id: 245, name: "Dewa Jinja (Gassan)",    icon: "moon.fill",             color: Color(red: 0.40, green: 0.45, blue: 0.60),
                        subtitle: "Yamagata",                   stampSymbol: "\u{1F319}", imageName: "stamp_dewa_gassan"),

        // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
        // East Japan — Hokkaido (ID 246-249)
        // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

        StampDefinition(id: 246, name: "Hokkaido Jingu",         icon: "crown.fill",            color: Color(red: 0.65, green: 0.50, blue: 0.12),
                        subtitle: "Sapporo, Hokkaido",          stampSymbol: "\u{1F451}", imageName: "stamp_hokkaido_jingu"),
        StampDefinition(id: 247, name: "Hakodate Hachimangu",    icon: "shield.fill",           color: Color(red: 0.60, green: 0.12, blue: 0.15),
                        subtitle: "Hakodate, Hokkaido",         stampSymbol: "\u{1F6E1}", imageName: "stamp_hakodate_hachiman"),
        StampDefinition(id: 248, name: "Obihiro Jinja",          icon: "building.columns.fill", color: Color(red: 0.55, green: 0.20, blue: 0.20),
                        subtitle: "Obihiro, Hokkaido",          stampSymbol: "\u{26E9}", imageName: "stamp_obihiro"),
        StampDefinition(id: 249, name: "Kamikawa Jinja",         icon: "tree.fill",             color: Color(red: 0.20, green: 0.50, blue: 0.30),
                        subtitle: "Asahikawa, Hokkaido",        stampSymbol: "\u{1F333}", imageName: "stamp_kamikawa"),

        // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
        // East Japan — Saitama Additional (ID 250-252)
        // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

        StampDefinition(id: 250, name: "Hisaizu Jinja",          icon: "building.columns.fill", color: Color(red: 0.60, green: 0.20, blue: 0.20),
                        subtitle: "Iwatsuki, Saitama",          stampSymbol: "\u{26E9}", imageName: "stamp_hisaizu"),
        StampDefinition(id: 251, name: "Tsuki Jinja",            icon: "hare.fill",             color: Color(red: 0.65, green: 0.40, blue: 0.50),
                        subtitle: "Urawa, Saitama",             stampSymbol: "\u{1F407}", imageName: "stamp_tsuki_jinja"),
        StampDefinition(id: 252, name: "Seitenkyu",              icon: "house.lodge.fill",      color: Color(red: 0.70, green: 0.30, blue: 0.15),
                        subtitle: "Sakado, Saitama",            stampSymbol: "\u{1F3EF}", imageName: "stamp_seitenkyu"),

        // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
        // West Japan — Chugoku (ID 253-261)
        // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

        StampDefinition(id: 253, name: "Kibitsu Jinja",          icon: "building.columns.fill", color: Color(red: 0.65, green: 0.18, blue: 0.18),
                        subtitle: "Okayama",                    stampSymbol: "\u{26E9}", imageName: "stamp_kibitsu"),
        StampDefinition(id: 254, name: "Kibitsuhiko Jinja",      icon: "building.columns.fill", color: Color(red: 0.60, green: 0.20, blue: 0.20),
                        subtitle: "Okayama",                    stampSymbol: "\u{26E9}", imageName: "stamp_kibitsuhiko"),
        StampDefinition(id: 255, name: "Hofu Tenmangu",          icon: "graduationcap.fill",    color: Color(red: 0.55, green: 0.25, blue: 0.52),
                        subtitle: "Hofu, Yamaguchi",            stampSymbol: "\u{1F3D3}", imageName: "stamp_hofu_tenmangu"),
        StampDefinition(id: 256, name: "Senko-ji",               icon: "mountain.2.fill",       color: Color(red: 0.35, green: 0.45, blue: 0.30),
                        subtitle: "Onomichi, Hiroshima",        stampSymbol: "\u{26F0}", imageName: "stamp_senkoji"),
        StampDefinition(id: 257, name: "Miho Jinja",             icon: "water.waves",           color: Color(red: 0.20, green: 0.45, blue: 0.60),
                        subtitle: "Matsue, Shimane",            stampSymbol: "\u{1F30A}", imageName: "stamp_miho_jinja"),
        StampDefinition(id: 258, name: "Yaegaki Jinja",          icon: "heart.fill",            color: Color(red: 0.70, green: 0.20, blue: 0.35),
                        subtitle: "Matsue, Shimane",            stampSymbol: "\u{2764}", imageName: "stamp_yaegaki"),
        StampDefinition(id: 259, name: "Ruriko-ji",              icon: "building.2.fill",       color: Color(red: 0.45, green: 0.35, blue: 0.25),
                        subtitle: "Yamaguchi",                  stampSymbol: "\u{1F3EF}", imageName: "stamp_rurikoji"),
        StampDefinition(id: 260, name: "Izumo Daijingu",         icon: "building.columns.fill", color: Color(red: 0.55, green: 0.22, blue: 0.22),
                        subtitle: "Kameoka, Kyoto",             stampSymbol: "\u{26E9}", imageName: "stamp_izumo_daijingu"),
        StampDefinition(id: 261, name: "Akama Jingu",            icon: "crown.fill",            color: Color(red: 0.65, green: 0.15, blue: 0.20),
                        subtitle: "Shimonoseki, Yamaguchi",     stampSymbol: "\u{1F451}", imageName: "stamp_akama_jingu"),

        // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
        // West Japan — Shikoku (ID 262-270)
        // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

        StampDefinition(id: 262, name: "Kotohira-gu",            icon: "figure.stairs",         color: Color(red: 0.70, green: 0.50, blue: 0.12),
                        subtitle: "Kotohira, Kagawa",           stampSymbol: "\u{1F3DB}", imageName: "stamp_kotohiragu"),
        StampDefinition(id: 263, name: "Zentsu-ji",              icon: "house.lodge.fill",      color: Color(red: 0.50, green: 0.35, blue: 0.55),
                        subtitle: "Zentsuji, Kagawa",           stampSymbol: "\u{1F3EF}", imageName: "stamp_zentsuji"),
        StampDefinition(id: 264, name: "Ishite-ji",              icon: "hand.raised.fill",      color: Color(red: 0.55, green: 0.35, blue: 0.25),
                        subtitle: "Matsuyama, Ehime",           stampSymbol: "\u{270B}", imageName: "stamp_ishiteji"),
        StampDefinition(id: 265, name: "Oyamazumi Jinja",        icon: "shield.fill",           color: Color(red: 0.55, green: 0.15, blue: 0.18),
                        subtitle: "Omishima, Ehime",            stampSymbol: "\u{1F6E1}", imageName: "stamp_oyamazumi"),
        StampDefinition(id: 266, name: "Ryozen-ji",              icon: "figure.walk",           color: Color(red: 0.60, green: 0.30, blue: 0.50),
                        subtitle: "Naruto, Tokushima",          stampSymbol: "\u{1F6B6}", imageName: "stamp_ryozenji"),
        StampDefinition(id: 267, name: "Okubo-ji",               icon: "flag.checkered",        color: Color(red: 0.50, green: 0.35, blue: 0.20),
                        subtitle: "Sanuki, Kagawa",             stampSymbol: "\u{1F3C1}", imageName: "stamp_okuboji"),
        StampDefinition(id: 268, name: "Iwaya-ji",               icon: "mountain.2.fill",       color: Color(red: 0.40, green: 0.50, blue: 0.35),
                        subtitle: "Kumakogen, Ehime",           stampSymbol: "\u{26F0}", imageName: "stamp_iwayaji"),
        StampDefinition(id: 269, name: "Yashima-ji",             icon: "binoculars.fill",       color: Color(red: 0.35, green: 0.45, blue: 0.55),
                        subtitle: "Takamatsu, Kagawa",          stampSymbol: "\u{1F52D}", imageName: "stamp_yashimaji"),
        StampDefinition(id: 270, name: "Unpen-ji",               icon: "cloud.fill",            color: Color(red: 0.45, green: 0.50, blue: 0.60),
                        subtitle: "Miyoshi, Tokushima",         stampSymbol: "\u{2601}", imageName: "stamp_unpenji"),

        // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
        // West Japan — Kyushu (ID 271-290)
        // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

        StampDefinition(id: 271, name: "Munakata Taisha",        icon: "water.waves",           color: Color(red: 0.15, green: 0.45, blue: 0.65),
                        subtitle: "Munakata, Fukuoka",          stampSymbol: "\u{1F30A}", imageName: "stamp_munakata"),
        StampDefinition(id: 272, name: "Kushida Jinja",          icon: "flame.fill",            color: Color(red: 0.75, green: 0.18, blue: 0.15),
                        subtitle: "Hakata, Fukuoka",            stampSymbol: "\u{1F525}", imageName: "stamp_kushida"),
        StampDefinition(id: 273, name: "Usa Jingu",              icon: "crown.fill",            color: Color(red: 0.65, green: 0.50, blue: 0.12),
                        subtitle: "Usa, Oita",                  stampSymbol: "\u{1F451}", imageName: "stamp_usa_jingu"),
        StampDefinition(id: 274, name: "Hikosan Jingu",          icon: "mountain.2.fill",       color: Color(red: 0.30, green: 0.50, blue: 0.35),
                        subtitle: "Soeda, Fukuoka",             stampSymbol: "\u{26F0}", imageName: "stamp_hikosan"),
        StampDefinition(id: 275, name: "Yutoku Inari Jinja",     icon: "flame",                 color: Color(red: 0.80, green: 0.22, blue: 0.15),
                        subtitle: "Kashima, Saga",              stampSymbol: "\u{1F98A}", imageName: "stamp_yutoku_inari"),
        StampDefinition(id: 276, name: "Suwa Jinja Nagasaki",    icon: "building.columns.fill", color: Color(red: 0.60, green: 0.20, blue: 0.20),
                        subtitle: "Nagasaki",                   stampSymbol: "\u{26E9}", imageName: "stamp_suwa_nagasaki"),
        StampDefinition(id: 277, name: "Kato Jinja",             icon: "shield.fill",           color: Color(red: 0.55, green: 0.15, blue: 0.18),
                        subtitle: "Kumamoto",                   stampSymbol: "\u{1F6E1}", imageName: "stamp_kato_jinja"),
        StampDefinition(id: 278, name: "Aso Jinja",              icon: "mountain.2.fill",       color: Color(red: 0.30, green: 0.50, blue: 0.30),
                        subtitle: "Aso, Kumamoto",              stampSymbol: "\u{1F30B}", imageName: "stamp_aso_jinja"),
        StampDefinition(id: 279, name: "Takachiho Jinja",        icon: "sparkles",              color: Color(red: 0.50, green: 0.40, blue: 0.60),
                        subtitle: "Takachiho, Miyazaki",        stampSymbol: "\u{2728}", imageName: "stamp_takachiho"),
        StampDefinition(id: 280, name: "Amanoiwato Jinja",       icon: "sun.max.fill",          color: Color(red: 0.75, green: 0.60, blue: 0.12),
                        subtitle: "Takachiho, Miyazaki",        stampSymbol: "\u{2600}", imageName: "stamp_amanoiwato"),
        StampDefinition(id: 281, name: "Miyazaki Jingu",         icon: "crown.fill",            color: Color(red: 0.65, green: 0.48, blue: 0.10),
                        subtitle: "Miyazaki",                   stampSymbol: "\u{1F451}", imageName: "stamp_miyazaki_jingu"),
        StampDefinition(id: 282, name: "Udo Jingu",              icon: "water.waves",           color: Color(red: 0.15, green: 0.40, blue: 0.65),
                        subtitle: "Nichinan, Miyazaki",         stampSymbol: "\u{1F30A}", imageName: "stamp_udo_jingu"),
        StampDefinition(id: 283, name: "Aoshima Jinja",          icon: "sun.max.fill",          color: Color(red: 0.80, green: 0.55, blue: 0.10),
                        subtitle: "Miyazaki",                   stampSymbol: "\u{1F334}", imageName: "stamp_aoshima"),
        StampDefinition(id: 284, name: "Kirishima Jingu",        icon: "mountain.2.fill",       color: Color(red: 0.30, green: 0.50, blue: 0.35),
                        subtitle: "Kirishima, Kagoshima",       stampSymbol: "\u{1F30B}", imageName: "stamp_kirishima"),
        StampDefinition(id: 285, name: "Terukuni Jinja",         icon: "building.columns.fill", color: Color(red: 0.60, green: 0.18, blue: 0.18),
                        subtitle: "Kagoshima",                  stampSymbol: "\u{26E9}", imageName: "stamp_terukuni"),
        StampDefinition(id: 286, name: "Izumi Jinja",            icon: "leaf.fill",             color: Color(red: 0.22, green: 0.55, blue: 0.30),
                        subtitle: "Kumamoto",                   stampSymbol: "\u{1F343}", imageName: "stamp_izumi_jinja"),
        StampDefinition(id: 287, name: "Shikanoshima Jinja",     icon: "water.waves",           color: Color(red: 0.20, green: 0.42, blue: 0.58),
                        subtitle: "Fukuoka",                    stampSymbol: "\u{1F30A}", imageName: "stamp_shikanoshima"),
        StampDefinition(id: 288, name: "Sumiyoshi Jinja Hakata", icon: "building.columns.fill", color: Color(red: 0.65, green: 0.20, blue: 0.20),
                        subtitle: "Hakata, Fukuoka",            stampSymbol: "\u{26E9}", imageName: "stamp_sumiyoshi_hakata"),
        StampDefinition(id: 289, name: "Kashii-gu",              icon: "tree.fill",             color: Color(red: 0.20, green: 0.50, blue: 0.28),
                        subtitle: "Fukuoka",                    stampSymbol: "\u{1F333}", imageName: "stamp_kashiigu"),
        StampDefinition(id: 290, name: "Komyozen-ji",            icon: "leaf.fill",             color: Color(red: 0.25, green: 0.55, blue: 0.30),
                        subtitle: "Dazaifu, Fukuoka",           stampSymbol: "\u{1F343}", imageName: "stamp_komyozenji"),
    ]
}
