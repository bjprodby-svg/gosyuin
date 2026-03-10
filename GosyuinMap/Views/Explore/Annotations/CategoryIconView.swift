import SwiftUI

/// Custom drawn category icons for map pins and list items.
struct CategoryIconView: View {
    let category: ShrineCategory
    let size: CGFloat
    var color: Color = .white

    var body: some View {
        Canvas { context, canvasSize in
            let s = canvasSize.width
            let scale = s / 64.0

            switch category {
            case .jinja:
                drawTorii(context: context, scale: scale)
            case .tera:
                drawPagoda(context: context, scale: scale)
            case .jingu:
                drawJingu(context: context, scale: scale)
            case .taisha:
                drawTaisha(context: context, scale: scale)
            case .tenmangu:
                drawTenmangu(context: context, scale: scale)
            case .inari:
                drawInari(context: context, scale: scale)
            case .hachimangu:
                drawHachimangu(context: context, scale: scale)
            case .daishi:
                drawDaishi(context: context, scale: scale)
            }
        }
        .frame(width: size, height: size)
    }

    // MARK: - Torii Gate (神社)
    private func drawTorii(context: GraphicsContext, scale: CGFloat) {
        var ctx = context
        // Top beam (kasagi) - curved
        var kasagi = Path()
        kasagi.move(to: p(6, 16, scale))
        kasagi.addQuadCurve(to: p(32, 8, scale), control: p(16, 10, scale))
        kasagi.addQuadCurve(to: p(58, 16, scale), control: p(48, 10, scale))
        kasagi.addLine(to: p(58, 19, scale))
        kasagi.addLine(to: p(6, 19, scale))
        kasagi.closeSubpath()
        ctx.fill(kasagi, with: .color(color))

        // Second beam (nuki)
        ctx.fill(Path(roundedRect: r(12, 24, 40, 4, scale), cornerRadius: 1 * scale), with: .color(color))

        // Left pillar
        ctx.fill(Path(roundedRect: r(15, 16, 5, 42, scale), cornerRadius: 1 * scale), with: .color(color))
        // Right pillar
        ctx.fill(Path(roundedRect: r(44, 16, 5, 42, scale), cornerRadius: 1 * scale), with: .color(color))
    }

    // MARK: - Pagoda (寺)
    private func drawPagoda(context: GraphicsContext, scale: CGFloat) {
        var ctx = context
        // Three-tier roofs
        ctx.fill(triangle(32, 6, 18, 20, 46, 20, scale), with: .color(color))
        ctx.fill(triangle(32, 18, 14, 32, 50, 32, scale), with: .color(color))
        ctx.fill(triangle(32, 30, 10, 44, 54, 44, scale), with: .color(color))

        // Body
        ctx.fill(Path(r(22, 44, 20, 6, scale)), with: .color(color))
        // Door (arch)
        ctx.fill(Path(roundedRect: r(28, 50, 8, 10, scale), cornerRadius: 4 * scale), with: .color(color))
        // Foundation
        ctx.fill(Path(roundedRect: r(18, 58, 28, 3, scale), cornerRadius: 1 * scale), with: .color(color))
    }

    // MARK: - Grand Shrine (神宮)
    private func drawJingu(context: GraphicsContext, scale: CGFloat) {
        var ctx = context
        // Chigi (crossed beams)
        ctx.stroke(Path { p in
            p.move(to: self.p(22, 4, scale))
            p.addLine(to: self.p(30, 20, scale))
        }, with: .color(color), lineWidth: 3 * scale)
        ctx.stroke(Path { p in
            p.move(to: self.p(42, 4, scale))
            p.addLine(to: self.p(34, 20, scale))
        }, with: .color(color), lineWidth: 3 * scale)

        // Katsuogi
        ctx.fill(Path(roundedRect: r(25, 12, 14, 3, scale), cornerRadius: 1.5 * scale), with: .color(color))

        // Roof
        ctx.fill(triangle(32, 10, 8, 36, 56, 36, scale), with: .color(color))
        // Body
        ctx.fill(Path(r(16, 36, 32, 18, scale)), with: .color(color))
        // Foundation
        ctx.fill(Path(roundedRect: r(12, 54, 40, 3, scale), cornerRadius: 1 * scale), with: .color(color))
        ctx.fill(Path(roundedRect: r(8, 57, 48, 3, scale), cornerRadius: 1 * scale), with: .color(color))
    }

    // MARK: - Taisha (大社)
    private func drawTaisha(context: GraphicsContext, scale: CGFloat) {
        var ctx = context
        // Roof (wide)
        ctx.fill(triangle(32, 10, 4, 38, 60, 38, scale), with: .color(color))
        // Shimenawa (rope)
        ctx.stroke(Path { p in
            p.move(to: self.p(10, 34, scale))
            p.addQuadCurve(to: self.p(32, 34, scale), control: self.p(21, 30, scale))
            p.addQuadCurve(to: self.p(54, 34, scale), control: self.p(43, 38, scale))
        }, with: .color(color), style: StrokeStyle(lineWidth: 3.5 * scale, lineCap: .round))

        // Body
        ctx.fill(Path(r(14, 38, 36, 16, scale)), with: .color(color))
        // Foundation
        ctx.fill(Path(roundedRect: r(10, 54, 44, 3, scale), cornerRadius: 1 * scale), with: .color(color))
        ctx.fill(Path(roundedRect: r(6, 57, 52, 3, scale), cornerRadius: 1 * scale), with: .color(color))
    }

