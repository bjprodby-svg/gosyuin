import SwiftUI

/// A gosyuin-style stamp that mimics real shrine stamps:
/// central red circular seal (朱印), vertical shrine name, 奉拝 header.
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

    /// Seal radius relative to overall size
    private var sealRadius: CGFloat { size * 0.32 }

    var body: some View {
        VStack(spacing: 2) {
            Canvas { context, canvasSize in
                drawGosyuin(context: context, size: canvasSize)
            }
            .frame(width: size, height: size)

            if showDate, let date = collectedDate {
                Text(date, format: .dateTime.year().month().day())
                    .font(.system(size: max(7, size * 0.07)))
                    .foregroundStyle(.secondary)
            }
        }
    }

    // MARK: - Canvas Drawing

    private func drawGosyuin(context: GraphicsContext, size: CGSize) {
        let cx = size.width / 2
        let cy = size.height / 2
        let r = sealRadius

        // 1. Central red circular seal (朱印)
        drawSeal(context: context, cx: cx, cy: cy + size.height * 0.05, radius: r)

        // 2. 「奉拝」 — top right, small
        let houhaiFont = Font.system(size: max(6, self.size * 0.08), weight: .medium, design: .serif)
        let houhaiPoint = CGPoint(x: cx + size.width * 0.3, y: size.height * 0.08)
        drawVerticalText("奉拝", at: houhaiPoint, font: houhaiFont, color: .black.opacity(0.7), context: context, spacing: self.size * 0.1)

        // 3. Shrine name — vertical calligraphy, center-right
        let nameFont = Font.system(size: max(8, self.size * 0.13), weight: .bold, design: .serif)
        let nameX = cx + size.width * 0.08
        let nameY = size.height * 0.1
        drawVerticalText(stamp.name, at: CGPoint(x: nameX, y: nameY), font: nameFont, color: .black.opacity(0.85), context: context, spacing: self.size * 0.14)

        // 4. Subtitle location — bottom left, smaller
        let subFont = Font.system(size: max(5, self.size * 0.065), weight: .regular, design: .serif)
        let subX = cx - size.width * 0.28
        let subY = size.height * 0.55
        drawVerticalText(stamp.subtitle, at: CGPoint(x: subX, y: subY), font: subFont, color: .black.opacity(0.5), context: context, spacing: self.size * 0.075)
    }

    // MARK: - Seal (朱印)

    private func drawSeal(context: GraphicsContext, cx: CGFloat, cy: CGFloat, radius: CGFloat) {
        let sealColor = stamp.color

        // Outer ring — slightly uneven (hand-stamped feel)
        var outerRing = Path()
        let segments = 60
        for i in 0...segments {
            let angle = Double(i) / Double(segments) * 2 * .pi
            // Subtle wobble based on stamp id for uniqueness
            let wobble = 1.0 + sin(angle * 7 + Double(stamp.id)) * 0.012
                              + cos(angle * 11 + Double(stamp.id) * 2) * 0.008
            let r = radius * wobble
            let x = cx + cos(angle) * r
            let y = cy + sin(angle) * r
            if i == 0 {
                outerRing.move(to: CGPoint(x: x, y: y))
            } else {
                outerRing.addLine(to: CGPoint(x: x, y: y))
            }
        }
        outerRing.closeSubpath()

        // Fill with slight opacity variation (ink texture)
        context.fill(outerRing, with: .color(sealColor.opacity(0.15)))

        // Stroke the ring
        context.stroke(outerRing, with: .color(sealColor.opacity(0.85)), lineWidth: max(1.5, radius * 0.06))

        // Inner ring
        var innerRing = Path()
        let innerRadius = radius * 0.82
        for i in 0...segments {
            let angle = Double(i) / Double(segments) * 2 * .pi
            let wobble = 1.0 + cos(angle * 9 + Double(stamp.id) * 3) * 0.01
            let r = innerRadius * wobble
            let x = cx + cos(angle) * r
            let y = cy + sin(angle) * r
            if i == 0 {
                innerRing.move(to: CGPoint(x: x, y: y))
            } else {
                innerRing.addLine(to: CGPoint(x: x, y: y))
            }
        }
        innerRing.closeSubpath()
        context.stroke(innerRing, with: .color(sealColor.opacity(0.5)), lineWidth: max(0.8, radius * 0.025))

        // Stamp symbol inside the seal
        let symbolFont = Font.system(size: max(12, radius * 0.7))
        var symbolText = Text(stamp.stampSymbol)
            .font(symbolFont)
            .foregroundColor(sealColor)
        context.draw(
            symbolText.resolve(in: context.environment),
            at: CGPoint(x: cx, y: cy),
            anchor: .center
        )
    }

    // MARK: - Vertical Text

    private func drawVerticalText(_ text: String, at origin: CGPoint, font: Font, color: Color, context: GraphicsContext, spacing: CGFloat) {
        for (i, char) in text.enumerated() {
            let charText = Text(String(char))
                .font(font)
                .foregroundColor(color)
            let y = origin.y + CGFloat(i) * spacing
            context.draw(
                charText.resolve(in: context.environment),
                at: CGPoint(x: origin.x, y: y),
                anchor: .center
            )
        }
    }
}

// MARK: - Hexagon Shape (kept for backward compatibility)

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

// MARK: - Previews

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

#Preview("Single Large") {
    GosyuinStampView(
        stamp: StampDefinition.all[0],
        size: 240,
        collectedDate: .now
    )
    .padding()
}
