import SwiftUI

/// Custom draggable bottom sheet that coexists with the tab bar.
/// Replaces .sheet() to avoid covering the tab bar.
struct DraggableSheetContainer<Content: View>: View {
    @Binding var detent: SheetDetent
    let detents: [SheetDetent]
    @ViewBuilder let content: () -> Content

    @State private var dragOffset: CGFloat = 0
    @State private var sheetHeight: CGFloat = 0
    @GestureState private var isDragging = false

    private let cornerRadius: CGFloat = 16
    private let indicatorHeight: CGFloat = 36

    var body: some View {
        GeometryReader { geo in
            let safeBottom = geo.safeAreaInsets.bottom
            let availableHeight = geo.size.height

            VStack(spacing: 0) {
                Spacer()

                VStack(spacing: 0) {
                    // Drag indicator
                    dragIndicator

                    // Content
                    content()
                        .frame(maxHeight: max(0, sheetHeight - indicatorHeight))
                        .clipped()
                }
                .frame(height: sheetHeight)
                .background(.regularMaterial, in: UnevenRoundedRectangle(
                    topLeadingRadius: cornerRadius,
                    bottomLeadingRadius: 0,
                    bottomTrailingRadius: 0,
                    topTrailingRadius: cornerRadius
                ))
                .shadow(color: .black.opacity(0.12), radius: 8, y: -2)
                .offset(y: dragOffset)
                .gesture(
                    DragGesture()
                        .updating($isDragging) { _, state, _ in state = true }
                        .onChanged { value in
                            dragOffset = value.translation.height
                        }
                        .onEnded { value in
                            snapToDetent(
                                velocity: value.predictedEndTranslation.height - value.translation.height,
                                availableHeight: availableHeight
                            )
                        }
                )
                .animation(.spring(duration: 0.35, bounce: 0.0), value: sheetHeight)
                .animation(.spring(duration: 0.35, bounce: 0.0), value: dragOffset)
            }
            .ignoresSafeArea(.container, edges: .bottom)
            .onAppear {
                sheetHeight = detent.height(in: availableHeight)
            }
            .onChange(of: detent) { _, newDetent in
                withAnimation(.spring(duration: 0.35, bounce: 0.0)) {
                    sheetHeight = newDetent.height(in: availableHeight)
                    dragOffset = 0
                }
            }
            .onChange(of: geo.size) { _, newSize in
                sheetHeight = detent.height(in: newSize.height)
            }
        }
    }

    private var dragIndicator: some View {
        VStack(spacing: 0) {
            Capsule()
                .fill(Color(.systemGray4))
                .frame(width: 40, height: 5)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 36)
        .contentShape(Rectangle())
    }

    private func snapToDetent(velocity: CGFloat, availableHeight: CGFloat) {
        let currentHeight = sheetHeight - dragOffset
        let threshold: CGFloat = 60

        // Sort detents by height
        let sorted = detents.sorted { $0.height(in: availableHeight) < $1.height(in: availableHeight) }

        // Find nearest detent considering velocity
        var bestDetent = detent
        var bestDist: CGFloat = .infinity

        for d in sorted {
            let h = d.height(in: availableHeight)
            let dist = abs(currentHeight - h) - (velocity > 0 ? -threshold : threshold)
            if abs(currentHeight - h) < bestDist {
                bestDist = abs(currentHeight - h)
                bestDetent = d
            }
        }

        // If strong downward velocity, go to smaller detent
        if velocity > 300 {
            if let smaller = sorted.last(where: { $0.height(in: availableHeight) < sheetHeight - 20 }) {
                bestDetent = smaller
            }
        }
        // If strong upward velocity, go to larger detent
        if velocity < -300 {
            if let larger = sorted.first(where: { $0.height(in: availableHeight) > sheetHeight + 20 }) {
                bestDetent = larger
            }
        }

        withAnimation(.spring(duration: 0.35, bounce: 0.0)) {
            detent = bestDetent
            sheetHeight = bestDetent.height(in: availableHeight)
            dragOffset = 0
        }
    }
}

// MARK: - Sheet Detent

enum SheetDetent: Equatable, Hashable {
    case fraction(CGFloat)
    case large

    func height(in availableHeight: CGFloat) -> CGFloat {
        switch self {
        case .fraction(let f):
            return availableHeight * f
        case .large:
            return availableHeight
        }
    }
}
