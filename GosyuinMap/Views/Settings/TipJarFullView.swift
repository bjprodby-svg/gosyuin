import SwiftUI
import StoreKit
import Lottie

struct TipJarFullView: View {
    @State private var tipStore = TipStore()
    @State private var purchasing = false
    @State private var showThankYou = false
    @State private var appeared = false

    private let tiers: [(id: String, kanji: String, name: String, desc: String, icon: String, fallbackPrice: String)] = [
        ("com.bjprodby.gosyuinmap.tip.small", "賽銭", "Saisen", "A small offering of gratitude, like tossing a coin into the offering box.", "yensign.circle", "$0.99"),
        ("com.bjprodby.gosyuinmap.tip.medium", "お守り", "Omamori", "A protective charm for the developer. Keeps the code bug-free.", "shield.checkered", "$2.99"),
        ("com.bjprodby.gosyuinmap.tip.large", "御朱印", "Goshuin", "A generous goshuin offering. The highest form of support.", "seal.fill", "$4.99"),
    ]

    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                headerSection
                tiersSection
            }
        }
        .background(Color.pageBackground)
        .navigationTitle("Tip Jar")
        .navigationBarTitleDisplayMode(.inline)
        .task {
            await tipStore.loadProducts()
        }
        .onChange(of: tipStore.thankYouTip) { _, newValue in
            if newValue != nil {
                withAnimation(DS.Anim.celebration) {
                    showThankYou = true
                }
            }
        }
        .onAppear {
            withAnimation(DS.Anim.entrance.delay(0.2)) {
                appeared = true
            }
        }
    }

    // MARK: - Header

    private var headerSection: some View {
        VStack(spacing: DS.Spacing.lg) {
            ZStack {
                // Decorative rings
                Circle()
                    .stroke(Color.kincha.opacity(0.08), lineWidth: 1)
                    .frame(width: 160, height: 160)
                Circle()
                    .stroke(Color.kincha.opacity(0.12), lineWidth: 1)
                    .frame(width: 120, height: 120)

                // Icon
                ZStack {
                    Circle()
                        .fill(Color.kincha.gradient)
                        .frame(width: 80, height: 80)
                    Image(systemName: "heart.fill")
                        .font(.system(size: 32))
                        .foregroundStyle(.white)
                }
                .shadow(color: Color.kincha.opacity(0.3), radius: 16, y: 4)
            }

            VStack(spacing: DS.Spacing.sm) {
                Text("Support GosyuinMap")
                    .font(.title2.bold())
                    .foregroundStyle(Color.bodyText)

                Text("GosyuinMap is a passion project built with care.\nA small tip helps keep the journey going.")
                    .font(.subheadline)
                    .foregroundStyle(Color.subtitleText)
                    .multilineTextAlignment(.center)
                    .lineSpacing(3)
            }
        }
        .padding(.vertical, DS.Spacing.xxl)
        .padding(.horizontal, DS.Spacing.xl)
    }

    // MARK: - Tiers

    private var tiersSection: some View {
        VStack(spacing: DS.Spacing.lg) {
            if showThankYou {
                thankYouCard
            } else if tipStore.isLoading {
                ProgressView()
                    .frame(height: 200)
            } else {
                ForEach(Array(tiers.enumerated()), id: \.element.id) { index, tier in
                    let product = tipStore.tips.first { $0.id == tier.id }
                    tierCard(tier: tier, product: product, index: index)
                }

                // Footer note
                VStack(spacing: DS.Spacing.xs) {
                    Image(systemName: "lock.shield")
                        .font(.caption)
                        .foregroundStyle(Color.captionText)
                    Text("Payments are processed securely by Apple.\nNo account or subscription required.")
                        .font(.caption2)
                        .foregroundStyle(Color.captionText)
                        .multilineTextAlignment(.center)
                }
                .padding(.top, DS.Spacing.md)
            }
        }
        .padding(.horizontal, DS.Spacing.xl)
        .padding(.bottom, DS.Spacing.xxl)
    }

    // MARK: - Tier Card

    private func tierCard(tier: (id: String, kanji: String, name: String, desc: String, icon: String, fallbackPrice: String), product: Product?, index: Int) -> some View {
        let isLarge = tier.id.contains("large")

        return Button {
            guard !purchasing, let product else { return }
            purchasing = true
            Task {
                await tipStore.purchase(product)
                purchasing = false
            }
        } label: {
            VStack(spacing: DS.Spacing.md) {
                HStack(spacing: DS.Spacing.lg) {
                    // Kanji circle
                    ZStack {
                        Circle()
                            .fill(isLarge ? Color.kincha.gradient : Color.kincha.opacity(0.1).gradient)
                            .frame(width: 56, height: 56)
                        Text(tier.kanji)
                            .font(.system(size: 20, weight: .bold))
                            .foregroundStyle(isLarge ? .white : Color.kincha)
                    }
                    .shadow(color: isLarge ? Color.kincha.opacity(0.3) : .clear, radius: 8, y: 2)

                    VStack(alignment: .leading, spacing: DS.Spacing.xs) {
                        HStack(spacing: DS.Spacing.sm) {
                            Text(tier.name)
                                .font(.headline)
                                .foregroundStyle(Color.bodyText)
                            if isLarge {
                                Text("POPULAR")
                                    .font(.system(size: 9, weight: .black, design: .monospaced))
                                    .foregroundStyle(.white)
                                    .padding(.horizontal, 6)
                                    .padding(.vertical, 2)
                                    .background(Color.vermillion, in: Capsule())
                            }
                        }
                        Text(tier.desc)
                            .font(.caption)
                            .foregroundStyle(Color.subtitleText)
                            .lineLimit(2)
                    }

                    Spacer()
                }

                // Price button
                HStack {
                    Spacer()
                    Text(product?.displayPrice ?? tier.fallbackPrice)
                        .font(.subheadline.weight(.bold))
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, DS.Spacing.md)
                        .background(
                            isLarge
                                ? AnyShapeStyle(Color.kincha.gradient)
                                : AnyShapeStyle(Color.kincha.opacity(0.85)),
                            in: RoundedRectangle(cornerRadius: DS.Radius.md)
                        )
                    Spacer()
                }
            }
            .padding(DS.Spacing.lg)
            .background(Color.cardBackground, in: RoundedRectangle(cornerRadius: DS.Radius.xl))
            .overlay(
                RoundedRectangle(cornerRadius: DS.Radius.xl)
                    .strokeBorder(
                        isLarge ? Color.kincha.opacity(0.3) : Color.divider,
                        lineWidth: isLarge ? 2 : 1
                    )
            )
            .shadow(color: .black.opacity(isLarge ? 0.08 : 0.04), radius: isLarge ? 8 : 4, y: 2)
        }
        .buttonStyle(.pressable)
        .disabled(purchasing || product == nil)
        .opacity(purchasing ? 0.6 : 1)
        .opacity(appeared ? 1 : 0)
        .offset(y: appeared ? 0 : 20)
        .animation(DS.Anim.entrance.delay(DS.Anim.stagger(index, interval: 0.12)), value: appeared)
    }

    // MARK: - Thank You

    private var thankYouCard: some View {
        VStack(spacing: DS.Spacing.xl) {
            LottieView(animation: .named("success"))
                .playing(loopMode: .playOnce)
                .frame(width: 200, height: 112)
                .allowsHitTesting(false)

            VStack(spacing: DS.Spacing.sm) {
                Text("Thank you!")
                    .font(.title.bold())
                    .foregroundStyle(Color.kincha)

                Text("Your generosity helps keep\nGosyuinMap alive and growing.")
                    .font(.subheadline)
                    .foregroundStyle(Color.subtitleText)
                    .multilineTextAlignment(.center)
                    .lineSpacing(3)
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, DS.Spacing.xxl)
        .cardStyle()
        .transition(.scale(scale: 0.85).combined(with: .opacity))
    }
}

#Preview {
    NavigationStack {
        TipJarFullView()
    }
}
