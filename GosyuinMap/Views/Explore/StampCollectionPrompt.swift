import SwiftUI

struct StampCollectionPrompt: View {
    let shrine: Shrine
    let onCollect: () -> Void
    let onDismiss: () -> Void

    // MARK: - State

    @State private var phase: Phase = .ready
    // Stamp slam animation
    @State private var stampScale: CGFloat = 3.0
    @State private var stampOpacity: Double = 0
    @State private var stampRotation: Double = -15
    @State private var stampY: CGFloat = -200
    // Impact effects
    @State private var shakeX: CGFloat = 0
    @State private var flashOpacity: Double = 0
    @State private var ringScale: CGFloat = 0.2
    @State private var ringOpacity: Double = 0
    @State private var ring2Scale: CGFloat = 0.2
    @State private var ring2Opacity: Double = 0
    // UI
    @State private var celebrationOpacity: Double = 0
    @State private var doneOpacity: Double = 0
    @State private var buttonBounce = false
    // Haptics
    @State private var hapticStep = 0

    private var stampDef: StampDefinition? {
        StampDefinition.all.first { $0.id == shrine.stampSlotId }
    }

    private var stampColor: Color {
        stampDef?.color ?? .vermillion
    }

    private enum Phase {
        case ready, stamped
    }

    // MARK: - Body

