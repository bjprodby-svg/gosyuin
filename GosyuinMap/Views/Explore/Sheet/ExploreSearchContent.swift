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

    var body: some View {
        VStack(spacing: 0) {
            headerBar
            Divider()

            if !searchService.completions.isEmpty {
                resultsList
            } else if isQueryEmpty {
                idleHint
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

                if !isQueryEmpty {
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

    // MARK: - Results List (local Shrine.samples)

    private var resultsList: some View {
        ScrollView {
            LazyVStack(spacing: 0) {
                ForEach(searchService.completions) { shrine in
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

                    Divider()
                        .padding(.leading, 64)
                }
            }
        }
    }

    // MARK: - Idle / Empty

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
