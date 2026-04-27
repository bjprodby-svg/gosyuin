import SwiftUI

// MARK: - Style Sample Container
//
// Phase 1 — Style Exploration
// 「鳥居でお辞儀 (Torii Bow)」を 3 つの異なるスタイルで試作。
// Xcode プレビュー、もしくは Learn タブから #if DEBUG で呼び出して比較する。

struct IllustrationStyleSamplesView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: DS.Spacing.xl) {
                VStack(alignment: .leading, spacing: DS.Spacing.xs) {
                    Text("PHASE 1 · STYLE EXPLORATION")
                        .font(DS.Font.sectionLabel)
                        .foregroundStyle(Color.vermillion)
                        .tracking(1.5)
                    Text("Learn Tab イラストスタイル比較")
                        .font(.title2.bold())
                        .foregroundStyle(Color.bodyText)
                    Text("同じシーン「鳥居でお辞儀」を 3 スタイルで描き分けました。")
                        .font(.subheadline)
                        .foregroundStyle(Color.subtitleText)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, DS.Spacing.lg)
                .padding(.top, DS.Spacing.lg)

                styleCard(tag: "STYLE A", title: "フラットイラスト",
                          description: "幾何学的でモダン。Notion や Headspace 風。テクスチャなし、色面主体。") {
                    FlatToriiBowIllustration()
                }

                styleCard(tag: "STYLE B", title: "和風水彩タッチ",
                          description: "和紙の質感とにじみ。御朱印帳テーマに最も親和性が高い。温かみと情緒。") {
                    WatercolorToriiBowIllustration()
                }

                styleCard(tag: "STYLE C", title: "線画 + ワンポイントカラー",
                          description: "細い黒線画 + 朱色の差し色のみ。上品で洗練された和風ガイドブック風。") {
                    LineArtToriiBowIllustration()
                }
            }
            .padding(.bottom, DS.Spacing.xxl)
        }
        .background(Color.pageBackground)
    }

    @ViewBuilder
    private func styleCard<Content: View>(tag: String, title: String, description: String, @ViewBuilder content: () -> Content) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            content()
                .frame(height: 240)
                .frame(maxWidth: .infinity)
                .clipShape(UnevenRoundedRectangle(topLeadingRadius: DS.Radius.lg, topTrailingRadius: DS.Radius.lg))

            VStack(alignment: .leading, spacing: DS.Spacing.sm) {
                Text(tag)
                    .font(DS.Font.sectionLabel)
                    .foregroundStyle(Color.vermillion)
                    .tracking(1.5)
                Text(title)
                    .font(.headline)
                    .foregroundStyle(Color.bodyText)
                Text(description)
                    .font(.subheadline)
                    .foregroundStyle(Color.subtitleText)
                    .fixedSize(horizontal: false, vertical: true)
            }
            .padding(DS.Spacing.lg)
        }
        .background(Color.cardBackground, in: RoundedRectangle(cornerRadius: DS.Radius.lg))
        .shadow(color: .black.opacity(0.06), radius: 6, y: 2)
        .padding(.horizontal, DS.Spacing.lg)
    }
}

// MARK: - STYLE A: Flat Illustration

struct FlatToriiBowIllustration: View {
    var body: some View {
        Canvas { ctx, size in
            let w = size.width, h = size.height

            // Sky gradient
            ctx.fill(
                Path(CGRect(origin: .zero, size: size)),
                with: .linearGradient(
                    Gradient(colors: [
                        Color(red: 0.98, green: 0.97, blue: 0.94),
                        Color(red: 0.94, green: 0.92, blue: 0.87)
                    ]),
                    startPoint: .zero,
                    endPoint: CGPoint(x: 0, y: h)
                )
            )

            // Hills
            var hill1 = Path()
            hill1.move(to: CGPoint(x: 0, y: h * 0.75))
            hill1.addQuadCurve(to: CGPoint(x: w * 0.5, y: h * 0.72), control: CGPoint(x: w * 0.25, y: h * 0.68))
            hill1.addQuadCurve(to: CGPoint(x: w, y: h * 0.74), control: CGPoint(x: w * 0.75, y: h * 0.7))
            hill1.addLine(to: CGPoint(x: w, y: h))
            hill1.addLine(to: CGPoint(x: 0, y: h))
            hill1.closeSubpath()
            ctx.fill(hill1, with: .color(Color(red: 0.85, green: 0.82, blue: 0.72).opacity(0.6)))

            // Trees (simple circles)
            let treeColor1 = Color(red: 0.54, green: 0.65, blue: 0.45)
            let treeColor2 = Color(red: 0.65, green: 0.74, blue: 0.52)
            ctx.fill(Path(ellipseIn: CGRect(x: w * 0.05, y: h * 0.6, width: 100, height: 100)), with: .color(treeColor1))
            ctx.fill(Path(ellipseIn: CGRect(x: w * 0.12, y: h * 0.58, width: 76, height: 76)), with: .color(treeColor2))
            ctx.fill(Path(ellipseIn: CGRect(x: w * 0.82, y: h * 0.6, width: 96, height: 96)), with: .color(treeColor1))
            ctx.fill(Path(ellipseIn: CGRect(x: w * 0.77, y: h * 0.62, width: 68, height: 68)), with: .color(treeColor2))

            // Ground
            var ground = Path()
            ground.addRect(CGRect(x: 0, y: h * 0.84, width: w, height: h * 0.16))
            ctx.fill(ground, with: .color(Color(red: 0.89, green: 0.84, blue: 0.72)))

            // Path stones
            for sx in stride(from: w * 0.20, through: w * 0.78, by: w * 0.10) {
                ctx.fill(Path(ellipseIn: CGRect(x: sx, y: h * 0.90, width: 36, height: 10)),
                         with: .color(Color(red: 0.72, green: 0.66, blue: 0.54).opacity(0.7)))
            }

            // TORII — flat geometric
            let tcx = w * 0.64
            let ttop = h * 0.24

            let vermillion = Color(red: 0.83, green: 0.28, blue: 0.19)
            let vermillionDk = Color(red: 0.72, green: 0.23, blue: 0.14)

            // Top beam (kasagi) with curve
            var kasagi = Path()
            kasagi.move(to: CGPoint(x: tcx - 150, y: ttop))
            kasagi.addQuadCurve(to: CGPoint(x: tcx, y: ttop - 18), control: CGPoint(x: tcx - 75, y: ttop - 12))
            kasagi.addQuadCurve(to: CGPoint(x: tcx + 150, y: ttop), control: CGPoint(x: tcx + 75, y: ttop - 12))
            kasagi.addLine(to: CGPoint(x: tcx + 145, y: ttop + 22))
            kasagi.addLine(to: CGPoint(x: tcx - 145, y: ttop + 22))
            kasagi.closeSubpath()
            ctx.fill(kasagi, with: .linearGradient(
                Gradient(colors: [vermillion, vermillionDk]),
                startPoint: CGPoint(x: tcx, y: ttop - 18),
                endPoint: CGPoint(x: tcx, y: ttop + 22)
            ))

            // Second beam
            ctx.fill(Path(CGRect(x: tcx - 130, y: ttop + 34, width: 260, height: 14)), with: .color(vermillionDk))
            // Tablet
            ctx.fill(Path(roundedRect: CGRect(x: tcx - 25, y: ttop + 28, width: 50, height: 32), cornerRadius: 2),
                     with: .color(Color(red: 0.60, green: 0.18, blue: 0.10)))
            // Pillars
            ctx.fill(Path(CGRect(x: tcx - 110, y: ttop + 48, width: 22, height: 260)), with: .color(vermillion))
            ctx.fill(Path(CGRect(x: tcx + 88, y: ttop + 48, width: 22, height: 260)), with: .color(vermillion))
            // Pillar bases
            ctx.fill(Path(roundedRect: CGRect(x: tcx - 116, y: ttop + 305, width: 34, height: 8), cornerRadius: 2),
                     with: .color(Color(red: 0.4, green: 0.4, blue: 0.4)))
            ctx.fill(Path(roundedRect: CGRect(x: tcx + 82, y: ttop + 305, width: 34, height: 8), cornerRadius: 2),
                     with: .color(Color(red: 0.4, green: 0.4, blue: 0.4)))

            // Person bowing — flat geometric
            FlatPerson.drawBowing(ctx, cx: w * 0.30, bottom: h * 0.86, h: h * 0.55)

            // 一礼 label
            let label = Text("一礼")
                .font(.system(size: 14, weight: .bold, design: .serif))
                .foregroundStyle(vermillion.opacity(0.7))
            ctx.draw(label, at: CGPoint(x: w * 0.30, y: h * 0.94))
        }
    }
}

