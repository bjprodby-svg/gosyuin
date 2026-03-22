@preconcurrency import MapKit
import OSLog

private let logger = Logger(subsystem: "com.bjprodby.gosyuinmap", category: "Search")

@MainActor
@Observable
final class ShrineSearchService: NSObject, @unchecked Sendable, MKLocalSearchCompleterDelegate {

    // MARK: - Published State

    private(set) var suggestions: [GooglePlacesService.Suggestion] = []
    private(set) var results: [MKMapItem] = []
    private(set) var isSearching = false
    private(set) var isCompleting = false
    private(set) var searchError: String?

    /// For MKLocalSearch fallback completions (used when Google Places fails)
    private(set) var fallbackCompletions: [MKLocalSearchCompletion] = []

    var queryFragment: String = "" {
        didSet {
            guard queryFragment != oldValue else { return }
            if queryFragment.isEmpty {
                completer.cancel()
                autocompleteTask?.cancel()
                suggestions = []
                fallbackCompletions = []
                isCompleting = false
            } else {
                isCompleting = true
                // Primary: Google Places autocomplete
                startGoogleAutocomplete(queryFragment)
                // Fallback: MKLocalSearchCompleter (runs in parallel)
                completer.queryFragment = queryFragment
            }
        }
    }

    // MARK: - Private

    private let googlePlaces = GooglePlacesService()
    private let completer = MKLocalSearchCompleter()
    private var searchTask: Task<Void, Never>?
    private var autocompleteTask: Task<Void, Never>?
    private var searchRegion: MKCoordinateRegion?

    override init() {
        super.init()
        completer.delegate = self
        completer.resultTypes = .pointOfInterest
    }

    // MARK: - Google Places Autocomplete

    private func startGoogleAutocomplete(_ query: String) {
        autocompleteTask?.cancel()
        autocompleteTask = Task {
            let results = await googlePlaces.autocomplete(query: query)
            if !Task.isCancelled {
                self.suggestions = results
                if !results.isEmpty {
                    self.isCompleting = false
                }
            }
        }
    }

    // MARK: - MKLocalSearchCompleter Delegate (Fallback)

    nonisolated func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        let newResults = completer.results
        Task { @MainActor [weak self] in
            guard let self else { return }
            self.fallbackCompletions = newResults
            // Only use fallback if Google Places returned nothing
            if self.suggestions.isEmpty {
                self.isCompleting = false
            }
        }
    }

    nonisolated func completer(_ completer: MKLocalSearchCompleter, didFailWithError error: Error) {
        Task { @MainActor [weak self] in
            self?.fallbackCompletions = []
        }
    }

    // MARK: - Region

    func updateRegion(_ region: MKCoordinateRegion) {
        searchRegion = region
        completer.region = region
    }

    // MARK: - Search (確定検索)

    /// Google Places のサジェスト候補から場所を取得して確定検索
    func search(suggestion: GooglePlacesService.Suggestion) {
        searchTask?.cancel()
        isSearching = true

        searchTask = Task {
            // Fetch place details by ID to get coordinates
            if let item = await googlePlaces.fetchPlace(placeID: suggestion.placeID) {
                if !Task.isCancelled {
                    self.results = [item]
                }
            } else {
                // Fallback: use suggestion title as text search
                await searchWithFallback(query: suggestion.title)
            }
            self.isSearching = false
        }
    }

    /// MKLocalSearchCompletion から確定検索を実行する (fallback)
    func search(completion: MKLocalSearchCompletion) {
        searchTask?.cancel()
        isSearching = true

        searchTask = Task {
            let request = MKLocalSearch.Request(completion: completion)
            request.resultTypes = .pointOfInterest

            do {
                let search = MKLocalSearch(request: request)
                let response = try await search.start()
                if !Task.isCancelled {
                    self.results = response.mapItems
                }
            } catch {
                if !Task.isCancelled {
                    self.results = []
                }
            }
            self.isSearching = false
        }
    }

    /// 自由テキストで確定検索を実行する
    func search(query: String, in region: MKCoordinateRegion) {
        searchTask?.cancel()

        guard !query.isEmpty else {
            results = []
            return
        }

        isSearching = true

        searchTask = Task {
            await searchWithFallback(query: query)
            self.isSearching = false
        }
    }

    /// 現在の地図リージョン内の神社仏閣を検索する
    func searchNearby(in region: MKCoordinateRegion) {
        searchTask?.cancel()
        isSearching = true

        searchTask = Task {
            // Primary: Google Places Nearby Search
            let googleResults = await googlePlaces.searchNearby(
                center: region.center,
                radius: regionToRadius(region)
            )

            if !Task.isCancelled {
                if !googleResults.isEmpty {
                    self.results = googleResults
                } else {
                    // Fallback: MKLocalSearch
                    await mkLocalSearch(query: "神社 寺", in: region)
                }
            }
            self.isSearching = false
        }
    }

    // MARK: - Clear

    func clear() {
        searchTask?.cancel()
        autocompleteTask?.cancel()
        completer.cancel()
        queryFragment = ""
        suggestions = []
        fallbackCompletions = []
        results = []
        isSearching = false
        isCompleting = false
        searchError = nil
    }

    // MARK: - Private Helpers

    /// Google Places Text Search → MKLocalSearch fallback
    private func searchWithFallback(query: String) async {
        let googleResults = await googlePlaces.textSearch(query: query)

        if !Task.isCancelled {
            if !googleResults.isEmpty {
                self.results = googleResults
            } else {
                // Fallback to MKLocalSearch
                await mkLocalSearch(query: query, in: searchRegion)
            }
        }
    }

    private func mkLocalSearch(query: String, in region: MKCoordinateRegion?) async {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = query
        if let region { request.region = region }
        request.resultTypes = .pointOfInterest

        do {
            let search = MKLocalSearch(request: request)
            let response = try await search.start()
            if !Task.isCancelled {
                self.results = response.mapItems
            }
        } catch {
            logger.error("MKLocalSearch failed: \(error.localizedDescription)")
            if !Task.isCancelled {
                self.results = []
                self.searchError = "Search failed. Check your connection."
            }
        }
    }

    private func regionToRadius(_ region: MKCoordinateRegion) -> Double {
        let latMeters = region.span.latitudeDelta * 111_000
        let lonMeters = region.span.longitudeDelta * 111_000 * cos(region.center.latitude * .pi / 180)
        return min(max(latMeters, lonMeters) / 2, 50_000)
    }
}
