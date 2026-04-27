import SwiftUI
import SwiftData
import Lottie

struct StampCollectionPrompt: View {
    let shrine: Shrine
    let onCollect: () -> Void
    let onDismiss: () -> Void

    @Query private var collectedStamps: [CollectedStamp]

    // Collection animation states
    @State private var collected = false
    @State private var ringScale: CGFloat = 0.8
    @State private var ringOpacity: Double = 0
    @State private var showStampArt = false
    @State private var stampRotation: Double = -8
    @State private var stampScale: CGFloat = 1.3
    @State private var stampOpacity: Double = 0

    // Lottie overlays
    @State private var showConfettiLottie = false
    @State private var showLevelUpOverlay = false
    @State private var showBadgeGlow = false

    // Rewards & tip
    @State private var showRewards = false
    @State private var showTipCard = false
    @State private var tipStore = TipStore()
    @State private var tipPromptController = TipPromptController()

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
            // Lottie confetti overlay
            if showConfettiLottie {
                LottieView(animation: .named("confetti"))
                    .playing(loopMode: .playOnce)
                    .animationSpeed(0.8)
                    .allowsHitTesting(false)
                    .transition(.opacity)
            }

            VStack(spacing: DS.Spacing.xxl) {
                Spacer()

                heroArea
                titleArea

                // Reward notifications
                if showRewards && (didLevelUp || !newBadges.isEmpty) {
                    rewardsSection
                }

                // Tip jar card
                if showTipCard {
                    TipJarCard(
                        tipStore: tipStore,
                        onDismissForever: { tipPromptController.dismissForever() },
                        onDismiss: { withAnimation { showTipCard = false } }
                    )
                    .transition(.move(edge: .bottom).combined(with: .opacity))
                }

                Spacer()

                buttonsSection
            }
            .padding(DS.Spacing.xxl)