private enum FlatPerson {
    static let skin = Color(red: 0.91, green: 0.78, blue: 0.65)
    static let kimono = Color(red: 0.29, green: 0.42, blue: 0.56)
    static let hakama = Color(red: 0.18, green: 0.24, blue: 0.36)
    static let obi = Color(red: 0.48, green: 0.36, blue: 0.42)
    static let hair = Color(red: 0.16, green: 0.12, blue: 0.10)
    static let collar = Color(red: 0.96, green: 0.94, blue: 0.89)

    static func drawBowing(_ ctx: GraphicsContext, cx: CGFloat, bottom: CGFloat, h: CGFloat) {
        // Shadow
        ctx.fill(Path(ellipseIn: CGRect(x: cx - 48, y: bottom + 4, width: 96, height: 10)),
                 with: .color(.black.opacity(0.1)))

        // Legs (hakama)
        var legL = Path()
        legL.move(to: CGPoint(x: cx - 22, y: bottom - h * 0.4))
        legL.addLine(to: CGPoint(x: cx - 26, y: bottom))
        legL.addLine(to: CGPoint(x: cx - 8, y: bottom))
        legL.addLine(to: CGPoint(x: cx - 6, y: bottom - h * 0.4))
        legL.closeSubpath()
        ctx.fill(legL, with: .color(hakama))

        var legR = Path()
        legR.move(to: CGPoint(x: cx + 6, y: bottom - h * 0.4))
        legR.addLine(to: CGPoint(x: cx + 8, y: bottom))
        legR.addLine(to: CGPoint(x: cx + 26, y: bottom))
        legR.addLine(to: CGPoint(x: cx + 22, y: bottom - h * 0.4))
        legR.closeSubpath()
        ctx.fill(legR, with: .color(hakama))

        // Feet
        ctx.fill(Path(ellipseIn: CGRect(x: cx - 31, y: bottom - 2, width: 28, height: 8)),
                 with: .color(Color(red: 0.22, green: 0.16, blue: 0.12)))
        ctx.fill(Path(ellipseIn: CGRect(x: cx + 3, y: bottom - 2, width: 28, height: 8)),
                 with: .color(Color(red: 0.22, green: 0.16, blue: 0.12)))

        // Obi
        ctx.fill(Path(CGRect(x: cx - 35, y: bottom - h * 0.48, width: 70, height: 14)), with: .color(obi))

        // Bent torso
        var torso = Path()
        torso.move(to: CGPoint(x: cx - 32, y: bottom - h * 0.55))
        torso.addQuadCurve(to: CGPoint(x: cx - 20, y: bottom - h * 0.82),
                           control: CGPoint(x: cx - 40, y: bottom - h * 0.70))
        torso.addLine(to: CGPoint(x: cx + 30, y: bottom - h * 0.87))
        torso.addQuadCurve(to: CGPoint(x: cx + 35, y: bottom - h * 0.55),
                           control: CGPoint(x: cx + 48, y: bottom - h * 0.70))
        torso.closeSubpath()
        ctx.fill(torso, with: .color(kimono))

        // Collar V
        var collarPath = Path()
        collarPath.move(to: CGPoint(x: cx - 10, y: bottom - h * 0.56))
        collarPath.addLine(to: CGPoint(x: cx, y: bottom - h * 0.51))
        collarPath.addLine(to: CGPoint(x: cx + 10, y: bottom - h * 0.56))
        ctx.fill(collarPath, with: .color(collar))

        // Arms hanging
        var armL = Path()
        armL.move(to: CGPoint(x: cx - 10, y: bottom - h * 0.74))
        armL.addLine(to: CGPoint(x: cx - 18, y: bottom - h * 0.45))
        armL.addLine(to: CGPoint(x: cx - 8, y: bottom - h * 0.45))
        armL.closeSubpath()
        ctx.fill(armL, with: .color(kimono))

        var armR = Path()
        armR.move(to: CGPoint(x: cx + 25, y: bottom - h * 0.72))
        armR.addLine(to: CGPoint(x: cx + 30, y: bottom - h * 0.43))
        armR.addLine(to: CGPoint(x: cx + 38, y: bottom - h * 0.43))
        armR.closeSubpath()
        ctx.fill(armR, with: .color(kimono))

        // Hands
        ctx.fill(Path(ellipseIn: CGRect(x: cx - 16, y: bottom - h * 0.46, width: 10, height: 10)), with: .color(skin))
        ctx.fill(Path(ellipseIn: CGRect(x: cx + 29, y: bottom - h * 0.44, width: 10, height: 10)), with: .color(skin))

        // Head (bent forward)
        ctx.fill(Path(ellipseIn: CGRect(x: cx - 12, y: bottom - h * 0.95, width: 44, height: 44)), with: .color(skin))

        // Hair back
        var hairPath = Path()
        hairPath.move(to: CGPoint(x: cx - 10, y: bottom - h * 0.98))
        hairPath.addQuadCurve(to: CGPoint(x: cx + 16, y: bottom - h * 1.0),
                              control: CGPoint(x: cx + 5, y: bottom - h * 1.02))
        hairPath.addQuadCurve(to: CGPoint(x: cx + 30, y: bottom - h * 0.88),
                              control: CGPoint(x: cx + 32, y: bottom - h * 0.95))
        hairPath.addQuadCurve(to: CGPoint(x: cx + 15, y: bottom - h * 0.83),
                              control: CGPoint(x: cx + 25, y: bottom - h * 0.83))
        hairPath.addQuadCurve(to: CGPoint(x: cx - 8, y: bottom - h * 0.88),
                              control: CGPoint(x: cx - 12, y: bottom - h * 0.88))
        hairPath.closeSubpath()
        ctx.fill(hairPath, with: .color(hair))

        // Closed eye
        var eye = Path()
        eye.move(to: CGPoint(x: cx + 2, y: bottom - h * 0.90))
        eye.addQuadCurve(to: CGPoint(x: cx + 10, y: bottom - h * 0.90),
                         control: CGPoint(x: cx + 6, y: bottom - h * 0.885))
        ctx.stroke(eye, with: .color(hair), style: StrokeStyle(lineWidth: 1.5, lineCap: .round))
    }
}

