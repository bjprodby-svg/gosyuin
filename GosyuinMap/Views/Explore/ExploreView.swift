import SwiftUI
import SwiftData
import MapKit

struct ExploreView: View {
    @State private var locationService = LocationService()
    @State private var searchService = ShrineSearchService()
    @State private var position: MapCameraPosition = .userLocation(
        fallback: .region(
            MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: 35.6895, longitude: 139.6917),
                span: MKCoordinateSpan(latitudeDelta: 0.08, longitudeDelta: 0.08)
            )
        )
    )
    @State private var visibleRegion: MKCoordinateRegion?
    @State private var selectedShrine: Shrine?
    @State private var selectedMapItem: MKMapItem?
    @State private var mapStyleOption: MapStyleOption = .standard
    @State private var showSearchSheet = false
    @State private var showCollectionPrompt = false
    @State private var promptShrine: Shrine?
    @State private var showSearchAreaButton = false

    @Query private var collectedStamps: [CollectedStamp]
    @Environment(\.modelContext) private var modelContext

    private let defaultRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 35.6895, longitude: 139.6917),
        span: MKCoordinateSpan(latitudeDelta: 0.08, longitudeDelta: 0.08)
    )

    private var currentRegion: MKCoordinateRegion {
        visibleRegion ?? defaultRegion
    }

    var body: some View {
        NavigationStack {
            mapLayer
                .toolbar(.hidden, for: .navigationBar)
                .navigationDestination(for: Shrine.self) { shrine in
                    ShrineDetailView(shrine: shrine)
                }
                .sheet(isPresented: $showSearchSheet) {
                    ExploreSearchSheet(
                        searchService: searchService,
                        region: currentRegion,
                        onSelectMapItem: {
                            handleSelectMapItem($0)
                            showSearchSheet = false
                        },
                        onSelectShrine: {
                            handleSelectShrine($0)
                            showSearchSheet = false
                        }
                    )
                    .presentationDetents([.large])
                    .presentationDragIndicator(.visible)
                }
                .sheet(isPresented: $showCollectionPrompt) {
                    if let shrine = promptShrine {
                        StampCollectionPrompt(
                            shrine: shrine,
                            onCollect: { collectStamp(for: shrine) },
                            onDismiss: {
                                showCollectionPrompt = false
                                promptShrine = nil
                            }
                        )
                        .presentationDetents([.medium])
                        .presentationDragIndicator(.visible)
                    }
                }
                .onAppear {
                    syncCollectedIds()
                    if locationService.authorizationStatus == .authorizedWhenInUse
                        || locationService.authorizationStatus == .authorizedAlways {
                        locationService.startUpdatingLocation()
                    }
                }
                .onChange(of: locationService.nearbyShrine) { _, newShrine in
                    if let shrine = newShrine {
                        promptShrine = shrine
                        showCollectionPrompt = true
                    }
                }
                .onChange(of: collectedStamps.count) {
                    syncCollectedIds()
                }
                .sensoryFeedback(.selection, trigger: selectedShrine?.id)
                .sensoryFeedback(.selection, trigger: selectedMapItem)
        }
    }

    // MARK: - Map Layer

    private var mapLayer: some View {
        ZStack {
            Map(position: $position) {
                UserAnnotation()

                ForEach(Shrine.samples) { shrine in
                    Annotation(shrine.name, coordinate: shrine.coordinate, anchor: .bottom) {
                        shrinePin(for: shrine)
                    }
                }

                ForEach(searchService.results, id: \.self) { item in
                    if let coord = item.placemark.location?.coordinate,
                       !isDuplicateOfSample(item) {
                        Annotation(item.name ?? "", coordinate: coord, anchor: .bottom) {
                            mapItemPin(for: item)
                        }
                    }
                }
            }
            .mapStyle(mapStyleOption.style)
            .mapControls {
                MapUserLocationButton()
                MapCompass()
                MapScaleView()
            }
            .onMapCameraChange(frequency: .onEnd) { context in
                visibleRegion = context.region
                searchService.updateRegion(context.region)
                if selectedShrine != nil || selectedMapItem != nil {
                    withAnimation(.spring(duration: 0.3)) {
                        selectedShrine = nil
                        selectedMapItem = nil
                    }
                } else {
                    withAnimation(.easeInOut(duration: 0.2)) {
                        showSearchAreaButton = true
                    }
                }
            }
            .ignoresSafeArea()

            // Floating overlays
            VStack(spacing: 0) {
                topOverlays
                Spacer()
                bottomOverlays
            }
        }
    }

    // MARK: - Top Overlays

    private var topOverlays: some View {
        VStack(spacing: DS.Spacing.sm) {
            if locationService.authorizationStatus == .denied {
                locationDeniedBanner
            }

            floatingSearchBar

            if showSearchAreaButton {
                searchAreaButton
            }
        }
        .padding(.top, 60)
    }

    // MARK: - Floating Search Bar

    private var floatingSearchBar: some View {
        Button {
            showSearchSheet = true
        } label: {
            HStack(spacing: DS.Spacing.md) {
                Image(systemName: "magnifyingglass")
                    .font(.body.weight(.medium))
                    .foregroundStyle(.secondary)

                Text("Search shrines & temples")
                    .font(.body)
                    .foregroundStyle(.secondary)

                Spacer()
            }
            .padding(.horizontal, DS.Spacing.lg)
            .padding(.vertical, DS.Spacing.md)
            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: DS.Radius.lg))
            .shadow(color: .black.opacity(0.12), radius: 6, y: 3)
        }
        .padding(.horizontal, DS.Spacing.lg)
    }

    // MARK: - Bottom Overlays

    private var bottomOverlays: some View {
        VStack(spacing: DS.Spacing.md) {
            HStack {
                Spacer()
                mapStyleButton
            }
            .padding(.horizontal, DS.Spacing.lg)

            if let shrine = selectedShrine {
                shrineCard(shrine)
            } else if let mapItem = selectedMapItem {
                mapItemCard(mapItem)
            }
        }
        .padding(.bottom, 100)
    }

    // MARK: - Floating Map Style Button

    private var mapStyleButton: some View {
        Menu {
            ForEach(MapStyleOption.allCases) { option in
                Button {
                    mapStyleOption = option
                } label: {
                    Label(option.label, systemImage: option.icon)
                }
            }
        } label: {
            Image(systemName: mapStyleOption.icon)
                .font(.body.weight(.medium))
                .foregroundStyle(.primary)
                .frame(width: 44, height: 44)
                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: DS.Radius.sm))
                .shadow(color: .black.opacity(0.12), radius: 4, y: 2)
        }
    }

    // MARK: - Search Area Button

    private var searchAreaButton: some View {
        Button {
            searchService.search(query: "神社 寺", in: currentRegion)
            withAnimation { showSearchAreaButton = false }
        } label: {
            HStack(spacing: 6) {
                Image(systemName: "arrow.clockwise")
                    .font(.caption.bold())
                Text("Search This Area")
                    .font(.subheadline.weight(.medium))
            }
            .padding(.horizontal, DS.Spacing.lg)
            .padding(.vertical, 10)
            .background(.ultraThinMaterial, in: Capsule())
            .shadow(color: .black.opacity(0.12), radius: 4, y: 2)
        }
        .buttonStyle(.pressable)
        .transition(.scale.combined(with: .opacity))
    }

    // MARK: - Location Denied Banner

    private var locationDeniedBanner: some View {
        Button {
            if let url = URL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(url)
            }
        } label: {
            HStack(spacing: DS.Spacing.sm) {
                Image(systemName: "location.slash.fill")
                    .font(.caption)
                    .foregroundStyle(Color.vermillion)
                Text("Enable location to collect stamps")
                    .font(.caption.weight(.medium))
                Spacer()
                Image(systemName: "chevron.right")
                    .font(.caption2)
                    .foregroundStyle(.secondary)
            }
            .padding(DS.Spacing.md)
            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: DS.Radius.md))
            .padding(.horizontal, DS.Spacing.lg)
        }
        .transition(.move(edge: .top).combined(with: .opacity))
    }

    // MARK: - Helpers

    private func syncCollectedIds() {
        locationService.collectedSlotIds = Set(collectedStamps.map(\.slotId))
    }

    private func collectStamp(for shrine: Shrine) {
        let stamp = CollectedStamp(slotId: shrine.stampSlotId)
        modelContext.insert(stamp)
        syncCollectedIds()
    }

    private func isDuplicateOfSample(_ item: MKMapItem) -> Bool {
        guard let name = item.name else { return false }
        return Shrine.samples.contains { name.contains($0.name) }
    }

    // MARK: - Selection Handlers

    private func handleSelectMapItem(_ item: MKMapItem) {
        selectedShrine = nil
        selectedMapItem = item

        if let coord = item.placemark.location?.coordinate {
            withAnimation(.spring(duration: 0.4)) {
                position = .region(
                    MKCoordinateRegion(
                        center: coord,
                        span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
                    )
                )
            }
        }
    }

    private func handleSelectShrine(_ shrine: Shrine) {
        selectedMapItem = nil
        selectedShrine = shrine

        withAnimation(.spring(duration: 0.4)) {
            position = .region(
                MKCoordinateRegion(
                    center: shrine.coordinate,
                    span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
                )
            )
        }
    }

    // MARK: - Shrine Pin

    private func shrinePin(for shrine: Shrine) -> some View {
        let isSelected = selectedShrine?.id == shrine.id
        return Button {
            withAnimation(.spring(duration: 0.4, bounce: 0.3)) {
                selectedMapItem = nil
                selectedShrine = shrine
                position = .region(
                    MKCoordinateRegion(
                        center: shrine.coordinate,
                        span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
                    )
                )
            }
        } label: {
            ZStack {
                if isSelected {
                    Circle()
                        .stroke(Color.vermillion.opacity(0.3), lineWidth: 2)
                        .frame(width: 52, height: 52)
                        .scaleEffect(isSelected ? 1.2 : 0.8)
                        .opacity(isSelected ? 0 : 1)
                        .animation(
                            .easeOut(duration: 1.2).repeatForever(autoreverses: false),
                            value: isSelected
                        )
                }

                Circle()
                    .fill(Color(.label))
                    .frame(width: isSelected ? 44 : 34, height: isSelected ? 44 : 34)
                    .shadow(color: .black.opacity(0.2), radius: isSelected ? 6 : 4, y: 2)

                Text("\u{26E9}")
                    .font(.system(size: isSelected ? 20 : 14))
                    .foregroundStyle(Color(.systemBackground))
            }
            .animation(.spring(duration: 0.3, bounce: 0.4), value: isSelected)
        }
        .buttonStyle(.plain)
    }

    // MARK: - Map Item Pin

    private func mapItemPin(for item: MKMapItem) -> some View {
        let isSelected = selectedMapItem == item
        return Button {
            withAnimation(.spring(duration: 0.4, bounce: 0.3)) {
                selectedShrine = nil
                selectedMapItem = item
            }
        } label: {
            ZStack {
                Circle()
                    .fill(Color.vermillionMuted)
                    .frame(width: isSelected ? 40 : 30, height: isSelected ? 40 : 30)
                    .shadow(color: .black.opacity(0.2), radius: isSelected ? 6 : 4, y: 2)
                Image(systemName: "mappin")
                    .font(.system(size: isSelected ? 16 : 12))
                    .foregroundStyle(.white)
            }
            .animation(.spring(duration: 0.3, bounce: 0.4), value: isSelected)
        }
        .buttonStyle(.plain)
    }

    // MARK: - Shrine Card

    private func shrineCard(_ shrine: Shrine) -> some View {
        NavigationLink(value: shrine) {
            HStack(spacing: DS.Spacing.md) {
                ZStack {
                    Circle()
                        .fill(Color(.label))
                        .frame(width: 44, height: 44)
                    Text("\u{26E9}")
                        .font(.title3)
                        .foregroundStyle(Color(.systemBackground))
                }

                VStack(alignment: .leading, spacing: 2) {
                    Text(shrine.name)
                        .font(.subheadline.weight(.semibold))
                    Text(shrine.address)
                        .font(.caption)
                        .foregroundStyle(.secondary)
                        .lineLimit(1)
                }

                Spacer()

                Image(systemName: "chevron.right")
                    .font(.caption.weight(.semibold))
                    .foregroundStyle(.tertiary)
            }
            .padding(DS.Spacing.md)
            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: DS.Radius.lg))
            .shadow(color: .black.opacity(0.12), radius: 6, y: 3)
        }
        .buttonStyle(.pressable)
        .padding(.horizontal, DS.Spacing.lg)
        .transition(.move(edge: .bottom).combined(with: .opacity))
    }

    // MARK: - Map Item Card

    private func mapItemCard(_ item: MKMapItem) -> some View {
        HStack(spacing: DS.Spacing.md) {
            ZStack {
                Circle()
                    .fill(Color.vermillion)
                    .frame(width: 44, height: 44)
                Image(systemName: "mappin")
                    .font(.body)
                    .foregroundStyle(.white)
            }

            VStack(alignment: .leading, spacing: 2) {
                Text(item.name ?? "Unknown")
                    .font(.subheadline.weight(.semibold))
                if let address = item.placemark.title {
                    Text(address)
                        .font(.caption)
                        .foregroundStyle(.secondary)
                        .lineLimit(1)
                }
            }

            Spacer()

            Button {
                if let coord = item.placemark.location?.coordinate {
                    let destination = MKMapItem(placemark: MKPlacemark(coordinate: coord))
                    destination.name = item.name
                    destination.openInMaps()
                }
            } label: {
                Image(systemName: "arrow.triangle.turn.up.right.circle.fill")
                    .font(.title2)
                    .foregroundStyle(Color.vermillion)
            }
        }
        .padding(DS.Spacing.md)
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: DS.Radius.lg))
        .shadow(color: .black.opacity(0.12), radius: 6, y: 3)
        .padding(.horizontal, DS.Spacing.lg)
        .transition(.move(edge: .bottom).combined(with: .opacity))
    }
}

// MARK: - Map Style Option

enum MapStyleOption: CaseIterable, Identifiable {
    case standard, satellite, hybrid

    var id: Self { self }

    var style: MapStyle {
        switch self {
        case .standard: .standard
        case .satellite: .imagery
        case .hybrid: .hybrid
        }
    }

    var icon: String {
        switch self {
        case .standard: "map"
        case .satellite: "globe.americas"
        case .hybrid: "square.stack.3d.up"
        }
    }

    var label: String {
        switch self {
        case .standard: "Standard"
        case .satellite: "Satellite"
        case .hybrid: "Hybrid"
        }
    }
}

#Preview {
    ExploreView()
        .modelContainer(for: [CollectedStamp.self], inMemory: true)
}
