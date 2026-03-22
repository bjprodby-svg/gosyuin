import Foundation

enum Secrets {
    /// Google Places API Key
    /// Set your key here or via GOOGLE_PLACES_API_KEY build setting.
    static let googlePlacesAPIKey: String = {
        // 1. Check Info.plist (from build settings)
        if let key = Bundle.main.object(forInfoDictionaryKey: "GOOGLE_PLACES_API_KEY") as? String,
           !key.isEmpty, !key.hasPrefix("$") {
            return key
        }
        // 2. Hardcoded fallback (replace with your key for development)
        return "YOUR_API_KEY_HERE"
    }()
}