            // Level up full overlay
            if showLevelUpOverlay {
                levelUpOverlay
            }
        }
        .sensoryFeedback(.success, trigger: collected)
    }

    // MARK: - Hero Area

    private var heroArea: some View {
        ZStack {
            // Expanding rings
            Circle()
                .stroke(Color.vermillion.opacity(0.3), lineWidth: 3)
                .frame(width: 140, height: 140)
                .scaleEffect(ringScale)
                .opacity(ringOpacity)

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
    }

    // MARK: - Title Area

    private var titleArea: some View {
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
    }

    // MARK: - Rewards Section

    private var rewardsSection: some View {
        VStack(spacing: DS.Spacing.sm) {
            if didLevelUp {
                rewardRow(
                    icon: levelAfter.icon,
                    color: levelAfter.color,
                    title: "Level Up!",
                    detail: "Lv.\(levelAfter.rawValue) \(levelAfter.kanji) \(levelAfter.title)"
                )
                .appearAnimation(delay: 0)
            }

            ForEach(Array(newBadges.enumerated()), id: \.element.id) { index, badge in
                ZStack {
                    if showBadgeGlow {
                        LottieView(animation: .named("badge_unlock"))
                            .playing(loopMode: .playOnce)
                            .animationSpeed(1.2)
                            .frame(width: 80, height: 80)
                            .offset(x: -DS.Spacing.lg)
                            .allowsHitTesting(false)
                    }

                    rewardRow(
                        icon: badge.icon,
                        color: badge.color,
                        title: "Badge Unlocked!",
                        detail: badge.title
                    )
                }
                .appearAnimation(delay: DS.Anim.stagger(index + (didLevelUp ? 1 : 0), interval: 0.15))
            }
        }
        .transition(.move(edge: .bottom).combined(with: .opacity))
    }

    // MARK: - Buttons Section

    private var buttonsSection: some View {
        Group {
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
    }

    // MARK: - Level Up Overlay

    private var levelUpOverlay: some View {
        ZStack {
            Color.black.opacity(0.3)
                .ignoresSafeArea()
                .onTapGesture {
                    withAnimation(DS.Anim.contentAppear) {
                        showLevelUpOverlay = false
                    }
                }

            VStack(spacing: DS.Spacing.lg) {
                LottieView(animation: .named("level_up"))
                    .playing(loopMode: .playOnce)
                    .frame(width: 200, height: 200)

                Text(levelAfter.kanji)
                    .font(.system(size: 64, weight: .bold))
                    .foregroundStyle(levelAfter.color)
                    .celebrationPop(color: levelAfter.color)

                VStack(spacing: DS.Spacing.xs) {
                    Text("Level \(levelAfter.rawValue)")
                        .font(.title3.weight(.bold))
                        .foregroundStyle(Color.bodyText)
                    Text(levelAfter.title)
                        .font(.subheadline)
                        .foregroundStyle(Color.subtitleText)
                    Text(levelAfter.subtitle)
                        .font(.caption)
                        .foregroundStyle(Color.captionText)
                }
                .slideUp(delay: 0.3)
            }
        }
        .transition(.opacity)
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

    // MARK: - Collect Animation Sequence (async/await)

    private func performCollectAnimation() {
        Task {
            // 1. Ring burst + collected state
            await AnimationSequence.step(DS.Anim.collect) {
                collected = true
                ringScale = 1.5
                ringOpacity = 1
            }

            // 2. Ring fades out
            await AnimationSequence.step(DS.Anim.ringFade, delay: .milliseconds(200)) {
                ringOpacity = 0
            }

            // 3. Stamp art appears
            await AnimationSequence.step(DS.Anim.reveal, delay: .milliseconds(100)) {
                showStampArt = true
                stampOpacity = 1
                stampScale = 1.0
                stampRotation = 0
            }

            // 4. Lottie confetti burst
            await AnimationSequence.perform(delay: .milliseconds(200)) {
                withAnimation(DS.Anim.contentAppear) {
                    showConfettiLottie = true
                }
            }

            // 5. Reward badges slide in
            await AnimationSequence.step(DS.Anim.collect, delay: .milliseconds(500)) {
                showRewards = true
                showBadgeGlow = true
            }

            // 6. Level up overlay (if applicable)
            if didLevelUp {
                await AnimationSequence.perform(delay: .milliseconds(400)) {
                    withAnimation(DS.Anim.celebration) {
                        showLevelUpOverlay = true
                    }
                }

                // Auto-dismiss after 2.5s
                await AnimationSequence.perform(delay: .milliseconds(2500)) {
                    withAnimation(DS.Anim.contentAppear) {
                        showLevelUpOverlay = false
                    }
                }
            }

            // 7. Tip card (conditional)
            await AnimationSequence.perform(delay: .milliseconds(500)) {
                if tipPromptController.shouldShowTipPrompt(currentStampCount: postCollectCount) {
                    tipPromptController.recordShown(atStampCount: postCollectCount)
                    withAnimation(DS.Anim.collect) {
                        showTipCard = true
                    }
                }
            }

            // 8. Stamp art hides
            await AnimationSequence.step(DS.Anim.pageTransition, delay: .milliseconds(300)) {
                showStampArt = false
            }
        }
    }

    // MARK: - Reward Row

    private func rewardRow(icon: String, color: Color, title: String, detail: String) -> some View {
        HStack(spacing: DS.Spacing.md) {
            IconBadge(icon: icon, size: 40, color: color)
                .celebrationPop(color: color)

            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.caption.weight(.bold))
                    .foregroundStyle(color)
                Text(detail)
                    .font(.subheadline.weight(.medium))
                    .foregroundStyle(Color.bodyText)
            }

            Spacer()

            LottieView(animation: .named("sparkle"))
                .playing(loopMode: .playOnce)
                .animationSpeed(0.6)
                .frame(width: 24, height: 24)
        }
        .padding(DS.Spacing.md)
        .background(color.opacity(0.06), in: RoundedRectangle(cornerRadius: DS.Radius.md))
    }
}

#Preview {
    StampCollectionPrompt(
        shrine: Shrine.samples[0],
        onCollect: {},
        onDismiss: {}
    )
}
