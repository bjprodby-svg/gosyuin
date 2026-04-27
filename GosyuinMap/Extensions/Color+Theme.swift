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

    /// サブタイトル — 温かみのあるグレー（ダーク時は secondaryLabel）
    static let subtitleText = Color(
        uiColor: UIColor { traits in
            traits.userInterfaceStyle == .dark
                ? .secondaryLabel
                : UIColor(red: 0.50, green: 0.48, blue: 0.45, alpha: 1)
        }
    )

    /// キャプション — さらに薄い温かみのあるグレー（ダーク時は tertiaryLabel）
    static let captionText = Color(
        uiColor: UIColor { traits in
            traits.userInterfaceStyle == .dark
                ? .tertiaryLabel
                : UIColor(red: 0.62, green: 0.60, blue: 0.56, alpha: 1)
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

    /// 区切り線 — subtle border
    static let divider = Color(
        uiColor: UIColor { traits in
            traits.userInterfaceStyle == .dark
                ? UIColor(white: 1, alpha: 0.08)
                : UIColor(red: 0, green: 0, blue: 0, alpha: 0.06)
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
        RoundedRectangle(cornerRadius: Radius.lg)
            .fill(.clear)
            .shadow(color: color, radius: 4, x: 0, y: 2)
    }

    // MARK: Animation Tokens
    enum Anim {
        // Interactive feedback
        static let press = SwiftUI.Animation.spring(duration: 0.2, bounce: 0.4)
        static let stamp = SwiftUI.Animation.spring(duration: 0.25, bounce: 0.5)
        static let select = SwiftUI.Animation.spring(duration: 0.25)

        // Content reveals
        static let reveal = SwiftUI.Animation.spring(duration: 0.4, bounce: 0.4)
        static let collect = SwiftUI.Animation.spring(duration: 0.5, bounce: 0.3)
        static let entrance = SwiftUI.Animation.spring(duration: 0.5, bounce: 0.25)
        static let celebration = SwiftUI.Animation.spring(duration: 0.6, bounce: 0.3)

        // Map / functional transitions
        static let mapTransition = SwiftUI.Animation.spring(duration: 0.35, bounce: 0)
        static let camera = SwiftUI.Animation.spring(duration: 0.6, bounce: 0)

        // Easing curves
        static let contentAppear = SwiftUI.Animation.easeOut(duration: 0.35)
        static let pageTransition = SwiftUI.Animation.easeInOut(duration: 0.4)
        static let ringFade = SwiftUI.Animation.easeOut(duration: 0.8)
        static let drift = SwiftUI.Animation.easeOut(duration: 1.5)

        // Looping
        static let pulse = SwiftUI.Animation.easeOut(duration: 1.5)
            .repeatForever(autoreverses: false)
        static let orbit = SwiftUI.Animation.easeInOut(duration: 1.8)
            .repeatForever(autoreverses: true)

        // Stagger helpers
        static let staggerInterval: Double = 0.08
        static func stagger(_ index: Int, interval: Double = staggerInterval) -> Double {
            Double(index) * interval
        }
    }

    // MARK: Typography Presets
    enum Font {
        /// Page section label: "ACHIEVEMENTS", "MY GOSYUIN JOURNEY"
        static let sectionLabel = SwiftUI.Font.system(size: 11, weight: .bold, design: .monospaced)
        /// Stat hero number (large)
        static let statHero = SwiftUI.Font.system(size: 48, weight: .bold, design: .rounded)
        /// Stat medium number
        static let statMedium = SwiftUI.Font.system(size: 28, weight: .bold, design: .rounded)
        /// Stat small number
        static let statSmall = SwiftUI.Font.system(size: 22, weight: .bold, design: .rounded)
        /// Stat caption label
        static let statCaption = SwiftUI.Font.system(size: 10, weight: .medium)
        /// Progress label (monospaced digits)
        static let progressLabel = SwiftUI.Font.system(size: 10, weight: .bold, design: .monospaced)
        /// Badge / chip label
        static let chipLabel = SwiftUI.Font.system(size: 10, weight: .bold, design: .monospaced)
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

// MARK: - Reusable Section Header

/// Consistent section header across all views — monospaced label + icon + optional trailing
struct SectionHeader: View {
    let title: String
    let icon: String
    var iconColor: Color = .vermillion
    var trailing: String? = nil

    var body: some View {
        HStack(spacing: DS.Spacing.sm) {
            Image(systemName: icon)
                .font(.system(size: 10))
                .foregroundStyle(iconColor.opacity(0.6))
            Text(title.uppercased())
                .font(DS.Font.sectionLabel)
                .foregroundStyle(Color.subtitleText)
                .tracking(1.5)
            Spacer()
            if let trailing {
                Text(trailing)
                    .font(DS.Font.chipLabel)
                    .foregroundStyle(Color.captionText)
            }
        }
    }
}

// MARK: - Reusable Icon Badge

/// Consistent circle icon badge used across all screens
struct IconBadge: View {
    let icon: String
    var size: CGFloat = 36
    var color: Color = .vermillion
    var filled: Bool = false

    var body: some View {
        ZStack {
            Circle()
                .fill(filled ? color : color.opacity(0.1))
                .frame(width: size, height: size)
            if !filled {
                Circle()
                    .strokeBorder(color.opacity(0.15), lineWidth: 1)
                    .frame(width: size, height: size)
            }
            Image(systemName: icon)
                .font(.system(size: size * 0.38, weight: .medium))
                .foregroundStyle(filled ? .white : color)
        }
    }
}

// MARK: - Reusable Progress Bar

/// Standardized progress bar used everywhere
struct ProgressBar: View {
    let progress: Double
    var color: Color = .vermillion
    var height: CGFloat = 5
    var useGradient: Bool = true

    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .leading) {
                Capsule().fill(Color.progressEmpty)
                Capsule()
                    .fill(useGradient ? AnyShapeStyle(color.gradient) : AnyShapeStyle(color))
                    .frame(width: max(height, geo.size.width * min(1, progress)))
                    .animation(.spring(duration: 0.5), value: progress)
            }
        }
        .frame(height: height)
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
