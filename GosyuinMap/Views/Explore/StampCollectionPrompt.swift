import SwiftUI

struct StampCollectionPrompt: View {
    let shrine: Shrine
    let onCollect: () -> Void
    let onDismiss: () -> Void

    // MARK: - State

    @State private var phase: Phase = .ready
    // Overlay
    @State private var dimOpacity: Double = 0
    @State private var flashOpacity: Double = 0
    // Stamp
    @State private var stampScale: CGFloat = 4.0
    @State private var stampOpacity: Double = 0
    @State private var stampRotation: Double = -20
    @State private var stampY: CGFloat = -300
    @State private var inkReveal: CGFloat = 0  // 0→1 ink bleed
    // Impact
    @State private var shakeX: CGFloat = 0
    @State private var shakeY: CGFloat = 0
    @State private var ring1Scale: CGFloat = 0.1
    @State private var ring1Opacity: Double = 0
    @State private var ring2Scale: CGFloat = 0.1
    @State private var ring2Opacity: Double = 0
    @State private var ring3Scale: CGFloat = 0.1
    @State private var ring3Opacity: Double = 0
    // UI
    @State private var celebScale: CGFloat = 0.3
    @State private var celebOpacity: Double = 0
    @State private var doneOpacity: Double = 0
    @State private var buttonPulse = false
    // Haptics
    @State private var hapticStep = 0

    private var stampDef: StampDefinition? {
        StampDefinition.all.first { $0.id == shrine.stampSlotId }
    }

    private var stampColor: Color {
        stampDef?.color ?? .vermillion
    }

    private enum Phase {
        case ready, slamming, stamped
    }

    // MARK: - Body

