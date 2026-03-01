import Foundation
import SwiftData

@Model
final class Gosyuin {
    var name: String
    var templeName: String
    var date: Date
    var latitude: Double
    var longitude: Double
    var memo: String
    @Attribute(.externalStorage) var imageData: Data?

    init(
        name: String,
        templeName: String,
        date: Date = .now,
        latitude: Double = 0,
        longitude: Double = 0,
        memo: String = "",
        imageData: Data? = nil
    ) {
        self.name = name
        self.templeName = templeName
        self.date = date
        self.latitude = latitude
        self.longitude = longitude
        self.memo = memo
        self.imageData = imageData
    }
}
