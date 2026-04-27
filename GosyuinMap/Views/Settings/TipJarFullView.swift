import SwiftUI
import StoreKit

struct TipJarFullView: View {
    @State private var tipStore = TipStore()
    @State private var purchasing = false
    @State private var showThankYou = false

    var body: some View {
        ScrollView {
            VStack(spacing: DS.Spacing.xxl) {
                // Header
                VStack(spacing: DS.Spacing.md) {
                    Image(systemName: "shippingbox.and.arrow.backward.fill")
                        .font(.system(size: 48))
                        .foregroundStyle(Color.kincha)

                    Text("Support GosyuinMap")
                        .font(.title2.bold())
                        .foregroundStyle(Color.bodyText)

                    Text("GosyuinMap is a passion project built with care. If you enjoy using it, a small tip helps keep it going.")
                        .font(.subheadline)
                        .foregroundStyle(Color.subtitleText)
                        .multilineTextAlignment(.center)
                }
                .padding(.top, DS.Spacing.xxl)

                if showThankYou {
                    thankYouCard
                } else if tipStore.isLoading {
                    ProgressView()
                        .frame(height: 200)
                } else {
                    // Tip options
                    VStack(spacing: DS.Spacing.md) {
                        ForEach(tipStore.tips) { product in
                            tipRow(for: product)
                        }
                    }
                }
            }
            .padding(.horizontal, DS.Spacing.xl)
        }
        .background(Color.pageBackground)
        .navigationTitle("Tip Jar")
        .navigationBarTitleDisplayMode(.inline)
        .task {
            await tipStore.loadProducts()
        }
        .onChange(of: tipStore.thankYouTip) { _, newValue in
            if newValue != nil {
                withAnimation(.spring(duration: 0.5)) {
                    showThankYou = true
                }
            }
        }
    }

    // MARK: - Tip Row

    private func tipRow(for product: Product) -> some View {
        Button {
            guard !purchasing else { return }
            purchasing = true
            Task {
                await tipStore.purchase(product)
                purchasing = false
            }
        } label: {
            HStack(spacing: DS.Spacing.lg) {
                IconBadge(
                    icon: tipIcon(for: product),
                    size: 44,
                    color: .kincha
                )

                VStack(alignment: .leading, spacing: 2) {
                    Text(tipTitle(for: product))
                        .font(.headline)
                        .foregroundStyle(Color.bodyText)
                    Text(tipDescription(for: product))
                        .font(.caption)
                        .foregroundStyle(Color.subtitleText)
                }

                Spacer()

                Text(product.displayPrice)
                    .font(.subheadline.weight(.semibold))
                    .foregroundStyle(Color.kincha)
                    .padding(.horizontal, DS.Spacing.md)
                    .padding(.vertical, DS.Spacing.sm)
                    .background(Color.kincha.opacity(0.1), in: Capsule())
            }
            .cardStyle()
        }
        .buttonStyle(.pressable)
        .disabled(purchasing)
        .opacity(purchasing ? 0.6 : 1)
    }

    private func tipIcon(for product: Product) -> String {
        switch product.id {
        case "com.bjprodby.gosyuinmap.tip.small": "yensign.circle"
        case "com.bjprodby.gosyuinmap.tip.medium": "shield.checkered"
        case "com.bjprodby.gosyuinmap.tip.large": "seal.fill"
        default: "heart.fill"
        }
    }

    private func tipTitle(for product: Product) -> String {
        switch product.id {
        case "com.bjprodby.gosyuinmap.tip.small": "Saisen (賽銭)"
        case "com.bjprodby.gosyuinmap.tip.medium": "Omamori (お守り)"
        case "com.bjprodby.gosyuinmap.tip.large": "Goshuin (御朱印)"
        default: product.displayName
        }
    }

    private func tipDescription(for product: Product) -> String {
        switch product.id {
        case "com.bjprodby.gosyuinmap.tip.small": "A small offering of gratitude"
        case "com.bjprodby.gosyuinmap.tip.medium": "A protective charm for the developer"
        case "com.bjprodby.gosyuinmap.tip.large": "A generous goshuin offering"
        default: product.description
        }
    }

    // MARK: - Thank You

    private var thankYouCard: some View {
        VStack(spacing: DS.Spacing.lg) {
            Image(systemName: "hands.and.sparkles.fill")
                .font(.system(size: 48))
                .foregroundStyle(Color.kincha)
                .symbolEffect(.bounce, value: showThankYou)

            Text("Thank you for your support!")
                .font(.title3.bold())
                .foregroundStyle(Color.bodyText)

            Text("Your generosity helps keep GosyuinMap alive and growing.")
                .font(.subheadline)
                .foregroundStyle(Color.subtitleText)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity)
        .cardStyle()
        .transition(.scale.combined(with: .opacity))
    }
}

#Preview {
    NavigationStack {
        TipJarFullView()
    }
}
