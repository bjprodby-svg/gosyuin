import MapKit

@Observable
final class ShrineSearchService {
    private(set) var results: [MKMapItem] = []
    private(set) var isSearching = false

    private var searchTask: Task<Void, Never>?

    /// 指定リージョン内で神社仏閣を自然言語検索する
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
        searchTask?.cancel()

        isSearching = true

        searchTask = Task {
            defer { isSearching = false }

            let request = MKLocalSearch.Request()
            request.naturalLanguageQuery = "神社 寺"
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

    func clear() {
        searchTask?.cancel()
        results = []
        isSearching = false
    }
}
