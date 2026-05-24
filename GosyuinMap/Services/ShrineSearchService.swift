import Foundation
import CoreLocation
import MapKit

@MainActor
@Observable
final class ShrineSearchService {

    // MARK: - Published State

    /// Local sample matches (free, no API cost)
    private(set) var completions: [Shrine] = []
    /// Google Places matches not already in `completions` (shown below local results)
    private(set) var googleCompletions: [Shrine] = []
    private(set) var isSearchingGoogle = false

    /// Dynamic shrine pins fetched for the current map viewport
    private(set) var discoveredShrines: [Shrine] = []
    private(set) var isDiscovering = false

    /// Enriched shrine detail (fetched on demand when user taps a shrine)
    private(set) var enrichedShrine: Shrine?
    private(set) var isEnriching = false
    private(set) var enrichError: String?

    var queryFragment: String = "" {
        didSet {
            guard queryFragment != oldValue else { return }
            filterLocally()
            scheduleGoogleSearch()
        }
    }

    // MARK: - Private

    let placesService = GooglePlacesService()
    private var enrichTask: Task<Void, Never>?
    private var enrichCache: [String: Shrine] = [:] // keyed by shrine name

    private var googleSearchTask: Task<Void, Never>?
    private var discoverTask: Task<Void, Never>?

    private var currentRegion: MKCoordinateRegion?
    private var lastDiscoveredRegion: MKCoordinateRegion?
    /// Stable Shrine objects keyed by Google place ID. Reused across viewport refreshes
    /// so SwiftUI keeps existing annotation views (and their appear animation) instead of
    /// re-mounting them every time the camera moves.
    private var placeShrineCache: [String: Shrine] = [:]

    // MARK: - Region

    func updateRegion(_ region: MKCoordinateRegion) {
        currentRegion = region
        scheduleDiscovery(region)
    }

    // MARK: - Local Filter

