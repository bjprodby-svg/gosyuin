import SwiftUI

// MARK: - Collector Level (12 tiers, front-loaded for early engagement)

enum CollectorLevel: Int, CaseIterable {
    case hatsumairi = 1  // 初参 — the very first visit
    case mairi           // 参り — the first prayer
    case meguri          // 巡り — beginning to explore
    case henro           // 遍路 — the pilgrimage begins
    case tabibito        // 旅人 — the traveler
    case yamabushi       // 山伏 — the mountain sage
    case sendatsu        // 先達 — the one who leads
    case gyoja           // 行者 — walking devotion
    case nushi           // 主 — the keeper
    case daigongen       // 大権現 — great incarnation
    case myojin          // 明神 — the divine light
    case shinshi         // 神使 — divine messenger

    var title: String {
        switch self {
        case .hatsumairi: "Hatsumairi"
        case .mairi: "Mairi"
        case .meguri: "Meguri"
        case .henro: "Henro"
        case .tabibito: "Tabibito"
        case .yamabushi: "Yamabushi"
        case .sendatsu: "Sendatsu"
        case .gyoja: "Gyōja"
        case .nushi: "Nushi"
        case .daigongen: "Daigongen"
        case .myojin: "Myōjin"
        case .shinshi: "Shinshi"
        }
    }

    var subtitle: String {
        switch self {
        case .hatsumairi: "The First Visit"
        case .mairi: "A Prayer Offered"
        case .meguri: "The Path Unfolds"
        case .henro: "The Pilgrimage Begins"
        case .tabibito: "Ever Wandering"
        case .yamabushi: "Into the Mountains"
        case .sendatsu: "Leading the Way"
        case .gyoja: "Walking Prayer"
        case .nushi: "The Keeper"
        case .daigongen: "Great Incarnation"
        case .myojin: "Divine Light"
        case .shinshi: "Divine Messenger"
        }
    }

    var kanji: String {
        switch self {
        case .hatsumairi: "初参"
        case .mairi: "参り"
        case .meguri: "巡り"
        case .henro: "遍路"
        case .tabibito: "旅人"
        case .yamabushi: "山伏"
        case .sendatsu: "先達"
        case .gyoja: "行者"
        case .nushi: "主"
        case .daigongen: "大権現"
        case .myojin: "明神"
        case .shinshi: "神使"
        }
    }

    var icon: String {
        switch self {
        case .hatsumairi: "sunrise"
        case .mairi: "leaf"
        case .meguri: "figure.walk"
        case .henro: "road.lanes"
        case .tabibito: "map.fill"
        case .yamabushi: "mountain.2.fill"
        case .sendatsu: "signpost.right.fill"
        case .gyoja: "figure.mind.and.body"
        case .nushi: "seal.fill"
        case .daigongen: "crown.fill"
        case .myojin: "sparkles"
        case .shinshi: "bird.fill"
        }
    }

    /// Asset name in `Assets.xcassets/Avatars/` (without extension).
    /// Wave 2D: ChatGPT-generated illustrative avatars (sunrise → crane).
    var avatarAssetName: String {
        switch self {
        case .hatsumairi: "avatar_lv01_sunrise"
        case .mairi:      "avatar_lv02_leaf"
        case .meguri:     "avatar_lv03_footprints"
        case .henro:      "avatar_lv04_torii"
        case .tabibito:   "avatar_lv05_compass"
        case .yamabushi:  "avatar_lv06_mountain"
        case .sendatsu:   "avatar_lv07_lantern"
        case .gyoja:      "avatar_lv08_bell"
        case .nushi:      "avatar_lv09_seal"
        case .daigongen:  "avatar_lv10_crown"
        case .myojin:     "avatar_lv11_sunburst"
        case .shinshi:    "avatar_lv12_crane"
        }
    }

    var color: Color {
        switch self {
        case .hatsumairi: Color(red: 0.60, green: 0.58, blue: 0.55)
        case .mairi: Color(red: 0.55, green: 0.55, blue: 0.52)
        case .meguri: Color(red: 0.40, green: 0.60, blue: 0.40)
        case .henro: Color(red: 0.35, green: 0.55, blue: 0.65)
        case .tabibito: Color(red: 0.30, green: 0.55, blue: 0.75)
        case .yamabushi: Color(red: 0.55, green: 0.40, blue: 0.65)
        case .sendatsu: Color(red: 0.75, green: 0.35, blue: 0.35)
        case .gyoja: Color(red: 0.80, green: 0.55, blue: 0.20)
        case .nushi: Color(red: 0.82, green: 0.65, blue: 0.15)
        case .daigongen: Color(red: 0.70, green: 0.48, blue: 0.12)
        case .myojin: Color(red: 0.80, green: 0.18, blue: 0.18)
        case .shinshi: Color(red: 0.75, green: 0.60, blue: 0.10)
        }
    }

