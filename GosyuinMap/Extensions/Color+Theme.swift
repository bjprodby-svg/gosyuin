import SwiftUI

// MARK: - Semantic Colors

extension Color {
    /// 朱色 — アプリのメインアクセントカラー
    static let vermillion = Color("AccentColor")

    /// 朱色バリエーション
    static let vermillionLight = vermillion.opacity(0.12)
    static let vermillionMedium = vermillion.opacity(0.4)
    static let vermillionMuted = vermillion.opacity(0.85)

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

    /// プレースホルダーアイコン色
    static let placeholderIcon = Color(.systemGray4)

    /// プログレスバー未達色
    static let progressEmpty = Color(.systemGray5)

    /// 藍色 — 手水・水系のアクセント
    static let indigo = Color(red: 0.15, green: 0.30, blue: 0.60)

    /// 翠 — 自然・緑系のアクセント
    static let matcha = Color(red: 0.20, green: 0.55, blue: 0.30)

    /// 金茶 — おみくじ等のアクセント
    static let kincha = Color(red: 0.60, green: 0.40, blue: 0.15)
}

// MARK: - Design Constants

enum DS {
    // MARK: Spacing
    enum Spacing {
        static let xs: CGFloat = 4
        static let sm: CGFloat = 8
        static let md: CGFloat = 12
        static let lg: CGFloat = 16
        static let xl: CGFloat = 24
        static let xxl: CGFloat = 32
    }

    // MARK: Corner Radius
    enum Radius {
        static let sm: CGFloat = 8
        static let md: CGFloat = 12
        static let lg: CGFloat = 16
        static let xl: CGFloat = 20
        static let pill: CGFloat = 999
    }

    // MARK: Shadow
    static func cardShadow(_ color: Color = .black.opacity(0.08)) -> some View {
        // Use as .background modifier
        RoundedRectangle(cornerRadius: Radius.lg)
            .fill(.clear)
            .shadow(color: color, radius: 4, x: 0, y: 2)
    }
}

// MARK: - View Modifiers

extension View {
    /// カード背景 — 和紙風の微妙なテクスチャ感（角丸 + 影）
    func cardStyle(radius: CGFloat = DS.Radius.lg) -> some View {
        self
            .padding(DS.Spacing.lg)
            .background(Color.cardBackground, in: RoundedRectangle(cornerRadius: radius))
            .shadow(color: .black.opacity(0.06), radius: 3, x: 0, y: 1)
    }

    /// 朱色のプライマリボタンスタイル
    func vermillionButtonStyle() -> some View {
        self
            .font(.headline)
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.vermillion, in: RoundedRectangle(cornerRadius: DS.Radius.md))
    }

    /// 朱色の縦線アクセント付きカード
    func accentedCard(accentColor: Color = .vermillion) -> some View {
        self
            .padding(DS.Spacing.lg)
            .background {
                RoundedRectangle(cornerRadius: DS.Radius.lg)
                    .fill(Color.cardBackground)
                    .shadow(color: .black.opacity(0.06), radius: 3, x: 0, y: 1)
                    .overlay(alignment: .leading) {
                        UnevenRoundedRectangle(
                            topLeadingRadius: DS.Radius.lg,
                            bottomLeadingRadius: DS.Radius.lg,
                            bottomTrailingRadius: 0,
                            topTrailingRadius: 0
                        )
                        .fill(accentColor)
                        .frame(width: 4)
                    }
                    .clipShape(RoundedRectangle(cornerRadius: DS.Radius.lg))
            }
    }
}

// MARK: - Pressed Button Style

/// タップ時にスケール + 透明度変化するボタンスタイル
struct PressableButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.96 : 1.0)
            .opacity(configuration.isPressed ? 0.85 : 1.0)
            .animation(.spring(duration: 0.2, bounce: 0.4), value: configuration.isPressed)
    }
}

extension ButtonStyle where Self == PressableButtonStyle {
    static var pressable: PressableButtonStyle { PressableButtonStyle() }
}

/// 朱印風の印章スタンプアニメーション用 — タップでドスンと押す
struct StampButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.88 : 1.0)
            .rotationEffect(.degrees(configuration.isPressed ? -2 : 0))
            .animation(.spring(duration: 0.25, bounce: 0.5), value: configuration.isPressed)
    }
}

extension ButtonStyle where Self == StampButtonStyle {
    static var stamp: StampButtonStyle { StampButtonStyle() }
}
