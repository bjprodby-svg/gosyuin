import SwiftUI

// MARK: - Shared Illustration Frame

private struct IllustrationFrame<Content: View>: View {
    let color: Color
    @ViewBuilder let content: Content

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(
                    LinearGradient(
                        colors: [color.opacity(0.08), color.opacity(0.03), Color(.systemBackground).opacity(0.5)],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(color.opacity(0.08), lineWidth: 1)
                )
            content
        }
        .frame(height: 220)
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

// MARK: - Color Palette

private enum Pal {
    static let skin = Color(red: 0.96, green: 0.87, blue: 0.77)
    static let skinShade = Color(red: 0.90, green: 0.78, blue: 0.66)
    static let hair = Color(red: 0.20, green: 0.16, blue: 0.14)
    static let white = Color(red: 0.98, green: 0.97, blue: 0.96)
    static let kimono1 = Color(red: 0.35, green: 0.50, blue: 0.65) // blue-grey
    static let kimono2 = Color(red: 0.50, green: 0.35, blue: 0.55) // purple
    static let sash = Color(red: 0.60, green: 0.45, blue: 0.55)
    static let wood = Color(red: 0.55, green: 0.38, blue: 0.24)
    static let woodLt = Color(red: 0.72, green: 0.56, blue: 0.40)
    static let stone = Color(red: 0.70, green: 0.68, blue: 0.65)
    static let stoneDk = Color(red: 0.55, green: 0.53, blue: 0.50)
    static let water = Color(red: 0.60, green: 0.78, blue: 0.88)
    static let waterDk = Color(red: 0.40, green: 0.60, blue: 0.75)
    static let gold = Color(red: 0.82, green: 0.68, blue: 0.22)
    static let goldLt = Color(red: 0.92, green: 0.82, blue: 0.45)
    static let verm = Color(red: 0.82, green: 0.20, blue: 0.15)
    static let paper = Color(red: 0.97, green: 0.95, blue: 0.90)
    static let ground = Color(red: 0.85, green: 0.80, blue: 0.72)
    static let groundDk = Color(red: 0.75, green: 0.70, blue: 0.62)
    static let green = Color(red: 0.45, green: 0.62, blue: 0.40)
}

// MARK: - Person Drawing Helpers

/// Shared building blocks for drawing people with visible actions.
/// All coordinates are absolute — caller computes position.
private enum Person {

    // ── Shared parts ──

    static func head(_ ctx: GraphicsContext, cx: CGFloat, cy: CGFloat, r: CGFloat, closedEyes: Bool = false) {
        // Hair (slightly larger ellipse behind)
        var hair = Path()
        hair.addEllipse(in: CGRect(x: cx - r * 1.2, y: cy - r * 1.25, width: r * 2.4, height: r * 2.3))
        ctx.fill(hair, with: .color(Pal.hair))

        // Face
        var face = Path()
        face.addEllipse(in: CGRect(x: cx - r, y: cy - r, width: r * 2, height: r * 2))
        ctx.fill(face, with: .color(Pal.skin))

        if closedEyes {
            // Peaceful closed eyes (curved lines)
            for side in [-1.0, 1.0] {
                let ex = cx + CGFloat(side) * r * 0.32
                var eye = Path()
                eye.move(to: CGPoint(x: ex - 3, y: cy))
                eye.addQuadCurve(to: CGPoint(x: ex + 3, y: cy), control: CGPoint(x: ex, y: cy + 2.5))
                ctx.stroke(eye, with: .color(Pal.hair.opacity(0.6)), style: StrokeStyle(lineWidth: 1.3, lineCap: .round))
            }
        } else {
            // Open eyes (dots)
            for side in [-1.0, 1.0] {
                var eye = Path()
                let ex = cx + CGFloat(side) * r * 0.32
                eye.addEllipse(in: CGRect(x: ex - 1.5, y: cy - 1.5, width: 3, height: 3.5))
                ctx.fill(eye, with: .color(Pal.hair.opacity(0.8)))
            }
        }

        // Small smile
        var mouth = Path()
        mouth.move(to: CGPoint(x: cx - 2.5, y: cy + r * 0.4))
        mouth.addQuadCurve(to: CGPoint(x: cx + 2.5, y: cy + r * 0.4), control: CGPoint(x: cx, y: cy + r * 0.55))
        ctx.stroke(mouth, with: .color(Pal.hair.opacity(0.35)), style: StrokeStyle(lineWidth: 1.1, lineCap: .round))
    }

    static func lowerBody(_ ctx: GraphicsContext, cx: CGFloat, hipY: CGFloat, bottomY: CGFloat, kimono: Color) {
        let hipW: CGFloat = 14
        let legLen = bottomY - hipY - 4

        // Hakama / skirt portion
        var skirt = Path()
        skirt.move(to: CGPoint(x: cx - hipW, y: hipY))
        skirt.addLine(to: CGPoint(x: cx + hipW, y: hipY))
        skirt.addLine(to: CGPoint(x: cx + hipW + 3, y: hipY + legLen * 0.6))
        skirt.addLine(to: CGPoint(x: cx - hipW - 3, y: hipY + legLen * 0.6))
        skirt.closeSubpath()
        ctx.fill(skirt, with: .color(kimono.opacity(0.82)))

        // Legs below skirt
        let legTop = hipY + legLen * 0.55
        for side in [-1.0, 1.0] {
            let lx = cx + CGFloat(side) * 5
            var leg = Path()
            leg.addRoundedRect(in: CGRect(x: lx - 3, y: legTop, width: 6, height: bottomY - legTop - 4),
                               cornerSize: CGSize(width: 3, height: 3))
            ctx.fill(leg, with: .color(Pal.skin))
        }

        // Feet (geta)
        for side in [-1.0, 1.0] {
            let fx = cx + CGFloat(side) * 5
            var foot = Path()
            foot.addRoundedRect(in: CGRect(x: fx - 5, y: bottomY - 5, width: 10, height: 5),
                                cornerSize: CGSize(width: 2, height: 2))
            ctx.fill(foot, with: .color(Pal.wood.opacity(0.5)))
        }
    }

    static func torso(_ ctx: GraphicsContext, cx: CGFloat, topY: CGFloat, bottomY: CGFloat, shoulderW: CGFloat, hipW: CGFloat, kimono: Color) {
        var body = Path()
        body.move(to: CGPoint(x: cx - shoulderW, y: topY))
        body.addLine(to: CGPoint(x: cx + shoulderW, y: topY))
        body.addLine(to: CGPoint(x: cx + hipW, y: bottomY))
        body.addLine(to: CGPoint(x: cx - hipW, y: bottomY))
        body.closeSubpath()
        ctx.fill(body, with: .color(kimono))

        // V collar
        var collar = Path()
        collar.move(to: CGPoint(x: cx - 6, y: topY))
        collar.addLine(to: CGPoint(x: cx, y: topY + (bottomY - topY) * 0.35))
        collar.addLine(to: CGPoint(x: cx + 6, y: topY))
        ctx.stroke(collar, with: .color(Pal.white.opacity(0.8)), style: StrokeStyle(lineWidth: 2, lineCap: .round))

        // Obi sash
        let obiY = bottomY - (bottomY - topY) * 0.2
        var obi = Path()
        obi.addRoundedRect(in: CGRect(x: cx - hipW + 2, y: obiY, width: (hipW - 2) * 2, height: (bottomY - topY) * 0.14),
                           cornerSize: CGSize(width: 2, height: 2))
        ctx.fill(obi, with: .color(Pal.sash))
    }

    // ── Arm as a filled shape (not a line!) from shoulder point to hand point ──

    static func arm(_ ctx: GraphicsContext, from shoulder: CGPoint, to hand: CGPoint, width: CGFloat, kimono: Color, showHand: Bool = true) {
        let dx = hand.x - shoulder.x
        let dy = hand.y - shoulder.y
        let len = sqrt(dx * dx + dy * dy)
        guard len > 0 else { return }
        let px = -dy / len * width / 2  // perpendicular
        let py = dx / len * width / 2

        // Sleeve (upper 2/3 in kimono color)
        let sleeveEnd = CGPoint(x: shoulder.x + dx * 0.65, y: shoulder.y + dy * 0.65)
        var sleeve = Path()
        sleeve.move(to: CGPoint(x: shoulder.x + px, y: shoulder.y + py))
        sleeve.addLine(to: CGPoint(x: shoulder.x - px, y: shoulder.y - py))
        sleeve.addLine(to: CGPoint(x: sleeveEnd.x - px * 1.3, y: sleeveEnd.y - py * 1.3))
        sleeve.addLine(to: CGPoint(x: sleeveEnd.x + px * 1.3, y: sleeveEnd.y + py * 1.3))
        sleeve.closeSubpath()
        ctx.fill(sleeve, with: .color(kimono.opacity(0.9)))

        // Forearm (skin)
        var forearm = Path()
        forearm.move(to: CGPoint(x: sleeveEnd.x + px * 0.8, y: sleeveEnd.y + py * 0.8))
        forearm.addLine(to: CGPoint(x: sleeveEnd.x - px * 0.8, y: sleeveEnd.y - py * 0.8))
        forearm.addLine(to: CGPoint(x: hand.x - px * 0.7, y: hand.y - py * 0.7))
        forearm.addLine(to: CGPoint(x: hand.x + px * 0.7, y: hand.y + py * 0.7))
        forearm.closeSubpath()
        ctx.fill(forearm, with: .color(Pal.skin))

        if showHand {
            // Hand (circle)
            var h = Path()
            h.addEllipse(in: CGRect(x: hand.x - 4, y: hand.y - 4, width: 8, height: 8))
            ctx.fill(h, with: .color(Pal.skin))
        }
    }

