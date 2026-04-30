import SwiftUI

/// Custom Canvas-drawn icon for each Learn-tab guide article.
/// Replaces legacy `Image("guide_xxx")` PNG assets with content-matched silhouettes.
/// Designed on a 64×64 grid then scaled to the requested `size`.
struct GuideArticleIcon: View {
    let articleId: String
    let size: CGFloat
    var color: Color = .primary

    var body: some View {
        Canvas { context, canvasSize in
            let scale = canvasSize.width / 64.0
            switch articleId {
            case "types":    drawTypes(context, scale)
            case "sanpai":   drawTorii(context, scale, ox: 0, oy: 0, w: 64, h: 64)
            case "temple":   drawGassho(context, scale)
            case "temizu":   drawTemizu(context, scale)
            case "gosyuin":  drawGosyuin(context, scale)
            case "omikuji":  drawOmikuji(context, scale)
            case "manners":  drawBowingPerson(context, scale)
            default:         drawTorii(context, scale, ox: 0, oy: 0, w: 64, h: 64)
            }
        }
        .frame(width: size, height: size)
    }

    // MARK: - Shrine & Temple Types (torii + pagoda)

    private func drawTypes(_ ctx: GraphicsContext, _ scale: CGFloat) {
        // Left half: small torii (within x: 2…30, y: 8…58)
        drawTorii(ctx, scale, ox: 0, oy: 6, w: 32, h: 56)
        // Right half: small pagoda (within x: 32…62, y: 4…60)
        drawPagoda(ctx, scale, ox: 32, oy: 0, w: 32, h: 64)
    }

    // MARK: - Torii (神社) — reused for sanpai & types

    /// Draw a torii fitted into the rect (ox,oy,w,h) in 64-grid units.
    private func drawTorii(_ ctx: GraphicsContext, _ scale: CGFloat,
                           ox: CGFloat, oy: CGFloat, w: CGFloat, h: CGFloat) {
        // Internal padding inside the rect
        let pad: CGFloat = w * 0.04
        let left = ox + pad
        let right = ox + w - pad
        let mid = ox + w / 2
        let topBeamY = oy + h * 0.10
        let topBeamBottomY = oy + h * 0.22
        let secondBeamY = oy + h * 0.30
        let secondBeamH = w * 0.07
        let pillarTopY = oy + h * 0.18
        let pillarBottomY = oy + h * 0.95
        let pillarW = w * 0.12

        // Top beam (kasagi) — gently curved upward
        var kasagi = Path()
        kasagi.move(to: p(left, topBeamBottomY, scale))
        kasagi.addQuadCurve(to: p(mid, topBeamY, scale),
                            control: p(left + (mid - left) * 0.4, topBeamY - h * 0.04, scale))
        kasagi.addQuadCurve(to: p(right, topBeamBottomY, scale),
                            control: p(right - (right - mid) * 0.4, topBeamY - h * 0.04, scale))
        kasagi.addLine(to: p(right, topBeamBottomY + h * 0.04, scale))
        kasagi.addLine(to: p(left, topBeamBottomY + h * 0.04, scale))
        kasagi.closeSubpath()
        ctx.fill(kasagi, with: .color(color))

        // Second beam (nuki)
        ctx.fill(Path(roundedRect:
            CGRect(x: (ox + w * 0.18) * scale, y: secondBeamY * scale,
                   width: w * 0.64 * scale, height: secondBeamH * scale),
            cornerRadius: 1 * scale), with: .color(color))

        // Left pillar
        ctx.fill(Path(roundedRect:
            CGRect(x: (ox + w * 0.22) * scale, y: pillarTopY * scale,
                   width: pillarW * scale, height: (pillarBottomY - pillarTopY) * scale),
            cornerRadius: 1 * scale), with: .color(color))
        // Right pillar
        ctx.fill(Path(roundedRect:
            CGRect(x: (ox + w * 0.66) * scale, y: pillarTopY * scale,
                   width: pillarW * scale, height: (pillarBottomY - pillarTopY) * scale),
            cornerRadius: 1 * scale), with: .color(color))
    }

