import SwiftUI
import MapKit

struct ExploreView: View {
    @State private var locationService = LocationService()
    @State private var searchService = ShrineSearchService()
    @State private var position: MapCameraPosition = .region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 35.6895, longitude: 139.6917),
            span: MKCoordinateSpan(latitudeDelta: 0.08, longitudeDelta: 0.08)
        )
    )
    @State private var visibleRegion: MKCoordinateRegion?
    @State private var selectedShrine: Shrine?
    @State private var selectedMapItem: MKMapItem?
    @State private var mapStyleOption: MapStyleOption = .standard
    @State private var searchSheetDetent: PresentationDetent = .height(56)
    @State private var showSearchSheet = true
    @Namespace private var mapNamespace

    private var currentRegion: MKCoordinateRegion {
        visibleRegion ?? MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 35.6895, longitude: 139.6917),
            span: MKCoordinateSpan(latitudeDelta: 0.08, longitudeDelta: 0.08)
        )
    }

    var body: some View {
        NavigationStack {
            ZStack {
                mapContent

                VStack {
                    Spacer()
                    if let shrine = selectedShrine {
                        shrineCard(shrine)
                    } else if let mapItem = selectedMapItem {
                        mapItemCard(mapItem)
                    }
                }
            }
            .navigationTitle("Map")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    mapStyleMenu
                }
            }
            .navigationDestination(for: Shrine.self) { shrine in
                ShrineDetailView(shrine: shrine)
            }
            .onAppear {
                locationService.requestPermission()
            }
            .sensoryFeedback(.selection, trigger: selectedShrine?.id)
            .sensoryFeedback(.selection, trigger: selectedMapItem)
            .sheet(isPresented: $showSearchSheet) {
                ExploreSearchSheet(
                    searchService: searchService,
                    region: currentRegion,
                    onSelectMapItem: { item in
                        handleSelectMapItem(item)
                    },
                    onSelectShrine: { shrine in
                        handleSelectShrine(shrine)
                    }
                )
                .presentationDetents(
                    [.height(56), .medium, .large],
                    selection: $searchSheetDetent
                )
                .presentationDragIndicator(.hidden)
                .presentationBackgroundInteraction(.enabled(upThrough: .medium))
                .interactiveDismissDisabled()
            }
        }
    }

    // MARK: - Map

    private var mapContent: some View {
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
        }
        .onMapCameraChange { context in
            visibleRegion = context.region
            searchService.updateRegion(context.region)
        }
        .onTapGesture {
            withAnimation(.spring(duration: 0.3)) {
                selectedShrine = nil
                selectedMapItem = nil
            }
        }
    }

    private func isDuplicateOfSample(_ item: MKMapItem) -> Bool {
        guard let name = item.name else { return false }
        return Shrine.samples.contains { name.contains($0.name) }
    }

    private func shrinePin(for shrine: Shrine) -> some View {
        let isSelected = selectedShrine?.id == shrine.id
        return Button {
            withAnimation(.spring(duration: 0.4, bounce: 0.3)) {
                selectedMapItem = nil
                selectedShrine = shrine
                searchSheetDetent = .height(56)
                position = .region(
                    MKCoordinateRegion(
                        center: shrine.coordinate,
                        span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
                    )
                )
            }
        } label: {
            ZStack {
                // 選択時の pulse ring
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

    private func mapItemPin(for item: MKMapItem) -> some View {
        let isSelected = selectedMapItem == item
        return Button {
            withAnimation(.spring(duration: 0.4, bounce: 0.3)) {
                selectedShrine = nil
                selectedMapItem = item
                searchSheetDetent = .height(56)
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

    // MARK: - Selection Handlers

    private func handleSelectMapItem(_ item: MKMapItem) {
        selectedShrine = nil
        selectedMapItem = item
        searchSheetDetent = .height(56)

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
        searchSheetDetent = .height(56)

        withAnimation(.spring(duration: 0.4)) {
            position = .region(
                MKCoordinateRegion(
                    center: shrine.coordinate,
                    span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
                )
            )
        }
    }

    // MARK: - Shrine Card

    private func shrineCard(_ shrine: Shrine) -> some View {
        NavigationLink(value: shrine) {
            HStack(spacing: DS.Spacing.md) {
                ZStack {
                    Circle()
                        .fill(Color(.label))
                        .frame(width: 48, height: 48)
                    Text("\u{26E9}")
                        .font(.title2)
                        .foregroundStyle(Color(.systemBackground))
                }
                .shadow(color: .black.opacity(0.1), radius: 3, y: 1)

                VStack(alignment: .leading, spacing: DS.Spacing.xs) {
                    Text(shrine.name)
                        .font(.headline)
                    Text(shrine.address)
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }

                Spacer()

                Image(systemName: "chevron.right")
                    .font(.caption.weight(.semibold))
                    .foregroundStyle(.tertiary)
            }
            .cardStyle()
        }
        .buttonStyle(.pressable)
        .padding(.horizontal, DS.Spacing.lg)
        .padding(.bottom, 72)
        .transition(.move(edge: .bottom).combined(with: .opacity))
    }

    // MARK: - Map Item Card

    private func mapItemCard(_ item: MKMapItem) -> some View {
        HStack(spacing: DS.Spacing.md) {
            ZStack {
                Circle()
                    .fill(Color.vermillion)
                    .frame(width: 48, height: 48)
                Image(systemName: "mappin")
                    .font(.title3)
                    .foregroundStyle(.white)
            }
            .shadow(color: Color.vermillion.opacity(0.3), radius: 4, y: 2)

            VStack(alignment: .leading, spacing: DS.Spacing.xs) {
                Text(item.name ?? "Unknown")
                    .font(.headline)
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
                    .foregroundStyle(.vermillion)
            }
        }
        .cardStyle()
        .padding(.horizontal, DS.Spacing.lg)
        .padding(.bottom, 72)
        .transition(.move(edge: .bottom).combined(with: .opacity))
    }

    // MARK: - Map Style Menu

    private var mapStyleMenu: some View {
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
        }
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
