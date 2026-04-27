import Foundation
import CoreLocation
import MapKit

@MainActor
@Observable
final class ShrineSearchService {

    // MARK: - Published State

    /// Filtered shrine suggestions (from local Shrine.samples)
    private(set) var completions: [Shrine] = []
    private(set) var isSearching = false

    /// Enriched shrine detail (fetched on demand when user taps a shrine)
    private(set) var enrichedShrine: Shrine?
    private(set) var isEnriching = false
    private(set) var enrichError: String?

    var queryFragment: String = "" {
        didSet {
            guard queryFragment != oldValue else { return }
            filterLocally()
        }
    }

    // MARK: - Private

    let placesService = GooglePlacesService()
    private var enrichTask: Task<Void, Never>?
    private var enrichCache: [String: Shrine] = [:] // keyed by shrine name
    private var currentRegion: MKCoordinateRegion?

    // MARK: - Region

    func updateRegion(_ region: MKCoordinateRegion) {
        currentRegion = region
    }

    // MARK: - Local Filter

    private func filterLocally() {
        let query = queryFragment.trimmingCharacters(in: .whitespaces).lowercased()
        guard !query.isEmpty else {
            completions = []
            return
        }

        completions = Shrine.samples.filter { shrine in
            shrine.name.lowercased().contains(query)
                || shrine.address.lowercased().contains(query)
                || shrine.category.displayName.lowercased().contains(query)
                || shrine.category.japaneseQuery.contains(query)
                || shrine.tagline.lowercased().contains(query)
                || (Self.japaneseLookup[shrine.name]?.contains(query) == true)
        }

        // Sort: name-prefix matches first, then by name
        completions.sort { a, b in
            let aPrefix = a.name.lowercased().hasPrefix(query)
            let bPrefix = b.name.lowercased().hasPrefix(query)
            if aPrefix != bPrefix { return aPrefix }
            return a.name < b.name
        }
    }

    // MARK: - Japanese Name Lookup

    /// Maps English shrine names to Japanese for search (famous shrines)
    private static let japaneseLookup: [String: String] = [
        "Meiji Jingu": "明治神宮",
        "Senso-ji": "浅草寺 雷門",
        "Yasukuni Jinja": "靖国神社",
        "Hie Jinja": "日枝神社",
        "Nezu Jinja": "根津神社",
        "Kanda Myojin": "神田明神",
        "Nogi Jinja": "乃木神社",
        "Togo Jinja": "東郷神社",
        "Hikawa Jinja": "氷川神社",
        "Sengaku-ji": "泉岳寺",
        "Gotoku-ji": "豪徳寺",
        "Zojo-ji": "増上寺",
        "Hanazono Jinja": "花園神社",
        "Asakusa Jinja": "浅草神社",
        "Shiba Daijingu": "芝大神宮",
        "Yushima Tenmangu": "湯島天満宮 湯島天神",
        "Kameido Tenjin": "亀戸天神",
        "Suitengu": "水天宮",
        "Toyokawa Inari": "豊川稲荷",
        "Namiyoke Inari": "波除稲荷神社",
        "Tsurugaoka Hachimangu": "鶴岡八幡宮",
        "Hasedera": "長谷寺",
        "Kotoku-in": "高徳院 鎌倉大仏",
        "Enoshima Jinja": "江島神社",
        "Hakone Jinja": "箱根神社",
        "Fushimi Inari Taisha": "伏見稲荷大社",
        "Kinkaku-ji": "金閣寺 鹿苑寺",
        "Kiyomizu-dera": "清水寺",
        "Yasaka Jinja": "八坂神社",
        "Kitano Tenmangu": "北野天満宮",
        "Shimogamo Jinja": "下鴨神社",
        "Kamigamo Jinja": "上賀茂神社",
        "Byodo-in": "平等院",
        "Nanzen-ji": "南禅寺",
        "Ginkaku-ji": "銀閣寺 慈照寺",
        "Sumiyoshi Taisha": "住吉大社",
        "Shitennō-ji": "四天王寺",
        "Kasuga Taisha": "春日大社",
        "Todai-ji": "東大寺",
        "Horyu-ji": "法隆寺",
        "Itsukushima Jinja": "厳島神社 宮島",
        "Izumo Taisha": "出雲大社",
        "Dazaifu Tenmangu": "太宰府天満宮",
        "Toshogu": "東照宮 日光",
        "Zenko-ji": "善光寺",
        "Ise Jingu": "伊勢神宮",
        "Kotohira-gu": "金刀比羅宮 こんぴら",
        "Atsuta Jingu": "熱田神宮",
        "Narita-san Shinsho-ji": "成田山新勝寺",
    ]

    // MARK: - Enrich Shrine (fetch Google details on tap)

    func enrich(shrine: Shrine) {
        enrichTask?.cancel()
        enrichedShrine = nil
        enrichError = nil

        // Return cached result if available
        if let cached = enrichCache[shrine.name] {
            enrichedShrine = cached
            return
        }

        // Skip if API key is not configured
        guard placesService.isConfigured else { return }

        isEnriching = true

        enrichTask = Task {
            do {
                let places = try await placesService.searchText(
                    query: shrine.name,
                    center: shrine.coordinate,
                    radius: 500
                )
                guard !Task.isCancelled else { return }

                if let match = places.first {
                    if let details = try await placesService.fetchDetails(placeId: match.id) {
                        guard !Task.isCancelled else { return }
                        let googleShrine = Shrine(from: details, placesService: placesService)
                        self.enrichedShrine = Shrine(
                            id: shrine.id,
                            name: shrine.name,
                            address: shrine.address.isEmpty ? googleShrine.address : shrine.address,
                            description: shrine.description.isEmpty ? googleShrine.description : shrine.description,
                            coordinate: shrine.coordinate,
                            stampSlotId: shrine.stampSlotId,
                            category: shrine.category,
                            tagline: shrine.tagline,
                            highlights: shrine.highlights,
                            mustSee: shrine.mustSee,
                            tips: shrine.tips,
                            bestSeason: shrine.bestSeason,
                            access: shrine.access,
                            hours: shrine.hours.isEmpty ? googleShrine.hours : shrine.hours,
                            imageURLs: googleShrine.imageURLs.isEmpty ? shrine.imageURLs : googleShrine.imageURLs,
                            placeId: googleShrine.placeId,
                            rating: googleShrine.rating,
                            userRatingCount: googleShrine.userRatingCount,
                            openNow: googleShrine.openNow,
                            weekdayHours: googleShrine.weekdayHours,
                            reviews: googleShrine.reviews,
                            photoReferences: googleShrine.photoReferences
                        )
                        // Cache the result
                        if let enriched = self.enrichedShrine {
                            self.enrichCache[shrine.name] = enriched
                        }
                    }
                }
            } catch {
                guard !Task.isCancelled else {
                    self.isEnriching = false
                    return
                }
                self.enrichError = (error as? LocalizedError)?.errorDescription ?? error.localizedDescription
            }
            self.isEnriching = false
        }
    }

    // MARK: - Clear

    func clear() {
        enrichTask?.cancel()
        queryFragment = ""
        completions = []
        isSearching = false
    }
}
