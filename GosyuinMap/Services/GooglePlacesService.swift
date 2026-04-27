import Foundation
import CoreLocation

// MARK: - Google Places API Response Models

struct GooglePlacesResponse: Decodable {
    let places: [GooglePlaceResponse]?
}

struct GooglePlaceResponse: Decodable {
    let id: String
    let displayName: GoogleLocalizedText?
    let formattedAddress: String?
    let location: GoogleLatLng?
    let types: [String]?
    let rating: Double?
    let userRatingCount: Int?
    let photos: [GooglePhotoResponse]?
    let currentOpeningHours: GoogleOpeningHours?
    let regularOpeningHours: GoogleOpeningHours?
    let editorialSummary: GoogleLocalizedText?
    let reviews: [GoogleReviewResponse]?
}

struct GoogleLocalizedText: Decodable {
    let text: String
    let languageCode: String?
}

struct GoogleLatLng: Decodable {
    let latitude: Double
    let longitude: Double
}

struct GooglePhotoResponse: Decodable {
    let name: String
    let widthPx: Int?
    let heightPx: Int?
}

struct GoogleOpeningHours: Decodable {
    let openNow: Bool?
    let weekdayDescriptions: [String]?
}

struct GoogleReviewResponse: Decodable {
    let authorAttribution: GoogleAuthorAttribution?
    let rating: Int?
    let text: GoogleLocalizedText?
    let relativePublishTimeDescription: String?
}

struct GoogleAuthorAttribution: Decodable {
    let displayName: String?
}

// MARK: - App-Level Models

struct PlaceReview: Hashable, Identifiable {
    let id: String
    let authorName: String
    let rating: Int
    let text: String
    let relativeTime: String
}

// MARK: - Errors

enum GooglePlacesError: Error, LocalizedError {
    case invalidURL
    case notConfigured
    case httpError(Int)
    case invalidResponse
    case network(Error)

    var errorDescription: String? {
        switch self {
        case .invalidURL: "Invalid URL"
        case .notConfigured: "API key is not configured"
        case .httpError(let code): "HTTP \(code) error"
        case .invalidResponse: "Invalid server response"
        case .network(let error): error.localizedDescription
        }
    }
}

// MARK: - Google Places Service

@MainActor
@Observable
final class GooglePlacesService: @unchecked Sendable {
    private let apiKey: String
    let apiKeyValue: String
    private let session: URLSession
    private let baseURL = "https://places.googleapis.com/v1"
    private let decoder = JSONDecoder()

    /// Whether the API key is configured (not placeholder or empty)
    var isConfigured: Bool {
        !apiKey.isEmpty && apiKey != "YOUR_API_KEY_HERE"
    }

    init() {
        let key = Bundle.main.infoDictionary?["GOOGLE_PLACES_API_KEY"] as? String ?? ""
        apiKey = key
        apiKeyValue = key

        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 15
        config.timeoutIntervalForResource = 30
        config.waitsForConnectivity = false
        self.session = URLSession(configuration: config)
    }

    // MARK: - Text Search

    func searchText(
        query: String,
        center: CLLocationCoordinate2D?,
        radius: Double = 50000
    ) async throws -> [GooglePlaceResponse] {
        guard isConfigured else { throw GooglePlacesError.notConfigured }
        guard let url = URL(string: "\(baseURL)/places:searchText") else {
            throw GooglePlacesError.invalidURL
        }

        var request = makeRequest(url: url, method: "POST")
        request.setValue(searchFieldMask, forHTTPHeaderField: "X-Goog-FieldMask")

        var body: [String: Any] = [
            "textQuery": query,
            "languageCode": "en",
            "maxResultCount": 20
        ]
        if let center {
            body["locationBias"] = [
                "circle": [
                    "center": ["latitude": center.latitude, "longitude": center.longitude],
                    "radius": radius
                ]
            ]
        }
        request.httpBody = try JSONSerialization.data(withJSONObject: body)

        let data = try await performRequest(request)
        let response = try decoder.decode(GooglePlacesResponse.self, from: data)
        return response.places ?? []
    }

    // MARK: - Place Details

    func fetchDetails(placeId: String) async throws -> GooglePlaceResponse? {
        guard isConfigured else { throw GooglePlacesError.notConfigured }
        guard let url = URL(string: "\(baseURL)/places/\(placeId)") else {
            throw GooglePlacesError.invalidURL
        }

        var request = makeRequest(url: url, method: "GET")
        request.setValue(detailFieldMask, forHTTPHeaderField: "X-Goog-FieldMask")

        let data = try await performRequest(request)
        return try decoder.decode(GooglePlaceResponse.self, from: data)
    }

    // MARK: - Photo URL

    nonisolated func photoURL(photoName: String, maxWidth: Int = 800) -> URL? {
        URL(string: "https://places.googleapis.com/v1/\(photoName)/media?maxWidthPx=\(maxWidth)&key=\(apiKeyValue)")
    }

    // MARK: - Private

    private func performRequest(_ request: URLRequest) async throws -> Data {
        let data: Data
        let response: URLResponse
        do {
            (data, response) = try await session.data(for: request)
        } catch {
            throw GooglePlacesError.network(error)
        }
        guard let http = response as? HTTPURLResponse else {
            throw GooglePlacesError.invalidResponse
        }
        guard (200..<300).contains(http.statusCode) else {
            throw GooglePlacesError.httpError(http.statusCode)
        }
        return data
    }

    private func makeRequest(url: URL, method: String) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = method
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(apiKey, forHTTPHeaderField: "X-Goog-Api-Key")
        return request
    }

    private let searchFieldMask = [
        "places.id",
        "places.displayName",
        "places.formattedAddress",
        "places.location",
        "places.types",
        "places.rating",
        "places.userRatingCount",
        "places.photos",
        "places.currentOpeningHours",
        "places.editorialSummary"
    ].joined(separator: ",")

    private let detailFieldMask = [
        "id",
        "displayName",
        "formattedAddress",
        "location",
        "types",
        "rating",
        "userRatingCount",
        "photos",
        "currentOpeningHours",
        "regularOpeningHours",
        "editorialSummary",
        "reviews"
    ].joined(separator: ",")
}