// MARK: - STYLE B: Watercolor Japanese

struct WatercolorToriiBowIllustration: View {
    var body: some View {
        ZStack {
            // Washi paper background with subtle texture
            LinearGradient(
                colors: [
                    Color(red: 0.96, green: 0.93, blue: 0.87),
                    Color(red: 0.91, green: 0.87, blue: 0.79)
                ],
                startPoint: .top,
                endPoint: .bottom
            )

            // Subtle paper noise overlay
            Canvas { ctx, size in
                let w = size.width, h = size.height
                // Paper texture noise
                for _ in 0..<400 {
                    let x = CGFloat.random(in: 0...w)
                    let y = CGFloat.random(in: 0...h)
                    let r = CGFloat.random(in: 0.3...1.2)
                    ctx.fill(Path(ellipseIn: CGRect(x: x, y: y, width: r, height: r)),
                             with: .color(Color(red: 0.55, green: 0.50, blue: 0.40).opacity(0.08)))
                }
            }
            .blendMode(.multiply)

            Canvas { ctx, size in
                let w = size.width, h = size.height

                // Distant mountains (soft washes, layered)
                var mtn1 = Path()
                mtn1.move(to: CGPoint(x: 0, y: h * 0.55))
                mtn1.addQuadCurve(to: CGPoint(x: w * 0.5, y: h * 0.5), control: CGPoint(x: w * 0.25, y: h * 0.42))
                mtn1.addQuadCurve(to: CGPoint(x: w, y: h * 0.48), control: CGPoint(x: w * 0.75, y: h * 0.45))
                mtn1.addLine(to: CGPoint(x: w, y: h * 0.75))
                mtn1.addLine(to: CGPoint(x: 0, y: h * 0.75))
                mtn1.closeSubpath()
                ctx.fill(mtn1, with: .color(Color(red: 0.58, green: 0.64, blue: 0.52).opacity(0.35)))

                var mtn2 = Path()
                mtn2.move(to: CGPoint(x: 0, y: h * 0.72))
                mtn2.addQuadCurve(to: CGPoint(x: w * 0.5, y: h * 0.68), control: CGPoint(x: w * 0.25, y: h * 0.62))
                mtn2.addQuadCurve(to: CGPoint(x: w, y: h * 0.66), control: CGPoint(x: w * 0.75, y: h * 0.63))
                mtn2.addLine(to: CGPoint(x: w, y: h * 0.82))
                mtn2.addLine(to: CGPoint(x: 0, y: h * 0.82))
                mtn2.closeSubpath()
                ctx.fill(mtn2, with: .color(Color(red: 0.66, green: 0.70, blue: 0.57).opacity(0.45)))

                // Sumi-e trees (soft, organic blobs)
                let inkWashGreen = Color(red: 0.38, green: 0.48, blue: 0.34)
                let inkWashGreenLight = Color(red: 0.54, green: 0.62, blue: 0.44)

                // Left tree cluster
                ctx.fill(Path(ellipseIn: CGRect(x: w * 0.02, y: h * 0.50, width: 140, height: 170)),
                         with: .color(inkWashGreen.opacity(0.55)))
                ctx.fill(Path(ellipseIn: CGRect(x: w * 0.08, y: h * 0.54, width: 100, height: 140)),
                         with: .color(inkWashGreenLight.opacity(0.5)))
                // Trunk hint
                ctx.fill(Path(CGRect(x: w * 0.08, y: h * 0.76, width: 7, height: h * 0.12)),
                         with: .color(Color(red: 0.32, green: 0.24, blue: 0.16).opacity(0.6)))

                // Right tree cluster
                ctx.fill(Path(ellipseIn: CGRect(x: w * 0.84, y: h * 0.48, width: 130, height: 160)),
                         with: .color(inkWashGreen.opacity(0.55)))
                ctx.fill(Path(ellipseIn: CGRect(x: w * 0.80, y: h * 0.52, width: 95, height: 130)),
                         with: .color(inkWashGreenLight.opacity(0.5)))
                ctx.fill(Path(CGRect(x: w * 0.85, y: h * 0.74, width: 7, height: h * 0.13)),
                         with: .color(Color(red: 0.32, green: 0.24, blue: 0.16).opacity(0.6)))

                // Ground (earth wash)
                var earthWash = Path()
                earthWash.move(to: CGPoint(x: 0, y: h * 0.84))
                earthWash.addQuadCurve(to: CGPoint(x: w, y: h * 0.85), control: CGPoint(x: w * 0.5, y: h * 0.83))
                earthWash.addLine(to: CGPoint(x: w, y: h))
                earthWash.addLine(to: CGPoint(x: 0, y: h))
                earthWash.closeSubpath()
                ctx.fill(earthWash, with: .color(Color(red: 0.79, green: 0.72, blue: 0.57).opacity(0.6)))

                // Ink path stones with watercolor bleed
                for sx in stride(from: w * 0.20, through: w * 0.78, by: w * 0.10) {
                    ctx.fill(Path(ellipseIn: CGRect(x: sx, y: h * 0.92, width: 34, height: 9)),
                             with: .color(Color(red: 0.48, green: 0.42, blue: 0.32).opacity(0.5)))
                }

                // TORII with halo of color
                let tcx = w * 0.64
                let ttop = h * 0.24

                // Soft vermillion halo behind torii
                ctx.fill(Path(ellipseIn: CGRect(x: tcx - 200, y: ttop - 80, width: 400, height: 460)),
                         with: .radialGradient(
                            Gradient(colors: [Color(red: 0.83, green: 0.28, blue: 0.19).opacity(0.12), .clear]),
                            center: CGPoint(x: tcx, y: ttop + 150),
                            startRadius: 0,
                            endRadius: 220
                         ))

                let vermWc = Color(red: 0.77, green: 0.22, blue: 0.12)
                let vermWcDk = Color(red: 0.55, green: 0.14, blue: 0.06)

                // Top beam with organic curve
                var kasagi = Path()
                kasagi.move(to: CGPoint(x: tcx - 160, y: ttop + 8))
                kasagi.addQuadCurve(to: CGPoint(x: tcx, y: ttop - 6), control: CGPoint(x: tcx - 80, y: ttop - 10))
                kasagi.addQuadCurve(to: CGPoint(x: tcx + 160, y: ttop + 8), control: CGPoint(x: tcx + 80, y: ttop - 10))
                kasagi.addLine(to: CGPoint(x: tcx + 148, y: ttop + 28))
                kasagi.addLine(to: CGPoint(x: tcx - 148, y: ttop + 28))
                kasagi.closeSubpath()
                ctx.fill(kasagi, with: .radialGradient(
                    Gradient(colors: [vermWc, vermWcDk]),
                    center: CGPoint(x: tcx, y: ttop + 10),
                    startRadius: 20,
                    endRadius: 180
                ))

                // Second beam
                ctx.fill(Path(CGRect(x: tcx - 135, y: ttop + 40, width: 270, height: 16)),
                         with: .color(vermWcDk.opacity(0.92)))

                // Tablet
                ctx.fill(Path(roundedRect: CGRect(x: tcx - 28, y: ttop + 32, width: 56, height: 36), cornerRadius: 2),
                         with: .color(Color(red: 0.48, green: 0.12, blue: 0.06)))

                // Pillars with organic edge
                var pillarL = Path()
                pillarL.move(to: CGPoint(x: tcx - 112, y: ttop + 56))
                pillarL.addLine(to: CGPoint(x: tcx - 108, y: ttop + 310))
                pillarL.addLine(to: CGPoint(x: tcx - 86, y: ttop + 310))
                pillarL.addLine(to: CGPoint(x: tcx - 90, y: ttop + 56))
                pillarL.closeSubpath()
                ctx.fill(pillarL, with: .color(vermWc))

                var pillarR = Path()
                pillarR.move(to: CGPoint(x: tcx + 90, y: ttop + 56))
                pillarR.addLine(to: CGPoint(x: tcx + 86, y: ttop + 310))
                pillarR.addLine(to: CGPoint(x: tcx + 108, y: ttop + 310))
                pillarR.addLine(to: CGPoint(x: tcx + 112, y: ttop + 56))
                pillarR.closeSubpath()
                ctx.fill(pillarR, with: .color(vermWc))

                // Pillar bases
                ctx.fill(Path(roundedRect: CGRect(x: tcx - 118, y: ttop + 308, width: 38, height: 10), cornerRadius: 2),
                         with: .color(Color(red: 0.29, green: 0.23, blue: 0.16)))
                ctx.fill(Path(roundedRect: CGRect(x: tcx + 80, y: ttop + 308, width: 38, height: 10), cornerRadius: 2),
                         with: .color(Color(red: 0.29, green: 0.23, blue: 0.16)))

                // Person (watercolor style with richer palette)
                WatercolorPerson.drawBowing(ctx, cx: w * 0.30, bottom: h * 0.84, h: h * 0.55)

                // Red seal (signature accent)
                let sealX = w * 0.93
                let sealY = h * 0.92
                ctx.fill(Path(roundedRect: CGRect(x: sealX - 18, y: sealY - 18, width: 36, height: 36), cornerRadius: 2),
                         with: .color(Color(red: 0.83, green: 0.28, blue: 0.19).opacity(0.88)))
                let seal = Text("礼")
                    .font(.system(size: 18, weight: .bold, design: .serif))
                    .foregroundStyle(.white)
                ctx.draw(seal, at: CGPoint(x: sealX, y: sealY))
            }
        }
    }
}

