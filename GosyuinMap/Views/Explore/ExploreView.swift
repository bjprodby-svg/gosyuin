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
    @State private var searchText = ""
    @State private var selectedShrine: Shrine?
    @State private var selectedMapItem: MKMapItem?
    @State private var mapStyleOption: MapStyleOption = .standard
    @State private var showingSearchSheet = false

    private var filteredShrines: [Shrine] {
        if searchText.isEmpty {
            return Shrine.samples
        }
        return Shrine.samples.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
    }

    var body: some View {
        NavigationStack {
            ZStack {
                mapContent

                VStack(spacing: 0) {
                    searchOverlay
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
            .sheet(isPresented: $showingSearchSheet) {
                SearchSheetView(
                    searchService: searchService,
                    region: visibleRegion ?? defaultRegion
                ) { mapItem in
                    showingSearchSheet = false
                    selectedShrine = nil
                    selectedMapItem = mapItem
                    if let coord = mapItem.placemark.location?.coordinate {
                        withAnimation {
                            position = .region(
                                MKCoordinateRegion(
                                    center: coord,
                                    span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
                                )
                            )
                        }
                    }
                }
            }
        }
    }

    private var defaultRegion: MKCoordinateRegion {
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 35.6895, longitude: 139.6917),
            span: MKCoordinateSpan(latitudeDelta: 0.08, longitudeDelta: 0.08)
        )
    }

    // MARK: - Map

    private var mapContent: some View {
        Map(position: $position) {
            UserAnnotation()

            ForEach(filteredShrines) { shrine in
                Annotation(shrine.name, coordinate: shrine.coordinate, anchor: .bottom) {
                    shrinePin(for: shrine)
                }
            }

            ForEach(searchService.results, id: \.self) { item in
                if let coord = item.placemark.location?.coordinate {
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
        }
    }

    private func shrinePin(for shrine: Shrine) -> some View {
        Button {
            withAnimation(.spring(duration: 0.3)) {
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
            ShrineAnnotationView(isSelected: selectedShrine?.id == shrine.id)
        }
        .buttonStyle(.plain)
    }

    private func mapItemPin(for item: MKMapItem) -> some View {
        Button {
            withAnimation(.spring(duration: 0.3)) {
                selectedShrine = nil
                selectedMapItem = item
            }
        } label: {
            ZStack {
                Circle()
                    .fill(Color.vermillion.opacity(0.8))
                    .frame(width: selectedMapItem == item ? 40 : 30,
                           height: selectedMapItem == item ? 40 : 30)
                    .shadow(color: .black.opacity(0.2), radius: 4, y: 2)
                Image(systemName: "mappin")
                    .font(.system(size: selectedMapItem == item ? 16 : 12))
                    .foregroundStyle(.white)
            }
            .animation(.spring(duration: 0.2), value: selectedMapItem == item)
        }
        .buttonStyle(.plain)
    }

    // MARK: - Search Overlay

    private var searchOverlay: some View {
        VStack(spacing: 8) {
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundStyle(.secondary)
                TextField("Search shrines", text: $searchText)
                    .textFieldStyle(.plain)
                if !searchText.isEmpty {
                    Button {
                        searchText = ""
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundStyle(.secondary)
                    }
                }
            }
            .padding(12)
            .adaptiveGlassBackground(cornerRadius: 12)

            HStack(spacing: 8) {
                Button {
                    showingSearchSheet = true
                } label: {
                    HStack(spacing: 6) {
                        Text("\u{26E9}")
                        Text("Search nearby")
                    }
                    .font(.subheadline.weight(.medium))
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .adaptiveGlassBackground(cornerRadius: 20)
                }
                .buttonStyle(.plain)

                if !searchService.results.isEmpty {
                    Button {
                        withAnimation {
                            searchService.clear()
                            selectedMapItem = nil
                        }
                    } label: {
                        HStack(spacing: 4) {
                            Image(systemName: "xmark")
                            Text("Clear")
                        }
                        .font(.caption.weight(.medium))
                        .padding(.horizontal, 12)
                        .padding(.vertical, 8)
                        .adaptiveGlassBackground(cornerRadius: 20)
                    }
                    .buttonStyle(.plain)
                }
            }
        }
        .padding(.horizontal)
        .padding(.top, 8)
    }

    // MARK: - Selected Shrine Card

    private func shrineCard(_ shrine: Shrine) -> some View {
        NavigationLink(value: shrine) {
            HStack(spacing: 12) {
                ZStack {
                    Circle()
                        .fill(Color(.label))
                        .frame(width: 44, height: 44)
                        .shadow(color: .black.opacity(0.1), radius: 2)
                    Text("\u{26E9}")
                        .font(.title2)
                        .foregroundStyle(Color(.systemBackground))
                }

                VStack(alignment: .leading, spacing: 2) {
                    Text(shrine.name)
                        .font(.headline)
                    Text(shrine.address)
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }

                Spacer()

                Image(systemName: "chevron.right")
                    .font(.caption)
                    .foregroundStyle(.tertiary)
            }
            .padding()
            .adaptiveGlassBackground(cornerRadius: 16)
        }
        .buttonStyle(.plain)
        .padding()
        .transition(.move(edge: .bottom).combined(with: .opacity))
    }

    // MARK: - Map Item Card

    private func mapItemCard(_ item: MKMapItem) -> some View {
        HStack(spacing: 12) {
            ZStack {
                Circle()
                    .fill(Color.vermillion)
                    .frame(width: 44, height: 44)
                    .shadow(color: .black.opacity(0.1), radius: 2)
                Image(systemName: "mappin")
                    .font(.title3)
                    .foregroundStyle(.white)
            }

            VStack(alignment: .leading, spacing: 2) {
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
                if let url = item.url {
                    UIApplication.shared.open(url)
                } else if let coord = item.placemark.location?.coordinate {
                    let mapItem = MKMapItem(placemark: MKPlacemark(coordinate: coord))
                    mapItem.name = item.name
                    mapItem.openInMaps()
                }
            } label: {
                Image(systemName: "arrow.triangle.turn.up.right.circle.fill")
                    .font(.title2)
                    .foregroundStyle(.vermillion)
            }
        }
        .padding()
        .adaptiveGlassBackground(cornerRadius: 16)
        .padding()
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

// MARK: - Shrine Annotation View

private struct ShrineAnnotationView: View {
    var isSelected: Bool = false

    var body: some View {
        ZStack {
            Circle()
                .fill(Color(.label))
                .frame(width: isSelected ? 44 : 34, height: isSelected ? 44 : 34)
                .shadow(color: .black.opacity(0.2), radius: 4, y: 2)
            Text("\u{26E9}")
                .font(.system(size: isSelected ? 20 : 14))
                .foregroundStyle(Color(.systemBackground))
        }
        .animation(.spring(duration: 0.2), value: isSelected)
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
}
