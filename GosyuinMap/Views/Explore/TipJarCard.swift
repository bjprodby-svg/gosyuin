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

    private let tipMeta: [(id: String, image: String, label: String, fallbackPrice: String)] = [
        ("com.bjprodby.gosyuinmap.tip.small", "tip_saisen", "Saisen", "$0.99"),
        ("com.bjprodby.gosyuinmap.tip.medium", "tip_omamori", "Omamori", "$2.99"),
        ("com.bjprodby.gosyuinmap.tip.large", "tip_goshuin", "Goshuin", "$4.99"),
    ]

    var body: some View {
        VStack(spacing: 0) {
            if showThankYou {
                thankYouContent
            } else {
                tipContent
            }
        }
        .background(Color.cardBackground, in: RoundedRectangle(cornerRadius: DS.Radius.lg))
        .overlay(
            RoundedRectangle(cornerRadius: DS.Radius.lg)
                .strokeBorder(Color.divider, lineWidth: 0.5)
        )
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
            // Minimal header
            VStack(spacing: 4) {
                Text("Enjoying GosyuinMap?")
                    .font(.subheadline.weight(.semibold))
                    .foregroundStyle(Color.bodyText)
                Text("Your support keeps this project alive.")
                    .font(.caption)
                    .foregroundStyle(Color.subtitleText)
            }
            .frame(maxWidth: .infinity)
            .padding(.top, DS.Spacing.lg)
            .padding(.bottom, DS.Spacing.md)

            Divider()

            // Tip rows
            if tipStore.isLoading {
                ProgressView()
                    .frame(height: 80)
            } else {
                VStack(spacing: 0) {
                    ForEach(Array(tipMeta.enumerated()), id: \.element.id) { index, meta in
                        let product = tipStore.tips.first { $0.id == meta.id }
                        tipRow(
                            image: meta.image,
                            label: meta.label,
                            price: product?.displayPrice ?? meta.fallbackPrice,
                            product: product,
                            index: index
                        )
                        if index < tipMeta.count - 1 {
                            Divider()
                                .padding(.leading, 56)
                        }
                    }
                }
            }

            Divider()

            Button {
                onDismissForever()
                onDismiss()
            } label: {
                Text("Don't show again")
                    .font(.caption2)
                    .foregroundStyle(Color.captionText)
            }
            .padding(.vertical, DS.Spacing.md)
        }
        .task {
            await tipStore.loadProducts()
        }
    }

    // MARK: - Tip Row

    private func tipRow(image: String, label: String, price: String, product: Product?, index: Int) -> some View {
        Button {
            guard !purchasing, let product else { return }
            purchasing = true
            Task {
                await tipStore.purchase(product)
                purchasing = false
            }
        } label: {
            HStack(spacing: DS.Spacing.md) {
                Image(image)
                    .resizable()
                    .interpolation(.none)
                    .scaledToFit()
                    .frame(width: 40, height: 40)

                Text(label)
                    .font(.subheadline.weight(.medium))
                    .foregroundStyle(Color.bodyText)

                Spacer()

                Text(price)
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
        .offset(y: appeared ? 0 : 8)
        .animation(DS.Anim.entrance.delay(DS.Anim.stagger(index, interval: 0.08)), value: appeared)
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
        .transition(.scale(scale: 0.9).combined(with: .opacity))
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