    // MARK: - Tenmangu (天満宮) - Plum blossom
    private func drawTenmangu(context: GraphicsContext, scale: CGFloat) {
        var ctx = context
        // 5 petals of plum blossom
        let centers: [(CGFloat, CGFloat)] = [(32, 10), (24, 16), (40, 16), (26, 24), (38, 24)]
        for (cx, cy) in centers {
            ctx.fill(Path(ellipseIn: r(cx - 5, cy - 5, 10, 10, scale)), with: .color(color))
        }
        // Center dot (negative space - skip for small size)

        // Torii below
        ctx.fill(Path(roundedRect: r(10, 36, 44, 4, scale), cornerRadius: 1 * scale), with: .color(color))
        ctx.fill(Path(roundedRect: r(16, 40, 32, 3, scale), cornerRadius: 1 * scale), with: .color(color))
        ctx.fill(Path(roundedRect: r(18, 36, 5, 24, scale), cornerRadius: 1 * scale), with: .color(color))
        ctx.fill(Path(roundedRect: r(41, 36, 5, 24, scale), cornerRadius: 1 * scale), with: .color(color))
    }

    // MARK: - Inari (稲荷) - Fox
    private func drawInari(context: GraphicsContext, scale: CGFloat) {
        var ctx = context
        // Ears
        ctx.fill(triangle(14, 8, 10, 30, 26, 24, scale), with: .color(color))
        ctx.fill(triangle(50, 8, 54, 30, 38, 24, scale), with: .color(color))
        // Face
        ctx.fill(Path(ellipseIn: r(12, 16, 40, 42, scale)), with: .color(color))
        // Eyes (small circles - in the pin these appear as holes)
        // At small sizes, just the silhouette is enough
    }

    // MARK: - Hachimangu (八幡宮) - Dove
    private func drawHachimangu(context: GraphicsContext, scale: CGFloat) {
        var ctx = context
        // Body
        ctx.fill(Path(ellipseIn: r(12, 26, 36, 26, scale)), with: .color(color))
        // Head
        ctx.fill(Path(ellipseIn: r(38, 14, 20, 20, scale)), with: .color(color))
        // Beak
        ctx.fill(triangle(56, 22, 64, 24, 56, 26, scale), with: .color(color))
        // Wing
        var wing = Path()
        wing.move(to: p(16, 30, scale))
        wing.addQuadCurve(to: p(14, 10, scale), control: p(8, 18, scale))
        wing.addQuadCurve(to: p(30, 26, scale), control: p(22, 18, scale))
        wing.closeSubpath()
        ctx.fill(wing, with: .color(color))
        // Tail
        ctx.fill(triangle(12, 36, 2, 28, 4, 42, scale), with: .color(color))
    }

    // MARK: - Daishi (大師) - Lotus
    private func drawDaishi(context: GraphicsContext, scale: CGFloat) {
        var ctx = context
        // Petals (rotated ellipses)
        for i in 0..<5 {
            let angle = Angle.degrees(Double(i) * 36)
            var petal = Path(ellipseIn: CGRect(x: -5 * scale, y: -14 * scale, width: 10 * scale, height: 28 * scale))
            let transform = CGAffineTransform(translationX: 32 * scale, y: 26 * scale)
                .rotated(by: CGFloat(angle.radians))
            petal = petal.applying(transform)
            ctx.fill(petal, with: .color(color))
        }

        // Base platform
        var base = Path()
        base.move(to: p(14, 48, scale))
        base.addQuadCurve(to: p(50, 48, scale), control: p(32, 42, scale))
        base.addLine(to: p(52, 52, scale))
        base.addLine(to: p(12, 52, scale))
        base.closeSubpath()
        ctx.fill(base, with: .color(color))
        ctx.fill(Path(roundedRect: r(10, 52, 44, 3, scale), cornerRadius: 1 * scale), with: .color(color))
        ctx.fill(Path(roundedRect: r(8, 55, 48, 3, scale), cornerRadius: 1 * scale), with: .color(color))
    }

    // MARK: - Helpers

    private func p(_ x: CGFloat, _ y: CGFloat, _ scale: CGFloat) -> CGPoint {
        CGPoint(x: x * scale, y: y * scale)
    }

    private func r(_ x: CGFloat, _ y: CGFloat, _ w: CGFloat, _ h: CGFloat, _ scale: CGFloat) -> CGRect {
        CGRect(x: x * scale, y: y * scale, width: w * scale, height: h * scale)
    }

    private func triangle(_ x1: CGFloat, _ y1: CGFloat, _ x2: CGFloat, _ y2: CGFloat, _ x3: CGFloat, _ y3: CGFloat, _ scale: CGFloat) -> Path {
        Path { path in
            path.move(to: p(x1, y1, scale))
            path.addLine(to: p(x2, y2, scale))
            path.addLine(to: p(x3, y3, scale))
            path.closeSubpath()
        }
    }
}
