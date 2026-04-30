import SwiftUI

/// Renders the user's avatar for their current `CollectorLevel`.
///
/// Wave 2D direction: ChatGPT-generated illustrative avatar artworks (one per level,
/// stored as raster assets in `Assets.xcassets/Avatars/`). Each `CollectorLevel` maps
/// to one image via `level.avatarAssetName` — see `CollectorLevel.avatarAssetName`.
/// The image is already a complete circular avatar (subject + atmospheric background),
/// so this view just renders it inside a soft level-tinted ring.
struct AvatarView: View {
    let level: CollectorLevel
    var size: CGFloat = 80
    var locked: Bool = false

    var body: some View {
        ZStack {
            // Subtle outer ring tinted by level color (helps separate the artwork
            // from the page background and re-affirms the level's signature color).
            Circle()
                .stroke(
                    locked ? Color.gray.opacity(0.18) : level.color.opacity(0.30),
                    lineWidth: max(1, size * 0.035)
                )

            // The illustration itself — clipped to a circle so the avatar reads
            // as a coin-like badge regardless of the source image's bounding box.
            Image(level.avatarAssetName)
                .resizable()
                .scaledToFill()
                .frame(width: size * 0.92, height: size * 0.92)
                .clipShape(Circle())
                .opacity(locked ? 0.4 : 1)
                .saturation(locked ? 0.0 : 1.0)
        }
        .frame(width: size, height: size)
    }
}

// MARK: - Preview

#Preview("Avatar — current level") {
    ScrollView {
        VStack(spacing: 16) {
            ForEach(CollectorLevel.allCases, id: \.rawValue) { level in
                HStack(spacing: 16) {
                    AvatarView(level: level, size: 64)
                    VStack(alignment: .leading, spacing: 2) {
                        HStack(spacing: 6) {
                            Text(level.kanji)
                                .font(.system(size: 18, weight: .bold))
                                .foregroundStyle(level.color)
                            Text(level.title)
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundStyle(Color.bodyText)
                        }
                        Text(level.subtitle)
                            .font(.caption)
                            .foregroundStyle(Color.subtitleText)
                    }
                    Spacer()
                }
                .padding(.horizontal, 12)
            }
        }
        .padding()
    }
    .background(Color.pageBackground)
}

#Preview("Avatar — sizes") {
    HStack(alignment: .bottom, spacing: 16) {
        AvatarView(level: .yamabushi, size: 96)
        AvatarView(level: .yamabushi, size: 64)
        AvatarView(level: .yamabushi, size: 44)
        AvatarView(level: .yamabushi, size: 32)
    }
    .padding()
    .background(Color.pageBackground)
}

#Preview("Avatar — locked vs unlocked") {
    HStack(spacing: 32) {
        VStack(spacing: 8) {
            AvatarView(level: .shinshi, size: 96, locked: false)
            Text("UNLOCKED")
                .font(DS.Font.chipLabel)
                .foregroundStyle(Color.subtitleText)
        }
        VStack(spacing: 8) {
            AvatarView(level: .shinshi, size: 96, locked: true)
            Text("LOCKED")
                .font(DS.Font.chipLabel)
                .foregroundStyle(Color.subtitleText)
        }
    }
    .padding()
    .background(Color.pageBackground)
}
