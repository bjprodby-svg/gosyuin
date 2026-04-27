import SwiftUI
import SwiftData
import Lottie

struct StampCollectionPrompt: View {
    let shrine: Shrine
    let onCollect: () -> Void
    let onDismiss: () -> Void

    @Query private var collectedStamps: [CollectedStamp]

    // Phase states
    @State private var collected = false
    @State private var showTipCard = false
    @State private var tipStore = TipStore()
    @State private var tipPromptController = TipPromptController()

    // Animation states
    @State private var readyRingScale: CGFloat = 0.7
    @State private var readyRingOpacity: Double = 0
    @State private var inkWaveScale: CGFloat = 0
    @State private var inkWaveOpacity: Double = 0
    @State private var stampScale: CGFloat = 2.5
    @State private var stampRotation: Double = -20
    @State private var stampOpacity: Double = 0
    @State private var flashOpacity: Double = 0
    @State private var shakeOffset: CGFloat = 0
    @State private var titleScale: CGFloat = 0.5
    @State private var titleOpacity: Double = 0
    @State private var showLottieConfetti = false
    @State private var showSwiftUIConfetti = false
    @State private var confettiPieces: [ConfettiPiece] = []
    @State private var showFireworks = false
    @State private var showShineRing = false
    @State private var showLevelUp = false
    @State private var levelKanjiScale: CGFloat = 0
    @State private var rewardRows: [Bool] = []
    @State private var doneButtonOpacity: Double = 0

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

            // Ink wave (vermillion circle that expands on stamp press)
            Circle()
                .fill(Color.vermillion.opacity(0.15))
                .scaleEffect(inkWaveScale)
                .opacity(inkWaveOpacity)
                .ignoresSafeArea()
                .allowsHitTesting(false)

            // Full-screen flash
            Color.white
                .ignoresSafeArea()
                .opacity(flashOpacity)
                .allowsHitTesting(false)

            // Lottie confetti
            if showLottieConfetti {
                LottieView(animation: .named("confetti"))
                    .playing(loopMode: .playOnce)
                    .animationSpeed(0.7)
                    .ignoresSafeArea()
                    .allowsHitTesting(false)
            }

            // SwiftUI confetti (denser, themed particles)
            if showSwiftUIConfetti {
                confettiCanvas
            }

            // Full-screen fireworks (for level up)
            if showFireworks {
                LottieView(animation: .named("fireworks"))
                    .playing(loopMode: .loop)
                    .animationSpeed(0.5)
                    .ignoresSafeArea()
                    .allowsHitTesting(false)
            }

            // Main content (single layout, animated visibility)
            ScrollView {
                VStack(spacing: DS.Spacing.xl) {
                    Spacer(minLength: 60)

                    mainContent

                    Spacer(minLength: 40)

                    buttonsArea
                        .padding(.bottom, DS.Spacing.xxl)
                }
                .padding(.horizontal, DS.Spacing.xxl)
            }
            .scrollIndicators(.hidden)
            .offset(x: shakeOffset)