    // MARK: - Pagoda (3-tier) — reused for types

    /// Draw a 3-tier pagoda fitted into rect (ox,oy,w,h).
    private func drawPagoda(_ ctx: GraphicsContext, _ scale: CGFloat,
                            ox: CGFloat, oy: CGFloat, w: CGFloat, h: CGFloat) {
        let cx = ox + w / 2
        // Spire on top
        ctx.fill(Path(roundedRect:
            CGRect(x: (cx - w * 0.03) * scale, y: (oy + h * 0.02) * scale,
                   width: w * 0.06 * scale, height: h * 0.08 * scale),
            cornerRadius: 0.5 * scale), with: .color(color))

        // Three stacked roofs (widening downward)
        let roofs: [(top: CGFloat, half: CGFloat)] = [
            (oy + h * 0.10, w * 0.28),
            (oy + h * 0.30, w * 0.40),
            (oy + h * 0.50, w * 0.50),
        ]
        for r in roofs {
            let h0: CGFloat = h * 0.10
            var roof = Path()
            roof.move(to: p(cx, r.top, scale))
            roof.addLine(to: p(cx + r.half, r.top + h0, scale))
            roof.addQuadCurve(to: p(cx + r.half * 0.85, r.top + h0 * 1.1, scale),
                              control: p(cx + r.half, r.top + h0 * 1.05, scale))
            roof.addLine(to: p(cx - r.half * 0.85, r.top + h0 * 1.1, scale))
            roof.addQuadCurve(to: p(cx - r.half, r.top + h0, scale),
                              control: p(cx - r.half, r.top + h0 * 1.05, scale))
            roof.closeSubpath()
            ctx.fill(roof, with: .color(color))
        }

        // Body block at base
        ctx.fill(Path(
            CGRect(x: (cx - w * 0.22) * scale, y: (oy + h * 0.74) * scale,
                   width: w * 0.44 * scale, height: h * 0.18 * scale)),
                 with: .color(color))
        // Foundation
        ctx.fill(Path(roundedRect:
            CGRect(x: (cx - w * 0.30) * scale, y: (oy + h * 0.92) * scale,
                   width: w * 0.60 * scale, height: h * 0.05 * scale),
            cornerRadius: 1 * scale), with: .color(color))
    }

    // MARK: - Gasshō / Praying Hands (合掌) — temple

    private func drawGassho(_ ctx: GraphicsContext, _ scale: CGFloat) {
        // Two long teardrop palms pressed together, fingertips up.
        // Slight outward lean for natural shape.
        // Right hand
        var right = Path()
        right.move(to: p(32, 6, scale))
        right.addQuadCurve(to: p(46, 32, scale), control: p(44, 14, scale))
        right.addQuadCurve(to: p(48, 52, scale), control: p(48, 42, scale))
        right.addQuadCurve(to: p(40, 58, scale), control: p(45, 58, scale))
        right.addLine(to: p(33, 58, scale))
        right.addLine(to: p(33, 6, scale))
        right.closeSubpath()
        ctx.fill(right, with: .color(color))

        // Left hand (mirror)
        var left = Path()
        left.move(to: p(32, 6, scale))
        left.addQuadCurve(to: p(18, 32, scale), control: p(20, 14, scale))
        left.addQuadCurve(to: p(16, 52, scale), control: p(16, 42, scale))
        left.addQuadCurve(to: p(24, 58, scale), control: p(19, 58, scale))
        left.addLine(to: p(31, 58, scale))
        left.addLine(to: p(31, 6, scale))
        left.closeSubpath()
        ctx.fill(left, with: .color(color))

        // Subtle wrist band line at bottom (small gap to suggest sleeves)
        ctx.fill(Path(roundedRect:
            CGRect(x: 18 * scale, y: 56 * scale,
                   width: 28 * scale, height: 4 * scale),
            cornerRadius: 1 * scale), with: .color(color))
    }

