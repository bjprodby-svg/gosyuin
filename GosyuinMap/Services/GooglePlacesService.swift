import Foundation
import CoreLocation
@preconcurrency import MapKit
import GooglePlacesSwift
import OSLog

private let logger = Logger(subsystem: "com.bjprodby.gosyuinmap", category: "GooglePlaces")

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
        guard apiKey != "YOUR_API_KEY_HERE", !apiKey.isEmpty else {
            logger.warning("Google Places API key not configured — using MKLocalSearch fallback")
            return
        }
        PlacesClient.provideAPIKey(apiKey)
    }

    // MARK: - Autocomplete

    private var sessionToken = AutocompleteSessionToken()

    func autocomplete(query: String) async -> [Suggestion] {
        guard Secrets.isGooglePlacesConfigured else { return [] }

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
        case .failure(let error):
            logger.error("Autocomplete failed: \(error.localizedDescription)")
            return []
        }
    }

    // MARK: - Text Search

    func textSearch(query: String, types: [String] = ["shinto_shrine", "buddhist_temple"]) async -> [MKMapItem] {
        guard Secrets.isGooglePlacesConfigured else { return [] }

        let request = SearchByTextRequest(
            textQuery: query,
            placeProperties: [.displayName, .coordinate, .formattedAddress, .placeID],
            includedType: types.first ?? "place_of_worship"
        )

        switch await PlacesClient.shared.searchByText(with: request) {
        case .success(let places):
            return places.compactMap { toMapItem($0) }
        case .failure(let error):
            logger.error("Text search failed: \(error.localizedDescription)")
            return []
        }
    }

    // MARK: - Nearby Search

    func searchNearby(center: CLLocationCoordinate2D, radius: Double = 2000) async -> [MKMapItem] {
        guard Secrets.isGooglePlacesConfigured else { return [] }

        let circle = CircularCoordinateRegion(center: center, radius: radius)
        let request = SearchNearbyRequest(
            locationRestriction: circle,
            placeProperties: [.displayName, .coordinate, .formattedAddress, .placeID],
            includedTypes: ["shinto_shrine", "buddhist_temple"]
        )

        switch await PlacesClient.shared.searchNearby(with: request) {
        case .success(let places):
            return places.compactMap { toMapItem($0) }
        case .failure(let error):
            logger.error("Nearby search failed: \(error.localizedDescription)")
            return []
        }
    }

    // MARK: - Fetch Place by ID

    func fetchPlace(placeID: String) async -> MKMapItem? {
        guard Secrets.isGooglePlacesConfigured else { return nil }

        let request = FetchPlaceRequest(
            placeID: placeID,
            placeProperties: [.displayName, .coordinate, .formattedAddress]
        )

        switch await PlacesClient.shared.fetchPlace(with: request) {
        case .success(let place):
            let item = toMapItem(place)
            sessionToken = AutocompleteSessionToken()
            return item
        case .failure(let error):
            logger.error("Fetch place failed: \(error.localizedDescription)")
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