            // Level up overlay
            if showLevelUp {
                levelUpOverlay
            }
        }
        .sensoryFeedback(.impact(weight: .heavy), trigger: collected)
    }

    // MARK: - Main Content (unified, animated visibility)

    private var mainContent: some View {
        VStack(spacing: DS.Spacing.xl) {
            // Hero area — transitions from shrine icon to stamp artwork
            ZStack {
                // Pulsing ring (before collection)
                if !collected {
                    Circle()
                        .stroke(shrine.category.color.opacity(0.15), lineWidth: 2)
                        .frame(width: 160, height: 160)
                        .scaleEffect(readyRingScale)
                        .opacity(readyRingOpacity)
                        .onAppear {
                            withAnimation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true)) {
                                readyRingScale = 0.85
                                readyRingOpacity = 0.6
                            }
                        }
                }

                // Shine ring Lottie (after collection)
                if showShineRing {
                    LottieView(animation: .named("shine_ring"))
                        .playing(loopMode: .playOnce)
                        .animationSpeed(0.8)
                        .frame(width: 220, height: 220)
                        .allowsHitTesting(false)
                }

                if collected {
                    // Stamp artwork (slams in)
                    let stampDef = StampDefinition.all.first { $0.id == shrine.stampSlotId }
                    if let stampDef {
                        GosyuinStampView(
                            stamp: stampDef,
                            size: 150,
                            showDate: false,
                            collectedDate: .now
                        )
                        .scaleEffect(stampScale)
                        .rotationEffect(.degrees(stampRotation))
                        .opacity(stampOpacity)
                    } else {
                        Image(systemName: "checkmark.seal.fill")
                            .font(.system(size: 80))
                            .foregroundStyle(Color.vermillion)
                            .scaleEffect(stampScale)
                            .opacity(stampOpacity)
                    }
                } else {
                    // Shrine category icon (before collection)
                    ZStack {
                        Circle()
                            .fill(shrine.category.color.opacity(0.08))
                            .frame(width: 120, height: 120)
                        Circle()
                            .strokeBorder(shrine.category.color.opacity(0.2), lineWidth: 2)
                            .frame(width: 120, height: 120)
                        CategoryIconView(category: shrine.category, size: 64, color: shrine.category.color)
                    }
                }
            }
            .frame(height: 220)

            // Title area
            VStack(spacing: DS.Spacing.sm) {
                if collected {
                    Text("Stamp Collected!")
                        .font(.title.bold())
                        .foregroundStyle(Color.vermillion)
                        .scaleEffect(titleScale)
                        .opacity(titleOpacity)

                    Text("A beautiful memory preserved.")
                        .font(.subheadline)
                        .foregroundStyle(Color.subtitleText)
                        .opacity(titleOpacity)
                } else {
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

            // Rewards cascade
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

    // MARK: - SwiftUI Confetti Canvas (themed, dense)

    private var confettiCanvas: some View {
        GeometryReader { geo in
            ForEach(confettiPieces.indices, id: \.self) { i in
                let piece = confettiPieces[i]
                RoundedRectangle(cornerRadius: 2)
                    .fill(piece.color)
                    .frame(width: piece.size, height: piece.size * 0.5)
                    .rotationEffect(.degrees(piece.rotation))
                    .position(
                        x: geo.size.width * piece.x,
                        y: showSwiftUIConfetti
                            ? geo.size.height * piece.endY
                            : geo.size.height * piece.startY
                    )
                    .opacity(showSwiftUIConfetti ? 0 : 1)
                    .animation(
                        .easeOut(duration: piece.duration).delay(piece.delay),
                        value: showSwiftUIConfetti
                    )
            }
        }
        .ignoresSafeArea()
        .allowsHitTesting(false)
    }

    // MARK: - Buttons

    private var buttonsArea: some View {
        Group {
            if !collected {
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
            } else {
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

    // MARK: - Collect Animation

    private func collectStamp() {
        onCollect()

        // === PHASE 1: Impact (0ms) — ink wave + flash + shake ===
        // Ink wave expands from center
        withAnimation(.easeOut(duration: 0.6)) {
            inkWaveScale = 6
            inkWaveOpacity = 1
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            withAnimation(.easeOut(duration: 0.5)) {
                inkWaveOpacity = 0
            }
        }

        // Screen flash
        withAnimation(.easeOut(duration: 0.08)) {
            flashOpacity = 0.9
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            withAnimation(.easeOut(duration: 0.3)) {
                flashOpacity = 0
            }
        }

        // Screen shake (3 oscillations)
        withAnimation(.spring(duration: 0.06, bounce: 0)) { shakeOffset = -12 }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.06) {
            withAnimation(.spring(duration: 0.06, bounce: 0)) { shakeOffset = 12 }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.12) {
            withAnimation(.spring(duration: 0.06, bounce: 0)) { shakeOffset = -6 }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.18) {
            withAnimation(.spring(duration: 0.08, bounce: 0)) { shakeOffset = 0 }
        }

        // Switch to collected state (stamp + title areas change)
        withAnimation(DS.Anim.collect) {
            collected = true
        }

        // === PHASE 2: Stamp slam (100ms) — stamp slams in from 2.5x ===
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            withAnimation(.spring(duration: 0.4, bounce: 0.35)) {
                stampOpacity = 1
                stampScale = 1.0
                stampRotation = 0
            }
            showShineRing = true
        }

        // === PHASE 3: Title bounce (400ms) ===
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            withAnimation(.spring(duration: 0.5, bounce: 0.5)) {
                titleScale = 1.0
                titleOpacity = 1
            }
        }

        // === PHASE 4: Confetti explosion (500ms) — both Lottie + SwiftUI ===
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            showLottieConfetti = true
            generateConfetti()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
                showSwiftUIConfetti = true
            }
        }

        // === PHASE 5: Rewards cascade (1000ms) ===
        let totalRewards = (didLevelUp ? 1 : 0) + newBadges.count
        if totalRewards > 0 {
            rewardRows = Array(repeating: false, count: totalRewards)
            for i in 0..<totalRewards {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0 + Double(i) * 0.35) {
                    withAnimation(.spring(duration: 0.5, bounce: 0.4)) {
                        if rewardRows.indices.contains(i) {
                            rewardRows[i] = true
                        }
                    }
                }
            }
        }

        // === PHASE 6: Level Up overlay (1600ms) ===
        if didLevelUp {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.6) {
                withAnimation(DS.Anim.celebration) {
                    showLevelUp = true
                    showFireworks = true
                }
                withAnimation(.spring(duration: 0.7, bounce: 0.5).delay(0.2)) {
                    levelKanjiScale = 1.0
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
                    withAnimation(DS.Anim.contentAppear) {
                        showLevelUp = false
                        showFireworks = false
                    }
                }
            }
        }

        // === PHASE 7: Tip card ===
        let tipDelay = didLevelUp ? 5.5 : 2.5
        DispatchQueue.main.asyncAfter(deadline: .now() + tipDelay) {
            if tipPromptController.shouldShowTipPrompt(currentStampCount: postCollectCount) {
                tipPromptController.recordShown(atStampCount: postCollectCount)
                withAnimation(DS.Anim.collect) {
                    showTipCard = true
                }
            }
        }

        // === PHASE 8: Done button ===
        let doneDelay = didLevelUp ? 6.0 : 1.5
        DispatchQueue.main.asyncAfter(deadline: .now() + doneDelay) {
            withAnimation(DS.Anim.contentAppear) {
                doneButtonOpacity = 1
            }
        }
    }

    private func generateConfetti() {
        let colors: [Color] = [.vermillion, shrine.category.color, .kincha, .matcha, .indigo, .white]
        confettiPieces = (0..<40).map { _ in
            ConfettiPiece(
                x: CGFloat.random(in: 0.05...0.95),
                startY: CGFloat.random(in: -0.15...0.2),
                endY: CGFloat.random(in: 0.8...1.3),
                size: CGFloat.random(in: 5...10),
                color: colors.randomElement()!,
                rotation: Double.random(in: 0...360),
                delay: Double.random(in: 0...0.4),
                duration: Double.random(in: 1.2...2.0)
            )
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

// MARK: - Confetti Piece Model

private struct ConfettiPiece {
    let x: CGFloat
    let startY: CGFloat
    let endY: CGFloat
    let size: CGFloat
    let color: Color
    let rotation: Double
    let delay: Double
    let duration: Double
}

#Preview {
    StampCollectionPrompt(
        shrine: Shrine.samples[0],
        onCollect: {},
        onDismiss: {}
    )
}
