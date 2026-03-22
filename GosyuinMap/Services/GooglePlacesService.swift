import Foundation
import CoreLocation
@preconcurrency import MapKit
import GooglePlacesSwift

/// Thin wrapper around Google Places Swift SDK for shrine/temple search.
@MainActor
@Observable
final class GooglePlacesService {

    // MARK: - Types

    struct Suggestion: Identifiable, Hashable {
        let id: String
        let title: String
        let subtitle: String
        let placeID: String
    }

    // MARK: - Configuration

    static func configure(apiKey: String) {
        PlacesClient.provideAPIKey(apiKey)
    }

    // MARK: - Autocomplete

    private var sessionToken = AutocompleteSessionToken()

    func autocomplete(query: String) async -> [Suggestion] {
        let filter = AutocompleteFilter(types: [.geocode, .establishment])
        let request = AutocompleteRequest(
            query: query,
            sessionToken: sessionToken,
            filter: filter
        )

        switch await PlacesClient.shared.fetchAutocompleteSuggestions(with: request) {
        case .success(let suggestions):
            return suggestions.compactMap { suggestion in
                guard case .place(let place) = suggestion else { return nil }
                return Suggestion(
                    id: place.placeID,
                    title: place.attributedPrimaryText.string,
                    subtitle: place.attributedSecondaryText?.string ?? "",
                    placeID: place.placeID
                )
            }
        case .failure:
            return []
        }
    }

    // MARK: - Text Search

    func textSearch(query: String, types: [String] = ["shinto_shrine", "buddhist_temple"]) async -> [MKMapItem] {
        let request = SearchByTextRequest(
            textQuery: query,
            placeProperties: [.displayName, .coordinate, .formattedAddress, .placeID],
            includedType: types.first ?? "place_of_worship"
        )

        switch await PlacesClient.shared.searchByText(with: request) {
        case .success(let places):
            return places.compactMap { toMapItem($0) }
        case .failure:
            return []
        }
    }

    // MARK: - Nearby Search

    func searchNearby(center: CLLocationCoordinate2D, radius: Double = 2000) async -> [MKMapItem] {
        let circle = CircularCoordinateRegion(center: center, radius: radius)
        let request = SearchNearbyRequest(
            locationRestriction: circle,
            placeProperties: [.displayName, .coordinate, .formattedAddress, .placeID],
            includedTypes: ["shinto_shrine", "buddhist_temple"]
        )

        switch await PlacesClient.shared.searchNearby(with: request) {
        case .success(let places):
            return places.compactMap { toMapItem($0) }
        case .failure:
            return []
        }
    }

    // MARK: - Fetch Place by ID

    func fetchPlace(placeID: String) async -> MKMapItem? {
        let request = FetchPlaceRequest(
            placeID: placeID,
            placeProperties: [.displayName, .coordinate, .formattedAddress]
        )

        switch await PlacesClient.shared.fetchPlace(with: request) {
        case .success(let place):
            let item = toMapItem(place)
            // Start new session after place selection
            sessionToken = AutocompleteSessionToken()
            return item
        case .failure:
            return nil
        }
    }

    // MARK: - Helpers

    private func toMapItem(_ place: Place) -> MKMapItem? {
        guard let coordinate = place.coordinate else { return nil }
        let placemark = MKPlacemark(coordinate: coordinate)
        let item = MKMapItem(placemark: placemark)
        item.name = place.displayName
        return item
    }
}