    var body: some View {
        ZStack {
            // Washi paper background
            washiBackground

            // White flash on impact
            Color.white
                .opacity(flashOpacity)
                .ignoresSafeArea()

            VStack(spacing: 0) {
                Spacer()

                // — Stamp Area —
                ZStack {
                    // Impact rings
                    Circle()
                        .stroke(stampColor.opacity(ringOpacity), lineWidth: 3)
                        .frame(width: 220, height: 220)
                        .scaleEffect(ringScale)
                    Circle()
                        .stroke(stampColor.opacity(ring2Opacity), lineWidth: 2)
                        .frame(width: 220, height: 220)
                        .scaleEffect(ring2Scale)

                    if phase == .ready {
                        // Ghost placeholder — dashed target
                        placeholder
                    }

                    if phase == .stamped, let def = stampDef {
                        // The real stamp — slams in
                        GosyuinStampView(stamp: def, size: 180, showDate: false)
                            .scaleEffect(stampScale)
                            .opacity(stampOpacity)
                            .rotationEffect(.degrees(stampRotation))
                            .offset(y: stampY)
                    }
                }
                .frame(height: 260)
                .offset(x: shakeX)

                Spacer().frame(height: 24)

                // — Text —
                VStack(spacing: DS.Spacing.sm) {
                    if phase == .ready {
                        Text(shrine.name)
                            .font(.title.bold())
                            .foregroundStyle(Color.bodyText)
                            .multilineTextAlignment(.center)

                        Text("に到着しました")
                            .font(.title3)
                            .foregroundStyle(.secondary)
                    } else {
                        VStack(spacing: DS.Spacing.xs) {
                            Image(systemName: "checkmark.circle.fill")
                                .font(.system(size: 32))
                                .foregroundStyle(stampColor)
                                .opacity(celebrationOpacity)

                            Text("Stamp Collected!")
                                .font(.title2.bold())
                                .foregroundStyle(Color.bodyText)
                                .opacity(celebrationOpacity)
                        }
                        .transition(.scale.combined(with: .opacity))
                    }
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
                } else {
                    VStack(spacing: DS.Spacing.md) {
                        Button {
                            slamStamp()
                        } label: {
                            HStack(spacing: DS.Spacing.sm) {
                                Image(systemName: "hand.point.down.fill")
                                Text("スタンプを押しましょう！")
                            }
                            .font(.headline)
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 18)
                            .background(stampColor, in: RoundedRectangle(cornerRadius: DS.Radius.md))
                            .scaleEffect(buttonBounce ? 1.04 : 1.0)
                        }
                        .buttonStyle(.stamp)

                        Button {
                            onDismiss()
                        } label: {
                            Text("Not Now")
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                        }
                    }
                    .onAppear {
                        withAnimation(.easeInOut(duration: 1.0).repeatForever(autoreverses: true)) {
                            buttonBounce = true
                        }
                    }
                }
            }
            .padding(DS.Spacing.xxl)
        }
        // 3-hit haptic chain: SLAM → bounce → settle
        .sensoryFeedback(.impact(weight: .heavy, intensity: 1.0), trigger: hapticStep) { _, new in new == 1 }
        .sensoryFeedback(.impact(weight: .medium, intensity: 0.5), trigger: hapticStep) { _, new in new == 2 }
        .sensoryFeedback(.impact(weight: .light, intensity: 0.3), trigger: hapticStep) { _, new in new == 3 }
        .sensoryFeedback(.success, trigger: hapticStep) { _, new in new == 4 }
    }

    // MARK: - Washi Background

    private var washiBackground: some View {
        ZStack {
            Color.pageBackground.ignoresSafeArea()

            Canvas { context, size in
                for i in stride(from: 0, to: size.width, by: 3) {
                    for j in stride(from: 0, to: size.height, by: 3) {
                        let noise = sin(i * 0.7) * cos(j * 0.5) * 0.015
                        if abs(noise) > 0.005 {
                            var dot = Path()
                            dot.addEllipse(in: CGRect(x: i, y: j, width: 1.5, height: 1.5))
                            context.fill(dot, with: .color(.brown.opacity(abs(noise))))
                        }
                    }
                }
            }
            .ignoresSafeArea()
            .opacity(0.25)
        }
    }

    // MARK: - Placeholder

    private var placeholder: some View {
        ZStack {
            Circle()
                .strokeBorder(stampColor.opacity(0.15), style: StrokeStyle(lineWidth: 2, dash: [8, 6]))
                .frame(width: 120, height: 120)

            if let def = stampDef {
                Image(systemName: def.icon)
                    .font(.system(size: 36))
                    .foregroundStyle(stampColor.opacity(0.2))
            }
        }
    }

    // MARK: - Stamp Slam Animation

    private func slamStamp() {
        phase = .stamped
        onCollect()

        // === HIT 1: SLAM (0.0s) ===
        // Stamp flies down fast
        withAnimation(.easeIn(duration: 0.15)) {
            stampScale = 1.05
            stampOpacity = 1.0
            stampRotation = Double.random(in: -2...2)
            stampY = 0
        }

        // Heavy haptic
        hapticStep = 1

        // Screen flash on impact
        withAnimation(.easeOut(duration: 0.06)) {
            flashOpacity = 0.4
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.06) {
            withAnimation(.easeOut(duration: 0.15)) {
                flashOpacity = 0
            }
        }

        // Paper shake
        shakeSequence()

        // Impact ring 1
        withAnimation(.easeOut(duration: 0.6)) {
            ringScale = 1.6
            ringOpacity = 0.5
        }
        withAnimation(.easeOut(duration: 0.5).delay(0.15)) {
            ringOpacity = 0
        }

        // === HIT 2: BOUNCE (0.15s) ===
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
            hapticStep = 2

            // Stamp bounces back to 1.0 with spring
            withAnimation(.spring(duration: 0.4, bounce: 0.35)) {
                stampScale = 1.0
                stampRotation = Double.random(in: -3...3)
            }

            // Impact ring 2
            withAnimation(.easeOut(duration: 0.7)) {
                ring2Scale = 1.3
                ring2Opacity = 0.3
            }
            withAnimation(.easeOut(duration: 0.5).delay(0.2)) {
                ring2Opacity = 0
            }
        }

        // === HIT 3: SETTLE (0.35s) ===
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.35) {
            hapticStep = 3
        }

        // === CELEBRATION (0.6s) ===
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
            hapticStep = 4

            withAnimation(.spring(duration: 0.5, bounce: 0.3)) {
                celebrationOpacity = 1
            }
        }

        // === DONE BUTTON (1.0s) ===
        withAnimation(.easeIn(duration: 0.4).delay(1.0)) {
            doneOpacity = 1
        }
    }

    // MARK: - Shake

    private func shakeSequence() {
        let steps: [(CGFloat, Double)] = [
            (-8, 0.03), (6, 0.03), (-4, 0.03), (3, 0.03), (-1, 0.03), (0, 0.05)
        ]
        var delay = 0.0
        for (offset, duration) in steps {
            DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                withAnimation(.linear(duration: duration)) {
                    shakeX = offset
                }
            }
            delay += duration
        }
    }
}

// MARK: - Preview

#Preview("Stamp Collection") {
    StampCollectionPrompt(
        shrine: Shrine.samples[0],
        onCollect: {},
        onDismiss: {}
    )
}

#Preview("Dark") {
    StampCollectionPrompt(
        shrine: Shrine.samples[1],
        onCollect: {},
        onDismiss: {}
    )
    .preferredColorScheme(.dark)
}
