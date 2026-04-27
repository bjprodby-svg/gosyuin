import SwiftUI

/// Displays an achievement badge from `Assets.xcassets/Badges/`.
///
/// Wave 2A direction: flat illustration badges (green ring + central illustration + bottom banner)
/// generated via ChatGPT/DALL-E and vectorized through Recraft.
struct BadgeView: View {
    /// Asset name in `Assets.xcassets/Badges/` (without extension).
    /// Example: `badge_milestone_jussan` → renders the 10-visit milestone badge.
    let assetName: String

    /// Display size in points. Default 80pt for sheet display.
    var size: CGFloat = 80

    /// Locked state — renders at reduced opacity for unearned badges.
    var locked: Bool = false

    var body: some View {
        Image(assetName)
            .resizable()
            .scaledToFit()
            .frame(width: size, height: size)
            .opacity(locked ? 0.25 : 1.0)
            .saturation(locked ? 0.0 : 1.0)
    }
}

// MARK: - Preview

#Preview("Badge sizes (unlocked)") {
    HStack(spacing: 16) {
        BadgeView(assetName: "badge_milestone_jussan", size: 80)
        BadgeView(assetName: "badge_milestone_jussan", size: 48)
        BadgeView(assetName: "badge_milestone_jussan", size: 32)
        BadgeView(assetName: "badge_milestone_jussan", size: 20)
    }
    .padding()
    .background(Color.pageBackground)
}

#Preview("Badge — locked vs unlocked") {
    HStack(spacing: 32) {
        VStack(spacing: 8) {
            BadgeView(assetName: "badge_milestone_jussan", size: 80, locked: false)
            Text("UNLOCKED")
                .font(DS.Font.chipLabel)
                .foregroundStyle(Color.subtitleText)
        }
        VStack(spacing: 8) {
            BadgeView(assetName: "badge_milestone_jussan", size: 80, locked: true)
            Text("LOCKED")
                .font(DS.Font.chipLabel)
                .foregroundStyle(Color.subtitleText)
        }
    }
    .padding()
    .background(Color.pageBackground)
}

#Preview("Badge in achievement row") {
    VStack(spacing: 0) {
        ForEach(0..<3, id: \.self) { i in
            HStack(spacing: 12) {
                BadgeView(assetName: "badge_milestone_jussan", size: 32, locked: i == 2)
                VStack(alignment: .leading, spacing: 2) {
                    Text("十参 / 10 Visits")
                        .font(.subheadline.weight(.semibold))
                        .foregroundStyle(Color.bodyText)
                    Text("Visit 10 shrines")
                        .font(.caption)
                        .foregroundStyle(Color.subtitleText)
                }
                Spacer()
            }
            .padding(.vertical, 8)
            .padding(.horizontal, 16)
            .background(Color.cardBackground)
            if i < 2 { Divider().foregroundStyle(Color.divider) }
        }
    }
    .frame(maxWidth: 360)
    .background(Color.pageBackground)
}
