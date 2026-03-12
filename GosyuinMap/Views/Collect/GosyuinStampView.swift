import SwiftUI

/// Authentic gosyuin (御朱印) stamp view.
///
/// Layout mirrors a real shrine stamp:
/// - Central red circular seal (朱印) with stamp symbol
/// - Shrine name in bold serif above the seal
/// - 「奉拝」top-right in small text
/// - Location subtitle bottom-left
/// - Slightly irregular seal edges for hand-stamped feel
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

    private var sealSize: CGFloat { size * 0.52 }
    private var sealColor: Color { stamp.color }

    var body: some View {
        VStack(spacing: 2) {
            ZStack {
                // 奉拝 — top-right
                Text("奉拝")
                    .font(.system(size: max(6, size * 0.075), weight: .medium, design: .serif))
                    .foregroundStyle(.black.opacity(0.6))
                    .offset(x: size * 0.3, y: -size * 0.38)

                // Shrine name — bold, centered above seal
                Text(stamp.name)
                    .font(.system(size: max(7, size * 0.1), weight: .heavy, design: .serif))
                    .foregroundStyle(.black.opacity(0.8))
                    .lineLimit(2)
                    .minimumScaleFactor(0.5)
                    .multilineTextAlignment(.center)
                    .frame(width: size * 0.85)
                    .offset(y: -size * 0.25)

                // Central seal (朱印)
                seal
                    .offset(y: size * 0.08)

                // Location — bottom-left, small
                Text(stamp.subtitle)
                    .font(.system(size: max(5, size * 0.06), weight: .regular, design: .serif))
                    .foregroundStyle(.black.opacity(0.4))
                    .offset(x: -size * 0.2, y: size * 0.4)
            }
            .frame(width: size, height: size)

            if showDate, let date = collectedDate {
                Text(date, format: .dateTime.year().month().day())
                    .font(.system(size: max(7, size * 0.07)))
                    .foregroundStyle(.secondary)
            }
        }
    }

    // MARK: - Seal

    private var seal: some View {
        Canvas { context, canvasSize in
            let cx = canvasSize.width / 2
            let cy = canvasSize.height / 2
            let radius = min(canvasSize.width, canvasSize.height) / 2 - 2

            // Outer ring with wobble
            let outerPath = wobbledCircle(cx: cx, cy: cy, radius: radius, seed: stamp.id, wobbleAmount: 0.015)
            context.fill(outerPath, with: .color(sealColor.opacity(0.12)))
            context.stroke(outerPath, with: .color(sealColor.opacity(0.9)), lineWidth: max(1.5, radius * 0.055))

            // Inner ring
            let innerPath = wobbledCircle(cx: cx, cy: cy, radius: radius * 0.82, seed: stamp.id + 100, wobbleAmount: 0.012)
            context.stroke(innerPath, with: .color(sealColor.opacity(0.45)), lineWidth: max(0.8, radius * 0.025))

            // Stamp symbol
            let symbolText = Text(stamp.stampSymbol)
                .font(.system(size: max(10, radius * 0.7)))
                .foregroundColor(sealColor)
            context.draw(symbolText.resolve(in: context.environment), at: CGPoint(x: cx, y: cy), anchor: .center)
        }
        .frame(width: sealSize, height: sealSize)
    }

    // MARK: - Wobbled Circle

    private func wobbledCircle(cx: CGFloat, cy: CGFloat, radius: CGFloat, seed: Int, wobbleAmount: Double) -> Path {
        var path = Path()
        let segments = 64
        for i in 0...segments {
            let angle = Double(i) / Double(segments) * 2 * .pi
            let wobble = 1.0
                + sin(angle * 7 + Double(seed)) * wobbleAmount
                + cos(angle * 11 + Double(seed) * 2.3) * wobbleAmount * 0.7
            let r = radius * wobble
            let point = CGPoint(x: cx + cos(angle) * r, y: cy + sin(angle) * r)
            if i == 0 { path.move(to: point) } else { path.addLine(to: point) }
        }
        path.closeSubpath()
        return path
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
        let cx = insetRect.midX
        let cy = insetRect.midY
        let radius = min(insetRect.width, insetRect.height) / 2

        var path = Path()
        for i in 0..<6 {
            let angle = Angle.degrees(Double(i) * 60 - 90)
            let x = cx + radius * cos(angle.radians)
            let y = cy + radius * sin(angle.radians)
            if i == 0 { path.move(to: CGPoint(x: x, y: y)) } else { path.addLine(to: CGPoint(x: x, y: y)) }
        }
        path.closeSubpath()
        return path
    }
}

// MARK: - Previews

#Preview("Stamp Grid") {
    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
        ForEach(Array(StampDefinition.all.prefix(9))) { stamp in
            GosyuinStampView(stamp: stamp, size: 110, collectedDate: .now)
        }
    }
    .padding()
}

#Preview("Single Large") {
    GosyuinStampView(stamp: StampDefinition.all[0], size: 240, collectedDate: .now)
        .padding()
}