private enum WatercolorPerson {
    static let skin = Color(red: 0.89, green: 0.77, blue: 0.63)
    static let kimono = Color(red: 0.30, green: 0.43, blue: 0.57)
    static let kimonoDeep = Color(red: 0.18, green: 0.28, blue: 0.42)
    static let hakama = Color(red: 0.16, green: 0.26, blue: 0.40)
    static let obi = Color(red: 0.48, green: 0.29, blue: 0.37)
    static let obiKnot = Color(red: 0.35, green: 0.19, blue: 0.25)
    static let hair = Color(red: 0.12, green: 0.09, blue: 0.07)
    static let collar = Color(red: 0.96, green: 0.93, blue: 0.87)

    static func drawBowing(_ ctx: GraphicsContext, cx: CGFloat, bottom: CGFloat, h: CGFloat) {
        // Soft shadow
        ctx.fill(Path(ellipseIn: CGRect(x: cx - 60, y: bottom + 4, width: 120, height: 12)),
                 with: .color(.black.opacity(0.12)))

        // Hakama legs with gradient
        var legL = Path()
        legL.move(to: CGPoint(x: cx - 30, y: bottom - h * 0.45))
        legL.addQuadCurve(to: CGPoint(x: cx - 38, y: bottom), control: CGPoint(x: cx - 42, y: bottom - h * 0.2))
        legL.addLine(to: CGPoint(x: cx - 4, y: bottom))
        legL.addLine(to: CGPoint(x: cx - 4, y: bottom - h * 0.45))
        legL.closeSubpath()
        ctx.fill(legL, with: .linearGradient(
            Gradient(colors: [hakama, kimonoDeep]),
            startPoint: CGPoint(x: cx - 20, y: bottom - h * 0.45),
            endPoint: CGPoint(x: cx - 20, y: bottom)
        ))

        var legR = Path()
        legR.move(to: CGPoint(x: cx + 30, y: bottom - h * 0.45))
        legR.addQuadCurve(to: CGPoint(x: cx + 38, y: bottom), control: CGPoint(x: cx + 42, y: bottom - h * 0.2))
        legR.addLine(to: CGPoint(x: cx + 4, y: bottom))
        legR.addLine(to: CGPoint(x: cx + 4, y: bottom - h * 0.45))
        legR.closeSubpath()
        ctx.fill(legR, with: .linearGradient(
            Gradient(colors: [hakama, kimonoDeep]),
            startPoint: CGPoint(x: cx + 20, y: bottom - h * 0.45),
            endPoint: CGPoint(x: cx + 20, y: bottom)
        ))

        // Feet
        ctx.fill(Path(ellipseIn: CGRect(x: cx - 36, y: bottom - 3, width: 30, height: 9)),
                 with: .color(Color(red: 0.22, green: 0.15, blue: 0.10)))
        ctx.fill(Path(ellipseIn: CGRect(x: cx + 6, y: bottom - 3, width: 30, height: 9)),
                 with: .color(Color(red: 0.22, green: 0.15, blue: 0.10)))

        // Bent torso with organic curve
        var torso = Path()
        torso.move(to: CGPoint(x: cx - 36, y: bottom - h * 0.50))
        torso.addQuadCurve(to: CGPoint(x: cx - 18, y: bottom - h * 0.88),
                           control: CGPoint(x: cx - 45, y: bottom - h * 0.72))
        torso.addLine(to: CGPoint(x: cx + 36, y: bottom - h * 0.96))
        torso.addQuadCurve(to: CGPoint(x: cx + 40, y: bottom - h * 0.50),
                           control: CGPoint(x: cx + 52, y: bottom - h * 0.72))
        torso.closeSubpath()
        ctx.fill(torso, with: .linearGradient(
            Gradient(colors: [kimono, kimonoDeep.opacity(0.85)]),
            startPoint: CGPoint(x: cx, y: bottom - h * 0.88),
            endPoint: CGPoint(x: cx, y: bottom - h * 0.50)
        ))

        // Collar
        var collarP = Path()
        collarP.move(to: CGPoint(x: cx - 12, y: bottom - h * 0.54))
        collarP.addLine(to: CGPoint(x: cx, y: bottom - h * 0.42))
        collarP.addLine(to: CGPoint(x: cx + 12, y: bottom - h * 0.54))
        ctx.fill(collarP, with: .color(collar))

        // Obi with subtle gradient
        var obiP = Path()
        obiP.addRoundedRect(in: CGRect(x: cx - 40, y: bottom - h * 0.48, width: 80, height: 18),
                            cornerSize: CGSize(width: 2, height: 2))
        ctx.fill(obiP, with: .linearGradient(
            Gradient(colors: [obi, obiKnot]),
            startPoint: CGPoint(x: cx, y: bottom - h * 0.48),
            endPoint: CGPoint(x: cx, y: bottom - h * 0.30)
        ))

        // Obi knot accent
        ctx.fill(Path(CGRect(x: cx - 6, y: bottom - h * 0.46, width: 12, height: 14)),
                 with: .color(obiKnot))

        // Arms hanging with flowing kimono
        var armL = Path()
        armL.move(to: CGPoint(x: cx - 14, y: bottom - h * 0.78))
        armL.addQuadCurve(to: CGPoint(x: cx - 22, y: bottom - h * 0.42),
                          control: CGPoint(x: cx - 24, y: bottom - h * 0.60))
        armL.addLine(to: CGPoint(x: cx - 10, y: bottom - h * 0.42))
        armL.addQuadCurve(to: CGPoint(x: cx - 6, y: bottom - h * 0.76),
                          control: CGPoint(x: cx - 8, y: bottom - h * 0.58))
        armL.closeSubpath()
        ctx.fill(armL, with: .color(kimono))

        var armR = Path()
        armR.move(to: CGPoint(x: cx + 28, y: bottom - h * 0.76))
        armR.addQuadCurve(to: CGPoint(x: cx + 40, y: bottom - h * 0.40),
                          control: CGPoint(x: cx + 44, y: bottom - h * 0.58))
        armR.addLine(to: CGPoint(x: cx + 32, y: bottom - h * 0.40))
        armR.addQuadCurve(to: CGPoint(x: cx + 30, y: bottom - h * 0.74),
                          control: CGPoint(x: cx + 28, y: bottom - h * 0.56))
        armR.closeSubpath()
        ctx.fill(armR, with: .color(kimono))

        // Hands
        ctx.fill(Path(ellipseIn: CGRect(x: cx - 17, y: bottom - h * 0.44, width: 11, height: 11)), with: .color(skin))
        ctx.fill(Path(ellipseIn: CGRect(x: cx + 32, y: bottom - h * 0.42, width: 11, height: 11)), with: .color(skin))

        // Head
        ctx.fill(Path(ellipseIn: CGRect(x: cx - 10, y: bottom - h * 1.00, width: 46, height: 46)), with: .color(skin))

        // Hair — more stylized
        var hairP = Path()
        hairP.move(to: CGPoint(x: cx - 10, y: bottom - h * 1.03))
        hairP.addQuadCurve(to: CGPoint(x: cx + 14, y: bottom - h * 1.05),
                           control: CGPoint(x: cx + 2, y: bottom - h * 1.10))
        hairP.addQuadCurve(to: CGPoint(x: cx + 34, y: bottom - h * 0.92),
                           control: CGPoint(x: cx + 38, y: bottom - h * 1.02))
        hairP.addQuadCurve(to: CGPoint(x: cx + 16, y: bottom - h * 0.86),
                           control: CGPoint(x: cx + 28, y: bottom - h * 0.86))
        hairP.addQuadCurve(to: CGPoint(x: cx - 6, y: bottom - h * 0.92),
                           control: CGPoint(x: cx - 12, y: bottom - h * 0.92))
        hairP.closeSubpath()
        ctx.fill(hairP, with: .color(hair))

        // Eye (closed, peaceful)
        var eye = Path()
        eye.move(to: CGPoint(x: cx + 2, y: bottom - h * 0.93))
        eye.addQuadCurve(to: CGPoint(x: cx + 12, y: bottom - h * 0.93),
                         control: CGPoint(x: cx + 7, y: bottom - h * 0.915))
        ctx.stroke(eye, with: .color(hair), style: StrokeStyle(lineWidth: 1.4, lineCap: .round))
    }
}

