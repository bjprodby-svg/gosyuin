import SwiftUI

struct GuideArticle: Identifiable, Hashable {
    let id: String
    let title: String
    let subtitle: String
    let icon: String
    let color: Color

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    static func == (lhs: GuideArticle, rhs: GuideArticle) -> Bool {
        lhs.id == rhs.id
    }

    static let allArticles: [GuideArticle] = [
        GuideArticle(
            id: "sanpai",
            title: "Worship Etiquette",
            subtitle: "From torii gate to bow-clap-bow ritual",
            icon: "building.columns.fill",
            color: .vermillion
        ),
        GuideArticle(
            id: "temizu",
            title: "Temizu Purification",
            subtitle: "How to purify at the water pavilion",
            icon: "drop.fill",
            color: Color(red: 0.15, green: 0.30, blue: 0.60)
        ),
        GuideArticle(
            id: "omikuji",
            title: "Omikuji Fortune",
            subtitle: "Drawing and reading sacred fortunes",
            icon: "sparkles",
            color: Color(red: 0.60, green: 0.40, blue: 0.15)
        ),
        GuideArticle(
            id: "gosyuin",
            title: "Gosyuin Stamps",
            subtitle: "How to receive shrine stamps",
            icon: "book.closed.fill",
            color: Color(red: 0.20, green: 0.55, blue: 0.30)
        ),
    ]
}
