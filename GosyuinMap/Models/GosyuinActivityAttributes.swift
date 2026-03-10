import ActivityKit
import Foundation

struct GosyuinActivityAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        var shrineName: String
        var distance: Int // meters
        var isCollected: Bool
        var isNavigating: Bool = false
        var estimatedMinutes: Int = 0
    }

    var shrineName: String
}
