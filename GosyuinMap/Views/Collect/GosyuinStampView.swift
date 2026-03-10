import SwiftUI

/// A passport-style geometric stamp for the collection grid.
/// Even IDs render as circles, odd IDs as hexagons — alternating for visual rhythm.
struct GosyuinStampView: View {
    let stamp: StampDefinition
    let size: CGFloat
    let showDate: Bool
    let collectedDate: Date?

    init(stamp: StampDefinition, size: CGFloat = 120, showDate: Bool = true, collectedDate: Date? = nil) {
        self.stamp = stamp
        self.size = size
        self.showDate = showDate
        self.collectedDate = collectedDate
    }

    private var isHexagon: Bool { stamp.id % 2 != 0 }

    var body: some View {
        VStack(spacing: 4) {
            ZStack {
                // Borders + content
                if isHexagon {
                    stampBorders(shape: HexagonShape())
                } else {
                    stampBorders(shape: Circle())
                }

                stampContent
            }
            .frame(width: size, height: size)

            if showDate, let date = collectedDate {
                Text(date, format: .dateTime.year().month().day())
                    .font(.system(size: max(7, size * 0.07)))
                    .foregroundStyle(.secondary)
            }
        }
    }

    private func stampBorders<S: InsettableShape>(shape: S) -> some View {
        ZStack {
            shape.strokeBorder(stamp.color, lineWidth: 2.5)
            shape.strokeBorder(stamp.color.opacity(0.4), lineWidth: 0.8)
                .padding(5)
        }
    }

    private var stampContent: some View {
        VStack(spacing: size * 0.02) {
            Text(stamp.name)
                .font(.system(size: max(7, size * 0.08), weight: .bold))
                .foregroundStyle(stamp.color)
                .lineLimit(2)
                .minimumScaleFactor(0.5)
                .multilineTextAlignment(.center)

            Image(systemName: stamp.icon)
                .font(.system(size: max(14, size * 0.22)))
                .foregroundStyle(stamp.color)

            Text(stamp.subtitle)
                .font(.system(size: max(5, size * 0.06), weight: .medium))
                .foregroundStyle(stamp.color.opacity(0.6))
                .lineLimit(1)
                .minimumScaleFactor(0.5)
        }
        .padding(size * 0.12)
    }
}

// MARK: - Hexagon Shape

struct HexagonShape: InsettableShape {
    var insetAmount: CGFloat = 0

    func inset(by amount: CGFloat) -> HexagonShape {
        HexagonShape(insetAmount: insetAmount + amount)
    }

    func path(in rect: CGRect) -> Path {
        let insetRect = rect.insetBy(dx: insetAmount, dy: insetAmount)
        let w = insetRect.width
        let h = insetRect.height
        let cx = insetRect.midX
        let cy = insetRect.midY
        let radius = min(w, h) / 2

        var path = Path()
        for i in 0..<6 {
            let angle = Angle.degrees(Double(i) * 60 - 90)
            let x = cx + radius * cos(angle.radians)
            let y = cy + radius * sin(angle.radians)
            if i == 0 {
                path.move(to: CGPoint(x: x, y: y))
            } else {
                path.addLine(to: CGPoint(x: x, y: y))
            }
        }
        path.closeSubpath()
        return path
    }
}

#Preview("Stamp Grid") {
    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
        ForEach(Array(StampDefinition.all.prefix(9))) { stamp in
            GosyuinStampView(
                stamp: stamp,
                size: 110,
                collectedDate: .now
            )
        }
    }
    .padding()
}