    // ── Full pose: deep bow (90°) facing a direction ──

    static func drawDeepBow(_ ctx: GraphicsContext, cx: CGFloat, bottom: CGFloat, h: CGFloat, kimono: Color, facingRight: Bool) {
        let dir: CGFloat = facingRight ? 1 : -1
        let headR = h * 0.09
        let hipY = bottom - h * 0.35
        let bodyLen = h * 0.32

        // Lower body (standing straight)
        lowerBody(ctx, cx: cx, hipY: hipY, bottomY: bottom, kimono: kimono)

        // Upper body bent forward at ~90° (horizontal)
        let backEndX = cx + dir * bodyLen
        let backEndY = hipY - h * 0.02 // nearly horizontal

        // Back/torso as thick horizontal shape
        let backW: CGFloat = h * 0.14
        var back = Path()
        back.move(to: CGPoint(x: cx - backW * 0.5, y: hipY - backW))
        back.addLine(to: CGPoint(x: cx + backW * 0.5, y: hipY - backW))
        back.addQuadCurve(to: CGPoint(x: backEndX + dir * 2, y: backEndY + backW * 0.4),
                          control: CGPoint(x: cx + dir * bodyLen * 0.5, y: hipY - backW * 1.1))
        back.addQuadCurve(to: CGPoint(x: cx - backW * 0.5, y: hipY),
                          control: CGPoint(x: cx + dir * bodyLen * 0.5, y: hipY + backW * 0.1))
        back.closeSubpath()
        ctx.fill(back, with: .color(kimono))

        // Obi at hinge point
        var obi = Path()
        obi.addRoundedRect(in: CGRect(x: cx - 12, y: hipY - backW - 2, width: 24, height: 5),
                           cornerSize: CGSize(width: 2, height: 2))
        ctx.fill(obi, with: .color(Pal.sash))

        // Head at end of bent body
        let headX = backEndX + dir * headR * 1.5
        let headY = backEndY - headR * 0.3
        head(ctx, cx: headX, cy: headY, r: headR, closedEyes: true)

        // Arms hanging down from mid-back towards the ground (key visual for bowing!)
        let armStartX = cx + dir * bodyLen * 0.6
        let armStartY = hipY - backW * 0.6
        let armEndX = armStartX + dir * 3
        let armEndY = armStartY + h * 0.18
        arm(ctx, from: CGPoint(x: armStartX, y: armStartY),
            to: CGPoint(x: armEndX, y: armEndY), width: 8, kimono: kimono)

        // Motion lines behind (to show the bowing motion)
        for i in 0..<3 {
            let ly = hipY - backW - 6 - CGFloat(i) * 6
            var line = Path()
            let startX = cx - dir * 5
            line.move(to: CGPoint(x: startX, y: ly))
            line.addQuadCurve(to: CGPoint(x: startX + dir * 15 + CGFloat(i) * dir * 4, y: ly + 8),
                              control: CGPoint(x: startX + dir * 10, y: ly - 2))
            ctx.stroke(line, with: .color(kimono.opacity(0.15 - Double(i) * 0.04)),
                       style: StrokeStyle(lineWidth: 1.5, lineCap: .round))
        }
    }

    // ── Full pose: standing with hands clapping in front ──

    static func drawClapping(_ ctx: GraphicsContext, cx: CGFloat, bottom: CGFloat, h: CGFloat, kimono: Color) {
        let headR = h * 0.09
        let headCY = bottom - h + headR + 2
        let neckBottom = headCY + headR + h * 0.04
        let shoulderW = h * 0.17
        let hipW = h * 0.13
        let torsoBottom = bottom - h * 0.38

        head(ctx, cx: cx, cy: headCY, r: headR)

        // Neck
        var neck = Path()
        neck.addRect(CGRect(x: cx - 4, y: headCY + headR, width: 8, height: h * 0.04))
        ctx.fill(neck, with: .color(Pal.skin))

        torso(ctx, cx: cx, topY: neckBottom, bottomY: torsoBottom, shoulderW: shoulderW, hipW: hipW, kimono: kimono)
        lowerBody(ctx, cx: cx, hipY: torsoBottom, bottomY: bottom, kimono: kimono)

        // Both arms reaching forward and up to chest level where hands meet
        let shoulderLX = cx - shoulderW + 2
        let shoulderRX = cx + shoulderW - 2
        let shoulderY = neckBottom + 5

        // Hands meet in front of chest — slightly in front (offset forward)
        let handsX = cx
        let handsY = neckBottom + h * 0.12

        arm(ctx, from: CGPoint(x: shoulderLX, y: shoulderY),
            to: CGPoint(x: handsX - 2, y: handsY), width: 9, kimono: kimono, showHand: false)
        arm(ctx, from: CGPoint(x: shoulderRX, y: shoulderY),
            to: CGPoint(x: handsX + 2, y: handsY), width: 9, kimono: kimono, showHand: false)

        // Detailed hands clapping together
        // Left palm
        var lPalm = Path()
        lPalm.addRoundedRect(in: CGRect(x: handsX - 14, y: handsY - 10, width: 12, height: 18),
                             cornerSize: CGSize(width: 4, height: 4))
        ctx.fill(lPalm, with: .color(Pal.skin))
        ctx.stroke(lPalm, with: .color(Pal.skinShade.opacity(0.5)), lineWidth: 0.8)

        // Left fingers
        for i in 0..<4 {
            var f = Path()
            f.addRoundedRect(in: CGRect(x: handsX - 13 + CGFloat(i) * 3, y: handsY - 18, width: 2.8, height: 9),
                             cornerSize: CGSize(width: 1.2, height: 1.2))
            ctx.fill(f, with: .color(Pal.skin))
        }

        // Right palm
        var rPalm = Path()
        rPalm.addRoundedRect(in: CGRect(x: handsX + 2, y: handsY - 8, width: 12, height: 18),
                             cornerSize: CGSize(width: 4, height: 4))
        ctx.fill(rPalm, with: .color(Pal.skin))
        ctx.stroke(rPalm, with: .color(Pal.skinShade.opacity(0.5)), lineWidth: 0.8)

        // Right fingers
        for i in 0..<4 {
            var f = Path()
            f.addRoundedRect(in: CGRect(x: handsX + 3 + CGFloat(i) * 3, y: handsY - 16, width: 2.8, height: 9),
                             cornerSize: CGSize(width: 1.2, height: 1.2))
            ctx.fill(f, with: .color(Pal.skin))
        }

        // Impact/sound lines radiating from hands
        for i in 0..<5 {
            let angle = Double(i - 2) * 25.0
            let rad = angle * .pi / 180
            let r1: CGFloat = 18
            let r2: CGFloat = 26
            var impact = Path()
            impact.move(to: CGPoint(x: handsX + cos(rad) * r1, y: handsY - 5 + sin(rad) * r1))
            impact.addLine(to: CGPoint(x: handsX + cos(rad) * r2, y: handsY - 5 + sin(rad) * r2))
            ctx.stroke(impact, with: .color(kimono.opacity(0.3)), style: StrokeStyle(lineWidth: 1.8, lineCap: .round))
        }
    }

    // ── Full pose: standing praying (hands together, peaceful) ──

    static func drawPraying(_ ctx: GraphicsContext, cx: CGFloat, bottom: CGFloat, h: CGFloat, kimono: Color) {
        let headR = h * 0.09
        let headCY = bottom - h + headR + 2
        let neckBottom = headCY + headR + h * 0.04
        let shoulderW = h * 0.17
        let hipW = h * 0.13
        let torsoBottom = bottom - h * 0.38

        head(ctx, cx: cx, cy: headCY, r: headR, closedEyes: true)

        var neck = Path()
        neck.addRect(CGRect(x: cx - 4, y: headCY + headR, width: 8, height: h * 0.04))
        ctx.fill(neck, with: .color(Pal.skin))

        torso(ctx, cx: cx, topY: neckBottom, bottomY: torsoBottom, shoulderW: shoulderW, hipW: hipW, kimono: kimono)
        lowerBody(ctx, cx: cx, hipY: torsoBottom, bottomY: bottom, kimono: kimono)

        // Arms meeting at center in prayer position
        let shoulderY = neckBottom + 5
        let handsY = neckBottom + h * 0.1
        let handsX = cx

        // Large kimono sleeves draping down (bell shape)
        var leftSleeve = Path()
        leftSleeve.move(to: CGPoint(x: cx - shoulderW, y: shoulderY))
        leftSleeve.addLine(to: CGPoint(x: handsX - 3, y: handsY))
        leftSleeve.addLine(to: CGPoint(x: handsX - 5, y: handsY + 15))
        leftSleeve.addLine(to: CGPoint(x: cx - shoulderW - 8, y: shoulderY + h * 0.15))
        leftSleeve.closeSubpath()
        ctx.fill(leftSleeve, with: .color(kimono.opacity(0.9)))

        var rightSleeve = Path()
        rightSleeve.move(to: CGPoint(x: cx + shoulderW, y: shoulderY))
        rightSleeve.addLine(to: CGPoint(x: handsX + 3, y: handsY))
        rightSleeve.addLine(to: CGPoint(x: handsX + 5, y: handsY + 15))
        rightSleeve.addLine(to: CGPoint(x: cx + shoulderW + 8, y: shoulderY + h * 0.15))
        rightSleeve.closeSubpath()
        ctx.fill(rightSleeve, with: .color(kimono.opacity(0.9)))

        // Clasped hands (pointed upward shape)
        var hands = Path()
        hands.move(to: CGPoint(x: handsX, y: handsY - 8))
        hands.addQuadCurve(to: CGPoint(x: handsX + 6, y: handsY + 8),
                           control: CGPoint(x: handsX + 8, y: handsY - 2))
        hands.addQuadCurve(to: CGPoint(x: handsX - 6, y: handsY + 8),
                           control: CGPoint(x: handsX, y: handsY + 12))
        hands.addQuadCurve(to: CGPoint(x: handsX, y: handsY - 8),
                           control: CGPoint(x: handsX - 8, y: handsY - 2))
        ctx.fill(hands, with: .color(Pal.skin))
    }

