import SwiftUI
import StoreKit

struct TipJarCard: View {
    let tipStore: TipStore
    let onDismissForever: () -> Void
    let onDismiss: () -> Void

    @State private var showThankYou = false
    @State private var purchasing = false

    var body: some View {
        VStack(spacing: DS.Spacing.md) {
            if showThankYou {
                thankYouContent
            } else {
                tipContent
            }
        }
        .padding(DS.Spacing.lg)
        .background(Color.kincha.opacity(0.06), in: RoundedRectangle(cornerRadius: DS.Radius.lg))
        .overlay(
            RoundedRectangle(cornerRadius: DS.Radius.lg)
                .strokeBorder(Color.kincha.opacity(0.15), lineWidth: 1)
        )
        .onChange(of: tipStore.thankYouTip) { _, newValue in
            if newValue != nil {
                withAnimation(.spring(duration: 0.5)) {
                    showThankYou = true
                }
            }
        }
    }

    // MARK: - Tip Content

    private var tipContent: some View {
        VStack(spacing: DS.Spacing.md) {
            VStack(spacing: DS.Spacing.xs) {
                Text("Enjoying GosyuinMap?")
                    .font(.subheadline.weight(.semibold))
                    .foregroundStyle(Color.bodyText)
                Text("Your support helps keep this project alive.")
                    .font(.caption)
                    .foregroundStyle(Color.subtitleText)
                    .multilineTextAlignment(.center)
            }

            if tipStore.isLoading {
                ProgressView()
                    .frame(height: 60)
            } else {
                HStack(spacing: DS.Spacing.sm) {
                    ForEach(tipStore.tips) { product in
                        tipButton(for: product)
                    }
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
        }
        .task {
            await tipStore.loadProducts()
        }
    }

    // MARK: - Tip Button

    private func tipButton(for product: Product) -> some View {
        Button {
            guard !purchasing else { return }
            purchasing = true
            Task {
                await tipStore.purchase(product)
                purchasing = false
            }
        } label: {
            VStack(spacing: DS.Spacing.xs) {
                Text(tipLabel(for: product))
                    .font(.system(size: 13, weight: .bold))
                    .foregroundStyle(Color.kincha)
                Text(product.displayPrice)
                    .font(.caption2.weight(.medium))
                    .foregroundStyle(Color.subtitleText)
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, DS.Spacing.md)
            .background(Color.kincha.opacity(0.08), in: RoundedRectangle(cornerRadius: DS.Radius.md))
            .overlay(
                RoundedRectangle(cornerRadius: DS.Radius.md)
                    .strokeBorder(Color.kincha.opacity(0.2), lineWidth: 1)
            )
        }
        .buttonStyle(.pressable)
        .disabled(purchasing)
        .opacity(purchasing ? 0.6 : 1)
    }

    private func tipLabel(for product: Product) -> String {
        switch product.id {
        case "com.bjprodby.gosyuinmap.tip.small": "賽銭"
        case "com.bjprodby.gosyuinmap.tip.medium": "お守り"
        case "com.bjprodby.gosyuinmap.tip.large": "御朱印"
        default: product.displayName
        }
    }

    // MARK: - Thank You

    private var thankYouContent: some View {
        VStack(spacing: DS.Spacing.sm) {
            Image(systemName: "hands.and.sparkles.fill")
                .font(.system(size: 32))
                .foregroundStyle(Color.kincha)
                .symbolEffect(.bounce, value: showThankYou)

            Text("Thank you!")
                .font(.subheadline.weight(.bold))
                .foregroundStyle(Color.bodyText)

            Text("Your support means a lot.")
                .font(.caption)
                .foregroundStyle(Color.subtitleText)
        }
        .frame(maxWidth: .infinity)
        .transition(.scale.combined(with: .opacity))
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
