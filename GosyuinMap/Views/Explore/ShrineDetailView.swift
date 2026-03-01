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
                heroMap
                shrineInfo
                collectedBadge
                guideLink
            }
            .padding(DS.Spacing.lg)
            .opacity(appeared ? 1 : 0)
            .offset(y: appeared ? 0 : 12)
        }
        .background(Color.pageBackground)
        .navigationTitle("Shrine Detail")
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
        .frame(height: 200)
        .clipShape(RoundedRectangle(cornerRadius: DS.Radius.lg))
        .allowsHitTesting(false)
    }

    // MARK: - Shrine Info

    private var shrineInfo: some View {
        VStack(alignment: .leading, spacing: DS.Spacing.md) {
            Text(shrine.name)
                .font(.title.bold())

            Label(shrine.address, systemImage: "mappin.circle.fill")
                .font(.subheadline)
                .foregroundStyle(.secondary)

            Text(shrine.description)
                .font(.body)
                .foregroundStyle(Color.bodyText)
                .fixedSize(horizontal: false, vertical: true)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
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

    // MARK: - Guide Link

    private var guideLink: some View {
        Button {
            showingGuide = true
        } label: {
            HStack {
                Image(systemName: "book.fill")
                    .foregroundStyle(Color.vermillion)
                Text("Shrine Etiquette Guide")
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