    private func filterLocally() {
        let query = queryFragment.trimmingCharacters(in: .whitespaces).lowercased()
        guard !query.isEmpty else {
            completions = []
            googleCompletions = []
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

    // MARK: - Google Search (debounced)

    private func scheduleGoogleSearch() {
        googleSearchTask?.cancel()
        googleCompletions = []

        let query = queryFragment.trimmingCharacters(in: .whitespaces)
        guard !query.isEmpty, query.count >= 2, placesService.isConfigured else {
            isSearchingGoogle = false
            return
        }

        isSearchingGoogle = true
        let center = currentRegion?.center
        googleSearchTask = Task { [weak self] in
            // Debounce: wait briefly so we don't fire on every keystroke
            try? await Task.sleep(nanoseconds: 350_000_000)
            guard !Task.isCancelled, let self else { return }

            do {
                let places = try await self.placesService.searchText(
                    query: query,
                    center: center,
                    radius: 80_000
                )
                guard !Task.isCancelled else { return }
                let localNames = Set(self.completions.map { $0.name.lowercased() })
                let mapped: [Shrine] = places.compactMap { place in
                    if let cached = self.placeShrineCache[place.id] { return cached }
                    let shrine = Shrine(from: place, placesService: self.placesService)
                    guard !shrine.name.isEmpty else { return nil }
                    // Skip Google results that duplicate a local sample we already show
                    if localNames.contains(shrine.name.lowercased()) { return nil }
                    if shrine.matchedSample() != nil { return nil }
                    self.placeShrineCache[place.id] = shrine
                    return shrine
                }
                self.googleCompletions = mapped
            } catch {
                // Silent failure for search — local results still work
                self.googleCompletions = []
            }
            self.isSearchingGoogle = false
        }
    }

    // MARK: - Viewport Discovery (debounced)

    private func scheduleDiscovery(_ region: MKCoordinateRegion) {
        // Skip viewport discovery if API not configured or zoomed out too far
        guard placesService.isConfigured else {
            discoveredShrines = []
            return
        }
        // Roughly: only fetch when zoomed in to ~city scale
        guard region.span.latitudeDelta < 0.25 else {
            discoverTask?.cancel()
            isDiscovering = false
            return
        }
        // Skip if the camera barely moved since the last successful fetch
        if let last = lastDiscoveredRegion, regionIsNearlyEqual(last, region) {
            return
        }

        discoverTask?.cancel()
        isDiscovering = true

        discoverTask = Task { [weak self] in
            try? await Task.sleep(nanoseconds: 600_000_000)
            guard !Task.isCancelled, let self else { return }

            do {
                let places = try await self.placesService.discoverShrines(in: region)
                guard !Task.isCancelled else { return }
                let sampleNames = Set(Shrine.samples.map { $0.name.lowercased() })
                let shrines: [Shrine] = places.compactMap { place in
                    if let cached = self.placeShrineCache[place.id] { return cached }
                    let shrine = Shrine(from: place, placesService: self.placesService)
                    guard !shrine.name.isEmpty else { return nil }
                    if sampleNames.contains(shrine.name.lowercased()) { return nil }
                    if shrine.matchedSample() != nil { return nil }
                    self.placeShrineCache[place.id] = shrine
                    return shrine
                }
                self.discoveredShrines = shrines
                self.lastDiscoveredRegion = region
            } catch {
                // Silent failure — discovered pins are an enhancement
            }
            self.isDiscovering = false
        }
    }

    private func regionIsNearlyEqual(_ a: MKCoordinateRegion, _ b: MKCoordinateRegion) -> Bool {
        let centerMoved = abs(a.center.latitude - b.center.latitude) + abs(a.center.longitude - b.center.longitude)
        let avgSpan = (a.span.latitudeDelta + a.span.longitudeDelta) / 2
        let spanRatio = b.span.latitudeDelta / max(a.span.latitudeDelta, 0.0001)
        return centerMoved < avgSpan * 0.3 && spanRatio > 0.7 && spanRatio < 1.4
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

        // If this shrine was itself produced from a Google place, it already has
        // photos/rating/address; we just need to fetch reviews + opening hours.
        if let placeId = shrine.placeId {
            enrichFromPlaceId(placeId, base: shrine)
            return
        }

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
                        let merged = Shrine(
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
                        self.enrichedShrine = merged
                        self.enrichCache[shrine.name] = merged
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

    /// Fetch full details using a known place ID (faster, more accurate than text search).
    private func enrichFromPlaceId(_ placeId: String, base: Shrine) {
        if let cached = enrichCache[base.name] {
            enrichedShrine = cached
            return
        }
        guard placesService.isConfigured else {
            enrichedShrine = base
            return
        }
        isEnriching = true
        enrichTask = Task {
            do {
                if let details = try await placesService.fetchDetails(placeId: placeId) {
                    guard !Task.isCancelled else { return }
                    let googleShrine = Shrine(from: details, placesService: placesService)
                    let merged = Shrine(
                        id: base.id,
                        name: base.name,
                        address: googleShrine.address.isEmpty ? base.address : googleShrine.address,
                        description: googleShrine.description.isEmpty ? base.description : googleShrine.description,
                        coordinate: base.coordinate,
                        stampSlotId: base.stampSlotId,
                        category: base.category,
                        tagline: base.tagline,
                        highlights: base.highlights,
                        mustSee: base.mustSee,
                        tips: base.tips,
                        bestSeason: base.bestSeason,
                        access: base.access,
                        hours: googleShrine.hours.isEmpty ? base.hours : googleShrine.hours,
                        imageURLs: googleShrine.imageURLs.isEmpty ? base.imageURLs : googleShrine.imageURLs,
                        placeId: googleShrine.placeId,
                        rating: googleShrine.rating ?? base.rating,
                        userRatingCount: googleShrine.userRatingCount ?? base.userRatingCount,
                        openNow: googleShrine.openNow ?? base.openNow,
                        weekdayHours: googleShrine.weekdayHours ?? base.weekdayHours,
                        reviews: googleShrine.reviews ?? base.reviews,
                        photoReferences: googleShrine.photoReferences.isEmpty ? base.photoReferences : googleShrine.photoReferences
                    )
                    self.enrichedShrine = merged
                    self.enrichCache[base.name] = merged
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
        googleSearchTask?.cancel()
        queryFragment = ""
        completions = []
        googleCompletions = []
        isSearchingGoogle = false
    }
}
