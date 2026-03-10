import SwiftUI

// MARK: - Collector Level

enum CollectorLevel: Int, CaseIterable {
    case mairi = 1       // 参り — the first prayer
    case henro           // 遍路 — the pilgrimage begins (Shikoku reference)
    case tabibito        // 旅人 — the traveler
    case yamabushi       // 山伏 — the mountain sage
    case sendatsu        // 先達 — the one who leads
    case gyoja           // 行者 — the walking devotion
    case nushi           // 主 — the keeper
    case daigongen       // 大権現 — great incarnation
    case myojin          // 明神 — the divine light

    /// Title (romanized Japanese)
    var title: String {
        switch self {
        case .mairi: "Mairi"
        case .henro: "Henro"
        case .tabibito: "Tabibito"
        case .yamabushi: "Yamabushi"
        case .sendatsu: "Sendatsu"
        case .gyoja: "Gyōja"
        case .nushi: "Nushi"
        case .daigongen: "Daigongen"
        case .myojin: "Myōjin"
        }
    }

    /// Evocative English subtitle
    var subtitle: String {
        switch self {
        case .mairi: "The Beginning"
        case .henro: "The Path Opens"
        case .tabibito: "Ever Wandering"
        case .yamabushi: "Into the Mountains"
        case .sendatsu: "Leading the Way"
        case .gyoja: "Walking Prayer"
        case .nushi: "The Keeper"
        case .daigongen: "Great Incarnation"
        case .myojin: "Divine Light"
        }
    }

    /// Kanji
    var kanji: String {
        switch self {
        case .mairi: "参り"
        case .henro: "遍路"
        case .tabibito: "旅人"
        case .yamabushi: "山伏"
        case .sendatsu: "先達"
        case .gyoja: "行者"
        case .nushi: "主"
        case .daigongen: "大権現"
        case .myojin: "明神"
        }
    }

    var icon: String {
        switch self {
        case .mairi: "leaf"
        case .henro: "figure.walk"
        case .tabibito: "map.fill"
        case .yamabushi: "mountain.2.fill"
        case .sendatsu: "signpost.right.fill"
        case .gyoja: "figure.mind.and.body"
        case .nushi: "seal.fill"
        case .daigongen: "crown.fill"
        case .myojin: "sparkles"
        }
    }

    var color: Color {
        switch self {
        case .mairi: Color(red: 0.55, green: 0.55, blue: 0.52)
        case .henro: Color(red: 0.40, green: 0.60, blue: 0.40)
        case .tabibito: Color(red: 0.30, green: 0.55, blue: 0.75)
        case .yamabushi: Color(red: 0.55, green: 0.40, blue: 0.65)
        case .sendatsu: Color(red: 0.75, green: 0.35, blue: 0.35)
        case .gyoja: Color(red: 0.80, green: 0.55, blue: 0.20)
        case .nushi: Color(red: 0.82, green: 0.65, blue: 0.15)
        case .daigongen: Color(red: 0.70, green: 0.48, blue: 0.12)
        case .myojin: Color(red: 0.80, green: 0.18, blue: 0.18)
        }
    }

    var threshold: Int {
        switch self {
        case .mairi: 0
        case .henro: 5
        case .tabibito: 15
        case .yamabushi: 30
        case .sendatsu: 50
        case .gyoja: 80
        case .nushi: 120
        case .daigongen: 180
        case .myojin: 250
        }
    }

    /// Next level (nil if max)
    var next: CollectorLevel? {
        CollectorLevel(rawValue: rawValue + 1)
    }

    /// Stamps needed to reach next level
    func stampsToNext(current: Int) -> Int? {
        guard let next else { return nil }
        return max(0, next.threshold - current)
    }

    /// Progress to next level (0...1)
    func progressToNext(current: Int) -> Double {
        guard let next else { return 1.0 }
        let range = Double(next.threshold - threshold)
        let progress = Double(current - threshold)
        return min(1.0, max(0, progress / range))
    }

    static func level(for count: Int) -> CollectorLevel {
        for level in allCases.reversed() {
            if count >= level.threshold { return level }
        }
        return .mairi
    }
}

// MARK: - Achievement

struct Achievement: Identifiable, Sendable {
    let id: String
    let title: String
    let description: String
    let icon: String
    let color: Color
    let requirement: @Sendable (Set<Int>, [Shrine]) -> Bool