// MARK: - STYLE C: Line Art + Accent

struct LineArtToriiBowIllustration: View {
    var body: some View {
        Canvas { ctx, size in
            let w = size.width, h = size.height

            // Cream background
            ctx.fill(Path(CGRect(origin: .zero, size: size)),
                     with: .linearGradient(
                        Gradient(colors: [
                            Color(red: 0.98, green: 0.96, blue: 0.93),
                            Color(red: 0.94, green: 0.91, blue: 0.85)
                        ]),
                        startPoint: .zero,
                        endPoint: CGPoint(x: 0, y: h)
                     ))

            let ink = Color(red: 0.16, green: 0.14, blue: 0.12)
            let vermillion = Color(red: 0.83, green: 0.28, blue: 0.19)

            // Horizon line
            ctx.stroke(
                Path { p in
                    p.move(to: CGPoint(x: 0, y: h * 0.80))
                    p.addLine(to: CGPoint(x: w, y: h * 0.80))
                },
                with: .color(ink.opacity(0.25)),
                style: StrokeStyle(lineWidth: 0.8)
            )

            // Background trees — outline only
            drawOutlineTree(ctx, cx: w * 0.08, base: h * 0.82, scale: 0.8, ink: ink)
            drawOutlineTree(ctx, cx: w * 0.88, base: h * 0.82, scale: 0.85, ink: ink)

            // Path stones — outline
            for sx in stride(from: w * 0.20, through: w * 0.78, by: w * 0.10) {
                ctx.stroke(
                    Path(ellipseIn: CGRect(x: sx, y: h * 0.90, width: 34, height: 9)),
                    with: .color(ink.opacity(0.4)),
                    style: StrokeStyle(lineWidth: 1.2)
                )
            }

            // TORII — black line with vermillion accent
            let tcx = w * 0.64
            let ttop = h * 0.24

            // Top beam (kasagi) - vermillion filled with outline
            var kasagi = Path()
            kasagi.move(to: CGPoint(x: tcx - 150, y: ttop))
            kasagi.addQuadCurve(to: CGPoint(x: tcx, y: ttop - 18), control: CGPoint(x: tcx - 75, y: ttop - 12))
            kasagi.addQuadCurve(to: CGPoint(x: tcx + 150, y: ttop), control: CGPoint(x: tcx + 75, y: ttop - 12))
            kasagi.addLine(to: CGPoint(x: tcx + 145, y: ttop + 22))
            kasagi.addLine(to: CGPoint(x: tcx - 145, y: ttop + 22))
            kasagi.closeSubpath()
            ctx.fill(kasagi, with: .color(vermillion))
            ctx.stroke(kasagi, with: .color(ink), style: StrokeStyle(lineWidth: 2, lineJoin: .round))

            // Second beam - outline only
            let beam2 = Path(roundedRect: CGRect(x: tcx - 130, y: ttop + 34, width: 260, height: 14), cornerRadius: 1)
            ctx.stroke(beam2, with: .color(ink), style: StrokeStyle(lineWidth: 2, lineJoin: .round))

            // Tablet - vermillion
            let tablet = Path(roundedRect: CGRect(x: tcx - 25, y: ttop + 28, width: 50, height: 32), cornerRadius: 2)
            ctx.fill(tablet, with: .color(vermillion))
            ctx.stroke(tablet, with: .color(ink), style: StrokeStyle(lineWidth: 1.8))

            // Pillars — outline + vermillion fill only at top portion
            let pillarL = Path(CGRect(x: tcx - 110, y: ttop + 48, width: 22, height: 260))
            ctx.fill(Path(CGRect(x: tcx - 110, y: ttop + 48, width: 22, height: 90)),
                     with: .color(vermillion.opacity(0.92)))
            ctx.stroke(pillarL, with: .color(ink), style: StrokeStyle(lineWidth: 2, lineJoin: .round))

            let pillarR = Path(CGRect(x: tcx + 88, y: ttop + 48, width: 22, height: 260))
            ctx.fill(Path(CGRect(x: tcx + 88, y: ttop + 48, width: 22, height: 90)),
                     with: .color(vermillion.opacity(0.92)))
            ctx.stroke(pillarR, with: .color(ink), style: StrokeStyle(lineWidth: 2, lineJoin: .round))

            // Pillar bases - outline
            let baseL = Path(roundedRect: CGRect(x: tcx - 116, y: ttop + 305, width: 34, height: 10), cornerRadius: 1)
            ctx.stroke(baseL, with: .color(ink), style: StrokeStyle(lineWidth: 1.8, lineJoin: .round))
            let baseR = Path(roundedRect: CGRect(x: tcx + 82, y: ttop + 305, width: 34, height: 10), cornerRadius: 1)
            ctx.stroke(baseR, with: .color(ink), style: StrokeStyle(lineWidth: 1.8, lineJoin: .round))

            // PERSON — linework
            LinePerson.drawBowing(ctx, cx: w * 0.30, bottom: h * 0.85, h: h * 0.58, ink: ink, accent: vermillion)

            // Seal accent in corner
            let sealX = w * 0.93
            let sealY = h * 0.92
            ctx.fill(Path(roundedRect: CGRect(x: sealX - 17, y: sealY - 17, width: 34, height: 34), cornerRadius: 1),
                     with: .color(vermillion))
            ctx.stroke(Path(roundedRect: CGRect(x: sealX - 17, y: sealY - 17, width: 34, height: 34), cornerRadius: 1),
                       with: .color(ink), style: StrokeStyle(lineWidth: 1.5))
            let seal = Text("礼")
                .font(.system(size: 18, weight: .bold, design: .serif))
                .foregroundStyle(.white)
            ctx.draw(seal, at: CGPoint(x: sealX, y: sealY))
        }
    }

