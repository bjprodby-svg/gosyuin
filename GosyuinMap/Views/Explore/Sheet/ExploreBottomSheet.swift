import SwiftUI
import SwiftData
import MapKit

/// Apple Maps-style persistent bottom sheet for Explore tab.
struct ExploreBottomSheet: View {
    let exploreMode: ExploreMode
    let region: MKCoordinateRegion
    let userLocation: CLLocation?
    let selectedCategory: ShrineCategory?
    let collectedIds: Set<Int>
    @Bindable var searchService: ShrineSearchService

    let onSelectShrine: (Shrine) -> Void
    let onSelectMapItem: (MKMapItem) -> Void
    let onCategoryTapped: (ShrineCategory) -> Void
    let onSearchTapped: () -> Void
    let onSearchBack: () -> Void
    let onDirections: () -> Void
    let onPlaceDetailBack: () -> Void
    var directionsService: DirectionsService?
    var onEndNavigation: (() -> Void)?

    var body: some View {
        switch exploreMode {
        case .exploring:
            exploringContent
        case .searching:
            searchingContent
        case .placeDetail(let shrine):
            PlaceDetailContent(
                shrine: shrine,
                onDirections: onDirections,
                onBack: onPlaceDetailBack
            )
        case .mapItemDetail(let wrapper):
            MapItemDetailContent(
                item: wrapper.item,
                onDirections: onDirections,
                onBack: onPlaceDetailBack
            )
        case .directions:
            EmptyView()
        case .navigating:
            if let directionsService, let onEndNavigation {
                NavigationETABar(
                    directionsService: directionsService,
                    onEndNavigation: onEndNavigation
                )
            }
        }
    }

    // MARK: - Exploring Content (search bar + chips + nearby list)

    private var exploringContent: some View {
        VStack(spacing: 0) {
            // Search bar
            searchBarPeek
            // Category chips
            categoryChips
                .padding(.top, DS.Spacing.sm)
            // Nearby shrine list
            nearbyList
        }
    }

    private var searchBarPeek: some View {
        Button(action: onSearchTapped) {
            HStack(spacing: DS.Spacing.sm) {
                Image(systemName: "magnifyingglass")
                    .font(.system(size: 15, weight: .medium))
                    .foregroundStyle(Color(.systemGray))
                Text("Search shrines & temples")
                    .font(.system(size: 17))
                    .foregroundStyle(Color(.placeholderText))
                Spacer()
            }
            .padding(.horizontal, DS.Spacing.md)
            .frame(height: 36)
            .background(Color(.quaternarySystemFill), in: RoundedRectangle(cornerRadius: 10))
        }
        .buttonStyle(.plain)
        .padding(.horizontal, DS.Spacing.lg)
        .padding(.top, DS.Spacing.sm)
    }

    private var categoryChips: some View {
        FloatingCategoryChips(
            region: region,
            selectedCategory: selectedCategory,
            onCategoryTapped: onCategoryTapped
        )
    }

    // MARK: - Nearby Shrine List

    private var nearbyShrines: [Shrine] {
        let allShrines: [Shrine]
        if let category = selectedCategory {
            allShrines = Shrine.samples.filter { $0.category == category }
        } else {
            allShrines = Shrine.samples
        }

        guard let userLocation else {
            // Show shrines in visible region sorted by distance from center
            let center = CLLocation(latitude: region.center.latitude, longitude: region.center.longitude)
            return allShrines
                .map { ($0, CLLocation(latitude: $0.coordinate.latitude, longitude: $0.coordinate.longitude).distance(from: center)) }
                .filter { $0.1 <= regionRadius }
                .sorted { $0.1 < $1.1 }
                .prefix(20)
                .map(\.0)
        }

        return allShrines
            .map { ($0, CLLocation(latitude: $0.coordinate.latitude, longitude: $0.coordinate.longitude).distance(from: userLocation)) }
            .sorted { $0.1 < $1.1 }
            .prefix(20)
            .map(\.0)
    }

    private var regionRadius: CLLocationDistance {
        let latDelta = region.span.latitudeDelta
        return latDelta * 111_000 / 2 // rough meters
    }

    private func distanceText(for shrine: Shrine) -> String? {
        guard let userLocation else { return nil }
        let loc = CLLocation(latitude: shrine.coordinate.latitude, longitude: shrine.coordinate.longitude)
        let dist = userLocation.distance(from: loc)
        if dist < 1000 {
            return "\(Int(dist)) m"
        } else {
            return String(format: "%.1f km", dist / 1000)
        }
    }

    private var nearbyList: some View {
        ScrollView {
            LazyVStack(spacing: 0) {
                ForEach(nearbyShrines) { shrine in
                    Button {
                        onSelectShrine(shrine)
                    } label: {
                        shrineRow(shrine)
                    }
                    .buttonStyle(.plain)

                    Divider()
                        .padding(.leading, 64)
                }
            }
            .padding(.top, DS.Spacing.sm)
        }
    }

    private func shrineRow(_ shrine: Shrine) -> some View {
        HStack(spacing: DS.Spacing.md) {
            // Thumbnail
            Group {
                if let urlString = shrine.imageURLs.first, let url = URL(string: urlString), url.scheme == "https" {
                    AsyncImage(url: url) { phase in
                        switch phase {
                        case .success(let image):
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                        default:
                            thumbnailPlaceholder(for: shrine)
                        }
                    }
                } else {
                    thumbnailPlaceholder(for: shrine)
                }
            }
            .frame(width: 48, height: 48)
            .clipShape(RoundedRectangle(cornerRadius: 10))

            VStack(alignment: .leading, spacing: 3) {
                Text(shrine.name)
                    .font(.subheadline.weight(.semibold))
                    .foregroundStyle(.primary)
                    .lineLimit(1)

                HStack(spacing: DS.Spacing.xs) {
                    Text(shrine.category.displayName)
                        .font(.caption)
                        .foregroundStyle(.secondary)
                    if let dist = distanceText(for: shrine) {
                        Text("·")
                            .font(.caption)
                            .foregroundStyle(.tertiary)
                        Text(dist)
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                }

                if !shrine.tagline.isEmpty {
                    Text(shrine.tagline)
                        .font(.caption)
                        .foregroundStyle(.tertiary)
                        .lineLimit(1)
                }
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
        .padding(.horizontal, DS.Spacing.lg)
        .padding(.vertical, 10)
        .contentShape(Rectangle())
    }

    private func thumbnailPlaceholder(for shrine: Shrine) -> some View {
        ZStack {
            shrine.category.color.opacity(0.15)
            CategoryIconView(
                category: shrine.category,
                size: 22,
                color: shrine.category.color
            )
        }
    }

    // MARK: - Searching Content

    private var searchingContent: some View {
        ExploreSearchContent(
            searchService: searchService,
            region: region,
            onSelectMapItem: onSelectMapItem,
            onSelectShrine: onSelectShrine,
            onBack: onSearchBack
        )
    }
}
