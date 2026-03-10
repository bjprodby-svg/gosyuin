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
            id: "types",
            title: "Shrine & Temple Types",
            subtitle: "Jinja, Tera, Jingu, Taisha and more — know the difference",
            icon: "rectangle.grid.2x2.fill",
            color: Color(red: 0.55, green: 0.25, blue: 0.52)
        ),
        GuideArticle(
            id: "sanpai",
            title: "Shrine Worship",
            subtitle: "Nirei Nihakushu Ichirei — the proper prayer ritual",
            icon: "building.columns.fill",
            color: .vermillion
        ),
        GuideArticle(
            id: "temple",
            title: "Temple Worship",
            subtitle: "How temple etiquette differs from shrines",
            icon: "house.lodge.fill",
            color: .indigo
        ),
        GuideArticle(
            id: "temizu",
            title: "Temizu Purification",
            subtitle: "The 7-step water purification ritual at the temizuya",
            icon: "drop.fill",
            color: Color(red: 0.15, green: 0.30, blue: 0.60)
        ),
        GuideArticle(
            id: "gosyuin",
            title: "Gosyuin Stamps",
            subtitle: "How to properly request and care for shrine stamps",
            icon: "book.closed.fill",
            color: Color(red: 0.20, green: 0.55, blue: 0.30)
        ),
        GuideArticle(
            id: "omikuji",
            title: "Omikuji Fortune",
            subtitle: "Drawing and reading sacred fortunes",
            icon: "sparkles",
            color: Color(red: 0.60, green: 0.40, blue: 0.15)
        ),
        GuideArticle(
            id: "manners",
            title: "General Manners",
            subtitle: "Dress code, photography, and common mistakes",
            icon: "hand.raised.fill",
            color: Color(red: 0.30, green: 0.55, blue: 0.75)
        ),
    ]
}
