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

    /// Japanese search terms for this category
    var japaneseQuery: String {
        switch self {
        case .jinja: "神社"
        case .tera: "寺 お寺 temple"
        case .jingu: "神宮"
        case .taisha: "大社"
        case .tenmangu: "天満宮 天神"
        case .inari: "稲荷"
        case .hachimangu: "八幡宮 八幡"
        case .daishi: "大師"
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

    // Google Places fields
    let placeId: String?
    let rating: Double?
    let userRatingCount: Int?
    let openNow: Bool?
    let weekdayHours: [String]?
    let reviews: [PlaceReview]?
    let photoReferences: [String]

    init(id: UUID = UUID(), name: String, address: String, description: String,
         coordinate: CLLocationCoordinate2D, stampSlotId: Int,
         category: ShrineCategory = .jinja, tagline: String = "",
         highlights: [String] = [], mustSee: String = "",
         tips: [String] = [], bestSeason: String = "Year-round",
         access: String = "", hours: String = "",
         imageURLs: [String] = [],
         placeId: String? = nil, rating: Double? = nil,
         userRatingCount: Int? = nil, openNow: Bool? = nil,
         weekdayHours: [String]? = nil, reviews: [PlaceReview]? = nil,
         photoReferences: [String] = []) {
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
        self.placeId = placeId
        self.rating = rating
        self.userRatingCount = userRatingCount
        self.openNow = openNow
        self.weekdayHours = weekdayHours
        self.reviews = reviews
        self.photoReferences = photoReferences
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
        self.placeId = other.placeId
        self.rating = other.rating
        self.userRatingCount = other.userRatingCount
        self.openNow = other.openNow
        self.weekdayHours = other.weekdayHours
        self.reviews = other.reviews
        self.photoReferences = other.photoReferences
    }

    /// Initialize from a Google Places API response
    init(from place: GooglePlaceResponse, placesService: GooglePlacesService) {
        self.id = UUID()
        self.name = place.displayName?.text ?? ""
        self.address = place.formattedAddress ?? ""
        self.description = place.editorialSummary?.text ?? ""
        self.coordinate = CLLocationCoordinate2D(
            latitude: place.location?.latitude ?? 0,
            longitude: place.location?.longitude ?? 0
        )
        self.stampSlotId = 0
        self.category = ShrineCategory.infer(from: place)
        self.tagline = ""
        self.highlights = []
        self.mustSee = ""
        self.tips = []
        self.bestSeason = ""
        self.access = ""
        self.hours = place.currentOpeningHours?.weekdayDescriptions?.first
            ?? place.regularOpeningHours?.weekdayDescriptions?.first
            ?? ""
        self.placeId = place.id
        self.rating = place.rating
        self.userRatingCount = place.userRatingCount
        self.openNow = place.currentOpeningHours?.openNow
        self.weekdayHours = place.currentOpeningHours?.weekdayDescriptions
            ?? place.regularOpeningHours?.weekdayDescriptions
        self.reviews = place.reviews?.compactMap { review in
            guard let text = review.text?.text, !text.isEmpty else { return nil }
            return PlaceReview(
                id: UUID().uuidString,
                authorName: review.authorAttribution?.displayName ?? "",
                rating: review.rating ?? 0,
                text: text,
                relativeTime: review.relativePublishTimeDescription ?? ""
            )
        }
        self.photoReferences = place.photos?.map(\.name) ?? []
        self.imageURLs = photoReferences.compactMap {
            placesService.photoURL(photoName: $0)?.absoluteString
        }
    }

    /// Try to match this Google-sourced shrine to a known sample shrine (for stamp collection)
    func matchedSample() -> Shrine? {
        Shrine.samples.first { sample in
            let nameLower = name.lowercased()
            let sampleLower = sample.name.lowercased()
            if nameLower.contains(sampleLower) || sampleLower.contains(nameLower) {
                return true
            }
            let sampleLoc = CLLocation(latitude: sample.coordinate.latitude, longitude: sample.coordinate.longitude)
            let thisLoc = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
            return thisLoc.distance(from: sampleLoc) < 100
        }
    }

    /// Whether this shrine has a stamp slot (either hardcoded or matched)
    var hasStampSlot: Bool {
        stampSlotId > 0 || matchedSample() != nil
    }

    /// The effective stamp slot ID (own or matched sample's)
    var effectiveStampSlotId: Int {
        if stampSlotId > 0 { return stampSlotId }
        return matchedSample()?.stampSlotId ?? 0
    }
}

// MARK: - Category inference from Google Place types

extension ShrineCategory {
    static func infer(from place: GooglePlaceResponse) -> ShrineCategory {
        let types = place.types ?? []
        let name = (place.displayName?.text ?? "").lowercased()

        if name.contains("inari") || name.contains("稲荷") { return .inari }
        if name.contains("tenmangu") || name.contains("天満宮") { return .tenmangu }
        if name.contains("hachimangu") || name.contains("八幡宮") || name.contains("hachiman") { return .hachimangu }
        if name.contains("taisha") || name.contains("大社") { return .taisha }
        if name.contains("jingu") || name.contains("jingū") || name.contains("神宮") { return .jingu }
        if name.contains("daishi") || name.contains("大師") { return .daishi }

        // Check types for temple vs shrine
        if types.contains("buddhist_temple") || name.contains("-ji") || name.contains("tera")
            || name.contains("寺") || name.contains("temple") { return .tera }

        return .jinja
    }
}