    // MARK: - Temizu (柄杓 + water drops)

    private func drawTemizu(_ ctx: GraphicsContext, _ scale: CGFloat) {
        // Ladle handle — diagonal from upper-right to mid-left
        var handle = Path()
        handle.move(to: p(58, 8, scale))
        handle.addLine(to: p(62, 12, scale))
        handle.addLine(to: p(28, 38, scale))
        handle.addLine(to: p(24, 34, scale))
        handle.closeSubpath()
        ctx.fill(handle, with: .color(color))

        // Ladle cup — half-circle / bowl tilted to pour
        var cup = Path()
        cup.move(to: p(10, 32, scale))
        cup.addLine(to: p(28, 32, scale))
        cup.addQuadCurve(to: p(28, 48, scale), control: p(34, 40, scale))
        cup.addQuadCurve(to: p(10, 48, scale), control: p(19, 56, scale))
        cup.closeSubpath()
        ctx.fill(cup, with: .color(color))

        // Lip highlight on cup edge (thin band)
        ctx.fill(Path(roundedRect:
            CGRect(x: 10 * scale, y: 32 * scale,
                   width: 18 * scale, height: 3 * scale),
            cornerRadius: 1 * scale), with: .color(color))

        // Water drops falling from cup
        for (cx, cy, r) in [(14.0, 54.0, 2.0), (18.0, 60.0, 1.6), (22.0, 56.0, 1.4)] {
            ctx.fill(Path(ellipseIn:
                CGRect(x: (CGFloat(cx) - CGFloat(r)) * scale,
                       y: (CGFloat(cy) - CGFloat(r)) * scale,
                       width: CGFloat(r) * 2 * scale,
                       height: CGFloat(r) * 2.4 * scale)),
                     with: .color(color))
        }
    }

    // MARK: - Gosyuin (open accordion book + stamp)

    private func drawGosyuin(_ ctx: GraphicsContext, _ scale: CGFloat) {
        // Two book pages opened (left + right), with a small spine gap
        let pageY: CGFloat = 18
        let pageH: CGFloat = 36
        // Left page
        ctx.fill(Path(roundedRect:
            CGRect(x: 6 * scale, y: pageY * scale,
                   width: 25 * scale, height: pageH * scale),
            cornerRadius: 1.5 * scale), with: .color(color))
        // Right page
        ctx.fill(Path(roundedRect:
            CGRect(x: 33 * scale, y: pageY * scale,
                   width: 25 * scale, height: pageH * scale),
            cornerRadius: 1.5 * scale), with: .color(color))

        // Page inner negative-space (suggests accordion fold detail)
        ctx.fill(Path(roundedRect:
            CGRect(x: 9 * scale, y: (pageY + 3) * scale,
                   width: 19 * scale, height: (pageH - 6) * scale),
            cornerRadius: 1 * scale), with: .color(.white))
        ctx.fill(Path(roundedRect:
            CGRect(x: 36 * scale, y: (pageY + 3) * scale,
                   width: 19 * scale, height: (pageH - 6) * scale),
            cornerRadius: 1 * scale), with: .color(.white))

        // Square stamp on right page (red impression suggested via filled square)
        ctx.fill(Path(roundedRect:
            CGRect(x: 40 * scale, y: 26 * scale,
                   width: 11 * scale, height: 11 * scale),
            cornerRadius: 1 * scale), with: .color(color))

        // Brush stroke on left page (single diagonal swoosh)
        var brush = Path()
        brush.move(to: p(13, 26, scale))
        brush.addQuadCurve(to: p(25, 46, scale), control: p(15, 40, scale))
        ctx.stroke(brush, with: .color(color),
                   style: StrokeStyle(lineWidth: 2 * scale, lineCap: .round))
    }

    // MARK: - Omikuji (folded paper fortune with knot)

