import SwiftUI

/// Large passport-style stamp artwork for the stamp detail page.
/// Uses the same geometric shapes as GosyuinStampView but at a larger scale.
/// Features a stamped animation on appear.
struct GosyuinArtworkView: View {
    let stamp: StampDefinition
    let collectedDate: Date?

    @State private var stamped = false

    private var isHexagon: Bool { stamp.id % 2 != 0 }

    var body: some View {
        ZStack {
            // Shape borders
            if isHexagon {
                artworkBorders(shape: HexagonShape())
            } else {
                artworkBorders(shape: Circle())
            }

            // Content
            VStack(spacing: DS.Spacing.sm) {
                Text(stamp.name)
                    .font(.system(size: 16, weight: .bold))
                    .foregroundStyle(stamp.color)
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                    .minimumScaleFactor(0.7)

                Image(systemName: stamp.icon)
                    .font(.system(size: 48))
                    .foregroundStyle(stamp.color)

                Text(stamp.subtitle)
                    .font(.system(size: 12, weight: .medium))
                    .foregroundStyle(stamp.color.opacity(0.6))

                if let date = collectedDate {
                    Text(date, format: .dateTime.year().month().day())
                        .font(.system(size: 11))
                        .foregroundStyle(stamp.color.opacity(0.5))
                }
            }
            .padding(DS.Spacing.xl)
        }
        .aspectRatio(1, contentMode: .fit)
        .scaleEffect(stamped ? 1.0 : 0.3)
        .opacity(stamped ? 1.0 : 0)
        .rotationEffect(.degrees(stamped ? 0 : -15))
        .onAppear {
            withAnimation(.spring(duration: 0.6, bounce: 0.3).delay(0.3)) {
                stamped = true
            }
        }
    }

    private func artworkBorders<S: InsettableShape>(shape: S) -> some View {
        ZStack {
            shape.strokeBorder(stamp.color, lineWidth: 3)
            shape.strokeBorder(stamp.color.opacity(0.4), lineWidth: 1)
                .padding(6)
        }
    }
}

// MARK: - Previews

#Preview("Meiji Jingu") {
    GosyuinArtworkView(
        stamp: StampDefinition.all[0],
        collectedDate: .now
    )
    .frame(width: 220)
    .padding()
}

#Preview("Senso-ji") {
    GosyuinArtworkView(
        stamp: StampDefinition.all[1],
        collectedDate: .now
    )
    .frame(width: 220)
    .padding()
}

#Preview("Multiple Stamps") {
    ScrollView(.horizontal) {
        HStack(spacing: 16) {
            ForEach(Array(StampDefinition.all.prefix(4))) { stamp in
                GosyuinArtworkView(
                    stamp: stamp,
                    collectedDate: .now
                )
                .frame(width: 180)
            }
        }
        .padding()
    }
}
