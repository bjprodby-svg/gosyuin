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

            // Soft sakura/gold particle drift for level-up (replaces multi-color fireworks)
            if showFireworks {
                sakuraDriftCanvas
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
                        // Fallback: hand-styled vermillion ink seal with kanji "朱印"
                        ZStack {
                            // Outer rough-edge halo (ink wash)
                            Circle()
                                .fill(Color.vermillion.opacity(0.18))
                                .frame(width: 168, height: 168)
                                .blur(radius: 6)
                            // Main square seal (rounded)
                            RoundedRectangle(cornerRadius: 14)
                                .fill(Color.vermillion)
                                .frame(width: 130, height: 130)
                                .rotationEffect(.degrees(-3))
                                .shadow(color: Color.vermillion.opacity(0.35), radius: 8, y: 4)
                            // Inner border
                            RoundedRectangle(cornerRadius: 8)
                                .strokeBorder(.white.opacity(0.7), lineWidth: 2)
                                .frame(width: 110, height: 110)
                                .rotationEffect(.degrees(-3))
                            // Kanji
                            Text("朱印")
                                .font(.system(size: 38, weight: .black))
                                .foregroundStyle(.white)
                                .rotationEffect(.degrees(-3))
                        }
                        .scaleEffect(stampScale)
                        .rotationEffect(.degrees(stampRotation))
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

                    Text(shrine.name)
                        .font(.subheadline.weight(.semibold))
                        .foregroundStyle(Color.bodyText)
                        .multilineTextAlignment(.center)
                        .opacity(titleOpacity)

                    Text("Your visit is now part of the journey.")
                        .font(.caption)
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

                    Text("Bow once, then collect your gosyuin.")
                        .font(.subheadline)
                        .foregroundStyle(Color.subtitleText)
                        .multilineTextAlignment(.center)
                }
            }

            // Rewards cascade
            if !rewardRows.isEmpty {
                VStack(spacing: DS.Spacing.sm) {
                    if didLevelUp && rewardRows.indices.contains(0) && rewardRows[0] {
                        levelRewardRow(
                            level: levelAfter,
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

    // MARK: - SwiftUI Confetti Canvas (sakura petals + gold flecks)

    private var confettiCanvas: some View {
        GeometryReader { geo in
            ForEach(confettiPieces.indices, id: \.self) { i in
                let piece = confettiPieces[i]
                Group {
                    switch piece.kind {
                    case .sakura:
                        SakuraPetalShape()
                            .fill(piece.color)
                            .frame(width: piece.size * 1.4, height: piece.size * 1.4)
                    case .gold:
                        Circle()
                            .fill(piece.color)
                            .frame(width: piece.size * 0.6, height: piece.size * 0.6)
                    case .ribbon:
                        Capsule()
                            .fill(piece.color)
                            .frame(width: piece.size * 0.4, height: piece.size * 1.4)
                    }
                }
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

    // MARK: - Sakura Drift (level-up gentle ambient)

    private var sakuraDriftCanvas: some View {
        GeometryReader { geo in
            ForEach(0..<24, id: \.self) { i in
                let xSeed = Double(i * 37 % 100) / 100.0
                let size = CGFloat.random(in: 12...22)
                let petalColor = [Color(red: 1.0, green: 0.78, blue: 0.82),
                                  Color(red: 0.98, green: 0.86, blue: 0.88),
                                  Color(red: 0.95, green: 0.78, blue: 0.30)].randomElement()!
                SakuraPetalShape()
                    .fill(petalColor.opacity(0.85))
                    .frame(width: size, height: size)
                    .rotationEffect(.degrees(showFireworks ? 360 : 0))
                    .position(
                        x: geo.size.width * (xSeed + (showFireworks ? 0.05 : -0.05)),
                        y: showFireworks ? geo.size.height + 30 : -30
                    )
                    .animation(
                        .easeIn(duration: Double.random(in: 4.5...7.0))
                            .delay(Double(i) * 0.12)
                            .repeatForever(autoreverses: false),
                        value: showFireworks
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
            // Soft sumi-ink dim
            Color(red: 0.10, green: 0.08, blue: 0.06).opacity(0.78)
                .ignoresSafeArea()
                .onTapGesture {
                    withAnimation(DS.Anim.contentAppear) {
                        showLevelUp = false
                        showFireworks = false
                    }
                }

            VStack(spacing: DS.Spacing.lg) {
                // Subdued LEVEL UP tag (was huge neon green kanji)
                Text("LEVEL UP")
                    .font(.system(size: 13, weight: .black, design: .default))
                    .foregroundStyle(.white.opacity(0.85))
                    .tracking(8)
                    .padding(.horizontal, DS.Spacing.lg)
                    .padding(.vertical, 6)
                    .background(
                        Capsule().stroke(.white.opacity(0.45), lineWidth: 1)
                    )

                // Avatar with diffuse glow — square frame respected, no hard ring
                ZStack(alignment: .bottomTrailing) {
                    // Soft halo only
                    Circle()
                        .fill(levelAfter.color.opacity(0.55))
                        .frame(width: 240, height: 240)
                        .blur(radius: 50)
                    AvatarView(level: levelAfter, size: 168)
                        .shadow(color: levelAfter.color.opacity(0.6), radius: 24, y: 4)
                    // Kanji chip overlay (small, doesn't collide with text)
                    Text(levelAfter.kanji)
                        .font(.system(size: 16, weight: .bold))
                        .foregroundStyle(.white)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 4)
                        .background(levelAfter.color, in: Capsule())
                        .overlay(Capsule().strokeBorder(.white, lineWidth: 1.5))
                        .offset(x: 8, y: 8)
                }
                .scaleEffect(levelKanjiScale)

                // Title + subtitle (now clearly visible — no giant kanji overlap)
                VStack(spacing: 4) {
                    Text("Lv.\(levelAfter.rawValue) \(levelAfter.title)")
                        .font(.title.bold())
                        .foregroundStyle(.white)

                    Text(levelAfter.subtitle)
                        .font(.subheadline)
                        .foregroundStyle(.white.opacity(0.75))
                }
            }
            .padding(.horizontal, DS.Spacing.xl)
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
        // Sakura tones (pinks/cream) + gold flecks + a few accent ribbons
        let sakuraColors: [Color] = [
            Color(red: 1.00, green: 0.80, blue: 0.84),  // light sakura
            Color(red: 0.98, green: 0.72, blue: 0.78),  // mid sakura
            Color(red: 1.00, green: 0.92, blue: 0.92),  // pale sakura cream
        ]
        let goldColors: [Color] = [
            Color(red: 0.95, green: 0.78, blue: 0.30),  // warm gold
            Color(red: 0.85, green: 0.65, blue: 0.18),  // deep gold
        ]
        let ribbonColors: [Color] = [.vermillion, shrine.category.color]

        confettiPieces = (0..<48).map { i in
            // 60% sakura, 30% gold, 10% ribbon
            let r = Double.random(in: 0...1)
            let kind: ConfettiKind
            let color: Color
            if r < 0.6 {
                kind = .sakura
                color = sakuraColors.randomElement()!
            } else if r < 0.9 {
                kind = .gold
                color = goldColors.randomElement()!
            } else {
                kind = .ribbon
                color = ribbonColors.randomElement()!
            }
            return ConfettiPiece(
                x: CGFloat.random(in: 0.02...0.98),
                startY: CGFloat.random(in: -0.20...0.10),
                endY: CGFloat.random(in: 0.85...1.35),
                size: CGFloat.random(in: 8...16),
                color: color,
                rotation: Double.random(in: 0...360),
                delay: Double.random(in: 0...0.5),
                duration: Double.random(in: 1.6...2.6),
                kind: kind
            )
        }
    }

    // MARK: - Reward Row (Level — uses pixel avatar)

    private func levelRewardRow(level: CollectorLevel, title: String, detail: String) -> some View {
        HStack(spacing: DS.Spacing.md) {
            ZStack {
                LottieView(animation: .named("success_particles"))
                    .playing(loopMode: .playOnce)
                    .animationSpeed(1.5)
                    .frame(width: 60, height: 60)
                    .allowsHitTesting(false)

                // Flat-illustration avatar badge for the current level.
                AvatarView(level: level, size: 48)
                    .shadow(color: level.color.opacity(0.4), radius: 6, y: 2)
            }

            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.caption.weight(.black))
                    .foregroundStyle(level.color)
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
        .background(level.color.opacity(0.08), in: RoundedRectangle(cornerRadius: DS.Radius.md))
        .overlay(
            RoundedRectangle(cornerRadius: DS.Radius.md)
                .strokeBorder(level.color.opacity(0.18), lineWidth: 1)
        )
    }

    // MARK: - Reward Row (Badge — SF Symbol)

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

private enum ConfettiKind {
    case sakura  // 5-petal flower
    case gold    // small round fleck
    case ribbon  // capsule streak
}

private struct ConfettiPiece {
    let x: CGFloat
    let startY: CGFloat
    let endY: CGFloat
    let size: CGFloat
    let color: Color
    let rotation: Double
    let delay: Double
    let duration: Double
    let kind: ConfettiKind
}

// MARK: - Sakura Petal Shape (5 rounded petals)

private struct SakuraPetalShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height) / 2
        let petalRadius = radius * 0.55

        // 5 petals arranged in a circle
        for i in 0..<5 {
            let angle = (Double(i) / 5.0) * 2 * .pi - .pi / 2
            let petalCenter = CGPoint(
                x: center.x + cos(angle) * (radius - petalRadius * 0.6),
                y: center.y + sin(angle) * (radius - petalRadius * 0.6)
            )
            path.addEllipse(in: CGRect(
                x: petalCenter.x - petalRadius,
                y: petalCenter.y - petalRadius,
                width: petalRadius * 2,
                height: petalRadius * 2
            ))
        }
        // Center disc to merge petals visually
        path.addEllipse(in: CGRect(
            x: center.x - petalRadius * 0.6,
            y: center.y - petalRadius * 0.6,
            width: petalRadius * 1.2,
            height: petalRadius * 1.2
        ))
        return path
    }
}

#Preview {
    StampCollectionPrompt(
        shrine: Shrine.samples[0],
        onCollect: {},
        onDismiss: {}
    )
}