    var body: some View {
        ZStack {
            washiBackground

            // Dim overlay before slam
            Color.black.opacity(dimOpacity).ignoresSafeArea()

            // White flash on impact
            Color.white.opacity(flashOpacity).ignoresSafeArea()

            VStack(spacing: 0) {
                Spacer()

                // — Stamp Area —
                ZStack {
                    // 3 impact rings
                    impactRing(scale: ring1Scale, opacity: ring1Opacity, width: 4)
                    impactRing(scale: ring2Scale, opacity: ring2Opacity, width: 2.5)
                    impactRing(scale: ring3Scale, opacity: ring3Opacity, width: 1.5)

                    // Ghost placeholder
                    if phase == .ready {
                        placeholder
                            .transition(.opacity)
                    }

                    // The real stamp
                    if phase != .ready, let def = stampDef {
                        GosyuinStampView(stamp: def, size: 200, showDate: false)
                            .scaleEffect(stampScale)
                            .opacity(stampOpacity * inkReveal)
                            .rotationEffect(.degrees(stampRotation))
                            .offset(y: stampY)
                    }
                }
                .frame(height: 280)
                .offset(x: shakeX, y: shakeY)

                Spacer().frame(height: 28)

                // — Text —
                if phase == .ready {
                    VStack(spacing: DS.Spacing.sm) {
                        Text("You arrived at")
                            .font(.title3)
                            .foregroundStyle(.secondary)
                        Text(shrine.name)
                            .font(.largeTitle.bold())
                            .foregroundStyle(Color.bodyText)
                            .multilineTextAlignment(.center)
                    }
                } else if phase == .stamped {
                    VStack(spacing: DS.Spacing.sm) {
                        Image(systemName: "checkmark.circle.fill")
                            .font(.system(size: 40))
                            .foregroundStyle(stampColor)

                        Text("Stamp Collected!")
                            .font(.title.bold())
                            .foregroundStyle(Color.bodyText)
                    }
                    .scaleEffect(celebScale)
                    .opacity(celebOpacity)
                }

                Spacer()

                // — Buttons —
                if phase == .stamped {
                    Button {
                        onDismiss()
                    } label: {
                        Text("Done")
                            .vermillionButtonStyle()
                    }
                    .buttonStyle(.pressable)
                    .opacity(doneOpacity)
                } else if phase == .ready {
                    VStack(spacing: DS.Spacing.md) {
                        Button {
                            slamStamp()
                        } label: {
                            HStack(spacing: DS.Spacing.sm) {
                                Image(systemName: "hand.point.down.fill")
                                Text("Press Stamp")
                            }
                            .font(.headline)
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 18)
                            .background(stampColor, in: RoundedRectangle(cornerRadius: DS.Radius.md))
                            .scaleEffect(buttonPulse ? 1.04 : 1.0)
                            .shadow(color: stampColor.opacity(0.4), radius: buttonPulse ? 12 : 4, y: 4)
                        }
                        .buttonStyle(.stamp)

                        Button { onDismiss() } label: {
                            Text("Not Now")
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                        }
                    }
                    .onAppear {
                        withAnimation(.easeInOut(duration: 1.0).repeatForever(autoreverses: true)) {
                            buttonPulse = true
                        }
                    }
                }
            }
            .padding(DS.Spacing.xxl)
        }
        // Haptic chain
        .sensoryFeedback(.impact(weight: .heavy, intensity: 1.0), trigger: hapticStep) { _, n in n == 1 }
        .sensoryFeedback(.impact(weight: .heavy, intensity: 0.8), trigger: hapticStep) { _, n in n == 2 }
        .sensoryFeedback(.impact(weight: .medium, intensity: 0.5), trigger: hapticStep) { _, n in n == 3 }
        .sensoryFeedback(.impact(weight: .light, intensity: 0.3), trigger: hapticStep) { _, n in n == 4 }
        .sensoryFeedback(.success, trigger: hapticStep) { _, n in n == 5 }
    }

    // MARK: - Subviews

    private func impactRing(scale: CGFloat, opacity: Double, width: CGFloat) -> some View {
        Circle()
            .stroke(stampColor.opacity(opacity), lineWidth: width)
            .frame(width: 240, height: 240)
            .scaleEffect(scale)
    }

    private var washiBackground: some View {
        ZStack {
            Color.pageBackground.ignoresSafeArea()
            Canvas { ctx, size in
                for i in stride(from: 0, to: size.width, by: 3) {
                    for j in stride(from: 0, to: size.height, by: 3) {
                        let n = sin(i * 0.7) * cos(j * 0.5) * 0.015
                        if abs(n) > 0.005 {
                            var dot = Path()
                            dot.addEllipse(in: CGRect(x: i, y: j, width: 1.5, height: 1.5))
                            ctx.fill(dot, with: .color(.brown.opacity(abs(n))))
                        }
                    }
                }
            }
            .ignoresSafeArea()
            .opacity(0.25)
        }
    }

    private var placeholder: some View {
        ZStack {
            Circle()
                .strokeBorder(stampColor.opacity(0.12), style: StrokeStyle(lineWidth: 2, dash: [8, 6]))
                .frame(width: 140, height: 140)

            if let def = stampDef {
                Image(systemName: def.icon)
                    .font(.system(size: 40))
                    .foregroundStyle(stampColor.opacity(0.15))
            }
        }
    }

    // MARK: - Slam Animation

    private func slamStamp() {
        // === PHASE 0: ANTICIPATION (0.0-0.3s) ===
        phase = .slamming

        // Screen dims — something big is coming
        withAnimation(.easeIn(duration: 0.25)) {
            dimOpacity = 0.3
        }

        // === PHASE 1: SLAM (0.3s) ===
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            // Haptic: HEAVY hit
            hapticStep = 1

            // Stamp crashes down — FAST
            withAnimation(.easeIn(duration: 0.1)) {
                stampScale = 1.08
                stampOpacity = 1.0
                stampRotation = Double.random(in: -3...3)
                stampY = 0
                dimOpacity = 0
            }

            // BRIGHT flash
            withAnimation(.easeOut(duration: 0.04)) {
                flashOpacity = 0.7
            }
            after(0.04) {
                withAnimation(.easeOut(duration: 0.2)) {
                    flashOpacity = 0
                }
            }

            // Violent shake
            shakeHard()

            // Ink bleeds in over 0.4s
            withAnimation(.easeOut(duration: 0.4)) {
                inkReveal = 1.0
            }

            // Ring 1 — immediate
            withAnimation(.easeOut(duration: 0.7)) {
                ring1Scale = 2.0
                ring1Opacity = 0.6
            }
            after(0.1) {
                withAnimation(.easeOut(duration: 0.5)) { ring1Opacity = 0 }
            }

            onCollect()
        }

        // === PHASE 2: BOUNCE (0.42s) ===
        after(0.42) {
            hapticStep = 2

            withAnimation(.spring(duration: 0.4, bounce: 0.5)) {
                stampScale = 0.97
                stampRotation = Double.random(in: -4...4)
            }

            // Ring 2
            withAnimation(.easeOut(duration: 0.6)) {
                ring2Scale = 1.6
                ring2Opacity = 0.4
            }
            after(0.15) {
                withAnimation(.easeOut(duration: 0.5)) { ring2Opacity = 0 }
            }
        }

        // === PHASE 3: SETTLE (0.6s) ===
        after(0.6) {
            hapticStep = 3

            withAnimation(.spring(duration: 0.3, bounce: 0.3)) {
                stampScale = 1.0
            }

            // Ring 3
            withAnimation(.easeOut(duration: 0.5)) {
                ring3Scale = 1.3
                ring3Opacity = 0.25
            }
            after(0.1) {
                withAnimation(.easeOut(duration: 0.4)) { ring3Opacity = 0 }
            }
        }

        // === PHASE 4: MICRO SETTLE (0.8s) ===
        after(0.8) {
            hapticStep = 4
        }

        // === PHASE 5: CELEBRATION (1.1s) ===
        after(1.1) {
            phase = .stamped
            hapticStep = 5

            withAnimation(.spring(duration: 0.6, bounce: 0.4)) {
                celebScale = 1.0
                celebOpacity = 1
            }
        }

        // === DONE BUTTON (1.6s) ===
        after(1.6) {
            withAnimation(.easeIn(duration: 0.4)) {
                doneOpacity = 1
            }
        }
    }

    // MARK: - Shake

    private func shakeHard() {
        // Rapid, violent shaking that decays
        let steps: [(x: CGFloat, y: CGFloat, dt: Double)] = [
            (-12, -4, 0.025),
            (10, 6, 0.025),
            (-8, -3, 0.03),
            (6, 4, 0.03),
            (-4, -2, 0.03),
            (3, 1, 0.035),
            (-1, 0, 0.035),
            (0, 0, 0.04),
        ]
        var delay = 0.0
        for step in steps {
            after(delay) {
                withAnimation(.linear(duration: step.dt)) {
                    shakeX = step.x
                    shakeY = step.y
                }
            }
            delay += step.dt
        }
    }

    // MARK: - Helper

    private func after(_ seconds: Double, action: @escaping () -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds, execute: action)
    }
}

// MARK: - Preview

#Preview("Stamp Collection") {
    StampCollectionPrompt(shrine: Shrine.samples[0], onCollect: {}, onDismiss: {})
}

#Preview("Dark") {
    StampCollectionPrompt(shrine: Shrine.samples[1], onCollect: {}, onDismiss: {})
        .preferredColorScheme(.dark)
}