    // ── Full pose: tossing a coin (right arm extended forward-up) ──

    static func drawTossing(_ ctx: GraphicsContext, cx: CGFloat, bottom: CGFloat, h: CGFloat, kimono: Color) {
        let headR = h * 0.09
        let headCY = bottom - h + headR + 2
        let neckBottom = headCY + headR + h * 0.04
        let shoulderW = h * 0.17
        let hipW = h * 0.13
        let torsoBottom = bottom - h * 0.38

        head(ctx, cx: cx, cy: headCY, r: headR)

        var neck = Path()
        neck.addRect(CGRect(x: cx - 4, y: headCY + headR, width: 8, height: h * 0.04))
        ctx.fill(neck, with: .color(Pal.skin))

        torso(ctx, cx: cx, topY: neckBottom, bottomY: torsoBottom, shoulderW: shoulderW, hipW: hipW, kimono: kimono)
        lowerBody(ctx, cx: cx, hipY: torsoBottom, bottomY: bottom, kimono: kimono)

        let shoulderY = neckBottom + 5

        // Left arm: hanging at side
        arm(ctx, from: CGPoint(x: cx - shoulderW + 2, y: shoulderY),
            to: CGPoint(x: cx - shoulderW - 5, y: shoulderY + h * 0.2), width: 8, kimono: kimono)

        // Right arm: extended forward and up (tossing motion!)
        let handX = cx + shoulderW + h * 0.18
        let handY = shoulderY - h * 0.1
        arm(ctx, from: CGPoint(x: cx + shoulderW - 2, y: shoulderY),
            to: CGPoint(x: handX, y: handY), width: 8, kimono: kimono)

        // Release arc from hand
        var tossArc = Path()
        tossArc.move(to: CGPoint(x: handX + 4, y: handY))
        tossArc.addQuadCurve(to: CGPoint(x: handX + 30, y: handY + 25),
                             control: CGPoint(x: handX + 25, y: handY - 15))
        ctx.stroke(tossArc, with: .color(Pal.gold.opacity(0.4)),
                   style: StrokeStyle(lineWidth: 1.5, lineCap: .round, dash: [4, 3]))
    }

    // ── Full pose: using ladle at basin (arms reaching forward) ──

    static func drawUsingLadle(_ ctx: GraphicsContext, cx: CGFloat, bottom: CGFloat, h: CGFloat, kimono: Color, ladleTargetX: CGFloat, ladleTargetY: CGFloat) {
        let headR = h * 0.09
        let headCY = bottom - h + headR + 2
        let neckBottom = headCY + headR + h * 0.04
        let shoulderW = h * 0.17
        let hipW = h * 0.13
        let torsoBottom = bottom - h * 0.38

        head(ctx, cx: cx, cy: headCY, r: headR)

        var neck = Path()
        neck.addRect(CGRect(x: cx - 4, y: headCY + headR, width: 8, height: h * 0.04))
        ctx.fill(neck, with: .color(Pal.skin))

        torso(ctx, cx: cx, topY: neckBottom, bottomY: torsoBottom, shoulderW: shoulderW, hipW: hipW, kimono: kimono)
        lowerBody(ctx, cx: cx, hipY: torsoBottom, bottomY: bottom, kimono: kimono)

        let shoulderY = neckBottom + 5

        // Both arms reaching forward toward the ladle
        let holdX = ladleTargetX + 15
        let holdY = ladleTargetY

        arm(ctx, from: CGPoint(x: cx - shoulderW + 2, y: shoulderY),
            to: CGPoint(x: holdX - 3, y: holdY + 3), width: 8, kimono: kimono, showHand: false)
        arm(ctx, from: CGPoint(x: cx + shoulderW - 2, y: shoulderY),
            to: CGPoint(x: holdX + 3, y: holdY), width: 8, kimono: kimono, showHand: false)

        // Hands gripping ladle handle
        var grip = Path()
        grip.addEllipse(in: CGRect(x: holdX - 5, y: holdY - 4, width: 10, height: 9))
        ctx.fill(grip, with: .color(Pal.skin))

        // Ladle extending from hands
        var handle = Path()
        handle.move(to: CGPoint(x: holdX, y: holdY))
        handle.addLine(to: CGPoint(x: ladleTargetX - 25, y: ladleTargetY - 5))
        ctx.stroke(handle, with: .color(Pal.woodLt), style: StrokeStyle(lineWidth: 3.5, lineCap: .round))

        // Ladle cup at end
        var cup = Path()
        cup.addEllipse(in: CGRect(x: ladleTargetX - 35, y: ladleTargetY - 12, width: 14, height: 10))
        ctx.fill(cup, with: .color(Pal.woodLt))
        ctx.stroke(cup, with: .color(Pal.wood), lineWidth: 1)

        // Water pouring from ladle
        var waterStream = Path()
        waterStream.move(to: CGPoint(x: ladleTargetX - 28, y: ladleTargetY - 3))
        waterStream.addQuadCurve(to: CGPoint(x: ladleTargetX - 32, y: ladleTargetY + 20),
                                 control: CGPoint(x: ladleTargetX - 25, y: ladleTargetY + 8))
        ctx.stroke(waterStream, with: .color(Pal.water.opacity(0.6)),
                   style: StrokeStyle(lineWidth: 2, lineCap: .round))

        // Water drops
        for i in 0..<3 {
            var drop = Path()
            drop.addEllipse(in: CGRect(x: ladleTargetX - 34 + CGFloat(i) * 3,
                                        y: ladleTargetY + 15 + CGFloat(i) * 5,
                                        width: 3, height: 4))
            ctx.fill(drop, with: .color(Pal.water.opacity(0.5)))
        }
    }

    // ── Full pose: fanning smoke (one hand waving) ──

    static func drawFanning(_ ctx: GraphicsContext, cx: CGFloat, bottom: CGFloat, h: CGFloat, kimono: Color) {
        let headR = h * 0.09
        let headCY = bottom - h + headR + 2
        let neckBottom = headCY + headR + h * 0.04
        let shoulderW = h * 0.17
        let hipW = h * 0.13
        let torsoBottom = bottom - h * 0.38

        head(ctx, cx: cx, cy: headCY, r: headR)

        var neck = Path()
        neck.addRect(CGRect(x: cx - 4, y: headCY + headR, width: 8, height: h * 0.04))
        ctx.fill(neck, with: .color(Pal.skin))

        torso(ctx, cx: cx, topY: neckBottom, bottomY: torsoBottom, shoulderW: shoulderW, hipW: hipW, kimono: kimono)
        lowerBody(ctx, cx: cx, hipY: torsoBottom, bottomY: bottom, kimono: kimono)

        let shoulderY = neckBottom + 5

        // Left arm waving/fanning (raised, slightly bent, hand near face)
        let leftHandX = cx - shoulderW - 8
        let leftHandY = shoulderY - h * 0.05
        arm(ctx, from: CGPoint(x: cx - shoulderW + 2, y: shoulderY),
            to: CGPoint(x: leftHandX, y: leftHandY), width: 8, kimono: kimono)

        // Motion arcs showing fanning action
        for i in 0..<3 {
            let arcOffset = CGFloat(i) * 5
            var fan = Path()
            fan.move(to: CGPoint(x: leftHandX - 5 - arcOffset, y: leftHandY - 5))
            fan.addQuadCurve(to: CGPoint(x: leftHandX - 5 - arcOffset, y: leftHandY + 15),
                             control: CGPoint(x: leftHandX - 15 - arcOffset, y: leftHandY + 5))
            ctx.stroke(fan, with: .color(kimono.opacity(0.15 - Double(i) * 0.04)),
                       style: StrokeStyle(lineWidth: 1.5, lineCap: .round))
        }

        // Right arm at side
        arm(ctx, from: CGPoint(x: cx + shoulderW - 2, y: shoulderY),
            to: CGPoint(x: cx + shoulderW + 3, y: shoulderY + h * 0.18), width: 8, kimono: kimono)
    }

    // ── Full pose: standing with hands at side (generic, used for simpler scenes) ──

