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
    @State private var searchSubmitted = false

    private let categories: [(String, String)] = [
        ("神社", "building.columns"),
        ("寺", "house.lodge"),
        ("神宮", "crown"),
        ("大社", "mountain.2"),
        ("天満宮", "graduationcap"),
        ("稲荷", "flame"),
    ]

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
        .sensoryFeedback(.success, trigger: searchSubmitted)
    }

    // MARK: - Search Bar

    private var searchBar: some View {
        HStack(spacing: DS.Spacing.md) {
            Image(systemName: "magnifyingglass")
                .foregroundStyle(.secondary)
                .font(.body.weight(.medium))

            TextField("Search shrines & temples", text: $searchService.queryFragment)
                .textFieldStyle(.plain)
                .focused($isFocused)
                .onSubmit {
                    if !searchService.queryFragment.isEmpty {
                        searchService.search(
                            query: searchService.queryFragment,
                            in: region
                        )
                        searchSubmitted.toggle()
                    }
                }

            if !isQueryEmpty {
                Button {
                    withAnimation(.spring(duration: 0.25)) {
                        searchService.clear()
                    }
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundStyle(.secondary)
                }
                .transition(.scale.combined(with: .opacity))
            }
        }
        .padding(.horizontal, DS.Spacing.lg)
        .padding(.vertical, DS.Spacing.md)
        .onAppear { isFocused = true }
    }

    // MARK: - Idle Content

    private var idleContent: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: DS.Spacing.xl) {
                categorySection
                nearbyShrinesSection
            }
            .padding(DS.Spacing.lg)
        }
    }

    private var categorySection: some View {
        VStack(alignment: .leading, spacing: DS.Spacing.md) {
            Text("Categories")
                .font(.subheadline.weight(.semibold))
                .foregroundStyle(.secondary)

            LazyVGrid(columns: [GridItem(.adaptive(minimum: 90), spacing: DS.Spacing.sm)], spacing: DS.Spacing.sm) {
                ForEach(categories, id: \.0) { name, icon in
                    Button {
                        searchService.queryFragment = name
                        searchService.search(query: name, in: region)
                        searchSubmitted.toggle()
                    } label: {
                        HStack(spacing: 6) {
                            Image(systemName: icon)
                                .font(.caption)
                                .foregroundStyle(Color.vermillion)
                            Text(name)
                                .font(.subheadline.weight(.medium))
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 10)
                        .background(Color.cardBackground, in: RoundedRectangle(cornerRadius: DS.Radius.md))
                        .overlay(
                            RoundedRectangle(cornerRadius: DS.Radius.md)
                                .strokeBorder(Color.vermillion.opacity(0.15), lineWidth: 1)
                        )
                    }
                    .buttonStyle(.pressable)
                }
            }
        }
    }

    private var nearbyShrinesSection: some View {
        VStack(alignment: .leading, spacing: DS.Spacing.md) {
            Text("Nearby")
                .font(.subheadline.weight(.semibold))
                .foregroundStyle(.secondary)

            ForEach(nearbySamples) { shrine in
                Button {
                    onSelectShrine(shrine)
                } label: {
                    shrineRow(shrine)
                }
                .buttonStyle(.pressable)
            }
        }
    }

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
        HStack(spacing: DS.Spacing.md) {
            ZStack {
                Circle()
                    .fill(Color(.label))
                    .frame(width: 36, height: 36)
                Text("\u{26E9}")
                    .font(.system(size: 14))
                    .foregroundStyle(Color(.systemBackground))
            }

            VStack(alignment: .leading, spacing: DS.Spacing.xs) {
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
                    .foregroundStyle(Color.vermillion)
            }

            Image(systemName: "chevron.right")
                .font(.caption2)
                .foregroundStyle(.tertiary)
        }
        .padding(.vertical, DS.Spacing.xs)
    }

    // MARK: - Completions

    private var completionsList: some View {
        List(searchService.completions, id: \.self) { completion in
            Button {
                searchService.search(completion: completion)
                searchSubmitted.toggle()
                isFocused = false
            } label: {
                HStack(spacing: DS.Spacing.md) {
                    Image(systemName: "magnifyingglass")
                        .font(.caption)
                        .foregroundStyle(Color.vermillion.opacity(0.6))
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
            .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
    }

    // MARK: - Confirmed Results

    private var confirmedResultsList: some View {
        List(searchService.results, id: \.self) { item in
            Button {
                onSelectMapItem(item)
            } label: {
                HStack(spacing: DS.Spacing.md) {
                    ZStack {
                        Circle()
                            .fill(Color.vermillionLight)
                            .frame(width: 40, height: 40)
                        Image(systemName: "mappin.circle.fill")
                            .font(.body)
                            .foregroundStyle(Color.vermillion)
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

                    if let shrine = matchingShrine(for: item),
                       collectedIds.contains(shrine.stampSlotId) {
                        Image(systemName: "checkmark.seal.fill")
                            .font(.caption)
                            .foregroundStyle(Color.vermillion)
                    }
                }
            }
            .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
    }

    private func matchingShrine(for item: MKMapItem) -> Shrine? {
        guard let name = item.name else { return nil }
        return Shrine.samples.first { name.contains($0.name) }
    }

    // MARK: - Loading / Empty

    private var loadingView: some View {
        VStack(spacing: DS.Spacing.md) {
            Spacer()
            ProgressView()
                .controlSize(.regular)
                .tint(Color.vermillion)
            Text("Searching...")
                .font(.caption)
                .foregroundStyle(.secondary)
            Spacer()
        }
        .frame(maxWidth: .infinity)
    }

    private var emptyState: some View {
        VStack(spacing: DS.Spacing.md) {
            Spacer()
            Image(systemName: "magnifyingglass")
                .font(.system(size: 40))
                .foregroundStyle(Color.placeholderIcon)
            Text("No Results")
                .font(.headline)
                .foregroundStyle(.secondary)
            Text("Try a different search term")
                .font(.caption)
                .foregroundStyle(.tertiary)
            Spacer()
        }
    }
}