    var threshold: Int {
        switch self {
        case .hatsumairi: 0
        case .mairi: 1
        case .meguri: 3
        case .henro: 7
        case .tabibito: 15
        case .yamabushi: 30
        case .sendatsu: 50
        case .gyoja: 80
        case .nushi: 120
        case .daigongen: 180
        case .myojin: 250
        case .shinshi: 380
        }
    }

    var next: CollectorLevel? {
        CollectorLevel(rawValue: rawValue + 1)
    }

    func stampsToNext(current: Int) -> Int? {
        guard let next else { return nil }
        return max(0, next.threshold - current)
    }

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
        return .hatsumairi
    }
}

// MARK: - Achievement (3 categories, tiered progression)

struct Achievement: Identifiable, Sendable {
    let id: String
    let title: String
    let description: String
    let icon: String
    let color: Color
    let category: AchievementCategory
    /// For tiered badges: how far along the user is (e.g., 3/5)
    let progressLabel: (@Sendable (Set<Int>, [Shrine]) -> String)?
    let requirement: @Sendable (Set<Int>, [Shrine]) -> Bool

    init(id: String, title: String, description: String, icon: String,
         color: Color, category: AchievementCategory = .milestone,
         progressLabel: (@Sendable (Set<Int>, [Shrine]) -> String)? = nil,
         requirement: @escaping @Sendable (Set<Int>, [Shrine]) -> Bool) {
        self.id = id
        self.title = title
        self.description = description
        self.icon = icon
        self.color = color
        self.category = category
        self.progressLabel = progressLabel
        self.requirement = requirement
    }

    nonisolated static let all: [Achievement] = milestone + categoryBadges + exploration

    // MARK: - Milestone (stamp count)

    nonisolated static let milestone: [Achievement] = [
        Achievement(
            id: "hatsumoude",
            title: "Hatsumoude",
            description: "Collect your first stamp",
            icon: "sunrise.fill",
            color: .matcha,
            category: .milestone,
            progressLabel: { ids, _ in "\(min(ids.count, 1))/1" }
        ) { ids, _ in ids.count >= 1 },

        Achievement(
            id: "gosha",
            title: "Gosha Mairi",
            description: "Collect 5 stamps",
            icon: "5.circle.fill",
            color: Color(red: 0.40, green: 0.60, blue: 0.40),
            category: .milestone,
            progressLabel: { ids, _ in "\(min(ids.count, 5))/5" }
        ) { ids, _ in ids.count >= 5 },

        Achievement(
            id: "jusha",
            title: "Jusha Meguri",
            description: "Collect 10 stamps",
            icon: "10.circle.fill",
            color: Color(red: 0.30, green: 0.55, blue: 0.75),
            category: .milestone,
            progressLabel: { ids, _ in "\(min(ids.count, 10))/10" }
        ) { ids, _ in ids.count >= 10 },

        Achievement(
            id: "nijugosha",
            title: "Silver Pilgrim",
            description: "Collect 25 stamps",
            icon: "seal.fill",
            color: Color(red: 0.60, green: 0.60, blue: 0.65),
            category: .milestone,
            progressLabel: { ids, _ in "\(min(ids.count, 25))/25" }
        ) { ids, _ in ids.count >= 25 },

        Achievement(
            id: "gojusha",
            title: "Gold Pilgrim",
            description: "Collect 50 stamps",
            icon: "star.circle.fill",
            color: Color(red: 0.85, green: 0.55, blue: 0.15),
            category: .milestone,
            progressLabel: { ids, _ in "\(min(ids.count, 50))/50" }
        ) { ids, _ in ids.count >= 50 },

        Achievement(
            id: "hyakusha",
            title: "Hyakusha Mairi",
            description: "Collect 100 stamps",
            icon: "trophy.circle.fill",
            color: Color(red: 0.85, green: 0.65, blue: 0.10),
            category: .milestone,
            progressLabel: { ids, _ in "\(min(ids.count, 100))/100" }
        ) { ids, _ in ids.count >= 100 },

        Achievement(
            id: "nihyakusha",
            title: "Grand Pilgrim",
            description: "Collect 200 stamps",
            icon: "crown.fill",
            color: Color(red: 0.70, green: 0.48, blue: 0.12),
            category: .milestone,
            progressLabel: { ids, _ in "\(min(ids.count, 200))/200" }
        ) { ids, _ in ids.count >= 200 },

        Achievement(
            id: "zensha",
            title: "Zensha Seiha",
            description: "Collect every stamp",
            icon: "sparkles",
            color: Color(red: 0.80, green: 0.18, blue: 0.18),
            category: .milestone,
            progressLabel: { ids, shrines in "\(ids.count)/\(shrines.count)" }
        ) { ids, shrines in ids.count >= shrines.count },
    ]

