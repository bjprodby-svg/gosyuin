import StoreKit

@MainActor
@Observable
final class TipStore {
    private(set) var tips: [Product] = []
    private(set) var isLoading = false
    private(set) var thankYouTip: Product?

    private let productIds: Set<String> = [
        "com.bjprodby.gosyuinmap.tip.small",
        "com.bjprodby.gosyuinmap.tip.medium",
        "com.bjprodby.gosyuinmap.tip.large"
    ]

    func loadProducts() async {
        guard tips.isEmpty else { return }
        isLoading = true
        do {
            let products = try await Product.products(for: productIds)
            tips = products.sorted { $0.price < $1.price }
        } catch {
            tips = []
        }
        isLoading = false
    }

    func purchase(_ product: Product) async {
        do {
            let result = try await product.purchase()
            switch result {
            case .success(let verification):
                if case .verified(let transaction) = verification {
                    await transaction.finish()
                    thankYouTip = product
                }
            case .userCancelled, .pending:
                break
            @unknown default:
                break
            }
        } catch {
            // Purchase failed silently
        }
    }

    func resetThankYou() {
        thankYouTip = nil
    }
}