    static func drawStanding(_ ctx: GraphicsContext, cx: CGFloat, bottom: CGFloat, h: CGFloat, kimono: Color) {
        let headR = h * 0.09
        let headCY = bottom - h + headR + 2
        let neckBottom = headCY + headR + h * 0.04
        let shoulderW = h * 0.17
        let hipW = h * 0.13
        let torsoBottom = bottom - h * 0.38

        head(ctx, cx: cx, cy: headCY, r: headR)

        var neck = Path()
        neck.addRect(CGRect(x: cx - 4, y: headCY + headR, width: 8, height: h * 0.04))
        ctx.fill(neck, with: .color(Pal.skin))

        torso(ctx, cx: cx, topY: neckBottom, bottomY: torsoBottom, shoulderW: shoulderW, hipW: hipW, kimono: kimono)
        lowerBody(ctx, cx: cx, hipY: torsoBottom, bottomY: bottom, kimono: kimono)

        let shoulderY = neckBottom + 5

        arm(ctx, from: CGPoint(x: cx - shoulderW + 2, y: shoulderY),
            to: CGPoint(x: cx - shoulderW - 5, y: shoulderY + h * 0.2), width: 8, kimono: kimono)
        arm(ctx, from: CGPoint(x: cx + shoulderW - 2, y: shoulderY),
            to: CGPoint(x: cx + shoulderW + 5, y: shoulderY + h * 0.2), width: 8, kimono: kimono)
    }
}

// MARK: - Torii Gate Illustration

struct ToriiGateIllustration: View {
    let color: Color

    var body: some View {
        IllustrationFrame(color: color) {
            Canvas { context, size in
                let w = size.width
                let h = size.height

                // Sky gradient
                var sky = Path()
                sky.addRect(CGRect(x: 0, y: 0, width: w, height: h * 0.82))
                context.fill(sky, with: .linearGradient(
                    Gradient(colors: [Color(red: 0.95, green: 0.93, blue: 0.98).opacity(0.3), .clear]),
                    startPoint: .zero, endPoint: CGPoint(x: 0, y: h * 0.5)
                ))

                // Ground
                var ground = Path()
                ground.addRect(CGRect(x: 0, y: h * 0.80, width: w, height: h * 0.20))
                context.fill(ground, with: .linearGradient(
                    Gradient(colors: [Pal.ground, Pal.groundDk]),
                    startPoint: CGPoint(x: 0, y: h * 0.80), endPoint: CGPoint(x: 0, y: h)
                ))

                // Path stones
                for i in 0..<14 {
                    let x = w * 0.22 + CGFloat(i) * w * 0.042
                    var stone = Path()
                    stone.addRoundedRect(in: CGRect(x: x, y: h * 0.82, width: w * 0.03, height: 3),
                                         cornerSize: CGSize(width: 1.5, height: 1.5))
                    context.fill(stone, with: .color(Pal.groundDk.opacity(0.3)))
                }

                // Background trees
                for (tx, ty, tr) in [(w * 0.05, h * 0.70, 20.0), (w * 0.12, h * 0.66, 25.0),
                                     (w * 0.88, h * 0.70, 22.0), (w * 0.95, h * 0.68, 16.0)] as [(CGFloat, CGFloat, CGFloat)] {
                    var tree = Path()
                    tree.addEllipse(in: CGRect(x: tx - tr, y: ty - tr, width: tr * 2, height: tr * 1.5))
                    context.fill(tree, with: .color(Pal.green.opacity(0.25)))
                }

                // === Torii Gate ===
                let tcx = w * 0.52
                let pillarW: CGFloat = 14
                let pillarH = h * 0.46
                let topY = h * 0.18

                // Shadow
                var shadow = Path()
                shadow.addEllipse(in: CGRect(x: tcx - 55, y: h * 0.78, width: 110, height: 8))
                context.fill(shadow, with: .color(.black.opacity(0.06)))

                // Pillars
                for px in [tcx - 48, tcx + 34] as [CGFloat] {
                    var p = Path()
                    p.addRoundedRect(in: CGRect(x: px, y: topY + 22, width: pillarW, height: pillarH),
                                     cornerSize: CGSize(width: 3, height: 3))
                    context.fill(p, with: .linearGradient(
                        Gradient(colors: [Pal.verm, Pal.verm.opacity(0.85)]),
                        startPoint: CGPoint(x: px, y: topY), endPoint: CGPoint(x: px + pillarW, y: topY)
                    ))
                }

                // Pillar bases
                for bx in [tcx - 52, tcx + 30] as [CGFloat] {
                    var base = Path()
                    base.addRoundedRect(in: CGRect(x: bx, y: topY + 22 + pillarH - 2, width: 22, height: 8),
                                        cornerSize: CGSize(width: 2, height: 2))
                    context.fill(base, with: .color(Pal.stone))
                }

                // Kasagi (top beam with curved ends)
                var kasagi = Path()
                kasagi.move(to: CGPoint(x: tcx - 70, y: topY + 8))
                kasagi.addQuadCurve(to: CGPoint(x: tcx, y: topY), control: CGPoint(x: tcx - 35, y: topY - 4))
                kasagi.addQuadCurve(to: CGPoint(x: tcx + 70, y: topY + 8), control: CGPoint(x: tcx + 35, y: topY - 4))
                kasagi.addLine(to: CGPoint(x: tcx + 68, y: topY + 16))
                kasagi.addLine(to: CGPoint(x: tcx - 68, y: topY + 16))
                kasagi.closeSubpath()
                context.fill(kasagi, with: .color(Pal.verm))

                // Shimaki
                var shimaki = Path()
                shimaki.addRoundedRect(in: CGRect(x: tcx - 58, y: topY + 18, width: 116, height: 8),
                                       cornerSize: CGSize(width: 3, height: 3))
                context.fill(shimaki, with: .color(Pal.verm.opacity(0.9)))

                // Nuki
                var nuki = Path()
                nuki.addRoundedRect(in: CGRect(x: tcx - 45, y: topY + 32, width: 90, height: 7),
                                    cornerSize: CGSize(width: 3, height: 3))
                context.fill(nuki, with: .color(Pal.verm.opacity(0.85)))

                // Tablet
                var tablet = Path()
                tablet.addRoundedRect(in: CGRect(x: tcx - 12, y: topY + 20, width: 24, height: 14),
                                      cornerSize: CGSize(width: 2, height: 2))
                context.fill(tablet, with: .color(Pal.verm.opacity(0.65)))

                // Person bowing deeply toward torii
                Person.drawDeepBow(context, cx: w * 0.22, bottom: h * 0.79, h: h * 0.42,
                                   kimono: Pal.kimono1, facingRight: true)

                // Labels
                let bowLabel = Text("一礼")
                    .font(.system(size: 13, weight: .bold, design: .serif))
                    .foregroundStyle(color.opacity(0.6))
                context.draw(bowLabel, at: CGPoint(x: w * 0.22, y: h * 0.90))
            }
        }
    }
}

// MARK: - Bow Illustration (二礼)

struct BowIllustration: View {
    let color: Color
    let bowCount: Int

