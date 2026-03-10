import SwiftUI
import SwiftData
import MapKit

struct ShrineDetailView: View {
    let shrine: Shrine
    @Query private var collectedStamps: [CollectedStamp]
    @State private var showingGuide = false
    @State private var appeared = false

    private var isCollected: Bool {
        collectedStamps.contains { $0.slotId == shrine.stampSlotId }
    }

    var body: some View {
        ScrollView {
            VStack(spacing: DS.Spacing.xl) {
                photoGallery
                shrineInfo

                if !shrine.mustSee.isEmpty {
                    mustSeeCard
                }

                highlightsSection
                infoCards

                if !shrine.tips.isEmpty {
                    tipsSection
                }

                collectedBadge
                heroMap
                guideLink
            }
            .padding(DS.Spacing.lg)
            .opacity(appeared ? 1 : 0)
            .offset(y: appeared ? 0 : 12)
        }
        .background(Color.pageBackground)
        .navigationTitle(shrine.name)
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $showingGuide) {
            NavigationStack {
                LearnDetailView(article: GuideArticle.allArticles[0])
                    .toolbar {
                        ToolbarItem(placement: .topBarTrailing) {
                            Button("Close") { showingGuide = false }
                        }
                    }
            }
        }
        .onAppear {
            withAnimation(.easeOut(duration: 0.4)) {
                appeared = true
            }
        }
    }

    // MARK: - Photo Gallery

    private var photoGallery: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: DS.Spacing.sm) {
                ForEach(shrine.imageURLs, id: \.self) { urlString in
                    if let url = URL(string: urlString) {
                        AsyncImage(url: url) { phase in
                            switch phase {
                            case .success(let image):
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 300, height: 220)
                                    .clipShape(RoundedRectangle(cornerRadius: DS.Radius.lg))
                            default:
                                RoundedRectangle(cornerRadius: DS.Radius.lg)
                                    .fill(shrine.category.color.opacity(0.3))
                                    .frame(width: 300, height: 220)
                                    .overlay {
                                        ProgressView().tint(shrine.category.color)
                                    }
                            }
                        }
                    }
                }
            }
        }
        .scrollClipDisabled()
    }

    // MARK: - Shrine Info

    private var shrineInfo: some View {
        VStack(alignment: .leading, spacing: DS.Spacing.md) {
            HStack(spacing: DS.Spacing.xs) {
                Image(systemName: shrine.category.icon)
                    .font(.caption2)
                    .foregroundStyle(.white)
                    .padding(4)
                    .background(shrine.category.color, in: RoundedRectangle(cornerRadius: 4))
                Text(shrine.category.displayName)
                    .font(.caption.weight(.semibold))
                    .foregroundStyle(shrine.category.color)
            }

            if !shrine.tagline.isEmpty {
                Text(shrine.tagline)
                    .font(.title3.weight(.medium))
                    .italic()
                    .foregroundStyle(.secondary)
            }

            Label(shrine.address, systemImage: "mappin.circle.fill")
                .font(.subheadline)
                .foregroundStyle(.secondary)

            Text(shrine.description)
                .font(.body)
                .foregroundStyle(Color.bodyText)
                .fixedSize(horizontal: false, vertical: true)
                .lineSpacing(3)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    // MARK: - Must See

    private var mustSeeCard: some View {
        VStack(alignment: .leading, spacing: DS.Spacing.md) {
            HStack(spacing: DS.Spacing.sm) {
                Image(systemName: "eye.fill")
                    .font(.caption)
                    .foregroundStyle(.white)
                    .padding(6)
                    .background(shrine.category.color, in: Circle())
                Text("Don't Miss")
                    .font(.subheadline.bold())
            }
            Text(shrine.mustSee)
                .font(.subheadline)
                .foregroundStyle(Color.bodyText)
                .fixedSize(horizontal: false, vertical: true)
                .lineSpacing(2)
        }
        .accentedCard(accentColor: shrine.category.color)
    }

    // MARK: - Highlights

    @ViewBuilder
    private var highlightsSection: some View {
        if !shrine.highlights.isEmpty {
            VStack(alignment: .leading, spacing: DS.Spacing.md) {
                Text("Highlights")
                    .font(.headline)

                VStack(alignment: .leading, spacing: DS.Spacing.md) {
                    ForEach(Array(shrine.highlights.enumerated()), id: \.offset) { index, highlight in
                        HStack(alignment: .top, spacing: DS.Spacing.md) {
                            Text("\(index + 1)")
                                .font(.caption.bold())
                                .foregroundStyle(.white)
                                .frame(width: 22, height: 22)
                                .background(shrine.category.color, in: Circle())
                            Text(highlight)
                                .font(.subheadline)
                                .foregroundStyle(Color.bodyText)
                                .fixedSize(horizontal: false, vertical: true)
                        }
                    }
                }
            }
            .cardStyle()
        }
    }

    // MARK: - Info Cards

    private var infoCards: some View {
        VStack(spacing: DS.Spacing.sm) {
            if !shrine.access.isEmpty {
                infoRow(icon: "tram.fill", title: "Access", detail: shrine.access, color: .blue)
            }
            if !shrine.hours.isEmpty {
                infoRow(icon: "clock.fill", title: "Hours", detail: shrine.hours, color: .orange)
            }
            infoRow(icon: "leaf.fill", title: "Best Season", detail: shrine.bestSeason, color: .matcha)
        }
    }

    private func infoRow(icon: String, title: String, detail: String, color: Color) -> some View {
        HStack(spacing: DS.Spacing.md) {
            Image(systemName: icon)
                .font(.subheadline)
                .foregroundStyle(color)
                .frame(width: 28)
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.caption.weight(.semibold))
                    .foregroundStyle(.secondary)
                Text(detail)
                    .font(.subheadline)
                    .foregroundStyle(Color.bodyText)
                    .fixedSize(horizontal: false, vertical: true)
            }
            Spacer()
        }
        .padding(DS.Spacing.md)
        .background(Color.cardBackground, in: RoundedRectangle(cornerRadius: DS.Radius.md))
        .shadow(color: .black.opacity(0.03), radius: 1, y: 1)
    }

    // MARK: - Tips

    private var tipsSection: some View {
        VStack(alignment: .leading, spacing: DS.Spacing.md) {
            HStack(spacing: DS.Spacing.sm) {
                Image(systemName: "lightbulb.fill")
                    .font(.caption)
                    .foregroundStyle(.orange)
                Text("Visitor Tips")
                    .font(.headline)
            }

            VStack(alignment: .leading, spacing: DS.Spacing.md) {
                ForEach(shrine.tips, id: \.self) { tip in
                    HStack(alignment: .top, spacing: DS.Spacing.sm) {
                        Image(systemName: "checkmark.circle.fill")
                            .font(.caption)
                            .foregroundStyle(.orange)
                            .padding(.top, 2)
                        Text(tip)
                            .font(.caption)
                            .foregroundStyle(Color.bodyText)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                }
            }
        }
        .cardStyle()
    }

    // MARK: - Collected Badge

    @ViewBuilder
    private var collectedBadge: some View {
        if isCollected {
            Label("Collected", systemImage: "checkmark.seal.fill")
                .font(.headline)
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.vermillion, in: RoundedRectangle(cornerRadius: DS.Radius.md))
        } else {
            Label("Visit this shrine to collect", systemImage: "mappin.and.ellipse")
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.cardBackground, in: RoundedRectangle(cornerRadius: DS.Radius.md))
        }
    }

    // MARK: - Hero Map

    private var heroMap: some View {
        Map {
            Annotation(shrine.name, coordinate: shrine.coordinate) {
                ZStack {
                    Circle()
                        .fill(Color(.label))
                        .frame(width: 36, height: 36)
                        .shadow(color: .black.opacity(0.15), radius: 3)
                    Text("\u{26E9}")
                        .font(.system(size: 16))
                        .foregroundStyle(Color(.systemBackground))
                }
            }
        }
        .frame(height: 180)
        .clipShape(RoundedRectangle(cornerRadius: DS.Radius.lg))
        .allowsHitTesting(false)
    }

    // MARK: - Guide Link

    private var guideLink: some View {
        Button {
            showingGuide = true
        } label: {
            HStack {
                Image(systemName: "book.fill")
                    .foregroundStyle(Color.vermillion)
                Text("Shrine Visit Guide")
                    .foregroundStyle(.primary)
                Spacer()
                Image(systemName: "chevron.right")
                    .font(.caption.weight(.semibold))
                    .foregroundStyle(.tertiary)
            }
            .cardStyle()
        }
        .buttonStyle(.pressable)
    }
}

#Preview {
    NavigationStack {
        ShrineDetailView(shrine: Shrine.samples[0])
    }
    .modelContainer(for: [CollectedStamp.self], inMemory: true)
}
