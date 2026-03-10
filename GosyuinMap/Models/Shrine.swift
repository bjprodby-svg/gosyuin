import SwiftUI
import CoreLocation

// MARK: - Shrine Category

enum ShrineCategory: String, CaseIterable {
    case jinja, tera, jingu, taisha, tenmangu, inari, hachimangu, daishi

    var displayName: String {
        switch self {
        case .jinja: "Shrine"
        case .tera: "Temple"
        case .jingu: "Grand Shrine"
        case .taisha: "Taisha"
        case .tenmangu: "Tenmangu"
        case .inari: "Inari Shrine"
        case .hachimangu: "Hachimangu"
        case .daishi: "Daishi"
        }
    }

    var icon: String {
        switch self {
        case .jinja: "building.columns"
        case .tera: "house.lodge"
        case .jingu: "crown"
        case .taisha: "mountain.2"
        case .tenmangu: "graduationcap"
        case .inari: "flame"
        case .hachimangu: "shield.fill"
        case .daishi: "flame.fill"
        }
    }

    /// Custom category icon asset name
    var iconAsset: String {
        switch self {
        case .jinja: "icon_jinja"
        case .tera: "icon_tera"
        case .jingu: "icon_jingu"
        case .taisha: "icon_taisha"
        case .tenmangu: "icon_tenmangu"
        case .inari: "icon_inari"
        case .hachimangu: "icon_hachimangu"
        case .daishi: "icon_daishi"
        }
    }

    var color: Color {
        switch self {
        case .jinja: .vermillion
        case .tera: .indigo
        case .jingu: .kincha
        case .taisha: .matcha
        case .tenmangu: Color(red: 0.55, green: 0.25, blue: 0.52)
        case .inari: .vermillion
        case .hachimangu: Color(red: 0.60, green: 0.12, blue: 0.15)
        case .daishi: Color(red: 0.80, green: 0.45, blue: 0.10)
        }
    }
}

// MARK: - Shrine

struct Shrine: Identifiable, Hashable {
    let id: UUID
    let name: String
    let address: String
    let description: String
    let coordinate: CLLocationCoordinate2D
    let stampSlotId: Int
    let category: ShrineCategory
    let tagline: String
    let highlights: [String]
    let mustSee: String
    let tips: [String]
    let bestSeason: String
    let access: String
    let hours: String
    var imageURLs: [String]

    init(id: UUID = UUID(), name: String, address: String, description: String,
         coordinate: CLLocationCoordinate2D, stampSlotId: Int,
         category: ShrineCategory = .jinja, tagline: String = "",
         highlights: [String] = [], mustSee: String = "",
         tips: [String] = [], bestSeason: String = "Year-round",
         access: String = "", hours: String = "",
         imageURLs: [String] = []) {
        self.id = id
        self.name = name
        self.address = address
        self.description = description
        self.coordinate = coordinate
        self.stampSlotId = stampSlotId
        self.category = category
        self.tagline = tagline
        self.highlights = highlights
        self.mustSee = mustSee
        self.tips = tips
        self.bestSeason = bestSeason
        self.access = access
        self.hours = hours
        self.imageURLs = imageURLs
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    static func == (lhs: Shrine, rhs: Shrine) -> Bool {
        lhs.id == rhs.id
    }

    // MARK: - Sample Data (combined from regional files)

    static let samples: [Shrine] = {
        let all = tokyoShrines + kanagawaShrines + chibaShrines + kansaiShrines + otherShrines + chubuShrines + eastJapanShrines + westJapanShrines + famousShrines
        // Load image URLs from bundled JSON
        guard let url = Bundle.main.url(forResource: "shrine_images", withExtension: "json"),
              let data = try? Data(contentsOf: url),
              let map = try? JSONSerialization.jsonObject(with: data) as? [String: [String]] else {
            return all
        }
        return all.map { shrine in
            if let urls = map[shrine.name], !urls.isEmpty, shrine.imageURLs.isEmpty {
                var s = shrine
                s.imageURLs = urls
                return s
            }
            return shrine
        }
    }()
}

extension Shrine {
    /// Mutable copy support for image URL injection
    init(copying other: Shrine, imageURLs: [String]) {
        self.id = other.id
        self.name = other.name
        self.address = other.address
        self.description = other.description
        self.coordinate = other.coordinate
        self.stampSlotId = other.stampSlotId
        self.category = other.category
        self.tagline = other.tagline
        self.highlights = other.highlights
        self.mustSee = other.mustSee
        self.tips = other.tips
        self.bestSeason = other.bestSeason
        self.access = other.access
        self.hours = other.hours
        self.imageURLs = imageURLs
    }
}
