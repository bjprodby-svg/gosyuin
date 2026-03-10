import SwiftUI
import MapKit

/// The single source of truth for what the Explore tab is doing.
enum ExploreMode: Equatable {
    /// Default: search bar peek, nearby shrines
    case exploring
    /// User tapped search bar: keyboard + completions/results
    case searching
    /// User selected a shrine: show detail in sheet
    case placeDetail(Shrine)
    /// User selected a search result: show map item detail
    case mapItemDetail(MapItemWrapper)
    /// Route preview (transport tabs, route on map, Go button)
    case directions
    /// Active walking navigation to a destination
    case navigating
}

/// Wrapper to make MKMapItem work with Equatable
struct MapItemWrapper: Equatable, Identifiable {
    let item: MKMapItem
    var id: ObjectIdentifier { ObjectIdentifier(item) }

    var name: String { item.name ?? "Unknown" }
    var coordinate: CLLocationCoordinate2D { item.placemark.coordinate }
    var address: String? { item.placemark.title }

    static func == (lhs: MapItemWrapper, rhs: MapItemWrapper) -> Bool {
        lhs.item === rhs.item
    }
}
