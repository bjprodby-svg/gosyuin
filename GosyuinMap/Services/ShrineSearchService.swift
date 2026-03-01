import MapKit

@Observable
final class ShrineSearchService: NSObject, MKLocalSearchCompleterDelegate {

    // MARK: - Published State

    private(set) var completions: [MKLocalSearchCompletion] = []
    private(set) var results: [MKMapItem] = []
    private(set) var isSearching = false
    private(set) var isCompleting = false

    var queryFragment: String = "" {
        didSet {
            guard queryFragment != oldValue else { return }
            if queryFragment.isEmpty {
                completer.cancel()
                completions = []
                isCompleting = false
            } else {
                completer.queryFragment = queryFragment
                isCompleting = true
            }
        }
    }

    // MARK: - Private

    private let completer = MKLocalSearchCompleter()
    private var searchTask: Task<Void, Never>?

    override init() {
        super.init()
        completer.delegate = self
        completer.resultTypes = .pointOfInterest
    }

    // MARK: - Completer Delegate

    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        completions = completer.results
        isCompleting = false
    }

    func completer(_ completer: MKLocalSearchCompleter, didFailWithError error: Error) {
        completions = []
        isCompleting = false
    }

    // MARK: - Region

    func updateRegion(_ region: MKCoordinateRegion) {
        completer.region = region
    }

    // MARK: - Search (確定検索)

    /// 補完候補から確定検索を実行する
    func search(completion: MKLocalSearchCompletion) {
        searchTask?.cancel()
        isSearching = true

        searchTask = Task {
            defer { isSearching = false }

            let request = MKLocalSearch.Request(completion)
            request.resultTypes = .pointOfInterest

            do {
                let search = MKLocalSearch(request: request)
                let response = try await search.start()
                if !Task.isCancelled {
                    results = response.mapItems
                }
            } catch {
                if !Task.isCancelled {
                    results = []
                }
            }
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
            defer { isSearching = false }

            let request = MKLocalSearch.Request()
            request.naturalLanguageQuery = query
            request.region = region
            request.resultTypes = .pointOfInterest

            do {
                let search = MKLocalSearch(request: request)
                let response = try await search.start()
                if !Task.isCancelled {
                    results = response.mapItems
                }
            } catch {
                if !Task.isCancelled {
                    results = []
                }
            }
        }
    }

    /// 現在の地図リージョン内の神社仏閣を自動検索する
    func searchNearby(in region: MKCoordinateRegion) {
        search(query: "神社 寺", in: region)
    }

    // MARK: - Clear

    func clear() {
        searchTask?.cancel()
        completer.cancel()
        queryFragment = ""
        completions = []
        results = []
        isSearching = false
        isCompleting = false
    }
}
