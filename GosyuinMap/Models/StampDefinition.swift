import SwiftUI

struct StampDefinition: Identifiable, Hashable {
    let id: Int
    let name: String
    let icon: String
    let color: Color
    let subtitle: String        // 神社の別名・所在地
    let stampSymbol: String     // スタンプ中央のシンボル（emoji）

    static let all: [StampDefinition] = [
        // 朱色系 (Vermillion / Shrine Red)
        StampDefinition(id: 1,  name: "明治神宮",   icon: "building.columns.fill", color: Color(red: 0.80, green: 0.15, blue: 0.15),
                        subtitle: "渋谷区代々木", stampSymbol: "\u{26E9}"),
        StampDefinition(id: 2,  name: "浅草寺",     icon: "flame.fill",            color: Color(red: 0.85, green: 0.20, blue: 0.10),
                        subtitle: "台東区浅草",   stampSymbol: "\u{1F3EF}"),
        StampDefinition(id: 3,  name: "靖国神社",   icon: "flag.fill",             color: Color(red: 0.75, green: 0.12, blue: 0.20),
                        subtitle: "千代田区九段",  stampSymbol: "\u{26E9}"),

        // 翠系 (Matcha Green)
        StampDefinition(id: 4,  name: "神田明神",   icon: "leaf.fill",             color: Color(red: 0.20, green: 0.55, blue: 0.30),
                        subtitle: "千代田区外神田", stampSymbol: "\u{1F343}"),
        StampDefinition(id: 5,  name: "日枝神社",   icon: "tree.fill",             color: Color(red: 0.15, green: 0.50, blue: 0.25),
                        subtitle: "千代田区永田町", stampSymbol: "\u{1F333}"),
        StampDefinition(id: 6,  name: "根津神社",   icon: "camera.macro",          color: Color(red: 0.30, green: 0.60, blue: 0.35),
                        subtitle: "文京区根津",   stampSymbol: "\u{1F338}"),

        // 藍色系 (Indigo Blue)
        StampDefinition(id: 7,  name: "東京大神宮", icon: "moon.stars.fill",       color: Color(red: 0.15, green: 0.30, blue: 0.60),
                        subtitle: "千代田区富士見", stampSymbol: "\u{1F319}"),
        StampDefinition(id: 8,  name: "湯島天満宮", icon: "graduationcap.fill",    color: Color(red: 0.20, green: 0.35, blue: 0.65),
                        subtitle: "文京区湯島",   stampSymbol: "\u{1F3D3}"),

        // 未収集スロット
        StampDefinition(id: 9,  name: "???", icon: "questionmark", color: .gray, subtitle: "", stampSymbol: "\u{26E9}"),
        StampDefinition(id: 10, name: "???", icon: "questionmark", color: .gray, subtitle: "", stampSymbol: "\u{26E9}"),
        StampDefinition(id: 11, name: "???", icon: "questionmark", color: .gray, subtitle: "", stampSymbol: "\u{26E9}"),
        StampDefinition(id: 12, name: "???", icon: "questionmark", color: .gray, subtitle: "", stampSymbol: "\u{26E9}"),
        StampDefinition(id: 13, name: "???", icon: "questionmark", color: .gray, subtitle: "", stampSymbol: "\u{26E9}"),
        StampDefinition(id: 14, name: "???", icon: "questionmark", color: .gray, subtitle: "", stampSymbol: "\u{26E9}"),
        StampDefinition(id: 15, name: "???", icon: "questionmark", color: .gray, subtitle: "", stampSymbol: "\u{26E9}"),
    ]
}