    var body: some View {
        IllustrationFrame(color: color) {
            Canvas { context, size in
                let w = size.width
                let h = size.height

                // Ground
                var ground = Path()
                ground.addRect(CGRect(x: 0, y: h * 0.78, width: w, height: h * 0.22))
                context.fill(ground, with: .linearGradient(
                    Gradient(colors: [Pal.ground.opacity(0.3), Pal.ground.opacity(0.5)]),
                    startPoint: CGPoint(x: 0, y: h * 0.78), endPoint: CGPoint(x: 0, y: h)
                ))

                // Offering box
                let boxX = w * 0.52
                let boxY = h * 0.48
                let boxW: CGFloat = 85
                let boxH: CGFloat = 48

                // Box shadow
                var bShadow = Path()
                bShadow.addEllipse(in: CGRect(x: boxX - 5, y: boxY + boxH, width: boxW + 10, height: 8))
                context.fill(bShadow, with: .color(.black.opacity(0.05)))

                // Box body
                var box = Path()
                box.addRoundedRect(in: CGRect(x: boxX, y: boxY, width: boxW, height: boxH),
                                   cornerSize: CGSize(width: 5, height: 5))
                context.fill(box, with: .linearGradient(
                    Gradient(colors: [Pal.wood, Pal.wood.opacity(0.75)]),
                    startPoint: CGPoint(x: boxX, y: boxY), endPoint: CGPoint(x: boxX, y: boxY + boxH)
                ))

                // Grill
                for i in 0..<6 {
                    let sx = boxX + 9 + CGFloat(i) * 13
                    var slat = Path()
                    slat.addRoundedRect(in: CGRect(x: sx, y: boxY + 2, width: 4, height: 14),
                                        cornerSize: CGSize(width: 1.5, height: 1.5))
                    context.fill(slat, with: .color(Pal.wood.opacity(0.4)))
                }

                let boxLabel = Text("賽銭箱").font(.system(size: 9, weight: .bold, design: .serif)).foregroundStyle(Pal.white.opacity(0.6))
                context.draw(boxLabel, at: CGPoint(x: boxX + boxW / 2, y: boxY + boxH / 2 + 9))

                // Bell rope
                let ropeCX = boxX + boxW / 2
                var rope = Path()
                rope.move(to: CGPoint(x: ropeCX, y: 0))
                rope.addLine(to: CGPoint(x: ropeCX, y: h * 0.18))
                context.stroke(rope, with: .color(Pal.verm.opacity(0.4)), style: StrokeStyle(lineWidth: 4, lineCap: .round))

                // Bell
                var bell = Path()
                bell.addEllipse(in: CGRect(x: ropeCX - 10, y: h * 0.14, width: 20, height: 18))
                context.fill(bell, with: .color(Pal.gold))

                // Tassels
                var tass = Path()
                tass.move(to: CGPoint(x: ropeCX, y: h * 0.18 + 14))
                tass.addLine(to: CGPoint(x: ropeCX - 8, y: h * 0.36))
                tass.move(to: CGPoint(x: ropeCX, y: h * 0.18 + 14))
                tass.addLine(to: CGPoint(x: ropeCX + 8, y: h * 0.36))
                context.stroke(tass, with: .color(Pal.verm.opacity(0.5)), style: StrokeStyle(lineWidth: 3, lineCap: .round))

                // Person bowing deeply
                Person.drawDeepBow(context, cx: w * 0.22, bottom: h * 0.77, h: h * 0.45,
                                   kimono: Pal.kimono1, facingRight: true)

                // Angle indicator (90°)
                let pivotX = w * 0.22
                let pivotY = h * 0.77 - h * 0.45 * 0.35
                var angleLine1 = Path()
                angleLine1.move(to: CGPoint(x: pivotX, y: pivotY))
                angleLine1.addLine(to: CGPoint(x: pivotX, y: pivotY - 18))
                context.stroke(angleLine1, with: .color(color.opacity(0.2)), style: StrokeStyle(lineWidth: 1, dash: [3, 2]))
                var angleLine2 = Path()
                angleLine2.move(to: CGPoint(x: pivotX, y: pivotY))
                angleLine2.addLine(to: CGPoint(x: pivotX + 18, y: pivotY))
                context.stroke(angleLine2, with: .color(color.opacity(0.2)), style: StrokeStyle(lineWidth: 1, dash: [3, 2]))
                // Arc
                var angleArc = Path()
                angleArc.addArc(center: CGPoint(x: pivotX, y: pivotY), radius: 10,
                                startAngle: .degrees(-90), endAngle: .degrees(0), clockwise: false)
                context.stroke(angleArc, with: .color(color.opacity(0.3)), style: StrokeStyle(lineWidth: 1.5))

                let angle90 = Text("90°").font(.system(size: 11, weight: .bold, design: .rounded)).foregroundStyle(color.opacity(0.45))
                context.draw(angle90, at: CGPoint(x: pivotX + 16, y: pivotY - 12))

                // ×2 badge
                let badge = Text("×\(bowCount)")
                    .font(.system(size: 18, weight: .black, design: .rounded))
                    .foregroundStyle(color.opacity(0.5))
                context.draw(badge, at: CGPoint(x: w * 0.22, y: h * 0.90))
            }
        }
    }
}

// MARK: - Clap Illustration (二拍手)

struct ClapIllustration: View {
    let color: Color

    var body: some View {
        IllustrationFrame(color: color) {
            HStack(spacing: 0) {
                Canvas { context, size in
                    let w = size.width
                    let h = size.height

                    // Ground
                    var ground = Path()
                    ground.addRect(CGRect(x: 0, y: h * 0.82, width: w, height: h * 0.18))
                    context.fill(ground, with: .color(Pal.ground.opacity(0.2)))

                    // Person clapping
                    Person.drawClapping(context, cx: w * 0.45, bottom: h * 0.81, h: h * 0.62,
                                        kimono: Pal.kimono1)

                    // ×2 badge near hands
                    let badge = Text("×2").font(.system(size: 18, weight: .black, design: .rounded)).foregroundStyle(color)
                    context.draw(badge, at: CGPoint(x: w * 0.75, y: h * 0.25))

                    // "パンパン" onomatopoeia
                    let sound = Text("パンパン").font(.system(size: 11, weight: .bold, design: .rounded)).foregroundStyle(color.opacity(0.5))
                    context.draw(sound, at: CGPoint(x: w * 0.75, y: h * 0.38))
                }
                .frame(maxWidth: .infinity)

                // Steps
                VStack(alignment: .leading, spacing: 8) {
                    stepRow(1, "Hands at chest", color, current: false)
                    stepRow(2, "Right hand lower", color, current: false)
                    stepRow(3, "Clap twice", color, current: true)
                    stepRow(4, "Align & pray", color, current: false)
                }
                .frame(width: 120)
                .padding(.trailing, 12)
            }
        }
    }
}

// MARK: - Temizu Illustration

struct TemizuIllustration: View {
    let color: Color
    let step: Int

    var body: some View {
        IllustrationFrame(color: color) {
            Canvas { context, size in
                let w = size.width
                let h = size.height

                // Ground
                var ground = Path()
                ground.addRect(CGRect(x: 0, y: h * 0.80, width: w, height: h * 0.20))
                context.fill(ground, with: .linearGradient(
                    Gradient(colors: [Pal.ground.opacity(0.2), Pal.ground.opacity(0.4)]),
                    startPoint: CGPoint(x: 0, y: h * 0.80), endPoint: CGPoint(x: 0, y: h)
                ))

                // === Stone basin (tsukubai) ===
                let basinCX = w * 0.35
                let basinTop = h * 0.48
                let basinW: CGFloat = 65
                let basinH: CGFloat = 40

                // Basin shadow
                var bShadow = Path()
                bShadow.addEllipse(in: CGRect(x: basinCX - basinW / 2 - 5, y: basinTop + basinH + 25, width: basinW + 10, height: 8))
                context.fill(bShadow, with: .color(.black.opacity(0.05)))

                // Pedestal
                var pedestal = Path()
                pedestal.addRoundedRect(in: CGRect(x: basinCX - 16, y: basinTop + basinH, width: 32, height: 30),
                                        cornerSize: CGSize(width: 3, height: 3))
                context.fill(pedestal, with: .color(Pal.stoneDk.opacity(0.6)))

                // Basin body
                var basin = Path()
                basin.move(to: CGPoint(x: basinCX - basinW / 2, y: basinTop))
                basin.addQuadCurve(to: CGPoint(x: basinCX + basinW / 2, y: basinTop),
                                   control: CGPoint(x: basinCX, y: basinTop - 8))
                basin.addLine(to: CGPoint(x: basinCX + basinW / 2 - 5, y: basinTop + basinH))
                basin.addLine(to: CGPoint(x: basinCX - basinW / 2 + 5, y: basinTop + basinH))
                basin.closeSubpath()
                context.fill(basin, with: .linearGradient(
                    Gradient(colors: [Pal.stone, Pal.stoneDk]),
                    startPoint: CGPoint(x: basinCX, y: basinTop), endPoint: CGPoint(x: basinCX, y: basinTop + basinH)
                ))

                // Water
                var water = Path()
                water.addEllipse(in: CGRect(x: basinCX - basinW / 2 + 6, y: basinTop + 3, width: basinW - 12, height: 14))
                context.fill(water, with: .linearGradient(
                    Gradient(colors: [Pal.water.opacity(0.6), Pal.waterDk.opacity(0.4)]),
                    startPoint: CGPoint(x: basinCX - 20, y: basinTop),
                    endPoint: CGPoint(x: basinCX + 20, y: basinTop + 12)
                ))

                // Bamboo kakei (vertical post + horizontal spout)
                let kakeiX = basinCX - basinW / 2 - 15

                var post = Path()
                post.addRoundedRect(in: CGRect(x: kakeiX, y: basinTop - 25, width: 6, height: basinH + 35),
                                    cornerSize: CGSize(width: 3, height: 3))
                context.fill(post, with: .color(Pal.green.opacity(0.7)))

                var spout = Path()
                spout.addRoundedRect(in: CGRect(x: kakeiX + 4, y: basinTop - 2, width: 35, height: 5),
                                     cornerSize: CGSize(width: 2, height: 2))
                context.fill(spout, with: .color(Color(red: 0.50, green: 0.60, blue: 0.35)))

                // Water stream from spout
                if step >= 1 && step <= 5 {
                    var stream = Path()
                    stream.move(to: CGPoint(x: kakeiX + 37, y: basinTop + 2))
                    stream.addQuadCurve(to: CGPoint(x: basinCX - 5, y: basinTop + 8),
                                        control: CGPoint(x: kakeiX + 40, y: basinTop + 5))
                    context.stroke(stream, with: .color(Pal.water.opacity(0.6)),
                                   style: StrokeStyle(lineWidth: 2.5, lineCap: .round))
                }

                // Person using ladle (reaching toward basin)
                let personCX = w * 0.68
                let ladleTarget = CGPoint(x: basinCX + 15, y: basinTop - 5)
                Person.drawUsingLadle(context, cx: personCX, bottom: h * 0.79, h: h * 0.50,
                                      kimono: Pal.kimono2, ladleTargetX: ladleTarget.x, ladleTargetY: ladleTarget.y)
            }
            .overlay(alignment: .trailing) {
                VStack(alignment: .leading, spacing: 4) {
                    let labels = ["Left hand", "Right hand", "Rinse mouth", "Left again", "Clean ladle"]
                    ForEach(0..<labels.count, id: \.self) { i in
                        HStack(spacing: 4) {
                            Circle()
                                .fill(i + 1 == step ? color : (i < step ? color.opacity(0.4) : color.opacity(0.12)))
                                .frame(width: 15, height: 15)
                                .overlay {
                                    if i < step - 1 {
                                        Text("✓").font(.system(size: 7, weight: .bold)).foregroundStyle(.white)
                                    } else {
                                        Text("\(i + 1)").font(.system(size: 7, weight: .bold))
                                            .foregroundStyle(i + 1 <= step ? .white : color.opacity(0.3))
                                    }
                                }
                            Text(labels[i])
                                .font(.system(size: 9, weight: i + 1 == step ? .bold : .regular))
                                .foregroundStyle(i < step ? color : color.opacity(0.3))
                        }
                    }
                }
                .padding(10)
                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 10))
                .padding(12)
            }
        }
    }
}

