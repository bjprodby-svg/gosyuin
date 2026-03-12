import SwiftUI

struct StampCollectionPrompt: View {
    let shrine: Shrine
    let onCollect: () -> Void
    let onDismiss: () -> Void

    // MARK: - State

    @State private var phase: Phase = .ready
    @State private var isPressing = false
    @State private var pressProgress: CGFloat = 0
    @State private var inkScale: CGFloat = 0.01
    @State private var inkOpacity: Double = 0
    @State private var stampScale: CGFloat = 0.3
    @State private var stampOpacity: Double = 0
    @State private var stampRotation: Double = -8
    @State private var splatters: [InkSplatter] = []
    @State private var ringWaves: [RingWave] = []
    @State private var textOpacity: Double = 1
    @State private var doneButtonOpacity: Double = 0

    private var stampDef: StampDefinition? {
        StampDefinition.all.first { $0.id == shrine.stampSlotId }
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
                    // Ink bloom
                    inkBloom

                    // Expanding ring waves
                    ForEach(ringWaves) { wave in
                        Circle()
                            .stroke(Color.vermillion.opacity(wave.opacity), lineWidth: 1.5)
                            .frame(width: wave.size, height: wave.size)
                    }

                    // Ink splatters
                    ForEach(splatters) { splat in
                        Circle()
                            .fill(splat.color)
                            .frame(width: splat.size, height: splat.size)
                            .offset(x: splat.offset.width, y: splat.offset.height)
                            .opacity(splat.opacity)
                    }

                    // Press target (before stamp)
                    if phase == .ready || phase == .pressing {
                        pressTarget
                    }

                    // Revealed stamp
                    if phase == .stamped, let def = stampDef {
                        GosyuinStampView(stamp: def, size: 160, showDate: false)
                            .scaleEffect(stampScale)
                            .opacity(stampOpacity)
                            .rotationEffect(.degrees(stampRotation))
                    }
                }
                .frame(height: 240)

                Spacer().frame(height: 32)

                // Text
                VStack(spacing: DS.Spacing.sm) {
                    switch phase {
                    case .ready:
                        Text("You're at \(shrine.name)!")
                            .font(.title2.bold())
                            .foregroundStyle(Color.bodyText)
                            .multilineTextAlignment(.center)
                        Text("Press and hold to stamp")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    case .pressing:
                        Text("Keep holding...")
                            .font(.title2.bold())
                            .foregroundStyle(Color.vermillion)
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
                    Button {
                        onDismiss()
                    } label: {
                        Text("Not Now")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                }
            }
            .padding(DS.Spacing.xxl)
        }
        .sensoryFeedback(.impact(flexibility: .solid, intensity: 0.4), trigger: isPressing)
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
            // Outer ring (progress indicator)
            Circle()
                .trim(from: 0, to: pressProgress)
                .stroke(Color.vermillion, style: StrokeStyle(lineWidth: 4, lineCap: .round))
                .frame(width: 140, height: 140)
                .rotationEffect(.degrees(-90))

            // Background circle
            Circle()
                .fill(Color.vermillion.opacity(isPressing ? 0.15 : 0.08))
                .frame(width: 130, height: 130)
                .scaleEffect(isPressing ? 0.92 : 1.0)

