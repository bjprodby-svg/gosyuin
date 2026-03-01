import SwiftUI

extension Color {
    /// 朱色 — アプリのメインアクセントカラー
    static let vermillion = Color("AccentColor")

    /// ページ背景 — ウォームベージュ（ダーク時は systemBackground）
    static let pageBackground = Color(
        uiColor: UIColor { traits in
            traits.userInterfaceStyle == .dark
                ? .systemBackground
                : UIColor(red: 0.97, green: 0.95, blue: 0.92, alpha: 1)
        }
    )

    /// カード背景 — 白（ダーク時は secondarySystemGroupedBackground）
    static let cardBackground = Color(
        uiColor: UIColor { traits in
            traits.userInterfaceStyle == .dark
                ? .secondarySystemGroupedBackground
                : .white
        }
    )

    /// 本文テキスト — darkGray（ダーク時は label）
    static let bodyText = Color(
        uiColor: UIColor { traits in
            traits.userInterfaceStyle == .dark
                ? .label
                : .darkGray
        }
    )

    /// ピン背景 — 白（ダーク時は secondarySystemBackground）
    static let pinBackground = Color(
        uiColor: UIColor { traits in
            traits.userInterfaceStyle == .dark
                ? .secondarySystemBackground
                : .white
        }
    )
}