    private func drawOmikuji(_ ctx: GraphicsContext, _ scale: CGFloat) {
        // Knot at top — small horizontal rope wrap
        ctx.fill(Path(roundedRect:
            CGRect(x: 22 * scale, y: 6 * scale,
                   width: 20 * scale, height: 6 * scale),
            cornerRadius: 2 * scale), with: .color(color))

        // Loop through knot (suggests tying)
        var loop = Path()
        loop.addEllipse(in:
            CGRect(x: 28 * scale, y: 2 * scale,
                   width: 8 * scale, height: 7 * scale))
        ctx.stroke(loop, with: .color(color),
                   style: StrokeStyle(lineWidth: 2 * scale))

        // Long folded paper hanging down (slight twist near middle)
        var paper = Path()
        paper.move(to: p(24, 12, scale))
        paper.addLine(to: p(40, 12, scale))
        paper.addLine(to: p(42, 32, scale))
        paper.addLine(to: p(46, 36, scale))
        paper.addLine(to: p(40, 40, scale))
        paper.addLine(to: p(42, 58, scale))
        paper.addLine(to: p(22, 58, scale))
        paper.addLine(to: p(24, 40, scale))
        paper.addLine(to: p(18, 36, scale))
        paper.addLine(to: p(22, 32, scale))
        paper.closeSubpath()
        ctx.fill(paper, with: .color(color))

        // Inner negative space — fortune lines (3 thin bars)
        for y in [20.0, 26.0, 48.0] {
            ctx.fill(Path(roundedRect:
                CGRect(x: 27 * scale, y: CGFloat(y) * scale,
                       width: 10 * scale, height: 1.6 * scale),
                cornerRadius: 0.5 * scale), with: .color(.white))
        }
    }

    // MARK: - Bowing person (お辞儀) — manners

    private func drawBowingPerson(_ ctx: GraphicsContext, _ scale: CGFloat) {
        // Head — angled forward
        ctx.fill(Path(ellipseIn:
            CGRect(x: 14 * scale, y: 14 * scale,
                   width: 16 * scale, height: 16 * scale)),
                 with: .color(color))

        // Torso — bent forward, like an inverted-L curve
        var torso = Path()
        torso.move(to: p(28, 22, scale))            // back of neck
        torso.addQuadCurve(to: p(54, 30, scale),    // back curving over
                           control: p(44, 18, scale))
        torso.addLine(to: p(58, 38, scale))         // tail of jacket
        torso.addQuadCurve(to: p(40, 44, scale),    // underside curve
                           control: p(48, 46, scale))
        torso.addLine(to: p(28, 36, scale))         // front of body
        torso.closeSubpath()
        ctx.fill(torso, with: .color(color))

        // Legs — standing straight below torso
        ctx.fill(Path(roundedRect:
            CGRect(x: 28 * scale, y: 36 * scale,
                   width: 8 * scale, height: 22 * scale),
            cornerRadius: 1 * scale), with: .color(color))
        ctx.fill(Path(roundedRect:
            CGRect(x: 38 * scale, y: 36 * scale,
                   width: 8 * scale, height: 22 * scale),
            cornerRadius: 1 * scale), with: .color(color))

        // Floor line for context
        ctx.fill(Path(roundedRect:
            CGRect(x: 14 * scale, y: 58 * scale,
                   width: 38 * scale, height: 2 * scale),
            cornerRadius: 1 * scale), with: .color(color))
    }

    // MARK: - Helpers

    private func p(_ x: CGFloat, _ y: CGFloat, _ scale: CGFloat) -> CGPoint {
        CGPoint(x: x * scale, y: y * scale)
    }
}

#Preview {
    let ids = ["types", "sanpai", "temple", "temizu", "gosyuin", "omikuji", "manners"]
    return VStack(spacing: 16) {
        ForEach(ids, id: \.self) { id in
            HStack(spacing: 16) {
                GuideArticleIcon(articleId: id, size: 44, color: .primary)
                    .frame(width: 44, height: 44)
                    .background(Color.gray.opacity(0.05))
                Text(id).font(.headline)
                Spacer()
            }
            .padding(.horizontal)
        }
    }
    .padding(.vertical)
}