    private func drawOutlineTree(_ ctx: GraphicsContext, cx: CGFloat, base: CGFloat, scale: CGFloat, ink: Color) {
        let stroke = StrokeStyle(lineWidth: 1.4, lineCap: .round, lineJoin: .round)
        // Canopy outline
        var canopy = Path()
        canopy.move(to: CGPoint(x: cx, y: base - 5 * scale))
        canopy.addQuadCurve(to: CGPoint(x: cx - 25 * scale, y: base - 35 * scale),
                            control: CGPoint(x: cx - 30 * scale, y: base - 15 * scale))
        canopy.addQuadCurve(to: CGPoint(x: cx - 30 * scale, y: base - 70 * scale),
                            control: CGPoint(x: cx - 48 * scale, y: base - 55 * scale))
        canopy.addQuadCurve(to: CGPoint(x: cx, y: base - 100 * scale),
                            control: CGPoint(x: cx - 28 * scale, y: base - 100 * scale))
        canopy.addQuadCurve(to: CGPoint(x: cx + 30 * scale, y: base - 70 * scale),
                            control: CGPoint(x: cx + 28 * scale, y: base - 100 * scale))
        canopy.addQuadCurve(to: CGPoint(x: cx + 25 * scale, y: base - 35 * scale),
                            control: CGPoint(x: cx + 48 * scale, y: base - 55 * scale))
        canopy.addQuadCurve(to: CGPoint(x: cx, y: base - 5 * scale),
                            control: CGPoint(x: cx + 30 * scale, y: base - 15 * scale))
        canopy.closeSubpath()
        ctx.stroke(canopy, with: .color(ink.opacity(0.4)), style: stroke)
        // Trunk
        var trunk = Path()
        trunk.move(to: CGPoint(x: cx - 3 * scale, y: base - 5 * scale))
        trunk.addLine(to: CGPoint(x: cx - 3 * scale, y: base + 10 * scale))
        trunk.addLine(to: CGPoint(x: cx + 3 * scale, y: base + 10 * scale))
        trunk.addLine(to: CGPoint(x: cx + 3 * scale, y: base - 5 * scale))
        ctx.stroke(trunk, with: .color(ink.opacity(0.4)), style: stroke)
    }
}

