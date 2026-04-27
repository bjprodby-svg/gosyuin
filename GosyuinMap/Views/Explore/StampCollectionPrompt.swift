import SwiftUI
import SwiftData

struct StampCollectionPrompt: View {
    let shrine: Shrine
    let onCollect: () -> Void
    let onDismiss: () -> Void

    @Query private var collectedStamps: [CollectedStamp]

    @State private var collected = false
    @State private var ringScale: CGFloat = 0.8
    @State private var ringOpacity: Double = 0
    @State private var showRewards = false
    @State private var stampRotation: Double = -8
    @State private var stampScale: CGFloat = 1.3
    @State private var stampOpacity: Double = 0
    @State private var showStampArt = false
    @State private var confettiParticles: [ConfettiParticle] = []
    @State private var showConfetti = false

    private var collectedIds: Set<Int> {
        Set(collectedStamps.map(\.slotId))
    }

    private var preCollectCount: Int { collectedStamps.count }
    private var postCollectCount: Int { collectedStamps.count + 1 }

    private var levelBefore: CollectorLevel {
        CollectorLevel.level(for: preCollectCount)
    }
    private var levelAfter: CollectorLevel {
        CollectorLevel.level(for: postCollectCount)
    }
    private var didLevelUp: Bool {
        levelAfter.rawValue > levelBefore.rawValue
    }

    private var newBadges: [Achievement] {
        let idsBefore = collectedIds
        var idsAfter = collectedIds
        idsAfter.insert(shrine.stampSlotId)
        return Achievement.all.filter { achievement in
            !achievement.requirement(idsBefore, Shrine.samples)
                && achievement.requirement(idsAfter, Shrine.samples)
        }
    }

    var body: some View {
        ZStack {
            if showConfetti {
                confettiOverlay
            }

            VStack(spacing: DS.Spacing.xxl) {
                Spacer()

                // Hero icon area
                ZStack {
                    // Expanding ring animation
                    Circle()
                        .stroke(Color.vermillion.opacity(0.3), lineWidth: 3)
                        .frame(width: 140, height: 140)
                        .scaleEffect(ringScale)
                        .opacity(ringOpacity)

                    // Second decorative ring
                    Circle()
                        .stroke(shrine.category.color.opacity(0.15), lineWidth: 1.5)
                        .frame(width: 160, height: 160)
                        .scaleEffect(ringScale * 0.95)
                        .opacity(ringOpacity * 0.6)

                    if collected && showStampArt {
                        let stampDef = StampDefinition.all.first { $0.id == shrine.stampSlotId }
                        if let stampDef {
                            GosyuinStampView(
                                stamp: stampDef,
                                size: 120,
                                showDate: false,
                                collectedDate: .now
                            )
                            .scaleEffect(stampScale)
                            .rotationEffect(.degrees(stampRotation))
                            .opacity(stampOpacity)
                            .transition(.scale.combined(with: .opacity))
                        } else {
                            collectedCheckmark
                        }
                    } else if collected {
                        collectedCheckmark
                    } else {
                        // Category icon (Canvas drawn)
                        ZStack {
                            Circle()
                                .fill(shrine.category.color.opacity(0.1))
                                .frame(width: 120, height: 120)
                            Circle()
                                .strokeBorder(shrine.category.color.opacity(0.2), lineWidth: 2)
                                .frame(width: 120, height: 120)
                            CategoryIconView(
                                category: shrine.category,
                                size: 64,
                                color: shrine.category.color
                            )
                        }
                    }
                }
                .frame(height: 170)

                VStack(spacing: DS.Spacing.sm) {
                    Text(collected ? "Stamp Collected!" : "You're at \(shrine.name)!")
                        .font(.title2.bold())
                        .foregroundStyle(Color.bodyText)
                        .multilineTextAlignment(.center)
                        .contentTransition(.numericText())

                    if collected {
                        Text("A beautiful memory preserved.")
                            .font(.subheadline)
                            .foregroundStyle(Color.subtitleText)
                            .multilineTextAlignment(.center)
                    } else {
                        HStack(spacing: DS.Spacing.xs) {
                            Image(systemName: shrine.category.icon)
                                .font(.caption)
                                .foregroundStyle(shrine.category.color)
                            Text(shrine.category.displayName)
                                .font(.caption.weight(.medium))
                                .foregroundStyle(Color.subtitleText)
                        }

                        Text("Collect your shrine stamp now.")
                            .font(.subheadline)
                            .foregroundStyle(Color.subtitleText)
                            .multilineTextAlignment(.center)
                    }
                }

                // Reward notifications
                if showRewards && (didLevelUp || !newBadges.isEmpty) {
                    VStack(spacing: DS.Spacing.sm) {
                        if didLevelUp {
                            rewardRow(
                                icon: levelAfter.icon,
                                color: levelAfter.color,
                                title: "Level Up!",
                                detail: "Lv.\(levelAfter.rawValue) \(levelAfter.kanji) \(levelAfter.title)"
                            )
                        }

                        ForEach(newBadges) { badge in
                            rewardRow(
                                icon: badge.icon,
                                color: badge.color,
                                title: "Badge Unlocked!",
                                detail: badge.title
                            )
                        }
                    }
                    .transition(.move(edge: .bottom).combined(with: .opacity))
                }

                Spacer()

                if collected {
                    Button {
                        onDismiss()
                    } label: {
                        Text("Done")
                            .vermillionButtonStyle()
                    }
                    .buttonStyle(.pressable)
                    .transition(.move(edge: .bottom).combined(with: .opacity))
                } else {
                    VStack(spacing: DS.Spacing.md) {
                        Button {
                            performCollectAnimation()
                            onCollect()
                        } label: {
                            HStack(spacing: DS.Spacing.sm) {
                                Image(systemName: "seal.fill")
                                    .font(.headline)
                                Text("Collect Stamp")
                            }
                            .vermillionButtonStyle()
                        }
                        .buttonStyle(.stamp)

                        Button {
                            onDismiss()
                        } label: {
                            Text("Not Now")
                                .font(.subheadline)
                                .foregroundStyle(Color.subtitleText)
                        }
                    }
                }
            }
            .padding(DS.Spacing.xxl)
        }
        .sensoryFeedback(.success, trigger: collected)
    }

