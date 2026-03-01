import SwiftUI

struct StampDefinition: Identifiable, Hashable {
    let id: Int
    let name: String
    let icon: String
    let color: Color
    let subtitle: String
    let stampSymbol: String

    static let all: [StampDefinition] = [
        // Vermillion (Shrine Red)
        StampDefinition(id: 1,  name: "Meiji Jingu",       icon: "building.columns.fill", color: Color(red: 0.80, green: 0.15, blue: 0.15),
                        subtitle: "Shibuya, Yoyogi",     stampSymbol: "\u{26E9}"),
        StampDefinition(id: 2,  name: "Senso-ji",          icon: "flame.fill",            color: Color(red: 0.85, green: 0.20, blue: 0.10),
                        subtitle: "Taito, Asakusa",       stampSymbol: "\u{1F3EF}"),
        StampDefinition(id: 3,  name: "Yasukuni Jinja",    icon: "flag.fill",             color: Color(red: 0.75, green: 0.12, blue: 0.20),
                        subtitle: "Chiyoda, Kudan",       stampSymbol: "\u{26E9}"),

        // Matcha Green
        StampDefinition(id: 4,  name: "Kanda Myojin",      icon: "leaf.fill",             color: Color(red: 0.20, green: 0.55, blue: 0.30),
                        subtitle: "Chiyoda, Sotokanda",   stampSymbol: "\u{1F343}"),
        StampDefinition(id: 5,  name: "Hie Jinja",         icon: "tree.fill",             color: Color(red: 0.15, green: 0.50, blue: 0.25),
                        subtitle: "Chiyoda, Nagatacho",   stampSymbol: "\u{1F333}"),
        StampDefinition(id: 6,  name: "Nezu Jinja",        icon: "camera.macro",          color: Color(red: 0.30, green: 0.60, blue: 0.35),
                        subtitle: "Bunkyo, Nezu",         stampSymbol: "\u{1F338}"),

        // Indigo Blue
        StampDefinition(id: 7,  name: "Tokyo Daijingu",    icon: "moon.stars.fill",       color: Color(red: 0.15, green: 0.30, blue: 0.60),
                        subtitle: "Chiyoda, Fujimi",      stampSymbol: "\u{1F319}"),
        StampDefinition(id: 8,  name: "Yushima Tenmangu",  icon: "graduationcap.fill",    color: Color(red: 0.20, green: 0.35, blue: 0.65),
                        subtitle: "Bunkyo, Yushima",      stampSymbol: "\u{1F3D3}"),

        // Undiscovered slots
        StampDefinition(id: 9,  name: "???", icon: "questionmark", color: .gray, subtitle: "", stampSymbol: "\u{26E9}"),
        StampDefinition(id: 10, name: "???", icon: "questionmark", color: .gray, subtitle: "", stampSymbol: "\u{26E9}"),
        StampDefinition(id: 11, name: "???", icon: "questionmark", color: .gray, subtitle: "", stampSymbol: "\u{26E9}"),
        StampDefinition(id: 12, name: "???", icon: "questionmark", color: .gray, subtitle: "", stampSymbol: "\u{26E9}"),
        StampDefinition(id: 13, name: "???", icon: "questionmark", color: .gray, subtitle: "", stampSymbol: "\u{26E9}"),
        StampDefinition(id: 14, name: "???", icon: "questionmark", color: .gray, subtitle: "", stampSymbol: "\u{26E9}"),
        StampDefinition(id: 15, name: "???", icon: "questionmark", color: .gray, subtitle: "", stampSymbol: "\u{26E9}"),
    ]
}
