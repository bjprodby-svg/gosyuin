import SwiftUI

struct LearnListView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 16) {
                    ForEach(GuideArticle.allArticles) { article in
                        NavigationLink(value: article) {
                            ArticleCard(article: article)
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding()
            }
            .background(Color(.systemBackground))
            .navigationTitle("Shrine Guide")
            .navigationDestination(for: GuideArticle.self) { article in
                LearnDetailView(article: article)
            }
        }
    }
}

private struct ArticleCard: View {
    let article: GuideArticle

    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: article.icon)
                .font(.title2)
                .foregroundStyle(.white)
                .frame(width: 48, height: 48)
                .background(article.color, in: RoundedRectangle(cornerRadius: 12))

            VStack(alignment: .leading, spacing: 4) {
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
                .font(.caption)
                .foregroundStyle(.tertiary)
        }
        .padding()
        .background(Color(.secondarySystemGroupedBackground), in: RoundedRectangle(cornerRadius: 16))
    }
}

#Preview {
    LearnListView()
}