            // Inner stamp icon
            VStack(spacing: 6) {
                Text("\u{26E9}")
                    .font(.system(size: 48))
                    .scaleEffect(isPressing ? 0.85 : 1.0)

                if !isPressing {
                    Image(systemName: "hand.tap.fill")
                        .font(.system(size: 16))
                        .foregroundStyle(Color.vermillion.opacity(0.6))
                        .transition(.opacity)
                }
            }
            .animation(.spring(duration: 0.3), value: isPressing)
        }
        .gesture(
            DragGesture(minimumDistance: 0)
                .onChanged { _ in
                    guard phase == .ready else { return }
                    if !isPressing {
                        isPressing = true
                        phase = .pressing
                        startPressAnimation()
                    }
                }
                .onEnded { _ in
                    if isPressing {
                        isPressing = false
                        if pressProgress >= 1.0 {
                            triggerStamp()
                        } else {
                            cancelPress()
                        }
                    }
                }
        )
    }

    // MARK: - Ink Bloom

    private var inkBloom: some View {
        Circle()
            .fill(
                RadialGradient(
                    colors: [
                        Color.vermillion.opacity(0.6),
                        Color.vermillion.opacity(0.3),
                        Color.vermillion.opacity(0.05),
                        .clear
                    ],
                    center: .center,
                    startRadius: 0,
                    endRadius: 120
                )
            )
            .frame(width: 240, height: 240)
            .scaleEffect(inkScale)
            .opacity(inkOpacity)
    }

    // MARK: - Animations

    private func startPressAnimation() {
        // Animate press progress from 0 to 1 over 0.8s
        withAnimation(.easeInOut(duration: 0.8)) {
            pressProgress = 1.0
        }

        // Ink starts bleeding
        withAnimation(.easeIn(duration: 0.8)) {
            inkScale = 0.5
            inkOpacity = 0.4
        }

        // Auto-trigger if held long enough
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
            if isPressing {
                triggerStamp()
            }
        }
    }

    private func cancelPress() {
        withAnimation(.easeOut(duration: 0.3)) {
            phase = .ready
            pressProgress = 0
            inkScale = 0.01
            inkOpacity = 0
        }
    }

    private func triggerStamp() {
        isPressing = false
        phase = .stamped
        onCollect()

        // 1. Ink bloom expands
        withAnimation(.spring(duration: 0.4, bounce: 0.15)) {
            inkScale = 1.2
            inkOpacity = 0.7
        }

        // 2. Spawn splatters
        spawnSplatters()

        // 3. Ring waves
        spawnRingWaves()

        // 4. Ink fades, stamp revealed
        withAnimation(.easeOut(duration: 0.6).delay(0.3)) {
            inkScale = 1.5
            inkOpacity = 0
        }

        withAnimation(.spring(duration: 0.6, bounce: 0.4).delay(0.35)) {
            stampScale = 1.0
            stampOpacity = 1.0
            stampRotation = Double.random(in: -3...3)
        }

        // 5. Text flash
        withAnimation(.easeOut(duration: 0.15).delay(0.2)) {
            textOpacity = 0
        }
        withAnimation(.easeIn(duration: 0.3).delay(0.5)) {
            textOpacity = 1
        }

        // 6. Done button
        withAnimation(.easeIn(duration: 0.4).delay(0.9)) {
            doneButtonOpacity = 1
        }
    }

    private func spawnSplatters() {
        let count = 12
        for i in 0..<count {
            let angle = Double(i) / Double(count) * .pi * 2 + Double.random(in: -0.3...0.3)
            let dist = CGFloat.random(in: 50...130)
            let splat = InkSplatter(
                id: UUID(),
                offset: CGSize(width: cos(angle) * dist, height: sin(angle) * dist),
                size: CGFloat.random(in: 4...14),
                color: Color.vermillion.opacity(Double.random(in: 0.3...0.7)),
                opacity: 1.0
            )
            splatters.append(splat)
        }

        // Animate splatters appearing then fading
        withAnimation(.spring(duration: 0.5, bounce: 0.3)) {
            // splatters are already in array, SwiftUI picks them up
        }

        // Fade out splatters
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
            withAnimation(.easeOut(duration: 0.6)) {
                for i in splatters.indices {
                    splatters[i].opacity = 0
                }
            }
        }
    }

    private func spawnRingWaves() {
        for delay in [0.0, 0.15, 0.3] {
            DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                let wave = RingWave(id: UUID(), size: 20, opacity: 0.6)
                ringWaves.append(wave)

                if let idx = ringWaves.firstIndex(where: { $0.id == wave.id }) {
                    withAnimation(.easeOut(duration: 0.8)) {
                        ringWaves[idx].size = 280
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
