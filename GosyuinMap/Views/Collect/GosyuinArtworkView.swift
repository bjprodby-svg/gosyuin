import SwiftUI

/// Large gosyuin artwork for the stamp detail page.
/// Uses the same authentic gosyuin style as GosyuinStampView at a larger scale.
/// Features a stamped animation on appear.
struct GosyuinArtworkView: View {
    let stamp: StampDefinition
    let collectedDate: Date?

    @State private var stamped = false

    var body: some View {
        GosyuinStampView(
            stamp: stamp,
            size: 220,
            showDate: true,
            collectedDate: collectedDate
        )
        .scaleEffect(stamped ? 1.0 : 0.3)
        .opacity(stamped ? 1.0 : 0)
        .rotationEffect(.degrees(stamped ? 0 : -15))
        .onAppear {
            withAnimation(.spring(duration: 0.6, bounce: 0.3).delay(0.3)) {
                stamped = true
            }
        }
    }
}

// MARK: - Previews

#Preview("Meiji Jingu") {
    GosyuinArtworkView(
        stamp: StampDefinition.all[0],
        collectedDate: .now
    )
    .padding()
}

#Preview("Senso-ji") {
    GosyuinArtworkView(
        stamp: StampDefinition.all[1],
        collectedDate: .now
    )
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
            }
        }
        .padding()
    }
}
