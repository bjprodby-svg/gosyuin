import SwiftUI

struct ShrinePinView: View {
    let shrine: Shrine
    let isSelected: Bool
    let isCollected: Bool
    /// `true` when the pin originated from Google Places discovery (not a hard-coded sample).
    /// Discovered pins render in an outlined, lower-emphasis style so curated samples remain
    /// the visual anchor.
    var isDiscovered: Bool = false
    let onTap: () -> Void

    @State private var appeared = false

    private var pinSize: CGFloat {
        if isSelected { return 48 }
        return isDiscovered ? 28 : 36
    }
    private var iconSize: CGFloat {
        if isSelected { return 20 }
        return isDiscovered ? 12 : 14
    }

    var body: some View {
        Button(action: onTap) {
            ZStack {
                if isSelected {
                    Circle()
                        .stroke(shrine.category.color.opacity(0.3), lineWidth: 2)
                        .frame(width: 56, height: 56)
                        .scaleEffect(isSelected ? 1.2 : 0.8)
                        .opacity(isSelected ? 0 : 1)
                        .animation(
                            .easeOut(duration: 1.2).repeatForever(autoreverses: false),
                            value: isSelected
                        )
                }

                Circle()
                    .fill(isDiscovered && !isSelected
                          ? Color(.systemBackground)
                          : shrine.category.color)
                    .frame(width: pinSize, height: pinSize)
                    .shadow(color: shrine.category.color.opacity(isDiscovered ? 0.2 : 0.4),
                            radius: isSelected ? 8 : (isDiscovered ? 2 : 4), y: 2)

                Circle()
                    .strokeBorder(isDiscovered && !isSelected
                                  ? shrine.category.color
                                  : .white,
                                  lineWidth: isSelected ? 3 : 2)
                    .frame(width: pinSize, height: pinSize)

                CategoryIconView(
                    category: shrine.category,
                    size: iconSize,
                    color: isDiscovered && !isSelected ? shrine.category.color : .white
                )

                if isCollected {
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            Image(systemName: "checkmark.circle.fill")
                                .font(.system(size: 14))
                                .foregroundStyle(Color.matcha)
                                .background(Color(.systemBackground), in: Circle())
                        }
                    }
                    .frame(width: pinSize, height: pinSize)
                }
            }
            .scaleEffect(appeared ? 1 : 0.3)
            .opacity(appeared ? 1 : 0)
            .animation(.spring(duration: 0.4, bounce: 0.5), value: appeared)
            .animation(.spring(duration: 0.3, bounce: 0.4), value: isSelected)
        }
        .buttonStyle(.plain)
        .onAppear { appeared = true }
    }
}
