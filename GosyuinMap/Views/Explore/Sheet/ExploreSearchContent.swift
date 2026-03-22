import SwiftUI
import SwiftData
import MapKit

struct ExploreSearchContent: View {
    @Bindable var searchService: ShrineSearchService
    let region: MKCoordinateRegion
    let onSelectMapItem: (MKMapItem) -> Void
    let onSelectShrine: (Shrine) -> Void
    let onBack: () -> Void

    @Query private var collectedStamps: [CollectedStamp]
    @FocusState private var isFocused: Bool
    @State private var searchSubmitted = false

    private var collectedIds: Set<Int> {
        Set(collectedStamps.map(\.slotId))
    }

    private var isQueryEmpty: Bool {
        searchService.queryFragment.trimmingCharacters(in: .whitespaces).isEmpty
    }

    /// Google Places suggestions, falling back to MKLocalSearch completions
    private var hasSuggestions: Bool {
        !searchService.suggestions.isEmpty || !searchService.fallbackCompletions.isEmpty
    }

    var body: some View {
        VStack(spacing: 0) {
            headerBar
            Divider()

            if searchService.isSearching {
                loadingView
            } else if let error = searchService.searchError {
                errorState(message: error)
            } else if !searchService.results.isEmpty {
                confirmedResultsList
            } else if hasSuggestions {
                suggestionsList
            } else if searchService.isCompleting {
                loadingView
            } else if isQueryEmpty {
                idleHint
            } else {
                emptyState
            }
        }
        .sensoryFeedback(.success, trigger: searchSubmitted)
        .onAppear { isFocused = true }
    }

    // MARK: - Header Bar

    private var headerBar: some View {
        HStack(spacing: DS.Spacing.sm) {
            Button {
                searchService.clear()
                onBack()
            } label: {
                Image(systemName: "chevron.left")
                    .font(.body.weight(.semibold))
                    .foregroundStyle(.blue)
                    .frame(width: 36, height: 36)
                    .contentShape(Rectangle())
            }

            HStack(spacing: DS.Spacing.sm) {
                Image(systemName: "magnifyingglass")
                    .foregroundStyle(.secondary)
                    .font(.subheadline.weight(.medium))

                TextField("Search shrines & temples", text: $searchService.queryFragment)
                    .textFieldStyle(.plain)
                    .font(.subheadline)
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
                            .frame(width: 36, height: 36)
                            .contentShape(Rectangle())
                    }
                    .transition(.scale.combined(with: .opacity))
                }
            }
            .padding(.horizontal, DS.Spacing.md)
            .frame(height: 36)
            .background(Color(.quaternarySystemFill), in: RoundedRectangle(cornerRadius: 10))
        }
        .padding(.horizontal, DS.Spacing.lg)
        .padding(.vertical, DS.Spacing.sm)
    }

    // MARK: - Suggestions (Google Places primary, MKLocalSearch fallback)

    private var suggestionsList: some View {
        ScrollView {
            LazyVStack(spacing: 0) {
                // Google Places suggestions (primary)
                ForEach(searchService.suggestions) { suggestion in
                    Button {
                        searchService.search(suggestion: suggestion)
                        searchSubmitted.toggle()
                        isFocused = false
                    } label: {
                        suggestionRow(title: suggestion.title, subtitle: suggestion.subtitle)
                    }
                    .buttonStyle(.pressable)

                    Divider()
                        .padding(.leading, 56)
                }

                // MKLocalSearch fallback (only if Google returned nothing)
                if searchService.suggestions.isEmpty {
                    ForEach(searchService.fallbackCompletions, id: \.self) { completion in
                        Button {
                            searchService.search(completion: completion)
                            searchSubmitted.toggle()
                            isFocused = false
                        } label: {
                            suggestionRow(title: completion.title, subtitle: completion.subtitle)
                        }
                        .buttonStyle(.pressable)

                        Divider()
                            .padding(.leading, 56)
                    }
                }
            }
        }
    }

    private func suggestionRow(title: String, subtitle: String) -> some View {
        HStack(spacing: DS.Spacing.md) {
            Image(systemName: "magnifyingglass")
                .font(.caption)
                .foregroundStyle(.tertiary)
                .frame(width: 24)

            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.subheadline)
                    .foregroundStyle(.primary)
                if !subtitle.isEmpty {
                    Text(subtitle)
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            }

            Spacer()
        }
        .padding(.horizontal, DS.Spacing.lg)
        .padding(.vertical, 10)
    }

    // MARK: - Confirmed Results

    private var confirmedResultsList: some View {
        ScrollView {
            LazyVStack(spacing: 0) {
                ForEach(searchService.results, id: \.self) { item in
                    Button {
                        if let shrine = matchingShrine(for: item) {
                            onSelectShrine(shrine)
                        } else {
                            onSelectMapItem(item)
                        }
                    } label: {
                        HStack(spacing: DS.Spacing.md) {
                            Image(systemName: "mappin.circle.fill")
                                .font(.title3)
                                .foregroundStyle(Color.vermillion)
                                .frame(width: 32, height: 32)

                            VStack(alignment: .leading, spacing: 2) {
                                Text(item.name ?? "Unknown")
                                    .font(.subheadline)
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
                                    .font(.caption2)
                                    .foregroundStyle(Color.vermillion)
                            }
                        }
                        .padding(.horizontal, DS.Spacing.lg)
                        .padding(.vertical, 10)
                    }
                    .buttonStyle(.pressable)

                    Divider()
                        .padding(.leading, 64)
                }
            }
        }
    }

    private func matchingShrine(for item: MKMapItem) -> Shrine? {
        guard let name = item.name else { return nil }
        return Shrine.samples.first { name.contains($0.name) }
    }

    // MARK: - Idle / Loading / Empty

    private var idleHint: some View {
        VStack(spacing: DS.Spacing.lg) {
            Spacer()
            Image(systemName: "magnifyingglass")
                .font(.system(size: 36))
                .foregroundStyle(Color.placeholderIcon)
            Text("Search for shrines, temples, or places")
                .font(.subheadline)
                .foregroundStyle(.secondary)
            Spacer()
        }
        .frame(maxWidth: .infinity)
    }

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

    private func errorState(message: String) -> some View {
        VStack(spacing: DS.Spacing.md) {
            Spacer()
            Image(systemName: "wifi.exclamationmark")
                .font(.system(size: 40))
                .foregroundStyle(Color.vermillion.opacity(0.6))
            Text("Search Unavailable")
                .font(.headline)
                .foregroundStyle(.secondary)
            Text(message)
                .font(.caption)
                .foregroundStyle(.tertiary)
                .multilineTextAlignment(.center)
            Button {
                searchService.search(query: searchService.queryFragment, in: region)
            } label: {
                Text("Try Again")
                    .font(.subheadline.weight(.medium))
                    .foregroundStyle(Color.vermillion)
            }
            .padding(.top, DS.Spacing.sm)
            Spacer()
        }
        .padding(.horizontal, DS.Spacing.xl)
    }
}
