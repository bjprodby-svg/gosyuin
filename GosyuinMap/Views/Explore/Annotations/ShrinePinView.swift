import SwiftUI

struct ShrinePinView: View {
    let shrine: Shrine
    let isSelected: Bool
    let isCollected: Bool
    let onTap: () -> Void

    @State private var appeared = false

    private var pinSize: CGFloat { isSelected ? 48 : 36 }
    private var iconSize: CGFloat { isSelected ? 20 : 14 }

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
                    .fill(shrine.category.color)
                    .frame(width: pinSize, height: pinSize)
                    .shadow(color: shrine.category.color.opacity(0.4), radius: isSelected ? 8 : 4, y: 2)

                Circle()
                    .strokeBorder(.white, lineWidth: isSelected ? 3 : 2)
                    .frame(width: pinSize, height: pinSize)

                // Canvas-drawn category icon (guaranteed to render)
                CategoryIconView(
                    category: shrine.category,
                    size: iconSize,
                    color: .white
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
