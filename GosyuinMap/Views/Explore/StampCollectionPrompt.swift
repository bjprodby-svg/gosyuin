import SwiftUI
import SwiftData
import Lottie

struct StampCollectionPrompt: View {
    let shrine: Shrine
    let onCollect: () -> Void
    let onDismiss: () -> Void

    @Query private var collectedStamps: [CollectedStamp]

    // Phase states
    @State private var phase: CollectPhase = .ready
    @State private var showTipCard = false
    @State private var tipStore = TipStore()
    @State private var tipPromptController = TipPromptController()

    // Animation states
    @State private var ringScale: CGFloat = 0.6
    @State private var ringOpacity: Double = 0
    @State private var stampScale: CGFloat = 2.0
    @State private var stampRotation: Double = -15
    @State private var stampOpacity: Double = 0
    @State private var flashOpacity: Double = 0
    @State private var shakeOffset: CGFloat = 0
    @State private var titleScale: CGFloat = 0.5
    @State private var titleOpacity: Double = 0
    @State private var showConfetti = false
    @State private var showFireworks = false
    @State private var showShineRing = false
    @State private var showLevelUp = false
    @State private var levelKanjiScale: CGFloat = 0
    @State private var rewardRows: [Bool] = []
    @State private var doneButtonOpacity: Double = 0

    private enum CollectPhase {
        case ready, collecting, collected
    }

    private var collectedIds: Set<Int> {
        Set(collectedStamps.map(\.slotId))
    }
    private var preCollectCount: Int { collectedStamps.count }
    private var postCollectCount: Int { collectedStamps.count + 1 }
    private var levelBefore: CollectorLevel { CollectorLevel.level(for: preCollectCount) }
    private var levelAfter: CollectorLevel { CollectorLevel.level(for: postCollectCount) }
    private var didLevelUp: Bool { levelAfter.rawValue > levelBefore.rawValue }
    private var newBadges: [Achievement] {
        let idsBefore = collectedIds
        var idsAfter = collectedIds
        idsAfter.insert(shrine.stampSlotId)
        return Achievement.all.filter { a in
            !a.requirement(idsBefore, Shrine.samples) && a.requirement(idsAfter, Shrine.samples)
        }
    }

    var body: some View {
        ZStack {
            // Background
            Color.pageBackground.ignoresSafeArea()

            // Full-screen flash
            Color.white
                .ignoresSafeArea()
                .opacity(flashOpacity)
                .allowsHitTesting(false)

            // Full-screen confetti (behind content)
            if showConfetti {
                LottieView(animation: .named("confetti"))
                    .playing(loopMode: .playOnce)
                    .animationSpeed(0.7)
                    .ignoresSafeArea()
                    .allowsHitTesting(false)
                    .transition(.opacity)
            }

            // Full-screen fireworks (for level up)
            if showFireworks {
                LottieView(animation: .named("fireworks"))
                    .playing(loopMode: .loop)
                    .animationSpeed(0.5)
                    .ignoresSafeArea()
                    .allowsHitTesting(false)
                    .transition(.opacity)
            }

            // Main content
            VStack(spacing: 0) {
                Spacer()

                switch phase {
                case .ready:
                    readyContent
                case .collecting, .collected:
                    collectedContent
                }

                Spacer()

                // Buttons
                buttonsArea
                    .padding(.bottom, DS.Spacing.xxl)
            }
            .padding(.horizontal, DS.Spacing.xxl)
            .offset(x: shakeOffset)

            // Level up overlay
            if showLevelUp {
                levelUpOverlay
            }
        }
        .sensoryFeedback(.impact(weight: .heavy), trigger: phase == .collecting)
        .sensoryFeedback(.success, trigger: phase == .collected)
    }

    // MARK: - Ready Content (before collection)

    private var readyContent: some View {
        VStack(spacing: DS.Spacing.xl) {
            // Shrine icon with pulsing ring
            ZStack {
                Circle()
                    .stroke(shrine.category.color.opacity(0.15), lineWidth: 2)
                    .frame(width: 160, height: 160)
                    .scaleEffect(ringScale)
                    .opacity(ringOpacity)
                    .onAppear {
                        withAnimation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true)) {
                            ringScale = 0.85
                            ringOpacity = 0.6
                        }
                    }

                Circle()
                    .fill(shrine.category.color.opacity(0.08))
                    .frame(width: 120, height: 120)
                Circle()
                    .strokeBorder(shrine.category.color.opacity(0.2), lineWidth: 2)
                    .frame(width: 120, height: 120)
                CategoryIconView(category: shrine.category, size: 64, color: shrine.category.color)
            }

