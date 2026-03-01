import Foundation
import SwiftData

@Model
final class CollectedStamp {
    @Attribute(.unique) var slotId: Int
    var collectedDate: Date

    init(slotId: Int, collectedDate: Date = .now) {
        self.slotId = slotId
        self.collectedDate = collectedDate
    }
}