// MARK: - Prayer Hands (Temple)

struct PrayerHandsIllustration: View {
    let color: Color

    var body: some View {
        IllustrationFrame(color: color) {
            Canvas { context, size in
                let w = size.width
                let h = size.height

                // Subtle interior background
                var bg = Path()
                bg.addRect(CGRect(x: 0, y: 0, width: w, height: h))
                context.fill(bg, with: .linearGradient(
                    Gradient(colors: [Color(red: 0.28, green: 0.24, blue: 0.38).opacity(0.06), .clear]),
                    startPoint: .zero, endPoint: CGPoint(x: 0, y: h * 0.6)
                ))

                // Ground
                var ground = Path()
                ground.addRect(CGRect(x: 0, y: h * 0.80, width: w, height: h * 0.20))
                context.fill(ground, with: .color(Pal.ground.opacity(0.15)))

                // Incense wisps in background
                for i in 0..<4 {
                    let sx = w * 0.3 + CGFloat(i) * 22
                    var smoke = Path()
                    smoke.move(to: CGPoint(x: sx, y: h * 0.6))
                    smoke.addCurve(to: CGPoint(x: sx + 8, y: h * 0.1),
                                   control1: CGPoint(x: sx - 10, y: h * 0.4),
                                   control2: CGPoint(x: sx + 15, y: h * 0.2))
                    context.stroke(smoke, with: .color(color.opacity(0.06)),
                                   style: StrokeStyle(lineWidth: 2, lineCap: .round))
                }

                // Person praying peacefully
                Person.drawPraying(context, cx: w * 0.35, bottom: h * 0.79, h: h * 0.55,
                                   kimono: Color(red: 0.40, green: 0.35, blue: 0.55))

                // 合掌 label
                let gassho = Text("合掌").font(.system(size: 24, weight: .bold, design: .serif)).foregroundStyle(color)
                context.draw(gassho, at: CGPoint(x: w * 0.72, y: h * 0.30))

                let sub = Text("Silent prayer").font(.system(size: 11, weight: .medium)).foregroundStyle(color.opacity(0.45))
                context.draw(sub, at: CGPoint(x: w * 0.72, y: h * 0.42))
            }
            .overlay(alignment: .bottomTrailing) {
                HStack(spacing: 4) {
                    Canvas { ctx, size in
                        var l1 = Path()
                        l1.move(to: CGPoint(x: 2, y: 2))
                        l1.addLine(to: CGPoint(x: size.width - 2, y: size.height - 2))
                        var l2 = Path()
                        l2.move(to: CGPoint(x: size.width - 2, y: 2))
                        l2.addLine(to: CGPoint(x: 2, y: size.height - 2))
                        ctx.stroke(l1, with: .color(.red.opacity(0.6)), style: StrokeStyle(lineWidth: 2, lineCap: .round))
                        ctx.stroke(l2, with: .color(.red.opacity(0.6)), style: StrokeStyle(lineWidth: 2, lineCap: .round))
                    }
                    .frame(width: 12, height: 12)
                    Text("No clapping at temples")
                        .font(.system(size: 10, weight: .semibold))
                        .foregroundStyle(.red.opacity(0.6))
                }
                .padding(.horizontal, 10)
                .padding(.vertical, 6)
                .background(.red.opacity(0.06), in: Capsule())
                .padding(12)
            }
        }
    }
}

// MARK: - Goshuincho Book

struct GoshuinchoIllustration: View {
    let color: Color
    let step: Int

    var body: some View {
        IllustrationFrame(color: color) {
            HStack(spacing: 0) {
                Canvas { context, size in
                    let w = size.width
                    let h = size.height

                    // Table
                    var table = Path()
                    table.addRect(CGRect(x: 0, y: h * 0.65, width: w, height: h * 0.35))
                    context.fill(table, with: .linearGradient(
                        Gradient(colors: [Pal.wood.opacity(0.15), Pal.wood.opacity(0.25)]),
                        startPoint: CGPoint(x: 0, y: h * 0.65), endPoint: CGPoint(x: 0, y: h)
                    ))

                    // Book shadow
                    var bookShadow = Path()
                    bookShadow.addEllipse(in: CGRect(x: w * 0.12, y: h * 0.59, width: w * 0.7, height: 10))
                    context.fill(bookShadow, with: .color(.black.opacity(0.06)))

                    // Open goshuincho
                    let bx = w * 0.15
                    let by = h * 0.15
                    let bw = w * 0.65
                    let bh = h * 0.44

                    // Back cover shadow
                    var backCover = Path()
                    backCover.addRoundedRect(in: CGRect(x: bx + 2, y: by + 2, width: bw, height: bh),
                                             cornerSize: CGSize(width: 4, height: 4))
                    context.fill(backCover, with: .color(Pal.verm.opacity(0.25)))

                    // Pages
                    var pages = Path()
                    pages.addRoundedRect(in: CGRect(x: bx, y: by, width: bw, height: bh),
                                         cornerSize: CGSize(width: 4, height: 4))
                    context.fill(pages, with: .linearGradient(
                        Gradient(colors: [Pal.paper, Color(red: 0.94, green: 0.91, blue: 0.85)]),
                        startPoint: CGPoint(x: bx, y: by), endPoint: CGPoint(x: bx + bw, y: by + bh)
                    ))
                    context.stroke(pages, with: .color(color.opacity(0.15)), lineWidth: 1)

                    // Center fold
                    var fold = Path()
                    fold.move(to: CGPoint(x: bx + bw / 2, y: by + 4))
                    fold.addLine(to: CGPoint(x: bx + bw / 2, y: by + bh - 4))
                    context.stroke(fold, with: .color(.black.opacity(0.06)), style: StrokeStyle(lineWidth: 1.5))

                    // Left page — date text
                    for i in 0..<4 {
                        let ly = by + 12 + CGFloat(i) * 12
                        var line = Path()
                        line.addRoundedRect(in: CGRect(x: bx + 8, y: ly, width: bw * 0.3 - CGFloat(i) * 8, height: 2.5),
                                            cornerSize: CGSize(width: 1, height: 1))
                        context.fill(line, with: .color(.black.opacity(0.08)))
                    }

                    if step >= 3 {
                        // Right page — calligraphy
                        let pr = bx + bw / 2 + 8
                        for i in 0..<3 {
                            let sx = pr + CGFloat(i) * 14 + 5
                            var stroke = Path()
                            stroke.move(to: CGPoint(x: sx, y: by + 10))
                            stroke.addCurve(to: CGPoint(x: sx + 2, y: by + bh * 0.6 + CGFloat(i) * 5),
                                            control1: CGPoint(x: sx - 3, y: by + bh * 0.2),
                                            control2: CGPoint(x: sx + 4, y: by + bh * 0.4))
                            context.stroke(stroke, with: .color(.black.opacity(0.5 - Double(i) * 0.1)),
                                           style: StrokeStyle(lineWidth: 2.5, lineCap: .round))
                        }

                        // Seal
                        let sealX = pr + bw * 0.25
                        let sealY = by + bh * 0.55
                        var seal = Path()
                        seal.addRect(CGRect(x: sealX - 10, y: sealY - 10, width: 20, height: 20))
                        context.fill(seal, with: .color(Pal.verm.opacity(0.25)))
                        context.stroke(seal, with: .color(Pal.verm.opacity(0.5)), lineWidth: 1.5)
                        let sealChar = Text("印").font(.system(size: 9, weight: .bold, design: .serif)).foregroundStyle(Pal.verm.opacity(0.6))
                        context.draw(sealChar, at: CGPoint(x: sealX, y: sealY))
                    }

                    // Decorative border
                    var border = Path()
                    border.addRoundedRect(in: CGRect(x: bx + 4, y: by + 4, width: bw - 8, height: bh - 8),
                                          cornerSize: CGSize(width: 2, height: 2))
                    context.stroke(border, with: .color(color.opacity(0.08)), lineWidth: 0.5)
                }
                .frame(maxWidth: .infinity)

                VStack(alignment: .leading, spacing: 6) {
                    let steps = ["Get goshuincho", "Worship first", "Hand to priest", "Pay ¥300–500", "Receive back"]
                    ForEach(0..<steps.count, id: \.self) { i in
                        HStack(spacing: 5) {
                            Circle()
                                .fill(i < step ? color : color.opacity(0.12))
                                .frame(width: 16, height: 16)
                                .overlay {
                                    if i < step - 1 {
                                        Text("✓").font(.system(size: 7, weight: .bold)).foregroundStyle(.white)
                                    } else {
                                        Text("\(i + 1)").font(.system(size: 8, weight: .bold))
                                            .foregroundStyle(i + 1 <= step ? .white : color.opacity(0.3))
                                    }
                                }
                            Text(steps[i])
                                .font(.system(size: 9, weight: i + 1 == step ? .bold : .regular))
                                .foregroundStyle(i < step ? color : color.opacity(0.3))
                        }
                    }
                }
                .frame(width: 120)
                .padding(.trailing, 12)
            }
        }
    }
}