    nonisolated static let all: [Achievement] = [
        // Milestone achievements
        Achievement(
            id: "first_stamp",
            title: "First Steps",
            description: "Collect your first stamp",
            icon: "1.circle.fill",
            color: .matcha
        ) { ids, _ in ids.count >= 1 },

        Achievement(
            id: "ten_stamps",
            title: "Getting Started",
            description: "Collect 10 stamps",
            icon: "10.circle.fill",
            color: Color(red: 0.30, green: 0.55, blue: 0.75)
        ) { ids, _ in ids.count >= 10 },

        Achievement(
            id: "fifty_stamps",
            title: "Halfway There",
            description: "Collect 50 stamps",
            icon: "star.circle.fill",
            color: Color(red: 0.85, green: 0.55, blue: 0.15)
        ) { ids, _ in ids.count >= 50 },

        Achievement(
            id: "hundred_stamps",
            title: "Century Club",
            description: "Collect 100 stamps",
            icon: "trophy.circle.fill",
            color: Color(red: 0.85, green: 0.65, blue: 0.10)
        ) { ids, _ in ids.count >= 100 },

        // Category achievements
        Achievement(
            id: "shrine_5",
            title: "Shrine Visitor",
            description: "Collect 5 Shrine stamps",
            icon: "building.columns.fill",
            color: .vermillion
        ) { ids, shrines in
            categoryCount(ids: ids, shrines: shrines, category: .jinja) >= 5
        },

        Achievement(
            id: "temple_5",
            title: "Temple Seeker",
            description: "Collect 5 Temple stamps",
            icon: "house.lodge.fill",
            color: .indigo
        ) { ids, shrines in
            categoryCount(ids: ids, shrines: shrines, category: .tera) >= 5
        },

        Achievement(
            id: "inari_3",
            title: "Fox Friend",
            description: "Collect 3 Inari Shrine stamps",
            icon: "flame",
            color: Color(red: 0.85, green: 0.25, blue: 0.10)
        ) { ids, shrines in
            categoryCount(ids: ids, shrines: shrines, category: .inari) >= 3
        },

        Achievement(
            id: "variety_5",
            title: "Variety Seeker",
            description: "Collect stamps from 5 different categories",
            icon: "square.grid.3x3.fill",
            color: Color(red: 0.55, green: 0.40, blue: 0.70)
        ) { ids, shrines in
            let categories = Set(shrines.filter { ids.contains($0.stampSlotId) }.map(\.category))
            return categories.count >= 5
        },

        Achievement(
            id: "all_categories",
            title: "Complete Explorer",
            description: "Collect from every category",
            icon: "checkmark.shield.fill",
            color: .kincha
        ) { ids, shrines in
            let categories = Set(shrines.filter { ids.contains($0.stampSlotId) }.map(\.category))
            return categories.count == ShrineCategory.allCases.count
        },

        // Region achievements
        Achievement(
            id: "tokyo_10",
            title: "Tokyo Explorer",
            description: "Collect 10 stamps in Tokyo area",
            icon: "building.2.fill",
            color: Color(red: 0.20, green: 0.45, blue: 0.75)
        ) { ids, shrines in
            regionCount(ids: ids, shrines: shrines, keyword: "Tokyo") >= 10
        },

        Achievement(
            id: "kansai_10",
            title: "Kansai Wanderer",
            description: "Collect 10 stamps in Kansai area",
            icon: "mountain.2.fill",
            color: .matcha
        ) { ids, shrines in
            regionCount(ids: ids, shrines: shrines, keyword: "Kyoto") +
            regionCount(ids: ids, shrines: shrines, keyword: "Osaka") +
            regionCount(ids: ids, shrines: shrines, keyword: "Nara") >= 10
        },
    ]

    static func categoryCount(ids: Set<Int>, shrines: [Shrine], category: ShrineCategory) -> Int {
        shrines.filter { ids.contains($0.stampSlotId) && $0.category == category }.count
    }

    static func regionCount(ids: Set<Int>, shrines: [Shrine], keyword: String) -> Int {
        shrines.filter { ids.contains($0.stampSlotId) && $0.address.contains(keyword) }.count
    }
}