            VStack(spacing: DS.Spacing.sm) {
                Text("You're at \(shrine.name)!")
                    .font(.title2.bold())
                    .foregroundStyle(Color.bodyText)
                    .multilineTextAlignment(.center)

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
            }
        }
    }

    // MARK: - Collected Content (after collection)

    private var collectedContent: some View {
        VStack(spacing: DS.Spacing.xl) {
            // Stamp artwork with shine ring
            ZStack {
                if showShineRing {
                    LottieView(animation: .named("shine_ring"))
                        .playing(loopMode: .playOnce)
                        .animationSpeed(0.8)
                        .frame(width: 200, height: 200)
                        .allowsHitTesting(false)
                }

                let stampDef = StampDefinition.all.first { $0.id == shrine.stampSlotId }
                if let stampDef {
                    GosyuinStampView(
                        stamp: stampDef,
                        size: 140,
                        showDate: false,
                        collectedDate: .now
                    )
                    .scaleEffect(stampScale)
                    .rotationEffect(.degrees(stampRotation))
                    .opacity(stampOpacity)
                } else {
                    Image(systemName: "checkmark.seal.fill")
                        .font(.system(size: 72))
                        .foregroundStyle(Color.vermillion)
                        .scaleEffect(stampScale)
                        .opacity(stampOpacity)
                }
            }
            .frame(height: 200)

            // "Stamp Collected!" title
            VStack(spacing: DS.Spacing.sm) {
                Text("Stamp Collected!")
                    .font(.title.bold())
                    .foregroundStyle(Color.vermillion)
                    .scaleEffect(titleScale)
                    .opacity(titleOpacity)

                Text("A beautiful memory preserved.")
                    .font(.subheadline)
                    .foregroundStyle(Color.subtitleText)
                    .opacity(titleOpacity)
            }

            // Rewards
            if !rewardRows.isEmpty {
                VStack(spacing: DS.Spacing.sm) {
                    if didLevelUp && rewardRows.indices.contains(0) && rewardRows[0] {
                        rewardRow(
                            icon: levelAfter.icon,
                            color: levelAfter.color,
                            title: "Level Up!",
                            detail: "Lv.\(levelAfter.rawValue) \(levelAfter.kanji) \(levelAfter.title)"
                        )
                        .transition(.asymmetric(
                            insertion: .scale(scale: 0.3).combined(with: .opacity),
                            removal: .opacity
                        ))
                    }

                    ForEach(Array(newBadges.enumerated()), id: \.element.id) { index, badge in
                        let rewardIndex = didLevelUp ? index + 1 : index
                        if rewardRows.indices.contains(rewardIndex) && rewardRows[rewardIndex] {
                            rewardRow(
                                icon: badge.icon,
                                color: badge.color,
                                title: "Badge Unlocked!",
                                detail: badge.title
                            )
                            .transition(.asymmetric(
                                insertion: .scale(scale: 0.3).combined(with: .opacity),
                                removal: .opacity
                            ))
                        }
                    }
                }
            }

            // Tip card
            if showTipCard {
                TipJarCard(
                    tipStore: tipStore,
                    onDismissForever: { tipPromptController.dismissForever() },
                    onDismiss: { withAnimation(DS.Anim.contentAppear) { showTipCard = false } }
                )
                .transition(.move(edge: .bottom).combined(with: .opacity))
            }
        }
    }

    // MARK: - Buttons

    private var buttonsArea: some View {
        Group {
            switch phase {
            case .ready:
                VStack(spacing: DS.Spacing.md) {
                    Button {
                        collectStamp()
                    } label: {
                        HStack(spacing: DS.Spacing.sm) {
                            Image(systemName: "seal.fill")
                                .font(.headline)
                            Text("Collect Stamp")
                        }
                        .vermillionButtonStyle()
                    }
                    .buttonStyle(.stamp)

                    Button { onDismiss() } label: {
                        Text("Not Now")
                            .font(.subheadline)
                            .foregroundStyle(Color.subtitleText)
                    }
                }

            case .collecting:
                EmptyView()

            case .collected:
                Button { onDismiss() } label: {
                    Text("Done")
                        .vermillionButtonStyle()
                }
                .buttonStyle(.pressable)
                .opacity(doneButtonOpacity)
            }
        }
    }

    // MARK: - Level Up Overlay

    private var levelUpOverlay: some View {
        ZStack {
            Color.black.opacity(0.4)
                .ignoresSafeArea()
                .onTapGesture {
                    withAnimation(DS.Anim.contentAppear) {
                        showLevelUp = false
                        showFireworks = false
                    }
                }

            VStack(spacing: DS.Spacing.xl) {
                LottieView(animation: .named("level_up"))
                    .playing(loopMode: .playOnce)
                    .frame(width: 240, height: 240)

                // Big kanji pop
                Text(levelAfter.kanji)
                    .font(.system(size: 80, weight: .black))
                    .foregroundStyle(levelAfter.color)
                    .shadow(color: levelAfter.color.opacity(0.5), radius: 20)
                    .scaleEffect(levelKanjiScale)

                VStack(spacing: DS.Spacing.sm) {
                    Text("LEVEL UP!")
                        .font(.system(size: 14, weight: .black, design: .monospaced))
                        .foregroundStyle(levelAfter.color)
                        .tracking(4)

                    Text("Lv.\(levelAfter.rawValue) \(levelAfter.title)")
                        .font(.title2.bold())
                        .foregroundStyle(.white)

                    Text(levelAfter.subtitle)
                        .font(.subheadline)
                        .foregroundStyle(.white.opacity(0.7))
                }
            }
        }
        .transition(.opacity)
    }

    // MARK: - Collect Animation (DispatchQueue for reliable timing)

    private func collectStamp() {
        onCollect()
        phase = .collecting

        // === PHASE 1: Impact (0ms) — screen flash + stamp slam ===
        withAnimation(.easeOut(duration: 0.1)) {
            flashOpacity = 0.8
        }
        // Shake
        withAnimation(.spring(duration: 0.08, bounce: 0)) {
            shakeOffset = -8
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.08) {
            withAnimation(.spring(duration: 0.08, bounce: 0)) {
                shakeOffset = 8
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.16) {
            withAnimation(.spring(duration: 0.1, bounce: 0)) {
                shakeOffset = 0
            }
        }

        // Flash fade
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
            withAnimation(.easeOut(duration: 0.4)) {
                flashOpacity = 0
            }
        }

        // === PHASE 2: Stamp reveal (200ms) — stamp slams in from big ===
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            withAnimation(DS.Anim.collect) {
                stampOpacity = 1
                stampScale = 1.0
                stampRotation = 0
            }
            // Shine ring
            showShineRing = true
        }

        // === PHASE 3: Title (500ms) ===
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            withAnimation(.spring(duration: 0.4, bounce: 0.5)) {
                titleScale = 1.0
                titleOpacity = 1
            }
        }

        // === PHASE 4: Confetti explosion (600ms) ===
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
            withAnimation(DS.Anim.contentAppear) {
                showConfetti = true
            }
            phase = .collected
        }

        // === PHASE 5: Rewards cascade (1200ms) ===
        let totalRewards = (didLevelUp ? 1 : 0) + newBadges.count
        if totalRewards > 0 {
            rewardRows = Array(repeating: false, count: totalRewards)
            for i in 0..<totalRewards {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.2 + Double(i) * 0.3) {
                    withAnimation(.spring(duration: 0.5, bounce: 0.4)) {
                        if rewardRows.indices.contains(i) {
                            rewardRows[i] = true
                        }
                    }
                }
            }
        }

        // === PHASE 6: Level Up overlay (1800ms) ===
        if didLevelUp {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.8) {
                withAnimation(DS.Anim.celebration) {
                    showLevelUp = true
                    showFireworks = true
                }
                // Kanji pop with spring
                withAnimation(.spring(duration: 0.6, bounce: 0.5).delay(0.3)) {
                    levelKanjiScale = 1.0
                }
                // Auto-dismiss
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                    withAnimation(DS.Anim.contentAppear) {
                        showLevelUp = false
                        showFireworks = false
                    }
                }
            }
        }

        // === PHASE 7: Tip card (3000ms) ===
        let tipDelay = didLevelUp ? 5.0 : 2.5
        DispatchQueue.main.asyncAfter(deadline: .now() + tipDelay) {
            if tipPromptController.shouldShowTipPrompt(currentStampCount: postCollectCount) {
                tipPromptController.recordShown(atStampCount: postCollectCount)
                withAnimation(DS.Anim.collect) {
                    showTipCard = true
                }
            }
        }

        // === PHASE 8: Done button (1500ms or after level up) ===
        let doneDelay = didLevelUp ? 5.5 : 1.8
        DispatchQueue.main.asyncAfter(deadline: .now() + doneDelay) {
            withAnimation(DS.Anim.contentAppear) {
                doneButtonOpacity = 1
            }
        }
    }

    // MARK: - Reward Row

    private func rewardRow(icon: String, color: Color, title: String, detail: String) -> some View {
        HStack(spacing: DS.Spacing.md) {
            ZStack {
                LottieView(animation: .named("success_particles"))
                    .playing(loopMode: .playOnce)
                    .animationSpeed(1.5)
                    .frame(width: 60, height: 60)
                    .allowsHitTesting(false)

                IconBadge(icon: icon, size: 44, color: color, filled: true)
            }

            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.caption.weight(.black))
                    .foregroundStyle(color)
                    .tracking(0.5)
                Text(detail)
                    .font(.subheadline.weight(.semibold))
                    .foregroundStyle(Color.bodyText)
            }

            Spacer()

            LottieView(animation: .named("sparkle"))
                .playing(loopMode: .loop)
                .animationSpeed(0.4)
                .frame(width: 32, height: 32)
                .allowsHitTesting(false)
        }
        .padding(DS.Spacing.md)
        .background(color.opacity(0.08), in: RoundedRectangle(cornerRadius: DS.Radius.md))
        .overlay(
            RoundedRectangle(cornerRadius: DS.Radius.md)
                .strokeBorder(color.opacity(0.15), lineWidth: 1)
        )
    }
}

#Preview {
    StampCollectionPrompt(
        shrine: Shrine.samples[0],
        onCollect: {},
        onDismiss: {}
    )
}
