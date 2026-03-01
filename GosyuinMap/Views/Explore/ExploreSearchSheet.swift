import SwiftUI
import SwiftData
import MapKit

struct ExploreSearchSheet: View {
    @Bindable var searchService: ShrineSearchService
    let region: MKCoordinateRegion
    let onSelectMapItem: (MKMapItem) -> Void
    let onSelectShrine: (Shrine) -> Void

    @Query private var collectedStamps: [CollectedStamp]
    @FocusState private var isFocused: Bool

    private let categories = ["神社", "寺", "神宮", "大社", "天満宮", "稲荷"]

    private var collectedIds: Set<Int> {
        Set(collectedStamps.map(\.slotId))
    }

    private var isQueryEmpty: Bool {
        searchService.queryFragment.trimmingCharacters(in: .whitespaces).isEmpty
    }

    var body: some View {
        VStack(spacing: 0) {
            searchBar
            Divider()

            if searchService.isSearching {
                loadingView
            } else if !searchService.results.isEmpty {
                confirmedResultsList
            } else if !searchService.completions.isEmpty {
                completionsList
            } else if searchService.isCompleting {
                loadingView
            } else if isQueryEmpty {
                idleContent
            } else {
                emptyState
            }
        }
    }

    // MARK: - Search Bar

    private var searchBar: some View {
        HStack(spacing: 10) {
            Image(systemName: "magnifyingglass")
                .foregroundStyle(.secondary)

            TextField("Search shrines & temples", text: $searchService.queryFragment)
                .textFieldStyle(.plain)
                .focused($isFocused)
                .onSubmit {
                    if !searchService.queryFragment.isEmpty {
                        searchService.search(
                            query: searchService.queryFragment,
                            in: region
                        )
                    }
                }

            if !isQueryEmpty {
                Button {
                    searchService.clear()
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundStyle(.secondary)
                }
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
        .onAppear { isFocused = true }
    }

    // MARK: - Idle (カテゴリ + 近くの神社)

    private var idleContent: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                categorySection
                nearbyShrinesSection
            }
            .padding()
        }
    }

    private var categorySection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Categories")
                .font(.subheadline.weight(.medium))
                .foregroundStyle(.secondary)

            LazyVGrid(columns: [GridItem(.adaptive(minimum: 80), spacing: 8)], spacing: 8) {
                ForEach(categories, id: \.self) { category in
                    Button {
                        searchService.queryFragment = category
                        searchService.search(query: category, in: region)
                    } label: {
                        HStack(spacing: 4) {
                            Text("\u{26E9}")
                                .font(.caption)
                            Text(category)
                                .font(.subheadline)
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 10)
                        .background(Color(.secondarySystemGroupedBackground),
                                    in: RoundedRectangle(cornerRadius: 12))
                    }
                    .buttonStyle(.plain)
                }
            }
        }
    }

    private var nearbyShrinesSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Nearby Shrines")
                .font(.subheadline.weight(.medium))
                .foregroundStyle(.secondary)

            ForEach(nearbySamples) { shrine in
                Button {
                    onSelectShrine(shrine)
                } label: {
                    shrineRow(shrine)
                }
                .buttonStyle(.plain)
            }
        }
    }

    /// サンプル神社を現在のリージョンとの距離でソートして上位5件を返す
    private var nearbySamples: [Shrine] {
        let center = region.center
        return Shrine.samples
            .sorted {
                distance(from: center, to: $0.coordinate)
                < distance(from: center, to: $1.coordinate)
            }
            .prefix(5)
            .map { $0 }
    }

    private func distance(from a: CLLocationCoordinate2D, to b: CLLocationCoordinate2D) -> Double {
        let dx = a.latitude - b.latitude
        let dy = a.longitude - b.longitude
        return dx * dx + dy * dy
    }

    private func shrineRow(_ shrine: Shrine) -> some View {
        HStack(spacing: 12) {
            ZStack {
                Circle()
                    .fill(Color(.label))
                    .frame(width: 36, height: 36)
                Text("\u{26E9}")
                    .font(.system(size: 14))
                    .foregroundStyle(Color(.systemBackground))
            }

            VStack(alignment: .leading, spacing: 2) {
                Text(shrine.name)
                    .font(.subheadline.weight(.medium))
                    .foregroundStyle(.primary)
                Text(shrine.address)
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }

            Spacer()

            if collectedIds.contains(shrine.stampSlotId) {
                Image(systemName: "checkmark.seal.fill")
                    .font(.caption)
                    .foregroundStyle(.vermillion)
            }

            Image(systemName: "chevron.right")
                .font(.caption2)
                .foregroundStyle(.tertiary)
        }
        .padding(.vertical, 4)
    }

    // MARK: - Completions List (入力中の補完候補)

    private var completionsList: some View {
        List(searchService.completions, id: \.self) { completion in
            Button {
                searchService.search(completion: completion)
                isFocused = false
            } label: {
                HStack(spacing: 12) {
                    Image(systemName: "magnifyingglass")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                        .frame(width: 24)

                    VStack(alignment: .leading, spacing: 2) {
                        Text(completion.title)
                            .font(.subheadline)
                            .foregroundStyle(.primary)
                        if !completion.subtitle.isEmpty {
                            Text(completion.subtitle)
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                    }
                }
            }
        }
        .listStyle(.plain)
    }

    // MARK: - Confirmed Results (確定検索結果)

    private var confirmedResultsList: some View {
        List(searchService.results, id: \.self) { item in
            Button {
                onSelectMapItem(item)
            } label: {
                HStack(spacing: 12) {
                    ZStack {
                        Circle()
                            .fill(Color.vermillion.opacity(0.12))
                            .frame(width: 36, height: 36)
                        Image(systemName: "mappin.circle.fill")
                            .font(.body)
                            .foregroundStyle(.vermillion)
                    }

                    VStack(alignment: .leading, spacing: 2) {
                        Text(item.name ?? "Unknown")
                            .font(.subheadline.weight(.medium))
                            .foregroundStyle(.primary)
                        if let address = item.placemark.title {
                            Text(address)
                                .font(.caption)
                                .foregroundStyle(.secondary)
                                .lineLimit(1)
                        }
                    }

                    Spacer()

                    // マッチする Shrine.samples があれば収集済みバッジ表示
                    if let shrine = matchingShrine(for: item),
                       collectedIds.contains(shrine.stampSlotId) {
                        Image(systemName: "checkmark.seal.fill")
                            .font(.caption)
                            .foregroundStyle(.vermillion)
                    }
                }
            }
        }
        .listStyle(.plain)
    }

    /// MKMapItem に対応する Shrine.samples を探す（名前一致）
    private func matchingShrine(for item: MKMapItem) -> Shrine? {
        guard let name = item.name else { return nil }
        return Shrine.samples.first { name.contains($0.name) }
    }

    // MARK: - Loading / Empty

    private var loadingView: some View {
        VStack {
            Spacer()
            ProgressView()
                .controlSize(.regular)
            Spacer()
        }
        .frame(maxWidth: .infinity)
    }

    private var emptyState: some View {
        VStack {
            Spacer()
            ContentUnavailableView(
                "No Results",
                systemImage: "magnifyingglass",
                description: Text("Try a different search term")
            )
            Spacer()
        }
    }
}
