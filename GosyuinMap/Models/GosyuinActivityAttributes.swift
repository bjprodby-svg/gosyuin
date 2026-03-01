import ActivityKit
import Foundation

struct GosyuinActivityAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        var shrineName: String
        var distance: Int // meters
        var isCollected: Bool
    }

    var shrineName: String
}