// MARK: - Incense Illustration

struct IncenseIllustration: View {
    let color: Color

    var body: some View {
        IllustrationFrame(color: color) {
            Canvas { context, size in
                let w = size.width
                let h = size.height

                // Ground
                var ground = Path()
                ground.addRect(CGRect(x: 0, y: h * 0.78, width: w, height: h * 0.22))
                context.fill(ground, with: .color(Pal.ground.opacity(0.15)))

                // === Incense burner ===
                let burnerCX = w * 0.38
                let burnerTop = h * 0.40

                // Burner legs
                for dx: CGFloat in [-22, 0, 22] {
                    var leg = Path()
                    leg.addRoundedRect(in: CGRect(x: burnerCX + dx - 3, y: burnerTop + 44, width: 6, height: 16),
                                       cornerSize: CGSize(width: 2, height: 2))
                    context.fill(leg, with: .color(Pal.stoneDk.opacity(0.6)))
                }

                // Burner body
                var burner = Path()
                burner.move(to: CGPoint(x: burnerCX - 38, y: burnerTop + 8))
                burner.addQuadCurve(to: CGPoint(x: burnerCX + 38, y: burnerTop + 8),
                                    control: CGPoint(x: burnerCX, y: burnerTop - 5))
                burner.addLine(to: CGPoint(x: burnerCX + 33, y: burnerTop + 46))
                burner.addLine(to: CGPoint(x: burnerCX - 33, y: burnerTop + 46))
                burner.closeSubpath()
                context.fill(burner, with: .linearGradient(
                    Gradient(colors: [Pal.stone, Pal.stoneDk]),
                    startPoint: CGPoint(x: burnerCX, y: burnerTop), endPoint: CGPoint(x: burnerCX, y: burnerTop + 46)
                ))

                // Ash
                var ash = Path()
                ash.addEllipse(in: CGRect(x: burnerCX - 30, y: burnerTop + 5, width: 60, height: 12))
                context.fill(ash, with: .color(Color(red: 0.82, green: 0.80, blue: 0.76).opacity(0.6)))

                // Incense sticks
                let stickColors: [Color] = [
                    Color(red: 0.50, green: 0.30, blue: 0.15),
                    Color(red: 0.55, green: 0.35, blue: 0.18),
                    Color(red: 0.48, green: 0.28, blue: 0.13)
                ]
                for i in 0..<3 {
                    let sx = burnerCX - 4 + CGFloat(i) * 6
                    let topY = burnerTop - 22 + CGFloat(i) * 3
                    var stick = Path()
                    stick.move(to: CGPoint(x: sx, y: burnerTop + 8))
                    stick.addLine(to: CGPoint(x: sx + CGFloat(i - 1) * 2, y: topY))
                    context.stroke(stick, with: .color(stickColors[i]), style: StrokeStyle(lineWidth: 2, lineCap: .round))

                    // Ember
                    var glow = Path()
                    glow.addEllipse(in: CGRect(x: sx + CGFloat(i - 1) * 2 - 2.5, y: topY - 2, width: 5, height: 5))
                    context.fill(glow, with: .color(Color.orange.opacity(0.7)))
                }

                // Smoke
                for i in 0..<5 {
                    let sx = burnerCX - 3 + CGFloat(i) * 5
                    let drift = CGFloat(i % 2 == 0 ? -1 : 1) * 15
                    var smoke = Path()
                    smoke.move(to: CGPoint(x: sx, y: burnerTop - 20))
                    smoke.addCurve(to: CGPoint(x: sx + drift, y: h * 0.02),
                                   control1: CGPoint(x: sx - drift * 0.3, y: burnerTop - 42),
                                   control2: CGPoint(x: sx + drift * 0.8, y: h * 0.10))
                    context.stroke(smoke, with: .color(color.opacity(0.08 + Double(i) * 0.015)),
                                   style: StrokeStyle(lineWidth: 2 + CGFloat(i) * 0.3, lineCap: .round))
                }

                // Person fanning smoke toward themselves
                Person.drawFanning(context, cx: w * 0.72, bottom: h * 0.77, h: h * 0.45,
                                   kimono: Pal.kimono2)

                // Curved arrow showing "smoke toward self"
                var arrow = Path()
                arrow.move(to: CGPoint(x: w * 0.52, y: h * 0.25))
                arrow.addQuadCurve(to: CGPoint(x: w * 0.68, y: h * 0.35),
                                   control: CGPoint(x: w * 0.64, y: h * 0.20))
                context.stroke(arrow, with: .color(color.opacity(0.3)),
                               style: StrokeStyle(lineWidth: 1.5, lineCap: .round, dash: [4, 3]))

                // Arrowhead
                var ah = Path()
                ah.move(to: CGPoint(x: w * 0.68, y: h * 0.35))
                ah.addLine(to: CGPoint(x: w * 0.655, y: h * 0.32))
                ah.move(to: CGPoint(x: w * 0.68, y: h * 0.35))
                ah.addLine(to: CGPoint(x: w * 0.665, y: h * 0.38))
                context.stroke(ah, with: .color(color.opacity(0.3)),
                               style: StrokeStyle(lineWidth: 1.5, lineCap: .round))
            }
            .overlay(alignment: .bottomTrailing) {
                VStack(alignment: .leading, spacing: 3) {
                    Text("Fan smoke toward yourself")
                        .font(.system(size: 10, weight: .medium))
                        .foregroundStyle(color.opacity(0.6))
                    HStack(spacing: 4) {
                        Canvas { ctx, sz in
                            var l1 = Path()
                            l1.move(to: CGPoint(x: 2, y: 2))
                            l1.addLine(to: CGPoint(x: sz.width - 2, y: sz.height - 2))
                            var l2 = Path()
                            l2.move(to: CGPoint(x: sz.width - 2, y: 2))
                            l2.addLine(to: CGPoint(x: 2, y: sz.height - 2))
                            ctx.stroke(l1, with: .color(.red.opacity(0.6)), style: StrokeStyle(lineWidth: 1.5, lineCap: .round))
                            ctx.stroke(l2, with: .color(.red.opacity(0.6)), style: StrokeStyle(lineWidth: 1.5, lineCap: .round))
                        }
                        .frame(width: 10, height: 10)
                        Text("Don't blow out flame")
                            .font(.system(size: 9, weight: .semibold))
                            .foregroundStyle(.red.opacity(0.5))
                    }
                }
                .padding(10)
                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 8))
                .padding(12)
            }
        }
    }
}

// MARK: - Omikuji Fortune

struct OmikujiIllustration: View {
    let color: Color

