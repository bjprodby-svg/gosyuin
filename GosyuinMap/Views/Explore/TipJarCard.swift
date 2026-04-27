import SwiftUI
import StoreKit
import Lottie

struct TipJarCard: View {
    let tipStore: TipStore
    let onDismissForever: () -> Void
    let onDismiss: () -> Void

    @State private var showThankYou = false
    @State private var purchasing = false
    @State private var appeared = false

    private let tipMeta: [(id: String, kanji: String, label: String, icon: String, fallbackPrice: String)] = [
        ("com.bjprodby.gosyuinmap.tip.small", "賽銭", "Saisen", "yensign.circle", "$0.99"),
        ("com.bjprodby.gosyuinmap.tip.medium", "お守り", "Omamori", "shield.checkered", "$2.99"),
        ("com.bjprodby.gosyuinmap.tip.large", "御朱印", "Goshuin", "seal.fill", "$4.99"),
    ]

    var body: some View {
        VStack(spacing: 0) {
            if showThankYou {
                thankYouContent
            } else {
                tipContent
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: DS.Radius.xl))
        .shadow(color: Color.kincha.opacity(0.12), radius: 12, y: 4)
        .onChange(of: tipStore.thankYouTip) { _, newValue in
            if newValue != nil {
                withAnimation(DS.Anim.celebration) {
                    showThankYou = true
                }
            }
        }
        .onAppear {
            withAnimation(DS.Anim.entrance.delay(0.1)) {
                appeared = true
            }
        }
    }

    // MARK: - Tip Content

    private var tipContent: some View {
        VStack(spacing: 0) {
            // Header with gradient
            VStack(spacing: DS.Spacing.sm) {
                Image(systemName: "heart.circle.fill")
                    .font(.system(size: 36))
                    .foregroundStyle(.white)
                    .shadow(color: .white.opacity(0.3), radius: 8)

                Text("Enjoying GosyuinMap?")
                    .font(.headline)
                    .foregroundStyle(.white)

                Text("Your support helps keep this project alive.")
                    .font(.caption)
                    .foregroundStyle(.white.opacity(0.8))
                    .multilineTextAlignment(.center)
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, DS.Spacing.xl)
            .padding(.horizontal, DS.Spacing.lg)
            .background(
                LinearGradient(
                    colors: [Color.kincha, Color.kincha.opacity(0.8)],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )

            // Tip buttons
            VStack(spacing: DS.Spacing.sm) {
                if tipStore.isLoading {
                    ProgressView()
                        .frame(height: 80)
                } else {
                    ForEach(Array(tipMeta.enumerated()), id: \.element.id) { index, meta in
                        let product = tipStore.tips.first { $0.id == meta.id }
                        tipRow(
                            kanji: meta.kanji,
                            label: meta.label,
                            icon: meta.icon,
                            price: product?.displayPrice ?? meta.fallbackPrice,
                            product: product,
                            index: index
                        )
                    }
                }

                Button {
                    onDismissForever()
                    onDismiss()
                } label: {
                    Text("Don't show again")
                        .font(.caption2)
                        .foregroundStyle(Color.captionText)
                }
                .padding(.top, DS.Spacing.xs)
            }
            .padding(DS.Spacing.lg)
            .background(Color.cardBackground)
        }
        .task {
            await tipStore.loadProducts()
        }
    }

    // MARK: - Tip Row

    private func tipRow(kanji: String, label: String, icon: String, price: String, product: Product?, index: Int) -> some View {
        Button {
            guard !purchasing, let product else { return }
            purchasing = true
            Task {
                await tipStore.purchase(product)
                purchasing = false
            }
        } label: {
            HStack(spacing: DS.Spacing.md) {
                // Kanji badge
                ZStack {
                    Circle()
                        .fill(Color.kincha.opacity(0.1))
                        .frame(width: 44, height: 44)
                    Text(kanji)
                        .font(.system(size: 16, weight: .bold))
                        .foregroundStyle(Color.kincha)
                }

                VStack(alignment: .leading, spacing: 2) {
                    Text(label)
                        .font(.subheadline.weight(.semibold))
                        .foregroundStyle(Color.bodyText)
                    Text(tipDescription(for: label))
                        .font(.caption2)
                        .foregroundStyle(Color.subtitleText)
                        .lineLimit(1)
                }

                Spacer()

                Text(price)
                    .font(.subheadline.weight(.bold))
                    .foregroundStyle(.white)
                    .padding(.horizontal, DS.Spacing.md)
                    .padding(.vertical, DS.Spacing.sm)
                    .background(Color.kincha.gradient, in: Capsule())
            }
            .padding(DS.Spacing.md)
            .background(Color.kincha.opacity(0.04), in: RoundedRectangle(cornerRadius: DS.Radius.md))
        }
        .buttonStyle(.pressable)
        .disabled(purchasing || product == nil)
        .opacity(purchasing ? 0.6 : 1)
        .opacity(appeared ? 1 : 0)
        .offset(y: appeared ? 0 : 10)
        .animation(DS.Anim.entrance.delay(DS.Anim.stagger(index, interval: 0.1)), value: appeared)
    }

    private func tipDescription(for label: String) -> String {
        switch label {
        case "Saisen": "A small offering of gratitude"
        case "Omamori": "A protective charm for the dev"
        case "Goshuin": "A generous goshuin offering"
        default: ""
        }
    }

    // MARK: - Thank You

    private var thankYouContent: some View {
        VStack(spacing: DS.Spacing.lg) {
            LottieView(animation: .named("success"))
                .playing(loopMode: .playOnce)
                .frame(width: 120, height: 68)
                .allowsHitTesting(false)

            Text("Thank you!")
                .font(.title2.bold())
                .foregroundStyle(Color.kincha)

            Text("Your support means the world.")
                .font(.subheadline)
                .foregroundStyle(Color.subtitleText)

            Button {
                onDismiss()
            } label: {
                Text("Continue")
                    .font(.subheadline.weight(.semibold))
                    .foregroundStyle(Color.kincha)
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, DS.Spacing.xxl)
        .padding(.horizontal, DS.Spacing.lg)
        .background(Color.cardBackground)
        .transition(.scale(scale: 0.8).combined(with: .opacity))
    }
}

#Preview {
    TipJarCard(
        tipStore: TipStore(),
        onDismissForever: {},
        onDismiss: {}
    )
    .padding()
}