private enum LinePerson {
    static func drawBowing(_ ctx: GraphicsContext, cx: CGFloat, bottom: CGFloat, h: CGFloat, ink: Color, accent: Color) {
        let stroke = StrokeStyle(lineWidth: 1.6, lineCap: .round, lineJoin: .round)
        let pageBg = Color(red: 0.98, green: 0.96, blue: 0.93)

        // Legs (outline)
        var legL = Path()
        legL.move(to: CGPoint(x: cx - 22, y: bottom - h * 0.40))
        legL.addQuadCurve(to: CGPoint(x: cx - 28, y: bottom), control: CGPoint(x: cx - 32, y: bottom - h * 0.20))
        legL.addLine(to: CGPoint(x: cx - 4, y: bottom))
        legL.addLine(to: CGPoint(x: cx - 4, y: bottom - h * 0.40))
        legL.closeSubpath()
        ctx.fill(legL, with: .color(pageBg))
        ctx.stroke(legL, with: .color(ink), style: stroke)

        var legR = Path()
        legR.move(to: CGPoint(x: cx + 22, y: bottom - h * 0.40))
        legR.addQuadCurve(to: CGPoint(x: cx + 28, y: bottom), control: CGPoint(x: cx + 32, y: bottom - h * 0.20))
        legR.addLine(to: CGPoint(x: cx + 4, y: bottom))
        legR.addLine(to: CGPoint(x: cx + 4, y: bottom - h * 0.40))
        legR.closeSubpath()
        ctx.fill(legR, with: .color(pageBg))
        ctx.stroke(legR, with: .color(ink), style: stroke)

        // Feet (filled ink)
        ctx.fill(Path(ellipseIn: CGRect(x: cx - 32, y: bottom - 2, width: 26, height: 7)), with: .color(ink))
        ctx.fill(Path(ellipseIn: CGRect(x: cx + 6, y: bottom - 2, width: 26, height: 7)), with: .color(ink))

        // Bent torso (outline)
        var torso = Path()
        torso.move(to: CGPoint(x: cx - 34, y: bottom - h * 0.48))
        torso.addQuadCurve(to: CGPoint(x: cx - 20, y: bottom - h * 0.86),
                           control: CGPoint(x: cx - 42, y: bottom - h * 0.70))
        torso.addLine(to: CGPoint(x: cx + 32, y: bottom - h * 0.94))
        torso.addQuadCurve(to: CGPoint(x: cx + 38, y: bottom - h * 0.48),
                           control: CGPoint(x: cx + 50, y: bottom - h * 0.70))
        torso.closeSubpath()
        ctx.fill(torso, with: .color(pageBg))
        ctx.stroke(torso, with: .color(ink), style: stroke)

        // Collar lines
        var collar = Path()
        collar.move(to: CGPoint(x: cx - 12, y: bottom - h * 0.52))
        collar.addLine(to: CGPoint(x: cx, y: bottom - h * 0.40))
        collar.addLine(to: CGPoint(x: cx + 12, y: bottom - h * 0.52))
        ctx.stroke(collar, with: .color(ink), style: stroke)

        // OBI — the vermillion accent
        var obi = Path()
        obi.addRoundedRect(in: CGRect(x: cx - 38, y: bottom - h * 0.46, width: 76, height: 18),
                           cornerSize: CGSize(width: 2, height: 2))
        ctx.fill(obi, with: .color(accent))
        ctx.stroke(obi, with: .color(ink), style: stroke)

        // Skirt opening lines
        var skirt = Path()
        skirt.move(to: CGPoint(x: cx - 38, y: bottom - h * 0.28))
        skirt.addLine(to: CGPoint(x: cx - 30, y: bottom - h * 0.18))
        skirt.move(to: CGPoint(x: cx + 38, y: bottom - h * 0.28))
        skirt.addLine(to: CGPoint(x: cx + 30, y: bottom - h * 0.18))
        ctx.stroke(skirt, with: .color(ink), style: stroke)

        // Arms hanging (outline)
        var armL = Path()
        armL.move(to: CGPoint(x: cx - 14, y: bottom - h * 0.78))
        armL.addQuadCurve(to: CGPoint(x: cx - 20, y: bottom - h * 0.44),
                          control: CGPoint(x: cx - 24, y: bottom - h * 0.60))
        armL.addLine(to: CGPoint(x: cx - 8, y: bottom - h * 0.44))
        armL.addQuadCurve(to: CGPoint(x: cx - 6, y: bottom - h * 0.76),
                          control: CGPoint(x: cx - 8, y: bottom - h * 0.58))
        armL.closeSubpath()
        ctx.fill(armL, with: .color(pageBg))
        ctx.stroke(armL, with: .color(ink), style: stroke)

        var armR = Path()
        armR.move(to: CGPoint(x: cx + 26, y: bottom - h * 0.76))
        armR.addQuadCurve(to: CGPoint(x: cx + 38, y: bottom - h * 0.42),
                          control: CGPoint(x: cx + 42, y: bottom - h * 0.58))
        armR.addLine(to: CGPoint(x: cx + 30, y: bottom - h * 0.42))
        armR.addQuadCurve(to: CGPoint(x: cx + 28, y: bottom - h * 0.74),
                          control: CGPoint(x: cx + 26, y: bottom - h * 0.56))
        armR.closeSubpath()
        ctx.fill(armR, with: .color(pageBg))
        ctx.stroke(armR, with: .color(ink), style: stroke)

        // Hands (outline)
        let handL = Path(ellipseIn: CGRect(x: cx - 18, y: bottom - h * 0.46, width: 10, height: 10))
        ctx.fill(handL, with: .color(pageBg))
        ctx.stroke(handL, with: .color(ink), style: stroke)
        let handR = Path(ellipseIn: CGRect(x: cx + 28, y: bottom - h * 0.44, width: 10, height: 10))
        ctx.fill(handR, with: .color(pageBg))
        ctx.stroke(handR, with: .color(ink), style: stroke)

        // Head (outline)
        let head = Path(ellipseIn: CGRect(x: cx - 10, y: bottom - h * 0.98, width: 44, height: 44))
        ctx.fill(head, with: .color(pageBg))
        ctx.stroke(head, with: .color(ink), style: stroke)

        // Hair (filled ink)
        var hair = Path()
        hair.move(to: CGPoint(x: cx - 8, y: bottom - h * 1.02))
        hair.addQuadCurve(to: CGPoint(x: cx + 16, y: bottom - h * 1.03),
                          control: CGPoint(x: cx + 4, y: bottom - h * 1.08))
        hair.addQuadCurve(to: CGPoint(x: cx + 30, y: bottom - h * 0.88),
                          control: CGPoint(x: cx + 34, y: bottom - h * 0.98))
        hair.addQuadCurve(to: CGPoint(x: cx + 14, y: bottom - h * 0.84),
                          control: CGPoint(x: cx + 26, y: bottom - h * 0.84))
        hair.addQuadCurve(to: CGPoint(x: cx - 6, y: bottom - h * 0.88),
                          control: CGPoint(x: cx - 10, y: bottom - h * 0.88))
        hair.closeSubpath()
        ctx.fill(hair, with: .color(ink))

        // Eye (closed, peaceful)
        var eye = Path()
        eye.move(to: CGPoint(x: cx + 2, y: bottom - h * 0.91))
        eye.addQuadCurve(to: CGPoint(x: cx + 12, y: bottom - h * 0.91),
                         control: CGPoint(x: cx + 7, y: bottom - h * 0.895))
        ctx.stroke(eye, with: .color(ink), style: StrokeStyle(lineWidth: 1.3, lineCap: .round))
    }
}

// MARK: - Preview

#Preview("Style Samples") {
    IllustrationStyleSamplesView()
}

#Preview("Style A — Flat") {
    FlatToriiBowIllustration()
        .frame(height: 240)
        .padding()
        .background(Color.pageBackground)
}

#Preview("Style B — Watercolor") {
    WatercolorToriiBowIllustration()
        .frame(height: 240)
        .padding()
        .background(Color.pageBackground)
}

#Preview("Style C — Line Art") {
    LineArtToriiBowIllustration()
        .frame(height: 240)
        .padding()
        .background(Color.pageBackground)
}
