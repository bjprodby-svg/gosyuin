import SwiftUI

struct LearnListView: View {
    @State private var appeared = false

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: DS.Spacing.lg) {
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

    var body: some View {
        HStack(spacing: DS.Spacing.lg) {
            Image(systemName: article.icon)
                .font(.title2)
                .foregroundStyle(.white)
                .frame(width: 48, height: 48)
                .background(article.color, in: RoundedRectangle(cornerRadius: DS.Radius.md))
                .shadow(color: article.color.opacity(0.3), radius: 4, y: 2)

            VStack(alignment: .leading, spacing: DS.Spacing.xs) {
                Text(article.title)
                    .font(.headline)
                    .foregroundStyle(.primary)
                Text(article.subtitle)
                    .font(.caption)
                    .foregroundStyle(.secondary)
                    .lineLimit(2)
            }

            Spacer()

            Image(systemName: "chevron.right")
                .font(.caption.weight(.semibold))
                .foregroundStyle(.tertiary)
        }
        .cardStyle()
    }
}

#Preview {
    LearnListView()
}