    var body: some View {
        IllustrationFrame(color: color) {
            Canvas { context, size in
                let w = size.width
                let h = size.height

                // Background dots
                for ix in stride(from: CGFloat(0), to: w, by: 30) {
                    for iy in stride(from: CGFloat(0), to: h, by: 30) {
                        var dot = Path()
                        dot.addEllipse(in: CGRect(x: ix + 12, y: iy + 12, width: 2, height: 2))
                        context.fill(dot, with: .color(color.opacity(0.04)))
                    }
                }

                // Fortune paper
                let px = w * 0.08
                let py = h * 0.10
                let pw = w * 0.38
                let ph = h * 0.75

                var paperSh = Path()
                paperSh.addRoundedRect(in: CGRect(x: px + 3, y: py + 3, width: pw, height: ph),
                                       cornerSize: CGSize(width: 4, height: 4))
                context.fill(paperSh, with: .color(.black.opacity(0.06)))

                var paper = Path()
                paper.addRoundedRect(in: CGRect(x: px, y: py, width: pw, height: ph),
                                     cornerSize: CGSize(width: 4, height: 4))
                context.fill(paper, with: .linearGradient(
                    Gradient(colors: [.white, Pal.paper]),
                    startPoint: CGPoint(x: px, y: py), endPoint: CGPoint(x: px, y: py + ph)
                ))
                context.stroke(paper, with: .color(color.opacity(0.12)), lineWidth: 1)

                // Top border
                var topBorder = Path()
                topBorder.addRect(CGRect(x: px + 6, y: py + 6, width: pw - 12, height: 3))
                context.fill(topBorder, with: .color(Pal.verm.opacity(0.2)))

                // 大吉
                let daikichi = Text("大吉").font(.system(size: 28, weight: .black, design: .serif)).foregroundStyle(Pal.verm)
                context.draw(daikichi, at: CGPoint(x: px + pw / 2, y: py + ph * 0.25))

                var divider = Path()
                divider.move(to: CGPoint(x: px + 10, y: py + ph * 0.38))
                divider.addLine(to: CGPoint(x: px + pw - 10, y: py + ph * 0.38))
                context.stroke(divider, with: .color(color.opacity(0.1)), lineWidth: 0.8)

                for i in 0..<5 {
                    let ly = py + ph * 0.44 + CGFloat(i) * 11
                    let lw = pw * 0.7 - CGFloat(i % 2) * 15
                    var line = Path()
                    line.addRoundedRect(in: CGRect(x: px + (pw - lw) / 2, y: ly, width: lw, height: 2.5),
                                        cornerSize: CGSize(width: 1, height: 1))
                    context.fill(line, with: .color(.black.opacity(0.07)))
                }

                var seal = Path()
                seal.addEllipse(in: CGRect(x: px + pw / 2 - 8, y: py + ph * 0.78, width: 16, height: 16))
                context.fill(seal, with: .color(Pal.verm.opacity(0.15)))

                // === Tying rack ===
                let rackX = w * 0.55
                let rackY = h * 0.15
                let rackW = w * 0.38
                let rackH = h * 0.45

                // Posts
                for dx in [CGFloat(0), rackW - 6] {
                    var p = Path()
                    p.addRoundedRect(in: CGRect(x: rackX + dx, y: rackY - 5, width: 6, height: rackH + 15),
                                     cornerSize: CGSize(width: 2, height: 2))
                    context.fill(p, with: .color(Pal.wood.opacity(0.5)))
                }

                // Bars
                for i in 0..<3 {
                    let by = rackY + CGFloat(i) * (rackH / 2)
                    var bar = Path()
                    bar.addRoundedRect(in: CGRect(x: rackX, y: by, width: rackW, height: 5),
                                       cornerSize: CGSize(width: 2, height: 2))
                    context.fill(bar, with: .color(Pal.wood.opacity(0.6)))
                }

                // Hanging papers
                for row in 0..<2 {
                    let barY = rackY + 5 + CGFloat(row) * (rackH / 2)
                    for i in 0..<7 {
                        let slipX = rackX + 8 + CGFloat(i) * (rackW - 16) / 7
                        let slipH: CGFloat = 14 + CGFloat((i + row) % 3) * 5
                        var slip = Path()
                        slip.addRoundedRect(in: CGRect(x: slipX, y: barY, width: 5, height: slipH),
                                            cornerSize: CGSize(width: 1, height: 1))
                        context.fill(slip, with: .color(Color.white.opacity(0.9)))
                        context.stroke(slip, with: .color(color.opacity(0.08)), lineWidth: 0.5)
                    }
                }

                // Labels
                let good = Text("Good → Keep it!").font(.system(size: 11, weight: .semibold)).foregroundStyle(color)
                context.draw(good, at: CGPoint(x: w * 0.73, y: h * 0.75))
                let bad = Text("Bad → Tie it here").font(.system(size: 10, weight: .medium)).foregroundStyle(color.opacity(0.5))
                context.draw(bad, at: CGPoint(x: w * 0.73, y: h * 0.85))

                var tieArrow = Path()
                tieArrow.move(to: CGPoint(x: w * 0.73, y: h * 0.88))
                tieArrow.addLine(to: CGPoint(x: w * 0.73, y: h * 0.62))
                context.stroke(tieArrow, with: .color(color.opacity(0.2)),
                               style: StrokeStyle(lineWidth: 1, lineCap: .round, dash: [3, 2]))
            }
        }
    }
}

// MARK: - Coin Offering

struct CoinOfferingIllustration: View {
    let color: Color

    var body: some View {
        IllustrationFrame(color: color) {
            Canvas { context, size in
                let w = size.width
                let h = size.height

                // Ground
                var ground = Path()
                ground.addRect(CGRect(x: 0, y: h * 0.78, width: w, height: h * 0.22))
                context.fill(ground, with: .color(Pal.ground.opacity(0.2)))

                // Offering box
                let boxX = w * 0.40
                let boxY = h * 0.48
                let boxW: CGFloat = 85
                let boxH: CGFloat = 48

                var bShadow = Path()
                bShadow.addEllipse(in: CGRect(x: boxX - 5, y: boxY + boxH, width: boxW + 10, height: 8))
                context.fill(bShadow, with: .color(.black.opacity(0.05)))

                var box = Path()
                box.addRoundedRect(in: CGRect(x: boxX, y: boxY, width: boxW, height: boxH),
                                   cornerSize: CGSize(width: 5, height: 5))
                context.fill(box, with: .linearGradient(
                    Gradient(colors: [Pal.wood, Pal.wood.opacity(0.75)]),
                    startPoint: CGPoint(x: boxX, y: boxY), endPoint: CGPoint(x: boxX, y: boxY + boxH)
                ))

                for i in 0..<7 {
                    let sx = boxX + 7 + CGFloat(i) * 11
                    var slat = Path()
                    slat.addRoundedRect(in: CGRect(x: sx, y: boxY + 2, width: 4, height: 13),
                                        cornerSize: CGSize(width: 1.5, height: 1.5))
                    context.fill(slat, with: .color(Pal.wood.opacity(0.4)))
                }

                let boxLabel = Text("賽銭箱").font(.system(size: 9, weight: .bold, design: .serif)).foregroundStyle(Pal.white.opacity(0.6))
                context.draw(boxLabel, at: CGPoint(x: boxX + boxW / 2, y: boxY + boxH / 2 + 9))

                // Person tossing coin (arm extended!)
                Person.drawTossing(context, cx: w * 0.16, bottom: h * 0.77, h: h * 0.48,
                                   kimono: Pal.kimono1)

                // 5-yen coin (large, in the air)
                let coinX = w * 0.42
                let coinY = h * 0.18
                let coinR: CGFloat = 16

                var coin = Path()
                coin.addEllipse(in: CGRect(x: coinX - coinR, y: coinY - coinR, width: coinR * 2, height: coinR * 2))
                context.fill(coin, with: .linearGradient(
                    Gradient(colors: [Pal.goldLt, Pal.gold]),
                    startPoint: CGPoint(x: coinX - coinR, y: coinY - coinR),
                    endPoint: CGPoint(x: coinX + coinR, y: coinY + coinR)
                ))
                context.stroke(coin, with: .color(Pal.gold.opacity(0.6)), lineWidth: 1.5)

                var hole = Path()
                hole.addEllipse(in: CGRect(x: coinX - 4, y: coinY - 4, width: 8, height: 8))
                context.fill(hole, with: .color(Color(red: 0.95, green: 0.93, blue: 0.88)))
                context.stroke(hole, with: .color(Pal.gold.opacity(0.4)), lineWidth: 1)

                // Flight arc from coin to box
                var arc = Path()
                arc.move(to: CGPoint(x: coinX, y: coinY + coinR))
                arc.addQuadCurve(to: CGPoint(x: boxX + boxW / 2, y: boxY),
                                 control: CGPoint(x: coinX + 35, y: coinY - 8))
                context.stroke(arc, with: .color(color.opacity(0.2)),
                               style: StrokeStyle(lineWidth: 1.5, dash: [5, 3]))

                // Sparkles on coin
                for angle in stride(from: 0.0, to: 360.0, by: 45.0) {
                    let rad = angle * .pi / 180
                    let r1: CGFloat = coinR + 3
                    let r2: CGFloat = coinR + 7
                    var sparkle = Path()
                    sparkle.move(to: CGPoint(x: coinX + cos(rad) * r1, y: coinY + sin(rad) * r1))
                    sparkle.addLine(to: CGPoint(x: coinX + cos(rad) * r2, y: coinY + sin(rad) * r2))
                    context.stroke(sparkle, with: .color(Pal.gold.opacity(0.3)),
                                   style: StrokeStyle(lineWidth: 1, lineCap: .round))
                }
            }
            .overlay(alignment: .bottomTrailing) {
                VStack(alignment: .leading, spacing: 4) {
                    HStack(spacing: 3) {
                        Text("5円").font(.system(size: 20, weight: .bold, design: .rounded)).foregroundStyle(Pal.gold)
                        Text("=").font(.system(size: 13)).foregroundStyle(color.opacity(0.3))
                        Text("ご縁").font(.system(size: 20, weight: .bold, design: .serif)).foregroundStyle(color)
                    }
                    Text("\"good connection\"")
                        .font(.system(size: 9, weight: .medium))
                        .foregroundStyle(color.opacity(0.4))
                    Text("Toss gently — don't throw")
                        .font(.system(size: 9, weight: .medium))
                        .foregroundStyle(color.opacity(0.5))
                }
                .padding(10)
                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 10))
                .padding(12)
            }
        }
    }
}

// MARK: - Helper: Step Row

private func stepRow(_ num: Int, _ text: String, _ color: Color, current: Bool) -> some View {
    HStack(spacing: 5) {
        Circle()
            .fill(current ? color : color.opacity(0.15))
            .frame(width: 18, height: 18)
            .overlay {
                Text("\(num)").font(.system(size: 9, weight: .bold))
                    .foregroundStyle(current ? .white : color.opacity(0.4))
            }
        Text(text)
            .font(.system(size: 10, weight: current ? .bold : .regular))
            .foregroundStyle(current ? color : color.opacity(0.4))
    }
}

// MARK: - Previews

#Preview("All Illustrations") {
    ScrollView {
        VStack(spacing: 16) {
            ToriiGateIllustration(color: .vermillion)
            BowIllustration(color: .vermillion, bowCount: 2)
            ClapIllustration(color: .vermillion)
            CoinOfferingIllustration(color: .vermillion)
            TemizuIllustration(color: Color(red: 0.15, green: 0.30, blue: 0.60), step: 3)
            PrayerHandsIllustration(color: .indigo)
            IncenseIllustration(color: .indigo)
            GoshuinchoIllustration(color: Color(red: 0.20, green: 0.55, blue: 0.30), step: 3)
            OmikujiIllustration(color: Color(red: 0.60, green: 0.40, blue: 0.15))
        }
        .padding()
    }
}
