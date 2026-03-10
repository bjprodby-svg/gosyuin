import SwiftUI
import MapKit

struct SearchResultPinView: View {
    let item: MKMapItem
    let isSelected: Bool
    let onTap: () -> Void

    @State private var appeared = false

    var body: some View {
        Button(action: onTap) {
            ZStack {
                Circle()
                    .fill(Color.vermillionMuted)
                    .frame(width: isSelected ? 40 : 30, height: isSelected ? 40 : 30)
                    .shadow(color: .black.opacity(0.2), radius: isSelected ? 6 : 4, y: 2)
                Image(systemName: "mappin")
                    .font(.system(size: isSelected ? 16 : 12))
                    .foregroundStyle(.white)
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