    // MARK: - Category Badges (tiered: first visit, 5, all)

    nonisolated static let categoryBadges: [Achievement] = {
        let configs: [(ShrineCategory, String, Color)] = [
            (.jinja, "building.columns.fill", .vermillion),
            (.tera, "house.lodge.fill", .indigo),
            (.jingu, "crown", .kincha),
            (.taisha, "mountain.2", .matcha),
            (.tenmangu, "graduationcap.fill", Color(red: 0.55, green: 0.25, blue: 0.52)),
            (.inari, "flame.fill", Color(red: 0.85, green: 0.25, blue: 0.10)),
            (.hachimangu, "shield.fill", Color(red: 0.60, green: 0.12, blue: 0.15)),
            (.daishi, "flame", Color(red: 0.80, green: 0.45, blue: 0.10)),
        ]

        return configs.flatMap { cat, icon, color in
            let name = cat.displayName
            return [
                // Tier 1: First visit
                Achievement(
                    id: "\(cat.rawValue)_1",
                    title: "\(name) Initiate",
                    description: "Visit your first \(name)",
                    icon: icon,
                    color: color.opacity(0.7),
                    category: .category,
                    progressLabel: { ids, shrines in
                        let c = categoryCount(ids: ids, shrines: shrines, category: cat)
                        return "\(min(c, 1))/1"
                    }
                ) { ids, shrines in
                    categoryCount(ids: ids, shrines: shrines, category: cat) >= 1
                },
                // Tier 2: 5 visits
                Achievement(
                    id: "\(cat.rawValue)_5",
                    title: "\(name) Regular",
                    description: "Collect 5 \(name) stamps",
                    icon: icon,
                    color: color,
                    category: .category,
                    progressLabel: { ids, shrines in
                        let c = categoryCount(ids: ids, shrines: shrines, category: cat)
                        return "\(min(c, 5))/5"
                    }
                ) { ids, shrines in
                    categoryCount(ids: ids, shrines: shrines, category: cat) >= 5
                },
                // Tier 3: Master (all in category)
                Achievement(
                    id: "\(cat.rawValue)_all",
                    title: "\(name) Master",
                    description: "Collect every \(name) stamp",
                    icon: icon,
                    color: color,
                    category: .category,
                    progressLabel: { ids, shrines in
                        let c = categoryCount(ids: ids, shrines: shrines, category: cat)
                        let total = shrines.filter { $0.category == cat }.count
                        return "\(c)/\(total)"
                    }
                ) { ids, shrines in
                    let total = shrines.filter { $0.category == cat }.count
                    return total > 0 && categoryCount(ids: ids, shrines: shrines, category: cat) >= total
                },
            ]
        }
    }()

    // MARK: - Exploration Badges

