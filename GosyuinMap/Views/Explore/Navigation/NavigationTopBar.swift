import SwiftUI

struct NavigationTopBar: View {
    let step: String
    let distance: String?

    var body: some View {
        HStack(spacing: DS.Spacing.md) {
            Image(systemName: "arrow.turn.up.right")
                .font(.title3.bold())
                .foregroundStyle(Color.vermillion)
                .frame(width: 36)

            VStack(alignment: .leading, spacing: 2) {
                if let distance {
                    Text(distance)
                        .font(.title2.bold().monospacedDigit())
                }
                Text(step)
                    .font(.subheadline.weight(.medium))
                    .lineLimit(2)
            }

            Spacer()
        }
        .padding(DS.Spacing.lg)
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: DS.Radius.lg))
        .shadow(color: .black.opacity(0.15), radius: 8, y: 4)
        .padding(.horizontal, DS.Spacing.lg)
    }
}
