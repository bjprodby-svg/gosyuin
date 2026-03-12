import SwiftUI

struct StampCollectionPrompt: View {
    let shrine: Shrine
    let onCollect: () -> Void
    let onDismiss: () -> Void

    // MARK: - State

    @State private var phase: Phase = .ready
    @State private var isPressing = false
    @State private var inkScale: CGFloat = 0.01
    @State private var inkOpacity: Double = 0
    @State private var stampScale: CGFloat = 2.0
    @State private var stampOpacity: Double = 0
    @State private var stampRotation: Double = -12
    @State private var stampY: CGFloat = -80
    @State private var splatters: [InkSplatter] = []
    @State private var ringWaves: [RingWave] = []
    @State private var textOpacity: Double = 1
    @State private var doneButtonOpacity: Double = 0
    @State private var buttonPulse = false

    private var stampDef: StampDefinition? {
        StampDefinition.all.first { $0.id == shrine.stampSlotId }
    }

    private var stampColor: Color {
        stampDef?.color ?? .vermillion
    }

    private enum Phase {
        case ready, pressing, stamped
    }

    // MARK: - Body

    var body: some View {
        ZStack {
            // Washi paper background
            washiBackground

            VStack(spacing: 0) {
                Spacer()

                // Main stamp area
                ZStack {
                    // Ink bloom — radial ink spread on impact
                    inkBloom

                    // Expanding ring waves
                    ForEach(ringWaves) { wave in
                        Circle()
                            .stroke(stampColor.opacity(wave.opacity), lineWidth: 1.5)
                            .frame(width: wave.size, height: wave.size)
                    }

                    // Ink splatters — flying droplets
                    ForEach(splatters) { splat in
                        Ellipse()
                            .fill(splat.color)
                            .frame(width: splat.size, height: splat.size * splat.elongation)
                            .rotationEffect(.degrees(splat.rotation))
                            .offset(x: splat.offset.width, y: splat.offset.height)
                            .opacity(splat.opacity)
                    }

                    // Pre-stamp: shrine icon with pulse
                    if phase == .ready {
                        pressTarget
                    }

                    // Pressing state: stamp shadow descending
                    if phase == .pressing {
                        Circle()
                            .fill(stampColor.opacity(0.1))
                            .frame(width: 150, height: 150)
                            .scaleEffect(isPressing ? 0.85 : 1.0)
                            .animation(.easeInOut(duration: 0.15), value: isPressing)
                    }

                    // Revealed stamp — slams down from above
                    if phase == .stamped, let def = stampDef {
                        GosyuinStampView(stamp: def, size: 160, showDate: false)
                            .scaleEffect(stampScale)
                            .opacity(stampOpacity)
                            .rotationEffect(.degrees(stampRotation))
                            .offset(y: stampY)
                    }
                }
                .frame(height: 240)

                Spacer().frame(height: 32)

                // Text
                VStack(spacing: DS.Spacing.sm) {
                    switch phase {
                    case .ready:
                        Text("\(shrine.name) に到着！")
                            .font(.title2.bold())
                            .foregroundStyle(Color.bodyText)
                            .multilineTextAlignment(.center)
                        Text("Collect your shrine stamp now.")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    case .pressing:
                        Text("ぺたん...")
                            .font(.title2.bold())
                            .foregroundStyle(stampColor)
                    case .stamped:
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

                // Bottom buttons
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
                } else if phase == .ready {
                    VStack(spacing: DS.Spacing.md) {
                        Button {
                            beginStampPress()
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
        .sensoryFeedback(.impact(flexibility: .solid, intensity: 0.6), trigger: phase == .pressing)
        .sensoryFeedback(.impact(flexibility: .rigid, intensity: 1.0), trigger: phase == .stamped)
    }

    // MARK: - Washi Background

    private var washiBackground: some View {
        Canvas { context, size in
            // Subtle fiber texture
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

    // MARK: - Press Target

    private var pressTarget: some View {
        ZStack {
            // Gentle pulsing circle
            Circle()
                .fill(stampColor.opacity(0.08))
                .frame(width: 140, height: 140)
                .scaleEffect(buttonPulse ? 1.06 : 1.0)

            Circle()
                .strokeBorder(stampColor.opacity(0.25), lineWidth: 2)
                .frame(width: 140, height: 140)

            // Inner shrine icon
            VStack(spacing: 6) {
                if let def = stampDef {
                    Image(systemName: def.icon)
                        .font(.system(size: 48))
                        .foregroundStyle(stampColor)
                } else {
                    Text("\u{26E9}")
                        .font(.system(size: 48))
                }

                Text(shrine.name)
                    .font(.caption.bold())
                    .foregroundStyle(stampColor)
                    .lineLimit(1)
            }
        }
    }

    // MARK: - Ink Bloom

    private var inkBloom: some View {
        Circle()
            .fill(
                RadialGradient(
                    colors: [
                        stampColor.opacity(0.7),
                        stampColor.opacity(0.4),
                        stampColor.opacity(0.1),
                        .clear
                    ],
                    center: .center,
                    startRadius: 0,
                    endRadius: 120
                )
            )
            .frame(width: 260, height: 260)
            .scaleEffect(inkScale)
            .opacity(inkOpacity)
    }

    // MARK: - Stamp Press Sequence

    private func beginStampPress() {
        phase = .pressing
        isPressing = true

        // Phase 1: Ink starts bleeding on the paper (anticipation)
        withAnimation(.easeIn(duration: 0.4)) {
            inkScale = 0.4
            inkOpacity = 0.5
        }

        // Phase 2: Auto-trigger the slam after brief build-up
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            triggerStamp()
        }
    }

    private func triggerStamp() {
        isPressing = false
        phase = .stamped
        onCollect()

        // 1. Ink bloom EXPLODES outward
        withAnimation(.spring(duration: 0.3, bounce: 0.1)) {
            inkScale = 1.4
            inkOpacity = 0.8
        }

        // 2. Stamp SLAMS down — fast, heavy
        withAnimation(.spring(duration: 0.3, bounce: 0.0)) {
            stampScale = 1.1
            stampOpacity = 1.0
            stampRotation = Double.random(in: -2...2)
            stampY = 0
        }

        // 3. Spawn ink splatters on impact
        spawnSplatters()

        // 4. Ring waves ripple out
        spawnRingWaves()

        // 5. Stamp settles with bounce
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            withAnimation(.spring(duration: 0.5, bounce: 0.35)) {
                stampScale = 1.0
                stampRotation = Double.random(in: -3...3)
            }
        }

        // 6. Ink bloom fades
        withAnimation(.easeOut(duration: 0.8).delay(0.3)) {
            inkScale = 1.8
            inkOpacity = 0
        }

        // 7. Text flash
        withAnimation(.easeOut(duration: 0.1).delay(0.15)) {
            textOpacity = 0
        }
        withAnimation(.easeIn(duration: 0.3).delay(0.5)) {
            textOpacity = 1
        }

        // 8. Done button appears
        withAnimation(.easeIn(duration: 0.4).delay(0.9)) {
            doneButtonOpacity = 1
        }
    }

    // MARK: - Splatter Generation

    private func spawnSplatters() {
        // Large splatters — dramatic impact droplets
        for i in 0..<10 {
            let angle = Double(i) / 10.0 * .pi * 2 + Double.random(in: -0.4...0.4)
            let dist = CGFloat.random(in: 55...120)
            splatters.append(InkSplatter(
                id: UUID(),
                offset: CGSize(width: cos(angle) * dist, height: sin(angle) * dist),
                size: CGFloat.random(in: 8...18),
                elongation: CGFloat.random(in: 0.5...1.0),
                rotation: Double.random(in: 0...360),
                color: stampColor.opacity(Double.random(in: 0.4...0.8)),
                opacity: 1.0
            ))
        }

        // Medium droplets — mid range
        for _ in 0..<14 {
            let angle = Double.random(in: 0...(2 * .pi))
            let dist = CGFloat.random(in: 70...160)
            splatters.append(InkSplatter(
                id: UUID(),
                offset: CGSize(width: cos(angle) * dist, height: sin(angle) * dist),
                size: CGFloat.random(in: 4...10),
                elongation: CGFloat.random(in: 0.4...1.0),
                rotation: Double.random(in: 0...360),
                color: stampColor.opacity(Double.random(in: 0.3...0.6)),
                opacity: 1.0
            ))
        }

        // Fine mist — tiny dots scattered far
        for _ in 0..<20 {
            let angle = Double.random(in: 0...(2 * .pi))
            let dist = CGFloat.random(in: 90...200)
            splatters.append(InkSplatter(
                id: UUID(),
                offset: CGSize(width: cos(angle) * dist, height: sin(angle) * dist),
                size: CGFloat.random(in: 2...5),
                elongation: CGFloat.random(in: 0.6...1.0),
                rotation: Double.random(in: 0...360),
                color: stampColor.opacity(Double.random(in: 0.2...0.5)),
                opacity: 1.0
            ))
        }

        // Animate splatters
        withAnimation(.spring(duration: 0.4, bounce: 0.2)) {
            // SwiftUI picks up array changes
        }

        // Splatters fade out slowly (ink drying)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
            withAnimation(.easeOut(duration: 1.0)) {
                for i in splatters.indices {
                    splatters[i].opacity = 0
                }
            }
        }
    }

    private func spawnRingWaves() {
        for delay in [0.0, 0.12, 0.24, 0.36] {
            DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                let wave = RingWave(id: UUID(), size: 20, opacity: 0.5)
                ringWaves.append(wave)

                if let idx = ringWaves.firstIndex(where: { $0.id == wave.id }) {
                    withAnimation(.easeOut(duration: 0.9)) {
                        ringWaves[idx].size = 300
                        ringWaves[idx].opacity = 0
                    }
                }
            }
        }
    }
}

// MARK: - Data Types

private struct InkSplatter: Identifiable {
    let id: UUID
    let offset: CGSize
    let size: CGFloat
    var elongation: CGFloat = 1.0
    var rotation: Double = 0
    let color: Color
    var opacity: Double
}

private struct RingWave: Identifiable {
    let id: UUID
    var size: CGFloat
    var opacity: Double
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
