import ActivityKit
import Foundation

struct GosyuinActivityAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        var templeName: String
        var status: String
        var currentStep: WorshipStep
        var startDate: Date
    }

    var gosyuinName: String
}

enum WorshipStep: Int, Codable, CaseIterable, Hashable {
    case temizu = 0   // 手水
    case sanpai = 1   // 参拝
    case gosyuin = 2  // 御朱印受領

    var label: String {
        switch self {
        case .temizu: "手水"
        case .sanpai: "参拝"
        case .gosyuin: "御朱印"
        }
    }

    var labelEn: String {
        switch self {
        case .temizu: "Temizu"
        case .sanpai: "Worship"
        case .gosyuin: "Stamp"
        }
    }

    var icon: String {
        switch self {
        case .temizu: "drop.fill"
        case .sanpai: "building.columns.fill"
        case .gosyuin: "seal.fill"
        }
    }

    var next: WorshipStep? {
        WorshipStep(rawValue: rawValue + 1)
    }
}
