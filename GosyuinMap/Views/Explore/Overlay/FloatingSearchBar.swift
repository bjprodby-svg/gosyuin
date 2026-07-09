import SwiftUI

struct FloatingSearchBar: View {
    let onTap: () -> Void

    var body: some View {
        Button(action: onTap) {
            HStack(spacing: 8) {
                Image(systemName: "magnifyingglass")
                    .font(.system(size: 15, weight: .medium))
                    .foregroundStyle(Color.subtitleText)
                Text("Search shrines & temples")
                    .font(.system(size: 17))
                    .foregroundStyle(Color.subtitleText)
                Spacer()
                Image(systemName: "mic.fill")
                    .font(.system(size: 15))
                    .foregroundStyle(Color.subtitleText)
            }
            .padding(.horizontal, 14)
            .frame(height: 48)
            .background(.regularMaterial, in: RoundedRectangle(cornerRadius: DS.Radius.md))
            .shadow(color: .black.opacity(0.12), radius: 8, y: 3)
        }
        .buttonStyle(AppleMapButtonStyle())
        .padding(.horizontal, DS.Spacing.lg)
    }
}

/// Apple Maps-style press effect: gentle scale + opacity + light haptic on touch-down.
struct AppleMapButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.97 : 1.0)
            .opacity(configuration.isPressed ? 0.85 : 1.0)
            .animation(DS.Anim.press, value: configuration.isPressed)
            .sensoryFeedback(trigger: configuration.isPressed) { _, pressed in
                pressed ? .impact(weight: .light) : nil
            }
    }
}
