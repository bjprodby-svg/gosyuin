import SwiftUI

struct LearnListView: View {
    @State private var appeared = false

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: DS.Spacing.lg) {
                    // Section header
                    VStack(alignment: .leading, spacing: DS.Spacing.sm) {
                        SectionHeader(
                            title: "Guides",
                            icon: "book.pages",
                            trailing: "\(GuideArticle.allArticles.count) articles"
                        )
                        Text("Learn the etiquette and traditions of visiting shrines and temples in Japan.")
                            .font(.subheadline)
                            .foregroundStyle(Color.subtitleText)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, DS.Spacing.xs)
                    .opacity(appeared ? 1 : 0)
                    .animation(.easeOut(duration: 0.3), value: appeared)

                    ForEach(Array(GuideArticle.allArticles.enumerated()), id: \.element.id) { index, article in
                        NavigationLink(value: article) {
                            ArticleCard(article: article)
                        }
                        .buttonStyle(.pressable)
                        .opacity(appeared ? 1 : 0)
                        .offset(y: appeared ? 0 : 20)
                        .animation(
                            .spring(duration: 0.5, bounce: 0.25)
                                .delay(Double(index) * 0.08),
                            value: appeared
                        )
                    }
                }
                .padding(DS.Spacing.lg)
                .padding(.bottom, DS.Spacing.xxl)
            }
            .background(Color.pageBackground)
            .navigationTitle("Shrine Guide")
            .navigationDestination(for: GuideArticle.self) { article in
                LearnDetailView(article: article)
            }
            .onAppear {
                withAnimation { appeared = true }
            }
        }
    }
}

private struct ArticleCard: View {
    let article: GuideArticle

    /// Article ids whose icons ship with their own colors (multi-tone SVGs).
    /// These render in `.original` mode; everything else stays template-tinted to bodyText.
    private static let originalColorIcons: Set<String> = ["sanpai", "temple"]

    var body: some View {
        HStack(spacing: DS.Spacing.lg) {
            // Bare silhouette icon — no badge, no fill, lets the artwork speak for itself
            iconImage
                .frame(width: 44, height: 44)

            VStack(alignment: .leading, spacing: DS.Spacing.xs) {
                Text(article.title)
                    .font(.headline)
                    .foregroundStyle(.primary)
                Text(article.subtitle)
                    .font(.caption)
                    .foregroundStyle(Color.subtitleText)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
            }

            Spacer()

            Image(systemName: "chevron.right")
                .font(.caption.weight(.semibold))
                .foregroundStyle(Color.captionText)
        }
        .cardStyle()
    }

    @ViewBuilder
    private var iconImage: some View {
        if Self.originalColorIcons.contains(article.id) {
            Image(article.icon)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
        } else {
            Image(article.icon)
                .renderingMode(.template)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundStyle(Color.bodyText)
        }
    }
}

#Preview {
    LearnListView()
}
