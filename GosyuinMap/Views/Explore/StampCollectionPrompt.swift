import SwiftUI

struct StampCollectionPrompt: View {
    let shrine: Shrine
    let onCollect: () -> Void
    let onDismiss: () -> Void

    // MARK: - State

    @State private var phase: Phase = .ready
    @State private var stampScale: CGFloat = 2.5
    @State private var stampOpacity: Double = 0
    @State private var stampRotation: Double = -10
    @State private var stampY: CGFloat = -120
    @State private var impactRingScale: CGFloat = 0.3
    @State private var impactRingOpacity: Double = 0
    @State private var paperShake: CGFloat = 0
    @State private var textOpacity: Double = 1
    @State private var doneButtonOpacity: Double = 0
    @State private var buttonPulse = false
    @State private var hapticTick = 0

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
            washiBackground

            VStack(spacing: 0) {
                Spacer()

                // Stamp area
                ZStack {
                    // Impact ring — shockwave on contact
                    Circle()
                        .stroke(stampColor.opacity(impactRingOpacity), lineWidth: 3)
                        .frame(width: 200, height: 200)
                        .scaleEffect(impactRingScale)

                    // Pre-stamp: ghost outline showing where stamp will land
                    if phase == .ready {
                        stampPlaceholder
                    }

                    // The actual stamp — slams down
                    if phase == .stamped, let def = stampDef {
                        GosyuinStampView(stamp: def, size: 160, showDate: false)
                            .scaleEffect(stampScale)
                            .opacity(stampOpacity)
                            .rotationEffect(.degrees(stampRotation))
                            .offset(y: stampY)
                    }
                }
                .frame(height: 240)
                .offset(x: paperShake)

                Spacer().frame(height: 32)

                // Text
                VStack(spacing: DS.Spacing.sm) {
                    if phase == .ready {
                        Text("\(shrine.name) に到着！")
                            .font(.title2.bold())
                            .foregroundStyle(Color.bodyText)
                            .multilineTextAlignment(.center)
                    } else {
                        Text("Stamp Collected!")
                            .font(.title2.bold())
                            .foregroundStyle(Color.bodyText)
                            .transition(.scale.combined(with: .opacity))
                        Text("Check your Stamp Book to see it.")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                            .transition(.opacity)
                    }
                }
                .opacity(textOpacity)
                .animation(.easeInOut(duration: 0.3), value: phase)

                Spacer()

                // Buttons
                if phase == .stamped {
                    Button {
                        onDismiss()
                    } label: {
                        Text("Done")
                            .vermillionButtonStyle()
                    }
                    .buttonStyle(.pressable)
                    .opacity(doneButtonOpacity)
                    .transition(.move(edge: .bottom).combined(with: .opacity))
                } else {
                    VStack(spacing: DS.Spacing.md) {
                        Button {
                            triggerStamp()
                        } label: {
                            HStack(spacing: DS.Spacing.sm) {
                                Image(systemName: "hand.point.down.fill")
                                Text("スタンプを押しましょう！")
                            }
                            .vermillionButtonStyle()
                            .scaleEffect(buttonPulse ? 1.03 : 1.0)
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
                        withAnimation(.easeInOut(duration: 1.2).repeatForever(autoreverses: true)) {
                            buttonPulse = true
                        }
                    }
                }
            }
            .padding(DS.Spacing.xxl)
        }
        // Bump-style haptic sequence: heavy hit → bounce → settle
        .sensoryFeedback(.impact(weight: .heavy, intensity: 1.0), trigger: hapticTick) { old, new in
            new == 1
        }
        .sensoryFeedback(.impact(weight: .medium, intensity: 0.6), trigger: hapticTick) { old, new in
            new == 2
        }
        .sensoryFeedback(.impact(weight: .light, intensity: 0.3), trigger: hapticTick) { old, new in
            new == 3
        }
    }

    // MARK: - Washi Background

    private var washiBackground: some View {
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
        .opacity(0.3)
    }

    // MARK: - Stamp Placeholder

    private var stampPlaceholder: some View {
        ZStack {
            // Dashed circle — "stamp here" target
            Circle()
                .strokeBorder(stampColor.opacity(0.2), style: StrokeStyle(lineWidth: 2, dash: [8, 6]))
                .frame(width: 160, height: 160)

            VStack(spacing: 8) {
                if let def = stampDef {
                    Image(systemName: def.icon)
                        .font(.system(size: 40))
                        .foregroundStyle(stampColor.opacity(0.3))
                } else {
                    Text("\u{26E9}")
                        .font(.system(size: 40))
                        .foregroundStyle(stampColor.opacity(0.3))
                }
            }
        }
    }

    // MARK: - Stamp Animation

    private func triggerStamp() {
        phase = .stamped
        onCollect()

        // 1. Stamp SLAMS down — fast, no bounce initially
        withAnimation(.easeIn(duration: 0.18)) {
            stampScale = 1.08
            stampOpacity = 1.0
            stampRotation = Double.random(in: -2...2)
            stampY = 0
        }

        // Haptic 1: heavy BUMP on impact
        hapticTick = 1

        // 2. Impact shockwave ring
        withAnimation(.easeOut(duration: 0.5)) {
            impactRingScale = 1.5
            impactRingOpacity = 0.5
        }
        withAnimation(.easeOut(duration: 0.7).delay(0.1)) {
            impactRingOpacity = 0
        }

        // 3. Paper shake — the whole surface trembles on impact
        withAnimation(.linear(duration: 0.04)) {
            paperShake = -6
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.04) {
            withAnimation(.linear(duration: 0.04)) {
                paperShake = 5
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.08) {
            withAnimation(.linear(duration: 0.04)) {
                paperShake = -3
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.12) {
            withAnimation(.spring(duration: 0.2)) {
                paperShake = 0
            }
        }

        // 4. Stamp bounce-back — like rubber stamp lifting slightly then settling
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.18) {
            hapticTick = 2 // medium bounce haptic

            withAnimation(.spring(duration: 0.35, bounce: 0.4)) {
                stampScale = 1.0
                stampRotation = Double.random(in: -3...3)
            }
        }

        // 5. Tiny settle haptic
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            hapticTick = 3
        }

        // 6. Text transition
        withAnimation(.easeOut(duration: 0.1).delay(0.1)) {
            textOpacity = 0
        }
        withAnimation(.easeIn(duration: 0.3).delay(0.45)) {
            textOpacity = 1
        }

        // 7. Done button
        withAnimation(.easeIn(duration: 0.4).delay(0.8)) {
            doneButtonOpacity = 1
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

#Preview("Stamp Collection - Dark") {
    StampCollectionPrompt(
        shrine: Shrine.samples[1],
        onCollect: {},
        onDismiss: {}
    )
    .preferredColorScheme(.dark)
}
