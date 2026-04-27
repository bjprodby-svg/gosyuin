import SwiftUI
import MapKit

/// The single source of truth for what the Explore tab is doing.
enum ExploreMode: Equatable {
    /// Default: search bar peek, nearby shrines
    case exploring
    /// User tapped search bar: keyboard + completions/results
    case searching
    /// User selected a shrine (hardcoded or Google): show detail in sheet
    case placeDetail(Shrine)
    /// Route preview (transport tabs, route on map, Go button)
    case directions
    /// Active walking navigation to a destination
    case navigating
}