    nonisolated static let exploration: [Achievement] = [
        Achievement(
            id: "first_journey",
            title: "First Journey",
            description: "Visit shrines in 2 different regions",
            icon: "arrow.triangle.branch",
            color: Color(red: 0.35, green: 0.55, blue: 0.65),
            category: .exploration,
            progressLabel: { ids, shrines in
                let r = regionSet(ids: ids, shrines: shrines)
                return "\(min(r.count, 2))/2"
            }
        ) { ids, shrines in
            regionSet(ids: ids, shrines: shrines).count >= 2
        },

        Achievement(
            id: "east_west",
            title: "East Meets West",
            description: "Visit shrines in both Kanto and Kansai",
            icon: "arrow.left.arrow.right",
            color: Color(red: 0.55, green: 0.40, blue: 0.65),
            category: .exploration
        ) { ids, shrines in
            let kanto = regionCount(ids: ids, shrines: shrines, keyword: "Tokyo")
                + regionCount(ids: ids, shrines: shrines, keyword: "Kanagawa")
                + regionCount(ids: ids, shrines: shrines, keyword: "Chiba")
                + regionCount(ids: ids, shrines: shrines, keyword: "Saitama")
            let kansai = regionCount(ids: ids, shrines: shrines, keyword: "Kyoto")
                + regionCount(ids: ids, shrines: shrines, keyword: "Osaka")
                + regionCount(ids: ids, shrines: shrines, keyword: "Nara")
                + regionCount(ids: ids, shrines: shrines, keyword: "Hyogo")
            return kanto >= 1 && kansai >= 1
        },

        Achievement(
            id: "variety_5",
            title: "Variety Seeker",
            description: "Collect from 5 different categories",
            icon: "square.grid.3x3.fill",
            color: Color(red: 0.55, green: 0.40, blue: 0.70),
            category: .exploration,
            progressLabel: { ids, shrines in
                let c = Set(shrines.filter { ids.contains($0.stampSlotId) }.map(\.category)).count
                return "\(min(c, 5))/5"
            }
        ) { ids, shrines in
            let categories = Set(shrines.filter { ids.contains($0.stampSlotId) }.map(\.category))
            return categories.count >= 5
        },

        Achievement(
            id: "all_categories",
            title: "Complete Explorer",
            description: "Collect from every category",
            icon: "checkmark.shield.fill",
            color: .kincha,
            category: .exploration,
            progressLabel: { ids, shrines in
                let c = Set(shrines.filter { ids.contains($0.stampSlotId) }.map(\.category)).count
                return "\(c)/\(ShrineCategory.allCases.count)"
            }
        ) { ids, shrines in
            let categories = Set(shrines.filter { ids.contains($0.stampSlotId) }.map(\.category))
            return categories.count == ShrineCategory.allCases.count
        },

        Achievement(
            id: "tokyo_10",
            title: "Tokyo Explorer",
            description: "Collect 10 stamps in Tokyo",
            icon: "building.2.fill",
            color: Color(red: 0.20, green: 0.45, blue: 0.75),
            category: .exploration,
            progressLabel: { ids, shrines in
                let c = regionCount(ids: ids, shrines: shrines, keyword: "Tokyo")
                return "\(min(c, 10))/10"
            }
        ) { ids, shrines in
            regionCount(ids: ids, shrines: shrines, keyword: "Tokyo") >= 10
        },

        Achievement(
            id: "kansai_10",
            title: "Kansai Wanderer",
            description: "Collect 10 stamps in Kansai",
            icon: "mountain.2.fill",
            color: .matcha,
            category: .exploration,
            progressLabel: { ids, shrines in
                let c = regionCount(ids: ids, shrines: shrines, keyword: "Kyoto")
                    + regionCount(ids: ids, shrines: shrines, keyword: "Osaka")
                    + regionCount(ids: ids, shrines: shrines, keyword: "Nara")
                return "\(min(c, 10))/10"
            }
        ) { ids, shrines in
            regionCount(ids: ids, shrines: shrines, keyword: "Kyoto") +
            regionCount(ids: ids, shrines: shrines, keyword: "Osaka") +
            regionCount(ids: ids, shrines: shrines, keyword: "Nara") >= 10
        },
    ]

    // MARK: - Helpers

    static func categoryCount(ids: Set<Int>, shrines: [Shrine], category: ShrineCategory) -> Int {
        shrines.filter { ids.contains($0.stampSlotId) && $0.category == category }.count
    }

    static func regionCount(ids: Set<Int>, shrines: [Shrine], keyword: String) -> Int {
        shrines.filter { ids.contains($0.stampSlotId) && $0.address.contains(keyword) }.count
    }

    static func regionSet(ids: Set<Int>, shrines: [Shrine]) -> Set<String> {
        let keywords = ["Tokyo", "Kanagawa", "Chiba", "Saitama",
                        "Kyoto", "Osaka", "Nara", "Hyogo",
                        "Aichi", "Shizuoka", "Mie", "Hiroshima",
                        "Fukuoka", "Nagano", "Tochigi", "Ibaraki"]
        var regions = Set<String>()
        let collected = shrines.filter { ids.contains($0.stampSlotId) }
        for keyword in keywords {
            if collected.contains(where: { $0.address.contains(keyword) }) {
                regions.insert(keyword)
            }
        }
        return regions
    }
}

// MARK: - Achievement Category

enum AchievementCategory: String, CaseIterable {
    case milestone
    case category
    case exploration

    var displayName: String {
        switch self {
        case .milestone: "Pilgrim Milestones"
        case .category: "Category Mastery"
        case .exploration: "Explorer Badges"
        }
    }

    var icon: String {
        switch self {
        case .milestone: "flag.fill"
        case .category: "square.grid.2x2.fill"
        case .exploration: "map.fill"
        }
    }
}
