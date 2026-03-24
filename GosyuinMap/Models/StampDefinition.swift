import SwiftUI

struct StampDefinition: Identifiable, Hashable {
    let id: Int
    let name: String
    let icon: String
    let color: Color
    let subtitle: String
    let stampSymbol: String
    let artworkImageName: String?

    static let all: [StampDefinition] = [
        // Vermillion (Shrine Red)
        StampDefinition(id: 1,  name: "Meiji Jingu",       icon: "building.columns.fill", color: Color(red: 0.80, green: 0.15, blue: 0.15),
                        subtitle: "Shibuya, Yoyogi",     stampSymbol: "\u{26E9}", artworkImageName: "01_meiji_jingu"),
        StampDefinition(id: 2,  name: "Senso-ji",          icon: "flame.fill",            color: Color(red: 0.85, green: 0.20, blue: 0.10),
                        subtitle: "Taito, Asakusa",       stampSymbol: "\u{1F3EF}", artworkImageName: "03_sensoji"),
        StampDefinition(id: 3,  name: "Yasukuni Jinja",    icon: "flag.fill",             color: Color(red: 0.75, green: 0.12, blue: 0.20),
                        subtitle: "Chiyoda, Kudan",       stampSymbol: "\u{26E9}", artworkImageName: "14_yasukuni"),

        // Matcha Green
        StampDefinition(id: 4,  name: "Kanda Myojin",      icon: "leaf.fill",             color: Color(red: 0.20, green: 0.55, blue: 0.30),
                        subtitle: "Chiyoda, Sotokanda",   stampSymbol: "\u{1F343}", artworkImageName: nil),
        StampDefinition(id: 5,  name: "Hie Jinja",         icon: "tree.fill",             color: Color(red: 0.15, green: 0.50, blue: 0.25),
                        subtitle: "Chiyoda, Nagatacho",   stampSymbol: "\u{1F333}", artworkImageName: nil),
        StampDefinition(id: 6,  name: "Nezu Jinja",        icon: "camera.macro",          color: Color(red: 0.30, green: 0.60, blue: 0.35),
                        subtitle: "Bunkyo, Nezu",         stampSymbol: "\u{1F338}", artworkImageName: nil),

        // Indigo Blue
        StampDefinition(id: 7,  name: "Tokyo Daijingu",    icon: "moon.stars.fill",       color: Color(red: 0.15, green: 0.30, blue: 0.60),
                        subtitle: "Chiyoda, Fujimi",      stampSymbol: "\u{1F319}", artworkImageName: nil),
        StampDefinition(id: 8,  name: "Yushima Tenmangu",  icon: "graduationcap.fill",    color: Color(red: 0.20, green: 0.35, blue: 0.65),
                        subtitle: "Bunkyo, Yushima",      stampSymbol: "\u{1F3D3}", artworkImageName: nil),

        // Tokyo (Additional)
        StampDefinition(id: 9,  name: "Gotoku-ji",         icon: "cat.fill",              color: Color(red: 0.50, green: 0.35, blue: 0.20),
                        subtitle: "Setagaya, Gotokuji",   stampSymbol: "\u{1F431}", artworkImageName: nil),
        StampDefinition(id: 10, name: "Zojo-ji",            icon: "flame.fill",            color: Color(red: 0.20, green: 0.35, blue: 0.60),
                        subtitle: "Minato, Shibakoen",    stampSymbol: "\u{1F3EF}", artworkImageName: nil),
        StampDefinition(id: 11, name: "Tomioka Hachimangu", icon: "figure.wrestling",      color: Color(red: 0.75, green: 0.15, blue: 0.15),
                        subtitle: "Koto, Tomioka",        stampSymbol: "\u{26E9}", artworkImageName: nil),
        StampDefinition(id: 12, name: "Atago Jinja",        icon: "stairs",                color: Color(red: 0.20, green: 0.50, blue: 0.30),
                        subtitle: "Minato, Atago",        stampSymbol: "\u{26E9}", artworkImageName: nil),
        StampDefinition(id: 13, name: "Hanazono Jinja",     icon: "sparkles",              color: Color(red: 0.80, green: 0.20, blue: 0.30),
                        subtitle: "Shinjuku",             stampSymbol: "\u{26E9}", artworkImageName: nil),
        StampDefinition(id: 14, name: "Asakusa Jinja",      icon: "party.popper.fill",     color: Color(red: 0.85, green: 0.25, blue: 0.15),
                        subtitle: "Taito, Asakusa",       stampSymbol: "\u{26E9}", artworkImageName: nil),
        StampDefinition(id: 15, name: "Sengaku-ji",         icon: "shield.fill",           color: Color(red: 0.30, green: 0.30, blue: 0.50),
                        subtitle: "Minato, Takanawa",     stampSymbol: "\u{2694}\u{FE0F}", artworkImageName: nil),
        StampDefinition(id: 16, name: "Jindai-ji",          icon: "leaf.fill",             color: Color(red: 0.25, green: 0.55, blue: 0.25),
                        subtitle: "Chofu, Jindaiji",      stampSymbol: "\u{1F35C}", artworkImageName: nil),
        StampDefinition(id: 17, name: "Nogi Jinja",         icon: "star.fill",             color: Color(red: 0.45, green: 0.40, blue: 0.35),
                        subtitle: "Minato, Akasaka",      stampSymbol: "\u{26E9}", artworkImageName: nil),
        StampDefinition(id: 18, name: "Akasaka Hikawa",     icon: "tree.fill",             color: Color(red: 0.18, green: 0.48, blue: 0.28),
                        subtitle: "Minato, Akasaka",      stampSymbol: "\u{26E9}", artworkImageName: nil),

        // Kanagawa
        StampDefinition(id: 19, name: "Tsurugaoka Hachiman", icon: "flag.fill",            color: Color(red: 0.70, green: 0.15, blue: 0.15),
                        subtitle: "Kamakura",             stampSymbol: "\u{26E9}", artworkImageName: "07_tsurugaoka"),
        StampDefinition(id: 20, name: "Kotoku-in",          icon: "figure.seated.seatbelt",color: Color(red: 0.45, green: 0.55, blue: 0.35),
                        subtitle: "Kamakura, Hase",       stampSymbol: "\u{1F9D8}", artworkImageName: nil),
        StampDefinition(id: 21, name: "Hasedera",           icon: "camera.macro",          color: Color(red: 0.35, green: 0.50, blue: 0.70),
                        subtitle: "Kamakura, Hase",       stampSymbol: "\u{1F338}", artworkImageName: "15_hasedera"),
        StampDefinition(id: 22, name: "Enoshima Jinja",     icon: "water.waves",           color: Color(red: 0.15, green: 0.45, blue: 0.70),
                        subtitle: "Fujisawa, Enoshima",   stampSymbol: "\u{1F30A}", artworkImageName: nil),
        StampDefinition(id: 23, name: "Kawasaki Daishi",     icon: "flame.fill",            color: Color(red: 0.80, green: 0.30, blue: 0.10),
                        subtitle: "Kawasaki",             stampSymbol: "\u{1F3EF}", artworkImageName: nil),
        StampDefinition(id: 24, name: "Kencho-ji",          icon: "mountain.2.fill",       color: Color(red: 0.30, green: 0.50, blue: 0.30),
                        subtitle: "Kamakura",             stampSymbol: "\u{1F343}", artworkImageName: nil),
        StampDefinition(id: 25, name: "Hokoku-ji",          icon: "leaf.fill",             color: Color(red: 0.20, green: 0.60, blue: 0.30),
                        subtitle: "Kamakura, Jomyoji",    stampSymbol: "\u{1F38D}", artworkImageName: nil),
        StampDefinition(id: 26, name: "Samukawa Jinja",     icon: "shield.checkered",      color: Color(red: 0.55, green: 0.40, blue: 0.20),
                        subtitle: "Samukawa, Kanagawa",   stampSymbol: "\u{26E9}", artworkImageName: nil),

        // Kyoto
        StampDefinition(id: 27, name: "Fushimi Inari Taisha", icon: "flame.fill",           color: Color(red: 0.80, green: 0.15, blue: 0.10),
                        subtitle: "Fushimi, Kyoto",        stampSymbol: "\u{26E9}", artworkImageName: "02_fushimi_inari"),
        StampDefinition(id: 28, name: "Kinkaku-ji",           icon: "sparkles",              color: Color(red: 0.75, green: 0.60, blue: 0.10),
                        subtitle: "Kita, Kyoto",           stampSymbol: "\u{1F3EF}", artworkImageName: "04_kinkakuji"),
        StampDefinition(id: 29, name: "Kiyomizu-dera",        icon: "mountain.2.fill",       color: Color(red: 0.55, green: 0.30, blue: 0.55),
                        subtitle: "Higashiyama, Kyoto",    stampSymbol: "\u{1F338}", artworkImageName: "09_kiyomizudera"),
        StampDefinition(id: 30, name: "Yasaka Jinja",         icon: "lantern.2.fill",        color: Color(red: 0.78, green: 0.12, blue: 0.18),
                        subtitle: "Gion, Kyoto",           stampSymbol: "\u{1F3EF}", artworkImageName: nil),
        StampDefinition(id: 31, name: "Shimogamo Jinja",      icon: "leaf.fill",             color: Color(red: 0.15, green: 0.50, blue: 0.25),
                        subtitle: "Sakyo, Kyoto",          stampSymbol: "\u{1F333}", artworkImageName: nil),
        StampDefinition(id: 32, name: "Kamigamo Jinja",       icon: "wind",                  color: Color(red: 0.20, green: 0.55, blue: 0.30),
                        subtitle: "Kita, Kyoto",           stampSymbol: "\u{26E9}", artworkImageName: nil),
        StampDefinition(id: 33, name: "Kitano Tenmangu",      icon: "graduationcap.fill",    color: Color(red: 0.55, green: 0.25, blue: 0.52),
                        subtitle: "Kamigyo, Kyoto",        stampSymbol: "\u{2602}\u{FE0F}", artworkImageName: nil),
        StampDefinition(id: 34, name: "Heian Jingu",          icon: "crown.fill",            color: Color(red: 0.15, green: 0.30, blue: 0.65),
                        subtitle: "Sakyo, Kyoto",          stampSymbol: "\u{1F3EF}", artworkImageName: nil),
        StampDefinition(id: 35, name: "Nijo Castle",          icon: "building.2.fill",       color: Color(red: 0.30, green: 0.28, blue: 0.55),
                        subtitle: "Nakagyo, Kyoto",        stampSymbol: "\u{1F3EF}", artworkImageName: nil),

        // Osaka
        StampDefinition(id: 36, name: "Sumiyoshi Taisha",     icon: "drop.fill",             color: Color(red: 0.20, green: 0.50, blue: 0.35),
                        subtitle: "Sumiyoshi, Osaka",      stampSymbol: "\u{26E9}", artworkImageName: "18_sumiyoshi"),
        StampDefinition(id: 37, name: "Osaka Tenmangu",       icon: "graduationcap.fill",    color: Color(red: 0.50, green: 0.22, blue: 0.50),
                        subtitle: "Kita, Osaka",           stampSymbol: "\u{1F4AB}", artworkImageName: nil),
        StampDefinition(id: 38, name: "Namba Yasaka Jinja",   icon: "mouth.fill",            color: Color(red: 0.80, green: 0.20, blue: 0.10),
                        subtitle: "Naniwa, Osaka",         stampSymbol: "\u{1F981}", artworkImageName: nil),
        StampDefinition(id: 39, name: "Imamiya Ebisu Jinja",  icon: "cart.fill",             color: Color(red: 0.70, green: 0.45, blue: 0.10),
                        subtitle: "Naniwa, Osaka",         stampSymbol: "\u{1F340}", artworkImageName: nil),
        StampDefinition(id: 40, name: "Shitennoji",           icon: "building.columns.fill", color: Color(red: 0.20, green: 0.35, blue: 0.60),
                        subtitle: "Tennoji, Osaka",        stampSymbol: "\u{1F3EF}", artworkImageName: nil),

        // Nara
        StampDefinition(id: 41, name: "Kasuga Taisha",        icon: "light.cylindrical.ceiling.fill", color: Color(red: 0.75, green: 0.50, blue: 0.10),
                        subtitle: "Nara Park, Nara",       stampSymbol: "\u{1FA94}", artworkImageName: "11_kasuga_taisha"),
        StampDefinition(id: 42, name: "Todai-ji",             icon: "figure.seated.seatbelt",color: Color(red: 0.25, green: 0.45, blue: 0.30),
                        subtitle: "Zoshi, Nara",           stampSymbol: "\u{1F9D8}", artworkImageName: "06_todaiji"),
        StampDefinition(id: 43, name: "Yakushi-ji",           icon: "medical.thermometer.fill", color: Color(red: 0.40, green: 0.55, blue: 0.65),
                        subtitle: "Nishinokyo, Nara",      stampSymbol: "\u{1F3EF}", artworkImageName: nil),
        StampDefinition(id: 44, name: "Kofuku-ji",            icon: "building.fill",         color: Color(red: 0.55, green: 0.35, blue: 0.20),
                        subtitle: "Noborioji, Nara",       stampSymbol: "\u{26E9}", artworkImageName: nil),

        // Other Regions
        StampDefinition(id: 45, name: "Ise Jingu",            icon: "crown.fill",            color: Color(red: 0.60, green: 0.45, blue: 0.15),
                        subtitle: "Ise, Mie",              stampSymbol: "\u{2728}", artworkImageName: nil),
        StampDefinition(id: 46, name: "Itsukushima Jinja",    icon: "water.waves",           color: Color(red: 0.80, green: 0.15, blue: 0.15),
                        subtitle: "Miyajima, Hiroshima",   stampSymbol: "\u{26E9}", artworkImageName: "05_itsukushima"),
        StampDefinition(id: 47, name: "Izumo Taisha",         icon: "heart.fill",            color: Color(red: 0.20, green: 0.45, blue: 0.65),
                        subtitle: "Izumo, Shimane",        stampSymbol: "\u{1F49E}", artworkImageName: "08_izumo_taisha"),
        StampDefinition(id: 48, name: "Dazaifu Tenmangu",     icon: "graduationcap.fill",    color: Color(red: 0.45, green: 0.20, blue: 0.48),
                        subtitle: "Dazaifu, Fukuoka",      stampSymbol: "\u{1F33A}", artworkImageName: "12_dazaifu"),
        StampDefinition(id: 49, name: "Toshogu (Nikko)",      icon: "paintpalette.fill",     color: Color(red: 0.65, green: 0.35, blue: 0.10),
                        subtitle: "Nikko, Tochigi",        stampSymbol: "\u{1F412}", artworkImageName: "10_nikko_toshogu"),
        StampDefinition(id: 50, name: "Hakozaki Hachimangu",  icon: "shield.fill",           color: Color(red: 0.70, green: 0.12, blue: 0.20),
                        subtitle: "Higashi, Fukuoka",      stampSymbol: "\u{26E9}", artworkImageName: nil),

        // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
        // Tokyo (Additional, ID 51-72)
        // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

        StampDefinition(id: 51, name: "Shibamata Taishakuten", icon: "film.fill",             color: Color(red: 0.55, green: 0.35, blue: 0.20),
                        subtitle: "Katsushika",             stampSymbol: "\u{1F3EF}", artworkImageName: nil),
        StampDefinition(id: 52, name: "Ikegami Honmon-ji",    icon: "flame.fill",            color: Color(red: 0.20, green: 0.30, blue: 0.55),
                        subtitle: "Ota, Ikegami",           stampSymbol: "\u{1F3EF}", artworkImageName: nil),
        StampDefinition(id: 53, name: "Oji Jinja",            icon: "fox.fill",              color: Color(red: 0.75, green: 0.20, blue: 0.15),
                        subtitle: "Kita, Oji",              stampSymbol: "\u{26E9}", artworkImageName: nil),
        StampDefinition(id: 54, name: "Oji Inari Jinja",      icon: "flame",                 color: Color(red: 0.80, green: 0.25, blue: 0.10),
                        subtitle: "Kita, Oji",              stampSymbol: "\u{1F98A}", artworkImageName: nil),
        StampDefinition(id: 55, name: "Toyokawa Inari",       icon: "flame",                 color: Color(red: 0.75, green: 0.18, blue: 0.18),
                        subtitle: "Minato, Akasaka",         stampSymbol: "\u{1F98A}", artworkImageName: nil),
        StampDefinition(id: 56, name: "Shiba Toshogu",        icon: "paintpalette.fill",     color: Color(red: 0.60, green: 0.40, blue: 0.12),
                        subtitle: "Minato, Shiba",           stampSymbol: "\u{26E9}", artworkImageName: nil),
        StampDefinition(id: 57, name: "Namiyoke Inari",       icon: "water.waves",           color: Color(red: 0.15, green: 0.40, blue: 0.65),
                        subtitle: "Chuo, Tsukiji",           stampSymbol: "\u{1F30A}", artworkImageName: nil),
        StampDefinition(id: 58, name: "Okunitama Jinja",      icon: "building.columns.fill", color: Color(red: 0.70, green: 0.15, blue: 0.15),
                        subtitle: "Fuchu",                   stampSymbol: "\u{26E9}", artworkImageName: nil),
        StampDefinition(id: 59, name: "Musashi Mitake Jinja", icon: "mountain.2.fill",       color: Color(red: 0.25, green: 0.50, blue: 0.30),
                        subtitle: "Ome, Mt. Mitake",         stampSymbol: "\u{26F0}\u{FE0F}", artworkImageName: nil),
        StampDefinition(id: 60, name: "Kishimojin-do",        icon: "figure.and.child.holdinghands", color: Color(red: 0.70, green: 0.30, blue: 0.50),
                        subtitle: "Toshima, Zoshigaya",      stampSymbol: "\u{1F3EF}", artworkImageName: nil),
        StampDefinition(id: 61, name: "Tennoji",              icon: "house.lodge.fill",      color: Color(red: 0.30, green: 0.25, blue: 0.55),
                        subtitle: "Taito, Yanaka",           stampSymbol: "\u{1F3EF}", artworkImageName: nil),
        StampDefinition(id: 62, name: "Fukagawa Fudo-do",     icon: "flame.fill",            color: Color(red: 0.80, green: 0.30, blue: 0.10),
                        subtitle: "Koto, Fukagawa",          stampSymbol: "\u{1F525}", artworkImageName: nil),
        StampDefinition(id: 63, name: "Suitengu",             icon: "drop.fill",             color: Color(red: 0.15, green: 0.35, blue: 0.65),
                        subtitle: "Chuo, Nihonbashi",        stampSymbol: "\u{1F4A7}", artworkImageName: nil),
        StampDefinition(id: 64, name: "Togo Jinja",           icon: "anchor",                color: Color(red: 0.20, green: 0.30, blue: 0.55),
                        subtitle: "Shibuya, Harajuku",       stampSymbol: "\u{2693}", artworkImageName: nil),
        StampDefinition(id: 65, name: "Takao-san Yakuo-in",   icon: "mountain.2.fill",       color: Color(red: 0.20, green: 0.50, blue: 0.25),
                        subtitle: "Hachioji, Mt. Takao",     stampSymbol: "\u{1F3D4}\u{FE0F}", artworkImageName: nil),
        StampDefinition(id: 66, name: "Konno Hachimangu",     icon: "shield.fill",           color: Color(red: 0.60, green: 0.12, blue: 0.15),
                        subtitle: "Shibuya",                 stampSymbol: "\u{1F6E1}\u{FE0F}", artworkImageName: nil),
        StampDefinition(id: 67, name: "Imado Jinja",          icon: "cat.fill",              color: Color(red: 0.80, green: 0.40, blue: 0.50),
                        subtitle: "Taito, Asakusa",          stampSymbol: "\u{1F431}", artworkImageName: nil),
        StampDefinition(id: 68, name: "Toranomon Kotohiragu", icon: "building.columns.fill", color: Color(red: 0.55, green: 0.40, blue: 0.15),
                        subtitle: "Minato, Toranomon",       stampSymbol: "\u{26E9}", artworkImageName: nil),
        StampDefinition(id: 69, name: "Matsuchiyama Shoden",  icon: "carrot.fill",           color: Color(red: 0.80, green: 0.20, blue: 0.20),
                        subtitle: "Taito, Asakusa",          stampSymbol: "\u{1F955}", artworkImageName: nil),
        StampDefinition(id: 70, name: "Kameido Tenjin",       icon: "graduationcap.fill",    color: Color(red: 0.45, green: 0.20, blue: 0.50),
                        subtitle: "Koto, Kameido",           stampSymbol: "\u{1F338}", artworkImageName: nil),
        StampDefinition(id: 71, name: "Koami Jinja",          icon: "banknote.fill",         color: Color(red: 0.70, green: 0.55, blue: 0.10),
                        subtitle: "Chuo, Nihonbashi",        stampSymbol: "\u{1F4B0}", artworkImageName: nil),
        StampDefinition(id: 72, name: "Yushima Seido",        icon: "book.fill",             color: Color(red: 0.25, green: 0.30, blue: 0.50),
                        subtitle: "Bunkyo, Yushima",         stampSymbol: "\u{1F4DA}", artworkImageName: nil),

        // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
        // Kanagawa (Additional, ID 73-84)
        // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

        StampDefinition(id: 73, name: "Engaku-ji",            icon: "bell.fill",             color: Color(red: 0.35, green: 0.50, blue: 0.30),
                        subtitle: "Kita-Kamakura",           stampSymbol: "\u{1F514}", artworkImageName: nil),
        StampDefinition(id: 74, name: "Jochi-ji",             icon: "leaf.fill",             color: Color(red: 0.25, green: 0.55, blue: 0.30),
                        subtitle: "Kita-Kamakura",           stampSymbol: "\u{1F343}", artworkImageName: nil),
        StampDefinition(id: 75, name: "Zuisen-ji",            icon: "camera.macro",          color: Color(red: 0.50, green: 0.30, blue: 0.55),
                        subtitle: "Kamakura",                stampSymbol: "\u{1F338}", artworkImageName: nil),
        StampDefinition(id: 76, name: "Sugimoto-dera",        icon: "stairs",                color: Color(red: 0.40, green: 0.50, blue: 0.25),
                        subtitle: "Kamakura",                stampSymbol: "\u{1F3EF}", artworkImageName: nil),
        StampDefinition(id: 77, name: "Meigetsuin",           icon: "camera.macro",          color: Color(red: 0.30, green: 0.45, blue: 0.70),
                        subtitle: "Kita-Kamakura",           stampSymbol: "\u{1F4AE}", artworkImageName: nil),
        StampDefinition(id: 78, name: "Tokei-ji",             icon: "camera.macro",          color: Color(red: 0.55, green: 0.40, blue: 0.60),
                        subtitle: "Kita-Kamakura",           stampSymbol: "\u{1F338}", artworkImageName: nil),
        StampDefinition(id: 79, name: "Ofuna Kannon-ji",      icon: "figure.seated.seatbelt",color: Color(red: 0.70, green: 0.70, blue: 0.70),
                        subtitle: "Kamakura, Ofuna",         stampSymbol: "\u{1F9D8}", artworkImageName: nil),
        StampDefinition(id: 80, name: "Iseyama Kotai Jingu",  icon: "crown.fill",            color: Color(red: 0.60, green: 0.45, blue: 0.15),
                        subtitle: "Yokohama, Nishi",         stampSymbol: "\u{2728}", artworkImageName: nil),
        StampDefinition(id: 81, name: "Soji-ji",              icon: "house.lodge.fill",      color: Color(red: 0.20, green: 0.35, blue: 0.55),
                        subtitle: "Yokohama, Tsurumi",       stampSymbol: "\u{1F3EF}", artworkImageName: nil),
        StampDefinition(id: 82, name: "Hakone Jinja",         icon: "tree.fill",             color: Color(red: 0.15, green: 0.50, blue: 0.30),
                        subtitle: "Hakone",                  stampSymbol: "\u{26E9}", artworkImageName: "17_hakone"),
        StampDefinition(id: 83, name: "Kuzuharaoka Jinja",    icon: "heart.fill",            color: Color(red: 0.75, green: 0.25, blue: 0.40),
                        subtitle: "Kamakura",                stampSymbol: "\u{1F497}", artworkImageName: nil),
        StampDefinition(id: 84, name: "Sasuke Inari Jinja",   icon: "flame",                 color: Color(red: 0.80, green: 0.20, blue: 0.10),
                        subtitle: "Kamakura",                stampSymbol: "\u{1F98A}", artworkImageName: nil),

        // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
        // Chiba (ID 85-100)
        // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

        StampDefinition(id: 85, name: "Naritasan Shinshoji",  icon: "flame.fill",            color: Color(red: 0.80, green: 0.30, blue: 0.10),
                        subtitle: "Narita",                  stampSymbol: "\u{1F525}", artworkImageName: nil),
        StampDefinition(id: 86, name: "Katori Jingu",         icon: "crown.fill",            color: Color(red: 0.55, green: 0.40, blue: 0.15),
                        subtitle: "Katori",                  stampSymbol: "\u{2728}", artworkImageName: nil),
        StampDefinition(id: 87, name: "Awa Jinja",            icon: "water.waves",           color: Color(red: 0.15, green: 0.40, blue: 0.60),
                        subtitle: "Tateyama",                stampSymbol: "\u{1F30A}", artworkImageName: nil),
        StampDefinition(id: 88, name: "Chiba Jinja",          icon: "star.fill",             color: Color(red: 0.20, green: 0.30, blue: 0.60),
                        subtitle: "Chiba",                   stampSymbol: "\u{2B50}", artworkImageName: nil),
        StampDefinition(id: 89, name: "Katsushika Hachimangu",icon: "shield.fill",           color: Color(red: 0.60, green: 0.12, blue: 0.18),
                        subtitle: "Ichikawa",                stampSymbol: "\u{1F6E1}\u{FE0F}", artworkImageName: nil),
        StampDefinition(id: 90, name: "Nakayama Hokekyoji",   icon: "book.fill",             color: Color(red: 0.25, green: 0.35, blue: 0.55),
                        subtitle: "Ichikawa",                stampSymbol: "\u{1F4D6}", artworkImageName: nil),
        StampDefinition(id: 91, name: "Inage Sengen Jinja",   icon: "mountain.2.fill",       color: Color(red: 0.70, green: 0.20, blue: 0.30),
                        subtitle: "Chiba, Inage",            stampSymbol: "\u{1F5FB}", artworkImageName: nil),
        StampDefinition(id: 92, name: "Funabashi Daijingu",   icon: "crown.fill",            color: Color(red: 0.65, green: 0.45, blue: 0.10),
                        subtitle: "Funabashi",               stampSymbol: "\u{2728}", artworkImageName: nil),
        StampDefinition(id: 93, name: "Matsudo Jinja",        icon: "building.columns.fill", color: Color(red: 0.70, green: 0.18, blue: 0.18),
                        subtitle: "Matsudo",                 stampSymbol: "\u{26E9}", artworkImageName: nil),
        StampDefinition(id: 94, name: "Tamasaki Jinja",       icon: "figure.wave",           color: Color(red: 0.75, green: 0.25, blue: 0.20),
                        subtitle: "Ichinomiya",              stampSymbol: "\u{26E9}", artworkImageName: nil),
        StampDefinition(id: 95, name: "Nihon-ji",             icon: "figure.seated.seatbelt",color: Color(red: 0.30, green: 0.50, blue: 0.25),
                        subtitle: "Nokogiriyama",            stampSymbol: "\u{1F9D8}", artworkImageName: nil),
        StampDefinition(id: 96, name: "Tanjoji",              icon: "sunrise.fill",          color: Color(red: 0.80, green: 0.45, blue: 0.10),
                        subtitle: "Kamogawa",                stampSymbol: "\u{1F305}", artworkImageName: nil),
        StampDefinition(id: 97, name: "Mamasan Guho-ji",      icon: "camera.macro",          color: Color(red: 0.55, green: 0.30, blue: 0.50),
                        subtitle: "Ichikawa, Mama",          stampSymbol: "\u{1F338}", artworkImageName: nil),
        StampDefinition(id: 98, name: "Kashiwa Jinja",        icon: "leaf.fill",             color: Color(red: 0.25, green: 0.50, blue: 0.25),
                        subtitle: "Kashiwa",                 stampSymbol: "\u{1F343}", artworkImageName: nil),
        StampDefinition(id: 99, name: "Ohara Jinja",          icon: "building.columns.fill", color: Color(red: 0.65, green: 0.15, blue: 0.20),
                        subtitle: "Narashino",               stampSymbol: "\u{26E9}", artworkImageName: nil),
        StampDefinition(id: 100, name: "Kemigawa Jinja",      icon: "building.columns.fill", color: Color(red: 0.60, green: 0.18, blue: 0.22),
                        subtitle: "Chiba, Hanamigawa",       stampSymbol: "\u{26E9}", artworkImageName: nil),

        // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
        // Tokyo (Additional, ID 101-112)
        // 東京十社完結 + 五色不動 + 主要寺社
        // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

        // 東京十社 (残り3社)
        StampDefinition(id: 101, name: "Shiba Daijingu",         icon: "building.columns.fill", color: Color(red: 0.75, green: 0.18, blue: 0.18),
                        subtitle: "Minato, Shiba",              stampSymbol: "\u{26E9}", artworkImageName: nil),
        StampDefinition(id: 102, name: "Hakusan Jinja",          icon: "camera.macro",          color: Color(red: 0.55, green: 0.35, blue: 0.55),
                        subtitle: "Bunkyo, Hakusan",            stampSymbol: "\u{1F338}", artworkImageName: nil),
        StampDefinition(id: 103, name: "Shinagawa Jinja",        icon: "flag.fill",             color: Color(red: 0.70, green: 0.15, blue: 0.20),
                        subtitle: "Shinagawa, Kitashinagawa",   stampSymbol: "\u{26E9}", artworkImageName: nil),

        // 五色不動 — 目黒不動
        StampDefinition(id: 104, name: "Ryusen-ji",              icon: "flame.fill",            color: Color(red: 0.30, green: 0.22, blue: 0.55),
                        subtitle: "Meguro, Shimomeguro",        stampSymbol: "\u{1F525}", artworkImageName: nil),

        // 主要寺社
        StampDefinition(id: 105, name: "Gokoku-ji",              icon: "building.columns.fill", color: Color(red: 0.22, green: 0.30, blue: 0.55),
                        subtitle: "Bunkyo, Otsuka",             stampSymbol: "\u{1F3EF}", artworkImageName: nil),
        StampDefinition(id: 106, name: "Fukutoku Jinja",         icon: "sparkles",              color: Color(red: 0.70, green: 0.55, blue: 0.12),
                        subtitle: "Chuo, Nihonbashi Muromachi",  stampSymbol: "\u{2728}", artworkImageName: nil),
        StampDefinition(id: 107, name: "Akagi Jinja",            icon: "building.2.fill",       color: Color(red: 0.22, green: 0.32, blue: 0.60),
                        subtitle: "Shinjuku, Kagurazaka",       stampSymbol: "\u{26E9}", artworkImageName: nil),
        StampDefinition(id: 108, name: "Anamori Inari Jinja",    icon: "flame",                 color: Color(red: 0.80, green: 0.22, blue: 0.15),
                        subtitle: "Ota, Haneda",                stampSymbol: "\u{1F98A}", artworkImageName: nil),
        StampDefinition(id: 109, name: "Takahatafudo Kongoji",   icon: "flame.fill",            color: Color(red: 0.75, green: 0.28, blue: 0.12),
                        subtitle: "Hino",                       stampSymbol: "\u{1F525}", artworkImageName: nil),
        StampDefinition(id: 110, name: "Ueno Toshogu",           icon: "paintpalette.fill",     color: Color(red: 0.65, green: 0.50, blue: 0.12),
                        subtitle: "Taito, Ueno",                stampSymbol: "\u{26E9}", artworkImageName: nil),
        StampDefinition(id: 111, name: "Koganji",                icon: "heart.circle.fill",     color: Color(red: 0.55, green: 0.35, blue: 0.22),
                        subtitle: "Toshima, Sugamo",            stampSymbol: "\u{1F3EF}", artworkImageName: nil),
        StampDefinition(id: 112, name: "Juniso Kumano Jinja",    icon: "tree.fill",             color: Color(red: 0.20, green: 0.48, blue: 0.28),
                        subtitle: "Shinjuku, Nishishinjuku",    stampSymbol: "\u{26E9}", artworkImageName: nil),

        // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
        // Kanagawa (Additional, ID 113-120)
        // 鎌倉五山完結 + 主要神社
        // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

        StampDefinition(id: 113, name: "Oyama Afuri Jinja",      icon: "mountain.2.fill",       color: Color(red: 0.18, green: 0.35, blue: 0.60),
                        subtitle: "Isehara, Oyama",             stampSymbol: "\u{26F0}\u{FE0F}", artworkImageName: nil),
        StampDefinition(id: 114, name: "Hotoku Ninomiya Jinja",  icon: "book.fill",             color: Color(red: 0.50, green: 0.35, blue: 0.20),
                        subtitle: "Odawara",                    stampSymbol: "\u{1F4DA}", artworkImageName: nil),
        StampDefinition(id: 115, name: "Hiratsuka Hachimangu",   icon: "flag.fill",             color: Color(red: 0.65, green: 0.15, blue: 0.15),
                        subtitle: "Hiratsuka",                  stampSymbol: "\u{26E9}", artworkImageName: nil),
        StampDefinition(id: 116, name: "Hakone Kuzuryu Jinja",   icon: "drop.fill",             color: Color(red: 0.15, green: 0.40, blue: 0.65),
                        subtitle: "Hakone, Moto-Hakone",        stampSymbol: "\u{1F409}", artworkImageName: nil),

        // 鎌倉五山 (残り2寺: 第三位・第五位)
        StampDefinition(id: 117, name: "Jufuku-ji",              icon: "leaf.fill",             color: Color(red: 0.25, green: 0.50, blue: 0.30),
                        subtitle: "Kamakura, Ogigayatsu",       stampSymbol: "\u{1F343}", artworkImageName: nil),
        StampDefinition(id: 118, name: "Jomyo-ji",               icon: "leaf.fill",             color: Color(red: 0.30, green: 0.55, blue: 0.28),
                        subtitle: "Kamakura, Jomyoji",          stampSymbol: "\u{1F375}", artworkImageName: nil),

        StampDefinition(id: 119, name: "Morito Jinja",           icon: "water.waves",           color: Color(red: 0.15, green: 0.45, blue: 0.65),
                        subtitle: "Hayama",                     stampSymbol: "\u{1F30A}", artworkImageName: nil),
        StampDefinition(id: 120, name: "Hashirimizu Jinja",      icon: "sailboat.fill",         color: Color(red: 0.20, green: 0.38, blue: 0.60),
                        subtitle: "Yokosuka",                   stampSymbol: "\u{26F5}", artworkImageName: nil),

        // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
        // Chiba (Additional, ID 121-122)
        // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

        StampDefinition(id: 121, name: "Kasamori Kannon",        icon: "building.fill",         color: Color(red: 0.50, green: 0.35, blue: 0.22),
                        subtitle: "Chonan",                     stampSymbol: "\u{1F3EF}", artworkImageName: nil),
        StampDefinition(id: 122, name: "Sakuragi Jinja",         icon: "camera.macro",          color: Color(red: 0.75, green: 0.40, blue: 0.50),
                        subtitle: "Noda",                       stampSymbol: "\u{1F338}", artworkImageName: nil),

        // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
        // Kanagawa — Kawasaki (ID 123-130)
        // 高津区・多摩区・川崎区
        // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

        StampDefinition(id: 123, name: "Mizonokuchi Jinja",      icon: "building.columns.fill", color: Color(red: 0.70, green: 0.18, blue: 0.18),
                        subtitle: "Kawasaki, Takatsu",          stampSymbol: "\u{26E9}", artworkImageName: nil),
        StampDefinition(id: 124, name: "Yokoji",                 icon: "house.lodge.fill",      color: Color(red: 0.30, green: 0.40, blue: 0.55),
                        subtitle: "Kawasaki, Takatsu",          stampSymbol: "\u{1F3EF}", artworkImageName: nil),
        StampDefinition(id: 125, name: "Kuji Jinja",             icon: "building.columns.fill", color: Color(red: 0.60, green: 0.20, blue: 0.20),
                        subtitle: "Kawasaki, Takatsu",          stampSymbol: "\u{26E9}", artworkImageName: nil),
        StampDefinition(id: 126, name: "Nagao Jinja",            icon: "leaf.fill",             color: Color(red: 0.22, green: 0.50, blue: 0.28),
                        subtitle: "Kawasaki, Tama",             stampSymbol: "\u{1F343}", artworkImageName: nil),
        StampDefinition(id: 127, name: "Myorakuji",              icon: "camera.macro",          color: Color(red: 0.35, green: 0.45, blue: 0.70),
                        subtitle: "Kawasaki, Tama",             stampSymbol: "\u{1F4AE}", artworkImageName: nil),
        StampDefinition(id: 128, name: "Inage Jinja",            icon: "flame.fill",            color: Color(red: 0.75, green: 0.22, blue: 0.15),
                        subtitle: "Kawasaki",                   stampSymbol: "\u{26E9}", artworkImageName: nil),
        StampDefinition(id: 129, name: "Hie Daijinja",           icon: "tree.fill",             color: Color(red: 0.18, green: 0.48, blue: 0.25),
                        subtitle: "Kawasaki, Takatsu",          stampSymbol: "\u{1F333}", artworkImageName: nil),
        StampDefinition(id: 130, name: "Noborito Inari",         icon: "flame",                 color: Color(red: 0.80, green: 0.20, blue: 0.12),
                        subtitle: "Kawasaki, Tama",             stampSymbol: "\u{1F98A}", artworkImageName: nil),

        // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
        // Kyoto (Additional, ID 131-155)
        // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

        StampDefinition(id: 131, name: "Kinkaku-ji",             icon: "sparkles",              color: Color(red: 0.80, green: 0.65, blue: 0.10),
                        subtitle: "Kyoto, Kita",                stampSymbol: "\u{2728}", artworkImageName: nil),
        StampDefinition(id: 132, name: "Ginkaku-ji",             icon: "moon.fill",             color: Color(red: 0.55, green: 0.55, blue: 0.55),
                        subtitle: "Kyoto, Sakyo",               stampSymbol: "\u{1F319}", artworkImageName: nil),
        StampDefinition(id: 133, name: "Kiyomizu-dera",          icon: "water.waves",           color: Color(red: 0.70, green: 0.18, blue: 0.15),
                        subtitle: "Kyoto, Higashiyama",         stampSymbol: "\u{1F3EF}", artworkImageName: nil),
        StampDefinition(id: 134, name: "Tofuku-ji",              icon: "leaf.fill",             color: Color(red: 0.80, green: 0.35, blue: 0.10),
                        subtitle: "Kyoto, Higashiyama",         stampSymbol: "\u{1F341}", artworkImageName: nil),
        StampDefinition(id: 135, name: "Nanzen-ji",              icon: "building.fill",         color: Color(red: 0.30, green: 0.45, blue: 0.25),
                        subtitle: "Kyoto, Sakyo",               stampSymbol: "\u{1F3EF}", artworkImageName: nil),
        StampDefinition(id: 136, name: "Ryoan-ji",               icon: "circle.grid.3x3",      color: Color(red: 0.50, green: 0.50, blue: 0.45),
                        subtitle: "Kyoto, Ukyo",                stampSymbol: "\u{1FAA8}", artworkImageName: nil),
        StampDefinition(id: 137, name: "Tenryu-ji",              icon: "cloud.fill",            color: Color(red: 0.25, green: 0.50, blue: 0.35),
                        subtitle: "Kyoto, Ukyo",                stampSymbol: "\u{1F409}", artworkImageName: nil),
        StampDefinition(id: 138, name: "Daitoku-ji",             icon: "cup.and.saucer.fill",   color: Color(red: 0.35, green: 0.30, blue: 0.25),
                        subtitle: "Kyoto, Kita",                stampSymbol: "\u{1F375}", artworkImageName: nil),
        StampDefinition(id: 139, name: "Myoshin-ji",             icon: "house.lodge.fill",      color: Color(red: 0.40, green: 0.35, blue: 0.30),
                        subtitle: "Kyoto, Ukyo",                stampSymbol: "\u{1F3EF}", artworkImageName: nil),
        StampDefinition(id: 140, name: "Kennin-ji",              icon: "wind",                  color: Color(red: 0.30, green: 0.40, blue: 0.55),
                        subtitle: "Kyoto, Higashiyama",         stampSymbol: "\u{1F32C}", artworkImageName: nil),
        StampDefinition(id: 141, name: "Nishi Hongan-ji",        icon: "building.columns.fill", color: Color(red: 0.55, green: 0.40, blue: 0.20),
                        subtitle: "Kyoto, Shimogyo",            stampSymbol: "\u{1F3DB}", artworkImageName: nil),
        StampDefinition(id: 142, name: "Higashi Hongan-ji",      icon: "building.columns.fill", color: Color(red: 0.50, green: 0.35, blue: 0.18),
                        subtitle: "Kyoto, Shimogyo",            stampSymbol: "\u{1F3DB}", artworkImageName: nil),
        StampDefinition(id: 143, name: "Kitano Tenmangu",        icon: "graduationcap.fill",    color: Color(red: 0.55, green: 0.25, blue: 0.52),
                        subtitle: "Kyoto, Kamigyo",             stampSymbol: "\u{1F3D3}", artworkImageName: nil),
        StampDefinition(id: 144, name: "Yasaka Jinja",           icon: "flame.fill",            color: Color(red: 0.75, green: 0.15, blue: 0.15),
                        subtitle: "Kyoto, Higashiyama",         stampSymbol: "\u{26E9}", artworkImageName: nil),
        StampDefinition(id: 145, name: "Heian Jingu",            icon: "crown.fill",            color: Color(red: 0.70, green: 0.20, blue: 0.20),
                        subtitle: "Kyoto, Sakyo",               stampSymbol: "\u{1F451}", artworkImageName: nil),
        StampDefinition(id: 146, name: "Shimogamo Jinja",        icon: "tree.fill",             color: Color(red: 0.20, green: 0.50, blue: 0.28),
                        subtitle: "Kyoto, Sakyo",               stampSymbol: "\u{1F333}", artworkImageName: nil),
        StampDefinition(id: 147, name: "Kamigamo Jinja",         icon: "leaf.fill",             color: Color(red: 0.22, green: 0.55, blue: 0.30),
                        subtitle: "Kyoto, Kita",                stampSymbol: "\u{1F343}", artworkImageName: nil),
        StampDefinition(id: 148, name: "Kifune Jinja",           icon: "water.waves",           color: Color(red: 0.15, green: 0.40, blue: 0.65),
                        subtitle: "Kyoto, Sakyo",               stampSymbol: "\u{1F30A}", artworkImageName: nil),
        StampDefinition(id: 149, name: "Kurama-dera",            icon: "mountain.2.fill",       color: Color(red: 0.35, green: 0.50, blue: 0.30),
                        subtitle: "Kyoto, Sakyo",               stampSymbol: "\u{26F0}", artworkImageName: nil),
        StampDefinition(id: 150, name: "Byodo-in",               icon: "bird.fill",             color: Color(red: 0.45, green: 0.25, blue: 0.55),
                        subtitle: "Uji, Kyoto",                 stampSymbol: "\u{1F426}", artworkImageName: nil),
        StampDefinition(id: 151, name: "Daigo-ji",               icon: "camera.macro",          color: Color(red: 0.70, green: 0.40, blue: 0.50),
                        subtitle: "Kyoto, Fushimi",             stampSymbol: "\u{1F338}", artworkImageName: nil),
        StampDefinition(id: 152, name: "Sanjusangendo",          icon: "figure.stand",          color: Color(red: 0.60, green: 0.30, blue: 0.15),
                        subtitle: "Kyoto, Higashiyama",         stampSymbol: "\u{1F9D8}", artworkImageName: nil),
        StampDefinition(id: 153, name: "To-ji",                  icon: "building.2.fill",       color: Color(red: 0.50, green: 0.35, blue: 0.25),
                        subtitle: "Kyoto, Minami",              stampSymbol: "\u{1F3EF}", artworkImageName: nil),
        StampDefinition(id: 154, name: "Eikan-do",               icon: "leaf.fill",             color: Color(red: 0.80, green: 0.40, blue: 0.10),
                        subtitle: "Kyoto, Sakyo",               stampSymbol: "\u{1F341}", artworkImageName: nil),
        StampDefinition(id: 155, name: "Kodai-ji",               icon: "moon.stars.fill",       color: Color(red: 0.25, green: 0.30, blue: 0.50),
                        subtitle: "Kyoto, Higashiyama",         stampSymbol: "\u{1F303}", artworkImageName: nil),

        // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
        // Osaka (Additional, ID 156-163)
        // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

        StampDefinition(id: 156, name: "Sumiyoshi Taisha",       icon: "mountain.2.fill",       color: Color(red: 0.20, green: 0.50, blue: 0.30),
                        subtitle: "Osaka, Sumiyoshi",           stampSymbol: "\u{26E9}", artworkImageName: nil),
        StampDefinition(id: 157, name: "Shitennoji",             icon: "building.columns.fill", color: Color(red: 0.65, green: 0.30, blue: 0.15),
                        subtitle: "Osaka, Tennoji",             stampSymbol: "\u{1F3EF}", artworkImageName: nil),
        StampDefinition(id: 158, name: "Osaka Tenmangu",         icon: "graduationcap.fill",    color: Color(red: 0.55, green: 0.25, blue: 0.52),
                        subtitle: "Osaka, Kita",                stampSymbol: "\u{1F3D3}", artworkImageName: nil),
        StampDefinition(id: 159, name: "Imamiya Ebisu Jinja",    icon: "fish.fill",             color: Color(red: 0.70, green: 0.50, blue: 0.10),
                        subtitle: "Osaka, Naniwa",              stampSymbol: "\u{1F41F}", artworkImageName: nil),
        StampDefinition(id: 160, name: "Tamatsukuri Inari",      icon: "flame",                 color: Color(red: 0.80, green: 0.22, blue: 0.15),
                        subtitle: "Osaka, Chuo",                stampSymbol: "\u{1F98A}", artworkImageName: nil),
        StampDefinition(id: 161, name: "Hozen-ji",               icon: "drop.fill",             color: Color(red: 0.25, green: 0.40, blue: 0.55),
                        subtitle: "Osaka, Chuo",                stampSymbol: "\u{1F4A7}", artworkImageName: nil),
        StampDefinition(id: 162, name: "Domyoji Tenmangu",       icon: "graduationcap.fill",    color: Color(red: 0.50, green: 0.22, blue: 0.48),
                        subtitle: "Fujiidera, Osaka",           stampSymbol: "\u{1F338}", artworkImageName: nil),
        StampDefinition(id: 163, name: "Hiraoka Jinja",          icon: "building.columns.fill", color: Color(red: 0.65, green: 0.18, blue: 0.18),
                        subtitle: "Higashi-Osaka",              stampSymbol: "\u{26E9}", artworkImageName: nil),

        // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
        // Nara (Additional, ID 164-172)
        // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

        StampDefinition(id: 164, name: "Todai-ji",               icon: "figure.seated.side",    color: Color(red: 0.60, green: 0.35, blue: 0.15),
                        subtitle: "Nara",                       stampSymbol: "\u{1F9D8}", artworkImageName: nil),
        StampDefinition(id: 165, name: "Kasuga Taisha",          icon: "lamp.desk.fill",        color: Color(red: 0.75, green: 0.18, blue: 0.12),
                        subtitle: "Nara",                       stampSymbol: "\u{1F3EE}", artworkImageName: nil),
        StampDefinition(id: 166, name: "Horyu-ji",               icon: "building.2.fill",       color: Color(red: 0.50, green: 0.40, blue: 0.25),
                        subtitle: "Ikaruga, Nara",              stampSymbol: "\u{1F3EF}", artworkImageName: nil),
        StampDefinition(id: 167, name: "Yakushi-ji",             icon: "cross.fill",            color: Color(red: 0.45, green: 0.30, blue: 0.55),
                        subtitle: "Nara, Nishinokyo",           stampSymbol: "\u{2695}", artworkImageName: nil),
        StampDefinition(id: 168, name: "Toshodai-ji",            icon: "building.fill",         color: Color(red: 0.40, green: 0.35, blue: 0.30),
                        subtitle: "Nara, Nishinokyo",           stampSymbol: "\u{1F3EF}", artworkImageName: nil),
        StampDefinition(id: 169, name: "Hase-dera",              icon: "camera.macro",          color: Color(red: 0.65, green: 0.35, blue: 0.50),
                        subtitle: "Sakurai, Nara",              stampSymbol: "\u{1F338}", artworkImageName: nil),
        StampDefinition(id: 170, name: "Tanzan Jinja",           icon: "leaf.fill",             color: Color(red: 0.80, green: 0.35, blue: 0.10),
                        subtitle: "Sakurai, Nara",              stampSymbol: "\u{1F341}", artworkImageName: nil),
        StampDefinition(id: 171, name: "Asuka-dera",             icon: "hourglass",             color: Color(red: 0.50, green: 0.40, blue: 0.30),
                        subtitle: "Asuka, Nara",                stampSymbol: "\u{231B}", artworkImageName: nil),
        StampDefinition(id: 172, name: "Muro-ji",                icon: "tree.fill",             color: Color(red: 0.22, green: 0.50, blue: 0.30),
                        subtitle: "Uda, Nara",                  stampSymbol: "\u{1F332}", artworkImageName: nil),

        // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
        // Shiga (ID 173-177)
        // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

        StampDefinition(id: 173, name: "Enryaku-ji",             icon: "mountain.2.fill",       color: Color(red: 0.35, green: 0.45, blue: 0.25),
                        subtitle: "Otsu, Shiga",                stampSymbol: "\u{26F0}", artworkImageName: nil),
        StampDefinition(id: 174, name: "Miidera",                icon: "bell.fill",             color: Color(red: 0.45, green: 0.35, blue: 0.55),
                        subtitle: "Otsu, Shiga",                stampSymbol: "\u{1F514}", artworkImageName: nil),
        StampDefinition(id: 175, name: "Taga Taisha",            icon: "heart.fill",            color: Color(red: 0.70, green: 0.20, blue: 0.30),
                        subtitle: "Taga, Shiga",                stampSymbol: "\u{2764}", artworkImageName: nil),
        StampDefinition(id: 176, name: "Hiyoshi Taisha",         icon: "tree.fill",             color: Color(red: 0.20, green: 0.50, blue: 0.25),
                        subtitle: "Otsu, Shiga",                stampSymbol: "\u{1F333}", artworkImageName: nil),
        StampDefinition(id: 177, name: "Ishiyama-dera",          icon: "book.fill",             color: Color(red: 0.50, green: 0.35, blue: 0.55),
                        subtitle: "Otsu, Shiga",                stampSymbol: "\u{1F4D6}", artworkImageName: nil),

        // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
        // Hyogo (ID 178-183)
        // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

        StampDefinition(id: 178, name: "Ikuta Jinja",            icon: "heart.fill",            color: Color(red: 0.75, green: 0.15, blue: 0.25),
                        subtitle: "Kobe, Hyogo",                stampSymbol: "\u{26E9}", artworkImageName: nil),
        StampDefinition(id: 179, name: "Nagata Jinja",           icon: "building.columns.fill", color: Color(red: 0.65, green: 0.18, blue: 0.18),
                        subtitle: "Kobe, Hyogo",                stampSymbol: "\u{26E9}", artworkImageName: nil),
        StampDefinition(id: 180, name: "Engyoji",                icon: "mountain.2.fill",       color: Color(red: 0.35, green: 0.50, blue: 0.30),
                        subtitle: "Himeji, Hyogo",              stampSymbol: "\u{26F0}", artworkImageName: nil),
        StampDefinition(id: 181, name: "Taisan-ji",              icon: "building.2.fill",       color: Color(red: 0.50, green: 0.35, blue: 0.22),
                        subtitle: "Kobe, Hyogo",                stampSymbol: "\u{1F3EF}", artworkImageName: nil),
        StampDefinition(id: 182, name: "Nishinomiya Jinja",      icon: "fish.fill",             color: Color(red: 0.65, green: 0.50, blue: 0.12),
                        subtitle: "Nishinomiya, Hyogo",         stampSymbol: "\u{1F41F}", artworkImageName: nil),
        StampDefinition(id: 183, name: "Suma-dera",              icon: "water.waves",           color: Color(red: 0.20, green: 0.40, blue: 0.60),
                        subtitle: "Kobe, Hyogo",                stampSymbol: "\u{1F30A}", artworkImageName: nil),

        // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
        // Wakayama (ID 184-190)
        // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

        StampDefinition(id: 184, name: "Kumano Hongu Taisha",    icon: "flame.fill",            color: Color(red: 0.70, green: 0.18, blue: 0.12),
                        subtitle: "Tanabe, Wakayama",           stampSymbol: "\u{1F525}", artworkImageName: nil),
        StampDefinition(id: 185, name: "Kumano Nachi Taisha",    icon: "water.waves",           color: Color(red: 0.15, green: 0.45, blue: 0.65),
                        subtitle: "Nachikatsuura, Wakayama",    stampSymbol: "\u{1F30A}", artworkImageName: nil),
        StampDefinition(id: 186, name: "Kumano Hayatama Taisha", icon: "bolt.fill",             color: Color(red: 0.75, green: 0.22, blue: 0.15),
                        subtitle: "Shingu, Wakayama",           stampSymbol: "\u{26A1}", artworkImageName: nil),
        StampDefinition(id: 187, name: "Koyasan Kongobu-ji",     icon: "building.fill",         color: Color(red: 0.50, green: 0.30, blue: 0.55),
                        subtitle: "Koya, Wakayama",             stampSymbol: "\u{1F3EF}", artworkImageName: nil),
        StampDefinition(id: 188, name: "Koyasan Okunoin",        icon: "moon.stars.fill",       color: Color(red: 0.20, green: 0.25, blue: 0.45),
                        subtitle: "Koya, Wakayama",             stampSymbol: "\u{1F303}", artworkImageName: nil),
        StampDefinition(id: 189, name: "Kimiidera",              icon: "camera.macro",          color: Color(red: 0.65, green: 0.35, blue: 0.50),
                        subtitle: "Wakayama",                   stampSymbol: "\u{1F338}", artworkImageName: nil),
        StampDefinition(id: 190, name: "Kokawa-dera",            icon: "house.lodge.fill",      color: Color(red: 0.45, green: 0.35, blue: 0.30),
                        subtitle: "Kinokawa, Wakayama",         stampSymbol: "\u{1F3EF}", artworkImageName: nil),

        // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
        // Chubu — Tokai (ID 191-201)
        // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

        StampDefinition(id: 191, name: "Atsuta Jingu",           icon: "crown.fill",            color: Color(red: 0.70, green: 0.55, blue: 0.10),
                        subtitle: "Nagoya, Aichi",              stampSymbol: "\u{1F451}", artworkImageName: nil),
        StampDefinition(id: 192, name: "Toyokawa Inari",         icon: "flame",                 color: Color(red: 0.80, green: 0.22, blue: 0.15),
                        subtitle: "Toyokawa, Aichi",            stampSymbol: "\u{1F98A}", artworkImageName: nil),
        StampDefinition(id: 193, name: "Osu Kannon",             icon: "figure.seated.side",    color: Color(red: 0.60, green: 0.30, blue: 0.50),
                        subtitle: "Nagoya, Aichi",              stampSymbol: "\u{1F9D8}", artworkImageName: nil),
        StampDefinition(id: 194, name: "Masumida Jinja",         icon: "building.columns.fill", color: Color(red: 0.65, green: 0.18, blue: 0.18),
                        subtitle: "Ichinomiya, Aichi",          stampSymbol: "\u{26E9}", artworkImageName: nil),
        StampDefinition(id: 195, name: "Tsushima Jinja",         icon: "building.columns.fill", color: Color(red: 0.60, green: 0.20, blue: 0.20),
                        subtitle: "Tsushima, Aichi",            stampSymbol: "\u{26E9}", artworkImageName: nil),
        StampDefinition(id: 196, name: "Inuyama Naritasan",      icon: "house.lodge.fill",      color: Color(red: 0.55, green: 0.35, blue: 0.20),
                        subtitle: "Inuyama, Aichi",             stampSymbol: "\u{1F3EF}", artworkImageName: nil),
        StampDefinition(id: 197, name: "Fujisan Hongu Sengen Taisha", icon: "mountain.2.fill",  color: Color(red: 0.20, green: 0.50, blue: 0.70),
                        subtitle: "Fujinomiya, Shizuoka",       stampSymbol: "\u{1F5FB}", artworkImageName: nil),
        StampDefinition(id: 198, name: "Kunozan Toshogu",        icon: "sparkles",              color: Color(red: 0.75, green: 0.60, blue: 0.12),
                        subtitle: "Shizuoka",                   stampSymbol: "\u{2728}", artworkImageName: nil),
        StampDefinition(id: 199, name: "Mishima Taisha",         icon: "shield.fill",           color: Color(red: 0.60, green: 0.15, blue: 0.18),
                        subtitle: "Mishima, Shizuoka",          stampSymbol: "\u{1F6E1}", artworkImageName: nil),
        StampDefinition(id: 200, name: "Hattasan Sonei-ji",      icon: "house.lodge.fill",      color: Color(red: 0.50, green: 0.35, blue: 0.25),
                        subtitle: "Fukuroi, Shizuoka",          stampSymbol: "\u{1F3EF}", artworkImageName: nil),
        StampDefinition(id: 201, name: "Kinomiya Jinja",         icon: "tree.fill",             color: Color(red: 0.18, green: 0.50, blue: 0.25),
                        subtitle: "Atami, Shizuoka",            stampSymbol: "\u{1F333}", artworkImageName: nil),

        // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
        // Chubu — Koshinetsu (ID 202-210)
        // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

        StampDefinition(id: 202, name: "Zenko-ji",               icon: "building.columns.fill", color: Color(red: 0.55, green: 0.40, blue: 0.20),
                        subtitle: "Nagano",                     stampSymbol: "\u{1F3EF}", artworkImageName: nil),
        StampDefinition(id: 203, name: "Togakushi Jinja",        icon: "mountain.2.fill",       color: Color(red: 0.25, green: 0.50, blue: 0.35),
                        subtitle: "Nagano",                     stampSymbol: "\u{26F0}", artworkImageName: nil),
        StampDefinition(id: 204, name: "Suwa Taisha",            icon: "wind",                  color: Color(red: 0.30, green: 0.45, blue: 0.60),
                        subtitle: "Suwa, Nagano",               stampSymbol: "\u{1F32C}", artworkImageName: nil),
        StampDefinition(id: 205, name: "Takeda Jinja",           icon: "shield.fill",           color: Color(red: 0.60, green: 0.15, blue: 0.15),
                        subtitle: "Kofu, Yamanashi",            stampSymbol: "\u{1F6E1}", artworkImageName: nil),
        StampDefinition(id: 206, name: "Minobusan Kuon-ji",      icon: "building.fill",         color: Color(red: 0.45, green: 0.30, blue: 0.55),
                        subtitle: "Minobu, Yamanashi",          stampSymbol: "\u{1F3EF}", artworkImageName: nil),
        StampDefinition(id: 207, name: "Yahiko Jinja",           icon: "leaf.fill",             color: Color(red: 0.22, green: 0.55, blue: 0.30),
                        subtitle: "Yahiko, Niigata",            stampSymbol: "\u{1F343}", artworkImageName: nil),
        StampDefinition(id: 208, name: "Kitaguchi Hongu Fuji Sengen Jinja", icon: "mountain.2.fill", color: Color(red: 0.25, green: 0.45, blue: 0.65),
                        subtitle: "Fujiyoshida, Yamanashi",     stampSymbol: "\u{1F5FB}", artworkImageName: nil),
        StampDefinition(id: 209, name: "Hotaka Jinja",           icon: "mountain.2.fill",       color: Color(red: 0.30, green: 0.50, blue: 0.40),
                        subtitle: "Azumino, Nagano",            stampSymbol: "\u{26F0}", artworkImageName: nil),
        StampDefinition(id: 210, name: "Hakusan Jinja (Niigata)", icon: "building.columns.fill", color: Color(red: 0.60, green: 0.20, blue: 0.20),
                        subtitle: "Niigata",                    stampSymbol: "\u{26E9}", artworkImageName: nil),

        // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
        // Chubu — Hokuriku (ID 211-218)
        // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

        StampDefinition(id: 211, name: "Eihei-ji",               icon: "figure.mind.and.body",  color: Color(red: 0.30, green: 0.40, blue: 0.25),
                        subtitle: "Eiheiji, Fukui",             stampSymbol: "\u{1F9D8}", artworkImageName: nil),
        StampDefinition(id: 212, name: "Kehi Jingu",             icon: "crown.fill",            color: Color(red: 0.65, green: 0.50, blue: 0.12),
                        subtitle: "Tsuruga, Fukui",             stampSymbol: "\u{1F451}", artworkImageName: nil),
        StampDefinition(id: 213, name: "Shirayama Hime Jinja",   icon: "snow",                  color: Color(red: 0.40, green: 0.55, blue: 0.70),
                        subtitle: "Hakusan, Ishikawa",          stampSymbol: "\u{2744}", artworkImageName: nil),
        StampDefinition(id: 214, name: "Oyama Jinja",            icon: "building.columns.fill", color: Color(red: 0.50, green: 0.35, blue: 0.20),
                        subtitle: "Kanazawa, Ishikawa",         stampSymbol: "\u{26E9}", artworkImageName: nil),
        StampDefinition(id: 215, name: "Kanazawa Jinja",         icon: "building.columns.fill", color: Color(red: 0.55, green: 0.22, blue: 0.22),
                        subtitle: "Kanazawa, Ishikawa",         stampSymbol: "\u{26E9}", artworkImageName: nil),
        StampDefinition(id: 216, name: "Nata-dera",              icon: "flame.fill",            color: Color(red: 0.70, green: 0.30, blue: 0.15),
                        subtitle: "Komatsu, Ishikawa",          stampSymbol: "\u{1F525}", artworkImageName: nil),
        StampDefinition(id: 217, name: "Zuiryu-ji",              icon: "building.fill",         color: Color(red: 0.40, green: 0.35, blue: 0.50),
                        subtitle: "Takaoka, Toyama",            stampSymbol: "\u{1F3EF}", artworkImageName: nil),
        StampDefinition(id: 218, name: "Takaoka Daibutsu",       icon: "figure.seated.side",    color: Color(red: 0.55, green: 0.40, blue: 0.25),
                        subtitle: "Takaoka, Toyama",            stampSymbol: "\u{1F9D8}", artworkImageName: nil),

        // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
        // East Japan — Saitama (ID 219-224)
        // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

        StampDefinition(id: 219, name: "Musashi Ichinomiya Hikawa Jinja", icon: "building.columns.fill", color: Color(red: 0.70, green: 0.18, blue: 0.18),
                        subtitle: "Omiya, Saitama",             stampSymbol: "\u{26E9}", artworkImageName: nil),
        StampDefinition(id: 220, name: "Chichibu Jinja",         icon: "mountain.2.fill",       color: Color(red: 0.30, green: 0.50, blue: 0.35),
                        subtitle: "Chichibu, Saitama",          stampSymbol: "\u{26F0}", artworkImageName: nil),
        StampDefinition(id: 221, name: "Mitsumine Jinja",        icon: "cloud.fill",            color: Color(red: 0.25, green: 0.45, blue: 0.60),
                        subtitle: "Chichibu, Saitama",          stampSymbol: "\u{2601}", artworkImageName: nil),
        StampDefinition(id: 222, name: "Hodosan Jinja",          icon: "flame.fill",            color: Color(red: 0.75, green: 0.20, blue: 0.12),
                        subtitle: "Nagatoro, Saitama",          stampSymbol: "\u{1F525}", artworkImageName: nil),
        StampDefinition(id: 223, name: "Kitain",                 icon: "house.lodge.fill",      color: Color(red: 0.50, green: 0.35, blue: 0.55),
                        subtitle: "Kawagoe, Saitama",           stampSymbol: "\u{1F3EF}", artworkImageName: nil),
        StampDefinition(id: 224, name: "Kawagoe Hikawa Jinja",   icon: "heart.fill",            color: Color(red: 0.70, green: 0.20, blue: 0.35),
                        subtitle: "Kawagoe, Saitama",           stampSymbol: "\u{2764}", artworkImageName: nil),

        // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
        // East Japan — North Kanto (ID 225-232)
        // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

        StampDefinition(id: 225, name: "Nikko Futarasan Jinja",  icon: "mountain.2.fill",       color: Color(red: 0.25, green: 0.50, blue: 0.35),
                        subtitle: "Nikko, Tochigi",             stampSymbol: "\u{26F0}", artworkImageName: nil),
        StampDefinition(id: 226, name: "Banna-ji",               icon: "book.fill",             color: Color(red: 0.45, green: 0.35, blue: 0.25),
                        subtitle: "Ashikaga, Tochigi",          stampSymbol: "\u{1F4D6}", artworkImageName: nil),
        StampDefinition(id: 227, name: "Haruna Jinja",           icon: "water.waves",           color: Color(red: 0.20, green: 0.45, blue: 0.60),
                        subtitle: "Takasaki, Gunma",            stampSymbol: "\u{1F30A}", artworkImageName: nil),
        StampDefinition(id: 228, name: "Myogi Jinja",            icon: "mountain.2.fill",       color: Color(red: 0.35, green: 0.45, blue: 0.30),
                        subtitle: "Tomioka, Gunma",             stampSymbol: "\u{26F0}", artworkImageName: nil),
        StampDefinition(id: 229, name: "Kashima Jingu",          icon: "figure.fencing",        color: Color(red: 0.60, green: 0.15, blue: 0.20),
                        subtitle: "Kashima, Ibaraki",           stampSymbol: "\u{2694}", artworkImageName: nil),
        StampDefinition(id: 230, name: "Ikisu Jinja",            icon: "building.columns.fill", color: Color(red: 0.55, green: 0.20, blue: 0.20),
                        subtitle: "Kamisu, Ibaraki",            stampSymbol: "\u{26E9}", artworkImageName: nil),
        StampDefinition(id: 231, name: "Kasama Inari Jinja",     icon: "flame",                 color: Color(red: 0.80, green: 0.22, blue: 0.15),
                        subtitle: "Kasama, Ibaraki",            stampSymbol: "\u{1F98A}", artworkImageName: nil),
        StampDefinition(id: 232, name: "Rinno-ji",               icon: "building.fill",         color: Color(red: 0.45, green: 0.30, blue: 0.55),
                        subtitle: "Nikko, Tochigi",             stampSymbol: "\u{1F3EF}", artworkImageName: nil),

        // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
        // East Japan — Tohoku (ID 233-245)
        // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

        StampDefinition(id: 233, name: "Chuson-ji",              icon: "sparkles",              color: Color(red: 0.75, green: 0.60, blue: 0.12),
                        subtitle: "Hiraizumi, Iwate",           stampSymbol: "\u{2728}", artworkImageName: nil),
        StampDefinition(id: 234, name: "Motsu-ji",               icon: "leaf.fill",             color: Color(red: 0.22, green: 0.55, blue: 0.30),
                        subtitle: "Hiraizumi, Iwate",           stampSymbol: "\u{1F343}", artworkImageName: nil),
        StampDefinition(id: 235, name: "Zuigan-ji",              icon: "tree.fill",             color: Color(red: 0.20, green: 0.50, blue: 0.28),
                        subtitle: "Matsushima, Miyagi",         stampSymbol: "\u{1F332}", artworkImageName: nil),
        StampDefinition(id: 236, name: "Shiogama Jinja",         icon: "water.waves",           color: Color(red: 0.20, green: 0.40, blue: 0.60),
                        subtitle: "Shiogama, Miyagi",           stampSymbol: "\u{1F30A}", artworkImageName: nil),
        StampDefinition(id: 237, name: "Dewa Sanzan Jinja",      icon: "mountain.2.fill",       color: Color(red: 0.30, green: 0.50, blue: 0.35),
                        subtitle: "Tsuruoka, Yamagata",         stampSymbol: "\u{26F0}", artworkImageName: nil),
        StampDefinition(id: 238, name: "Risshaku-ji (Yamadera)", icon: "mountain.2.fill",       color: Color(red: 0.35, green: 0.45, blue: 0.30),
                        subtitle: "Yamagata",                   stampSymbol: "\u{26F0}", artworkImageName: nil),
        StampDefinition(id: 239, name: "Iwakiyama Jinja",        icon: "snow",                  color: Color(red: 0.35, green: 0.50, blue: 0.65),
                        subtitle: "Hirosaki, Aomori",           stampSymbol: "\u{2744}", artworkImageName: nil),
        StampDefinition(id: 240, name: "Uesugi Jinja",           icon: "shield.fill",           color: Color(red: 0.55, green: 0.15, blue: 0.18),
                        subtitle: "Yonezawa, Yamagata",         stampSymbol: "\u{1F6E1}", artworkImageName: nil),
        StampDefinition(id: 241, name: "Isasumi Jinja",          icon: "building.columns.fill", color: Color(red: 0.60, green: 0.20, blue: 0.20),
                        subtitle: "Aizumisato, Fukushima",      stampSymbol: "\u{26E9}", artworkImageName: nil),
        StampDefinition(id: 242, name: "Nanko Jinja",            icon: "camera.macro",          color: Color(red: 0.65, green: 0.35, blue: 0.50),
                        subtitle: "Shirakawa, Fukushima",       stampSymbol: "\u{1F338}", artworkImageName: nil),
        StampDefinition(id: 243, name: "Osaki Hachimangu",       icon: "shield.fill",           color: Color(red: 0.60, green: 0.12, blue: 0.15),
                        subtitle: "Sendai, Miyagi",             stampSymbol: "\u{1F6E1}", artworkImageName: nil),
        StampDefinition(id: 244, name: "Taiheizan Miyoshi Jinja", icon: "building.columns.fill", color: Color(red: 0.55, green: 0.22, blue: 0.22),
                        subtitle: "Akita",                      stampSymbol: "\u{26E9}", artworkImageName: nil),
        StampDefinition(id: 245, name: "Dewa Jinja (Gassan)",    icon: "moon.fill",             color: Color(red: 0.40, green: 0.45, blue: 0.60),
                        subtitle: "Yamagata",                   stampSymbol: "\u{1F319}", artworkImageName: nil),

        // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
        // East Japan — Hokkaido (ID 246-249)
        // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

        StampDefinition(id: 246, name: "Hokkaido Jingu",         icon: "crown.fill",            color: Color(red: 0.65, green: 0.50, blue: 0.12),
                        subtitle: "Sapporo, Hokkaido",          stampSymbol: "\u{1F451}", artworkImageName: nil),
        StampDefinition(id: 247, name: "Hakodate Hachimangu",    icon: "shield.fill",           color: Color(red: 0.60, green: 0.12, blue: 0.15),
                        subtitle: "Hakodate, Hokkaido",         stampSymbol: "\u{1F6E1}", artworkImageName: nil),
        StampDefinition(id: 248, name: "Obihiro Jinja",          icon: "building.columns.fill", color: Color(red: 0.55, green: 0.20, blue: 0.20),
                        subtitle: "Obihiro, Hokkaido",          stampSymbol: "\u{26E9}", artworkImageName: nil),
        StampDefinition(id: 249, name: "Kamikawa Jinja",         icon: "tree.fill",             color: Color(red: 0.20, green: 0.50, blue: 0.30),
                        subtitle: "Asahikawa, Hokkaido",        stampSymbol: "\u{1F333}", artworkImageName: nil),

        // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
        // East Japan — Saitama Additional (ID 250-252)
        // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

        StampDefinition(id: 250, name: "Hisaizu Jinja",          icon: "building.columns.fill", color: Color(red: 0.60, green: 0.20, blue: 0.20),
                        subtitle: "Iwatsuki, Saitama",          stampSymbol: "\u{26E9}", artworkImageName: nil),
        StampDefinition(id: 251, name: "Tsuki Jinja",            icon: "hare.fill",             color: Color(red: 0.65, green: 0.40, blue: 0.50),
                        subtitle: "Urawa, Saitama",             stampSymbol: "\u{1F407}", artworkImageName: nil),
        StampDefinition(id: 252, name: "Seitenkyu",              icon: "house.lodge.fill",      color: Color(red: 0.70, green: 0.30, blue: 0.15),
                        subtitle: "Sakado, Saitama",            stampSymbol: "\u{1F3EF}", artworkImageName: nil),

        // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
        // West Japan — Chugoku (ID 253-261)
        // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

        StampDefinition(id: 253, name: "Kibitsu Jinja",          icon: "building.columns.fill", color: Color(red: 0.65, green: 0.18, blue: 0.18),
                        subtitle: "Okayama",                    stampSymbol: "\u{26E9}", artworkImageName: nil),
        StampDefinition(id: 254, name: "Kibitsuhiko Jinja",      icon: "building.columns.fill", color: Color(red: 0.60, green: 0.20, blue: 0.20),
                        subtitle: "Okayama",                    stampSymbol: "\u{26E9}", artworkImageName: nil),
        StampDefinition(id: 255, name: "Hofu Tenmangu",          icon: "graduationcap.fill",    color: Color(red: 0.55, green: 0.25, blue: 0.52),
                        subtitle: "Hofu, Yamaguchi",            stampSymbol: "\u{1F3D3}", artworkImageName: nil),
        StampDefinition(id: 256, name: "Senko-ji",               icon: "mountain.2.fill",       color: Color(red: 0.35, green: 0.45, blue: 0.30),
                        subtitle: "Onomichi, Hiroshima",        stampSymbol: "\u{26F0}", artworkImageName: nil),
        StampDefinition(id: 257, name: "Miho Jinja",             icon: "water.waves",           color: Color(red: 0.20, green: 0.45, blue: 0.60),
                        subtitle: "Matsue, Shimane",            stampSymbol: "\u{1F30A}", artworkImageName: nil),
        StampDefinition(id: 258, name: "Yaegaki Jinja",          icon: "heart.fill",            color: Color(red: 0.70, green: 0.20, blue: 0.35),
                        subtitle: "Matsue, Shimane",            stampSymbol: "\u{2764}", artworkImageName: nil),
        StampDefinition(id: 259, name: "Ruriko-ji",              icon: "building.2.fill",       color: Color(red: 0.45, green: 0.35, blue: 0.25),
                        subtitle: "Yamaguchi",                  stampSymbol: "\u{1F3EF}", artworkImageName: nil),
        StampDefinition(id: 260, name: "Izumo Daijingu",         icon: "building.columns.fill", color: Color(red: 0.55, green: 0.22, blue: 0.22),
                        subtitle: "Kameoka, Kyoto",             stampSymbol: "\u{26E9}", artworkImageName: nil),
        StampDefinition(id: 261, name: "Akama Jingu",            icon: "crown.fill",            color: Color(red: 0.65, green: 0.15, blue: 0.20),
                        subtitle: "Shimonoseki, Yamaguchi",     stampSymbol: "\u{1F451}", artworkImageName: nil),

        // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
        // West Japan — Shikoku (ID 262-270)
        // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

        StampDefinition(id: 262, name: "Kotohira-gu",            icon: "figure.stairs",         color: Color(red: 0.70, green: 0.50, blue: 0.12),
                        subtitle: "Kotohira, Kagawa",           stampSymbol: "\u{1F3DB}", artworkImageName: "13_kotohiragu"),
        StampDefinition(id: 263, name: "Zentsu-ji",              icon: "house.lodge.fill",      color: Color(red: 0.50, green: 0.35, blue: 0.55),
                        subtitle: "Zentsuji, Kagawa",           stampSymbol: "\u{1F3EF}", artworkImageName: nil),
        StampDefinition(id: 264, name: "Ishite-ji",              icon: "hand.raised.fill",      color: Color(red: 0.55, green: 0.35, blue: 0.25),
                        subtitle: "Matsuyama, Ehime",           stampSymbol: "\u{270B}", artworkImageName: nil),
        StampDefinition(id: 265, name: "Oyamazumi Jinja",        icon: "shield.fill",           color: Color(red: 0.55, green: 0.15, blue: 0.18),
                        subtitle: "Omishima, Ehime",            stampSymbol: "\u{1F6E1}", artworkImageName: nil),
        StampDefinition(id: 266, name: "Ryozen-ji",              icon: "figure.walk",           color: Color(red: 0.60, green: 0.30, blue: 0.50),
                        subtitle: "Naruto, Tokushima",          stampSymbol: "\u{1F6B6}", artworkImageName: nil),
        StampDefinition(id: 267, name: "Okubo-ji",               icon: "flag.checkered",        color: Color(red: 0.50, green: 0.35, blue: 0.20),
                        subtitle: "Sanuki, Kagawa",             stampSymbol: "\u{1F3C1}", artworkImageName: nil),
        StampDefinition(id: 268, name: "Iwaya-ji",               icon: "mountain.2.fill",       color: Color(red: 0.40, green: 0.50, blue: 0.35),
                        subtitle: "Kumakogen, Ehime",           stampSymbol: "\u{26F0}", artworkImageName: nil),
        StampDefinition(id: 269, name: "Yashima-ji",             icon: "binoculars.fill",       color: Color(red: 0.35, green: 0.45, blue: 0.55),
                        subtitle: "Takamatsu, Kagawa",          stampSymbol: "\u{1F52D}", artworkImageName: nil),
        StampDefinition(id: 270, name: "Unpen-ji",               icon: "cloud.fill",            color: Color(red: 0.45, green: 0.50, blue: 0.60),
                        subtitle: "Miyoshi, Tokushima",         stampSymbol: "\u{2601}", artworkImageName: nil),

        // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
        // West Japan — Kyushu (ID 271-290)
        // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

        StampDefinition(id: 271, name: "Munakata Taisha",        icon: "water.waves",           color: Color(red: 0.15, green: 0.45, blue: 0.65),
                        subtitle: "Munakata, Fukuoka",          stampSymbol: "\u{1F30A}", artworkImageName: nil),
        StampDefinition(id: 272, name: "Kushida Jinja",          icon: "flame.fill",            color: Color(red: 0.75, green: 0.18, blue: 0.15),
                        subtitle: "Hakata, Fukuoka",            stampSymbol: "\u{1F525}", artworkImageName: nil),
        StampDefinition(id: 273, name: "Usa Jingu",              icon: "crown.fill",            color: Color(red: 0.65, green: 0.50, blue: 0.12),
                        subtitle: "Usa, Oita",                  stampSymbol: "\u{1F451}", artworkImageName: nil),
        StampDefinition(id: 274, name: "Hikosan Jingu",          icon: "mountain.2.fill",       color: Color(red: 0.30, green: 0.50, blue: 0.35),
                        subtitle: "Soeda, Fukuoka",             stampSymbol: "\u{26F0}", artworkImageName: nil),
        StampDefinition(id: 275, name: "Yutoku Inari Jinja",     icon: "flame",                 color: Color(red: 0.80, green: 0.22, blue: 0.15),
                        subtitle: "Kashima, Saga",              stampSymbol: "\u{1F98A}", artworkImageName: nil),
        StampDefinition(id: 276, name: "Suwa Jinja Nagasaki",    icon: "building.columns.fill", color: Color(red: 0.60, green: 0.20, blue: 0.20),
                        subtitle: "Nagasaki",                   stampSymbol: "\u{26E9}", artworkImageName: nil),
        StampDefinition(id: 277, name: "Kato Jinja",             icon: "shield.fill",           color: Color(red: 0.55, green: 0.15, blue: 0.18),
                        subtitle: "Kumamoto",                   stampSymbol: "\u{1F6E1}", artworkImageName: nil),
        StampDefinition(id: 278, name: "Aso Jinja",              icon: "mountain.2.fill",       color: Color(red: 0.30, green: 0.50, blue: 0.30),
                        subtitle: "Aso, Kumamoto",              stampSymbol: "\u{1F30B}", artworkImageName: nil),
        StampDefinition(id: 279, name: "Takachiho Jinja",        icon: "sparkles",              color: Color(red: 0.50, green: 0.40, blue: 0.60),
                        subtitle: "Takachiho, Miyazaki",        stampSymbol: "\u{2728}", artworkImageName: nil),
        StampDefinition(id: 280, name: "Amanoiwato Jinja",       icon: "sun.max.fill",          color: Color(red: 0.75, green: 0.60, blue: 0.12),
                        subtitle: "Takachiho, Miyazaki",        stampSymbol: "\u{2600}", artworkImageName: nil),
        StampDefinition(id: 281, name: "Miyazaki Jingu",         icon: "crown.fill",            color: Color(red: 0.65, green: 0.48, blue: 0.10),
                        subtitle: "Miyazaki",                   stampSymbol: "\u{1F451}", artworkImageName: nil),
        StampDefinition(id: 282, name: "Udo Jingu",              icon: "water.waves",           color: Color(red: 0.15, green: 0.40, blue: 0.65),
                        subtitle: "Nichinan, Miyazaki",         stampSymbol: "\u{1F30A}", artworkImageName: nil),
        StampDefinition(id: 283, name: "Aoshima Jinja",          icon: "sun.max.fill",          color: Color(red: 0.80, green: 0.55, blue: 0.10),
                        subtitle: "Miyazaki",                   stampSymbol: "\u{1F334}", artworkImageName: nil),
        StampDefinition(id: 284, name: "Kirishima Jingu",        icon: "mountain.2.fill",       color: Color(red: 0.30, green: 0.50, blue: 0.35),
                        subtitle: "Kirishima, Kagoshima",       stampSymbol: "\u{1F30B}", artworkImageName: nil),
        StampDefinition(id: 285, name: "Terukuni Jinja",         icon: "building.columns.fill", color: Color(red: 0.60, green: 0.18, blue: 0.18),
                        subtitle: "Kagoshima",                  stampSymbol: "\u{26E9}", artworkImageName: nil),
        StampDefinition(id: 286, name: "Izumi Jinja",            icon: "leaf.fill",             color: Color(red: 0.22, green: 0.55, blue: 0.30),
                        subtitle: "Kumamoto",                   stampSymbol: "\u{1F343}", artworkImageName: nil),
        StampDefinition(id: 287, name: "Shikanoshima Jinja",     icon: "water.waves",           color: Color(red: 0.20, green: 0.42, blue: 0.58),
                        subtitle: "Fukuoka",                    stampSymbol: "\u{1F30A}", artworkImageName: nil),
        StampDefinition(id: 288, name: "Sumiyoshi Jinja Hakata", icon: "building.columns.fill", color: Color(red: 0.65, green: 0.20, blue: 0.20),
                        subtitle: "Hakata, Fukuoka",            stampSymbol: "\u{26E9}", artworkImageName: nil),
        StampDefinition(id: 289, name: "Kashii-gu",              icon: "tree.fill",             color: Color(red: 0.20, green: 0.50, blue: 0.28),
                        subtitle: "Fukuoka",                    stampSymbol: "\u{1F333}", artworkImageName: nil),
        StampDefinition(id: 290, name: "Komyozen-ji",            icon: "leaf.fill",             color: Color(red: 0.25, green: 0.55, blue: 0.30),
                        subtitle: "Dazaifu, Fukuoka",           stampSymbol: "\u{1F343}", artworkImageName: nil),
    ]
}