    // MARK: - Collected Checkmark

    private var collectedCheckmark: some View {
        ZStack {
            Circle()
                .fill(Color.vermillion.opacity(0.1))
                .frame(width: 100, height: 100)
            Image(systemName: "checkmark.seal.fill")
                .font(.system(size: 56))
                .foregroundStyle(Color.vermillion)
        }
        .transition(.scale.combined(with: .opacity))
    }

    // MARK: - Collect Animation Sequence

    private func performCollectAnimation() {
        withAnimation(.spring(duration: 0.5, bounce: 0.3)) {
            collected = true
            ringScale = 1.5
            ringOpacity = 1
        }
        withAnimation(.easeOut(duration: 0.8).delay(0.2)) {
            ringOpacity = 0
        }

        withAnimation(.spring(duration: 0.4, bounce: 0.4).delay(0.3)) {
            showStampArt = true
            stampOpacity = 1
            stampScale = 1.0
            stampRotation = 0
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            generateConfetti()
            withAnimation(.easeOut(duration: 0.1)) {
                showConfetti = true
            }
        }

        withAnimation(.spring(duration: 0.5).delay(1.0)) {
            showRewards = true
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            withAnimation(.easeInOut(duration: 0.4)) {
                showStampArt = false
            }
        }
    }

    // MARK: - Confetti

    private func generateConfetti() {
        confettiParticles = (0..<24).map { _ in
            ConfettiParticle(
                x: CGFloat.random(in: 0.1...0.9),
                y: CGFloat.random(in: -0.1...0.3),
                targetY: CGFloat.random(in: 0.7...1.2),
                size: CGFloat.random(in: 4...8),
                color: [Color.vermillion, shrine.category.color, .kincha, .matcha, .indigo].randomElement() ?? .vermillion,
                rotation: Double.random(in: 0...360),
                delay: Double.random(in: 0...0.3)
            )
        }
    }

    private var confettiOverlay: some View {
        GeometryReader { geo in
            ForEach(confettiParticles.indices, id: \.self) { i in
                let particle = confettiParticles[i]
                RoundedRectangle(cornerRadius: 1)
                    .fill(particle.color)
                    .frame(width: particle.size, height: particle.size * 0.6)
                    .rotationEffect(.degrees(particle.rotation))
                    .position(
                        x: geo.size.width * particle.x,
                        y: showConfetti ? geo.size.height * particle.targetY : geo.size.height * particle.y
                    )
                    .opacity(showConfetti ? 0 : 1)
                    .animation(
                        .easeOut(duration: 1.5).delay(particle.delay),
                        value: showConfetti
                    )
            }
        }
        .allowsHitTesting(false)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
                withAnimation {
                    showConfetti = true
                }
            }
        }
    }

    // MARK: - Reward Row

    private func rewardRow(icon: String, color: Color, title: String, detail: String) -> some View {
        HStack(spacing: DS.Spacing.md) {
            IconBadge(icon: icon, size: 40, color: color)

            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.caption.weight(.bold))
                    .foregroundStyle(color)
                Text(detail)
                    .font(.subheadline.weight(.medium))
                    .foregroundStyle(Color.bodyText)
            }

            Spacer()

            Image(systemName: "sparkles")
                .font(.caption)
                .foregroundStyle(color.opacity(0.5))
        }
        .padding(DS.Spacing.md)
        .background(color.opacity(0.06), in: RoundedRectangle(cornerRadius: DS.Radius.md))
    }
}

// MARK: - Confetti Particle Model

private struct ConfettiParticle {
    let x: CGFloat
    let y: CGFloat
    let targetY: CGFloat
    let size: CGFloat
    let color: Color
    let rotation: Double
    let delay: Double
}

#Preview {
    StampCollectionPrompt(
        shrine: Shrine.samples[0],
        onCollect: {},
        onDismiss: {}
    )
}
