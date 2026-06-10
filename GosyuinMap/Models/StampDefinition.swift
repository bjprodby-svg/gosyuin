import SwiftUI

struct StampDefinition: Identifiable, Hashable {
    let id: Int
    let name: String
    let icon: String
    let color: Color
    let subtitle: String
    let stampSymbol: String
    let imageName: String?

    init(id: Int, name: String, icon: String, color: Color, subtitle: String, stampSymbol: String, imageName: String? = nil) {
        self.id = id
        self.name = name
        self.icon = icon
        self.color = color
        self.subtitle = subtitle
        self.stampSymbol = stampSymbol
        self.imageName = imageName
    }

    static let all: [StampDefinition] = StampSeed.loadAll()
}

// MARK: - Stamp JSON Seed

/// Decodable representation of a stamp as stored in `stamps.json`. The stamp
/// catalog lives as data (not compiled Swift literals) and is loaded at launch.
private struct StampSeed: Decodable {
    let id: Int
    let name: String
    let icon: String
    let color: [Double]
    let subtitle: String
    let stampSymbol: String
    let imageName: String?

    func toDefinition() -> StampDefinition {
        StampDefinition(
            id: id,
            name: name,
            icon: icon,
            color: Color(red: color[0], green: color[1], blue: color[2]),
            subtitle: subtitle,
            stampSymbol: stampSymbol,
            imageName: imageName
        )
    }

    static func loadAll() -> [StampDefinition] {
        guard let url = Bundle.main.url(forResource: "stamps", withExtension: "json"),
              let data = try? Data(contentsOf: url) else {
            assertionFailure("stamps.json missing from bundle")
            return []
        }
        do {
            return try JSONDecoder().decode([StampSeed].self, from: data).map { $0.toDefinition() }
        } catch {
            assertionFailure("Failed to decode stamps.json: \(error)")
            return []
        }
    }
}
