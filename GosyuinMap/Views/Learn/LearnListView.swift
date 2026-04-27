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
                            ArticleCard(article: article, index: index + 1)
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
    let index: Int

    var body: some View {
        HStack(spacing: DS.Spacing.lg) {
            // Icon badge — consistent with the rest of the app
            IconBadge(icon: article.icon, size: 52, color: article.color, filled: true)
                .shadow(color: article.color.opacity(0.3), radius: 4, y: 2)

            VStack(alignment: .leading, spacing: DS.Spacing.xs) {
                HStack(spacing: DS.Spacing.xs) {
                    Text("\(index)")
                        .font(DS.Font.chipLabel)
                        .foregroundStyle(.white)
                        .frame(width: 18, height: 18)
                        .background(article.color.opacity(0.7), in: Circle())
                    Text(article.title)
                        .font(.headline)
                        .foregroundStyle(.primary)
                }
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
}

#Preview {
    LearnListView()
}
