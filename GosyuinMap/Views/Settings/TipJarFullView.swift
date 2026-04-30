import SwiftUI
import StoreKit
import Lottie

struct TipJarFullView: View {
    @State private var tipStore = TipStore()
    @State private var purchasing = false
    @State private var showThankYou = false
    @State private var appeared = false

    private let tiers: [(id: String, image: String, name: String, desc: String, fallbackPrice: String)] = [
        ("com.bjprodby.gosyuinmap.tip.small", "tip_saisen", "Saisen", "A small offering of gratitude.", "$0.99"),
        ("com.bjprodby.gosyuinmap.tip.medium", "tip_omamori", "Omamori", "A protective charm for the developer.", "$2.99"),
        ("com.bjprodby.gosyuinmap.tip.large", "tip_goshuin", "Goshuin", "The highest form of support.", "$4.99"),
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
        VStack(spacing: DS.Spacing.sm) {
            Text("Support GosyuinMap")
                .font(.title3.weight(.semibold))
                .foregroundStyle(Color.bodyText)

            Text("A small tip helps keep this passion project going.")
                .font(.subheadline)
                .foregroundStyle(Color.subtitleText)
                .multilineTextAlignment(.center)
                .lineSpacing(2)
        }
        .frame(maxWidth: .infinity)
        .padding(.top, DS.Spacing.xl)
        .padding(.bottom, DS.Spacing.lg)
        .padding(.horizontal, DS.Spacing.xl)
    }

    // MARK: - Tiers

    private var tiersSection: some View {
        VStack(spacing: 0) {
            if showThankYou {
                thankYouCard
                    .padding(.horizontal, DS.Spacing.lg)
            } else if tipStore.isLoading {
                ProgressView()
                    .frame(height: 200)
            } else {
                VStack(spacing: 0) {
                    ForEach(Array(tiers.enumerated()), id: \.element.id) { index, tier in
                        let product = tipStore.tips.first { $0.id == tier.id }
                        tierRow(tier: tier, product: product, index: index)
                        if index < tiers.count - 1 {
                            Divider()
                                .padding(.leading, 72)
                        }
                    }
                }
                .background(Color.cardBackground, in: RoundedRectangle(cornerRadius: DS.Radius.lg))
                .overlay(
                    RoundedRectangle(cornerRadius: DS.Radius.lg)
                        .strokeBorder(Color.divider, lineWidth: 0.5)
                )
                .padding(.horizontal, DS.Spacing.lg)

                // Footer note
                HStack(spacing: 4) {
                    Image(systemName: "lock.shield")
                        .font(.caption2)
                    Text("Secure payment by Apple. No subscription.")
                        .font(.caption2)
                }
                .foregroundStyle(Color.captionText)
                .padding(.top, DS.Spacing.lg)
            }
        }
        .padding(.bottom, DS.Spacing.xxl)
    }

    // MARK: - Tier Row

    private func tierRow(tier: (id: String, image: String, name: String, desc: String, fallbackPrice: String), product: Product?, index: Int) -> some View {
        let isLarge = tier.id.contains("large")

        return Button {
            guard !purchasing, let product else { return }
            purchasing = true
            Task {
                await tipStore.purchase(product)
                purchasing = false
            }
        } label: {
            HStack(spacing: DS.Spacing.md) {
                Image(tier.image)
                    .resizable()
                    .interpolation(.none)
                    .scaledToFit()
                    .frame(width: 48, height: 48)

                VStack(alignment: .leading, spacing: 2) {
                    HStack(spacing: 6) {
                        Text(tier.name)
                            .font(.subheadline.weight(.semibold))
                            .foregroundStyle(Color.bodyText)
                        if isLarge {
                            Text("POPULAR")
                                .font(.system(size: 9, weight: .bold, design: .monospaced))
                                .foregroundStyle(Color.vermillion)
                                .padding(.horizontal, 5)
                                .padding(.vertical, 1)
                                .overlay(
                                    Capsule()
                                        .stroke(Color.vermillion, lineWidth: 0.5)
                                )
                        }
                    }
                    Text(tier.desc)
                        .font(.caption)
                        .foregroundStyle(Color.subtitleText)
                        .lineLimit(1)
                }

                Spacer()

                Text(product?.displayPrice ?? tier.fallbackPrice)
                    .font(.subheadline.weight(.semibold))
                    .foregroundStyle(Color.kincha)
            }
            .padding(.horizontal, DS.Spacing.lg)
            .padding(.vertical, DS.Spacing.md)
            .contentShape(Rectangle())
        }
        .buttonStyle(.pressable)
        .disabled(purchasing || product == nil)
        .opacity(purchasing ? 0.6 : 1)
        .opacity(appeared ? 1 : 0)
        .offset(y: appeared ? 0 : 12)
        .animation(DS.Anim.entrance.delay(DS.Anim.stagger(index, interval: 0.08)), value: appeared)
    }

    // MARK: - Thank You

    private var thankYouCard: some View {
        VStack(spacing: DS.Spacing.lg) {
            LottieView(animation: .named("success"))
                .playing(loopMode: .playOnce)
                .frame(width: 160, height: 90)
                .allowsHitTesting(false)

            VStack(spacing: 4) {
                Text("Thank you!")
                    .font(.title2.bold())
                    .foregroundStyle(Color.kincha)

                Text("Your generosity helps keep\nGosyuinMap alive and growing.")
                    .font(.subheadline)
                    .foregroundStyle(Color.subtitleText)
                    .multilineTextAlignment(.center)
                    .lineSpacing(2)
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, DS.Spacing.xxl)
        .background(Color.cardBackground, in: RoundedRectangle(cornerRadius: DS.Radius.lg))
        .overlay(
            RoundedRectangle(cornerRadius: DS.Radius.lg)
                .strokeBorder(Color.divider, lineWidth: 0.5)
        )
        .transition(.scale(scale: 0.92).combined(with: .opacity))
    }
}

#Preview {
    NavigationStack {
        TipJarFullView()
    }
}
