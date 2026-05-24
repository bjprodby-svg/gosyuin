import SwiftUI
import SwiftData
import MapKit

struct ExploreSearchContent: View {
    @Bindable var searchService: ShrineSearchService
    let region: MKCoordinateRegion
    let onSelectShrine: (Shrine) -> Void
    let onBack: () -> Void

    @Query private var collectedStamps: [CollectedStamp]
    @FocusState private var isFocused: Bool

    private var collectedIds: Set<Int> {
        Set(collectedStamps.map(\.slotId))
    }

    private var isQueryEmpty: Bool {
        searchService.queryFragment.trimmingCharacters(in: .whitespaces).isEmpty
    }

    private var hasAnyResults: Bool {
        !searchService.completions.isEmpty || !searchService.googleCompletions.isEmpty
    }

    var body: some View {
        VStack(spacing: 0) {
            headerBar
            Divider()

            if hasAnyResults {
                resultsList
            } else if isQueryEmpty {
                idleHint
            } else if searchService.isSearchingGoogle {
                searchingState
            } else {
                emptyState
            }
        }
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
                    .foregroundStyle(Color.subtitleText)
                    .font(.subheadline.weight(.medium))

                TextField("Search by name (English or 日本語)", text: $searchService.queryFragment)
                    .textFieldStyle(.plain)
                    .font(.subheadline)
                    .focused($isFocused)

                if searchService.isSearchingGoogle {
                    ProgressView()
                        .controlSize(.small)
                } else if !isQueryEmpty {
                    Button {
                        withAnimation(.spring(duration: 0.25)) {
                            searchService.clear()
                        }
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundStyle(Color.subtitleText)
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

    // MARK: - Results List (local + Google)

    private var resultsList: some View {
        ScrollView {
            LazyVStack(spacing: 0) {
                if !searchService.completions.isEmpty {
                    sectionHeader("Curated Shrines")
                    ForEach(searchService.completions) { shrine in
                        localRow(shrine: shrine)
                    }
                }

                if !searchService.googleCompletions.isEmpty {
                    sectionHeader("More on Google")
                    ForEach(searchService.googleCompletions) { shrine in
                        googleRow(shrine: shrine)
                    }
                }
            }
        }
    }

    private func sectionHeader(_ title: String) -> some View {
        HStack {
            Text(title)
                .font(.caption.weight(.semibold))
                .foregroundStyle(Color.subtitleText)
                .textCase(.uppercase)
            Spacer()
        }
        .padding(.horizontal, DS.Spacing.lg)
        .padding(.top, DS.Spacing.md)
        .padding(.bottom, DS.Spacing.xs)
    }

    private func localRow(shrine: Shrine) -> some View {
        Button {
            onSelectShrine(shrine)
        } label: {
            HStack(spacing: DS.Spacing.md) {
                Image(systemName: shrine.category.icon)
                    .font(.caption)
                    .foregroundStyle(.white)
                    .frame(width: 32, height: 32)
                    .background(shrine.category.color, in: RoundedRectangle(cornerRadius: 6))

                VStack(alignment: .leading, spacing: 2) {
                    Text(shrine.name)
                        .font(.subheadline)
                        .foregroundStyle(.primary)

                    HStack(spacing: DS.Spacing.xs) {
                        Text(shrine.category.displayName)
                            .font(.caption)
                            .foregroundStyle(Color.subtitleText)
                        Text("·")
                            .font(.caption)
                            .foregroundStyle(Color.captionText)
                        Text(shrine.address)
                            .font(.caption)
                            .foregroundStyle(Color.subtitleText)
                            .lineLimit(1)
                    }
                }

                Spacer()

                if collectedIds.contains(shrine.stampSlotId) {
                    Image(systemName: "checkmark.seal.fill")
                        .font(.caption2)
                        .foregroundStyle(Color.vermillion)
                }
            }
            .padding(.horizontal, DS.Spacing.lg)
            .padding(.vertical, 10)
        }
        .buttonStyle(.pressable)
        .overlay(alignment: .bottom) {
            Divider().padding(.leading, 64)
        }
    }

    private func googleRow(shrine: Shrine) -> some View {
        Button {
            onSelectShrine(shrine)
        } label: {
            HStack(spacing: DS.Spacing.md) {
                Group {
                    if let first = shrine.imageURLs.first, let url = URL(string: first) {
                        AsyncImage(url: url) { phase in
                            switch phase {
                            case .success(let image):
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                            default:
                                shrine.category.color.opacity(0.85)
                                    .overlay {
                                        Image(systemName: shrine.category.icon)
                                            .font(.caption)
                                            .foregroundStyle(.white)
                                    }
                            }
                        }
                    } else {
                        shrine.category.color.opacity(0.85)
                            .overlay {
                                Image(systemName: shrine.category.icon)
                                    .font(.caption)
                                    .foregroundStyle(.white)
                            }
                    }
                }
                .frame(width: 44, height: 44)
                .clipShape(RoundedRectangle(cornerRadius: 8))

                VStack(alignment: .leading, spacing: 2) {
                    Text(shrine.name)
                        .font(.subheadline)
                        .foregroundStyle(.primary)
                        .lineLimit(1)

                    HStack(spacing: DS.Spacing.xs) {
                        if let rating = shrine.rating {
                            Image(systemName: "star.fill")
                                .font(.system(size: 9))
                                .foregroundStyle(.orange)
                            Text(String(format: "%.1f", rating))
                                .font(.caption)
                                .foregroundStyle(Color.subtitleText)
                            if let count = shrine.userRatingCount {
                                Text("(\(count))")
                                    .font(.caption2)
                                    .foregroundStyle(Color.captionText)
                            }
                            Text("·")
                                .font(.caption)
                                .foregroundStyle(Color.captionText)
                        }
                        Text(shrine.address)
                            .font(.caption)
                            .foregroundStyle(Color.subtitleText)
                            .lineLimit(1)
                    }
                }

                Spacer()
            }
            .padding(.horizontal, DS.Spacing.lg)
            .padding(.vertical, 10)
        }
        .buttonStyle(.pressable)
        .overlay(alignment: .bottom) {
            Divider().padding(.leading, 72)
        }
    }

    // MARK: - Idle / Empty / Loading

    private var idleHint: some View {
        VStack(spacing: DS.Spacing.lg) {
            Spacer()
            Image(systemName: "magnifyingglass")
                .font(.system(size: 36))
                .foregroundStyle(Color.placeholderIcon)
            VStack(spacing: DS.Spacing.xs) {
                Text("Find shrines & temples")
                    .font(.subheadline.weight(.medium))
                Text("Search by name in English or Japanese")
                    .font(.caption)
                    .foregroundStyle(Color.subtitleText)
                Text("Try: \"Meiji\", \"金閣寺\", \"稲荷\", \"Kamakura\"")
                    .font(.caption2)
                    .foregroundStyle(Color.captionText)
                    .padding(.top, DS.Spacing.xs)
            }
            Spacer()
        }
        .frame(maxWidth: .infinity)
    }

    private var searchingState: some View {
        VStack(spacing: DS.Spacing.md) {
            Spacer()
            ProgressView()
            Text("Searching Google Places…")
                .font(.caption)
                .foregroundStyle(Color.subtitleText)
            Spacer()
        }
    }

    private var emptyState: some View {
        VStack(spacing: DS.Spacing.md) {
            Spacer()
            Image(systemName: "magnifyingglass")
                .font(.system(size: 40))
                .foregroundStyle(Color.placeholderIcon)
            Text("No Results")
                .font(.headline)
                .foregroundStyle(Color.subtitleText)
            Text("Try a different search term")
                .font(.caption)
                .foregroundStyle(Color.captionText)
            Spacer()
        }
    }
}
