import SwiftUI
import SwiftData
import MapKit

struct ExploreView: View {
    @State private var locationService = LocationService()
    @State private var searchService = ShrineSearchService()
    @State private var directionsService = DirectionsService()
    @State private var position: MapCameraPosition = .userLocation(
        fallback: .region(
            MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: 35.6895, longitude: 139.6917),
                span: MKCoordinateSpan(latitudeDelta: 0.08, longitudeDelta: 0.08)
            )
        )
    )
    @State private var visibleRegion: MKCoordinateRegion?
    @State private var mapStyleOption: MapStyleOption = .standard
    @State private var exploreMode: ExploreMode = .exploring
    @State private var showCollectionPrompt = false
    @State private var promptShrine: Shrine?
    @State private var selectedCategory: ShrineCategory?
    @State private var showRecenterButton = false
    @State private var destinationPulse = false
    @State private var sheetDetent: PresentationDetent = .fraction(0.4)
    @State private var showDetailSheet = false
    @State private var showSearchSheet = false
    @State private var directionsOriginShrine: Shrine?
    @State private var directionsOriginMapItem: MapItemWrapper?

    @Query private var collectedStamps: [CollectedStamp]
    @Environment(\.modelContext) private var modelContext

    private let defaultRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 35.6895, longitude: 139.6917),
        span: MKCoordinateSpan(latitudeDelta: 0.08, longitudeDelta: 0.08)
    )

    private var currentRegion: MKCoordinateRegion {
        visibleRegion ?? defaultRegion
    }

    private var collectedIds: Set<Int> {
        Set(collectedStamps.map(\.slotId))
    }

    private var filteredShrines: [Shrine] {
        guard let category = selectedCategory else { return Shrine.samples }
        return Shrine.samples.filter { $0.category == category }
    }

    private var isNavigating: Bool {
        if case .navigating = exploreMode { return true }
        return false
    }

    private var isDirectionsOrNavigating: Bool {
        switch exploreMode {
        case .directions, .navigating: return true
        default: return false
        }
    }

    private var isShowingDetail: Bool {
        switch exploreMode {
        case .placeDetail, .mapItemDetail, .directions, .navigating: return true
        default: return false
        }
    }

    private var currentDetents: Set<PresentationDetent> {
        switch exploreMode {
        case .placeDetail:
            [.fraction(0.4), .large]
        case .mapItemDetail:
            [.fraction(0.3), .large]
        case .directions:
            [.fraction(0.45), .large]
        case .navigating:
            [.fraction(0.25), .large]
        default:
            [.fraction(0.4), .large]
        }
    }

    // MARK: - Body

    var body: some View {
        ZStack {
            mapLayer

            // Navigation top bar
            if isNavigating {
                VStack {
                    if let step = directionsService.nextStep {
                        NavigationTopBar(step: step, distance: nil)
                    }
                    Spacer()
                }
                .transition(.opacity)
            }

            // Floating search bar + category chips (visible when exploring or searching)
            if !isNavigating && !isShowingDetail {
                VStack(spacing: 0) {
                    FloatingSearchBar(onTap: {
                        withAnimation(.spring(duration: 0.35, bounce: 0)) {
                            exploreMode = .searching
                            showSearchSheet = true
                        }
                    })
                    .padding(.top, DS.Spacing.sm)

                    FloatingCategoryChips(
                        region: currentRegion,
                        selectedCategory: selectedCategory,
                        onCategoryTapped: { category in
                            withAnimation(.spring(duration: 0.3, bounce: 0)) {
                                selectedCategory = selectedCategory == category ? nil : category
                            }
                        }
                    )
                    .padding(.top, DS.Spacing.sm)

                    Spacer()
                }
                .transition(.opacity)
            }

            // Map controls
            if !isDirectionsOrNavigating && exploreMode != .searching {
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        MapFloatingButtons(
                            mapStyleOption: $mapStyleOption,
                            onRecenterTapped: {
                                withAnimation(.spring(duration: 0.4, bounce: 0)) {
                                    position = .userLocation(fallback: .region(defaultRegion))
                                }
                            }
                        )
                    }
                    .padding(.trailing, DS.Spacing.lg)
                    .padding(.bottom, sheetBottomPadding)
                }
            }

            // Location denied
            if locationService.authorizationStatus == .denied && !isNavigating {
                VStack {
                    locationDeniedBanner
                    Spacer()
                }
            }
        }
        // Detail sheet (only for placeDetail / mapItemDetail / navigating)
        .sheet(isPresented: $showDetailSheet) {
            detailSheetContent
                .presentationDetents(currentDetents, selection: $sheetDetent)
                .presentationBackgroundInteraction(.enabled(upThrough: .fraction(0.45)))
                .presentationDragIndicator(.visible)
                .presentationCornerRadius(16)
        }
        // Search sheet (full screen search)
        .sheet(isPresented: $showSearchSheet) {
            ExploreSearchContent(
                searchService: searchService,
                region: currentRegion,
                onSelectMapItem: { item in
                    showSearchSheet = false
                    handleSelectMapItem(item)
                },
                onSelectShrine: { shrine in
                    showSearchSheet = false
                    handleSelectShrine(shrine)
                },
                onBack: {
                    withAnimation(.spring(duration: 0.35, bounce: 0)) {
                        searchService.clear()
                        exploreMode = .exploring
                        showSearchSheet = false
                    }
                }
            )
            .presentationDetents([.large])
            .presentationDragIndicator(.visible)
            .presentationCornerRadius(16)
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
        .onChange(of: collectedStamps.count) { syncCollectedIds() }
        .onChange(of: locationService.currentLocation) { _, newLocation in
            if isNavigating, let loc = newLocation {
                directionsService.updateRemainingDistance(from: loc)
            }
        }
        .onChange(of: directionsService.isCalculating) { _, isCalculating in
            if !isCalculating, case .directions = exploreMode {
                zoomToRoute()
            }
        }
        .onChange(of: directionsService.selectedTransportMode) { _, _ in
            if case .directions = exploreMode {
                zoomToRoute()
            }
        }
        .sensoryFeedback(.selection, trigger: exploreMode)
        .sensoryFeedback(.success, trigger: directionsService.isArrived)
    }

    private var sheetBottomPadding: CGFloat {
        switch exploreMode {
        case .exploring: 200
        case .placeDetail: 260
        case .mapItemDetail: 200
        case .directions: 280
        default: 100
        }
    }

    // MARK: - Detail Sheet Content

    @ViewBuilder
    private var detailSheetContent: some View {
        switch exploreMode {
        case .placeDetail(let shrine):
            PlaceDetailContent(
                shrine: shrine,
                onDirections: { startDirections(to: shrine.coordinate, name: shrine.name, shrine: shrine) },
                onBack: { dismissDetailSheet() }
            )
        case .mapItemDetail(let wrapper):
            MapItemDetailContent(
                item: wrapper.item,
                onDirections: {
                    if let coord = wrapper.item.placemark.location?.coordinate {
                        startDirections(to: coord, name: wrapper.item.name, mapItem: wrapper)
                    }
                },
                onBack: { dismissDetailSheet() }
            )
        case .directions:
            DirectionsSheet(
                directionsService: directionsService,
                userLocation: locationService.currentLocation,
                onStartNavigation: { beginNavigation() },
                onDismiss: { dismissDirections() }
            )
        case .navigating:
            NavigationETABar(
                directionsService: directionsService,
                onEndNavigation: { endNavigation() }
            )
        default:
            EmptyView()
        }
    }

    // MARK: - Map Layer

    private var mapLayer: some View {
        Map(position: $position) {
            UserAnnotation()

            ForEach(filteredShrines) { shrine in
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

            if let route = directionsService.route {
                MapPolyline(route.polyline)
                    .stroke(Color.white, lineWidth: 8)
                MapPolyline(route.polyline)
                    .stroke(Color.blue, lineWidth: 5)

                if let dest = directionsService.destinationCoordinate {
                    Annotation("", coordinate: dest, anchor: .center) {
                        destinationPulseMarker
                    }
                }
            }
        }
        .mapStyle(mapStyleOption.style)
        .mapControls {
            MapCompass()
            MapScaleView()
        }
        .onMapCameraChange(frequency: .onEnd) { context in
            visibleRegion = context.region
            searchService.updateRegion(context.region)
        }
        .ignoresSafeArea()
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
    }

    // MARK: - Pins

    private func shrinePin(for shrine: Shrine) -> some View {
        let isSelected: Bool = {
            if case .placeDetail(let s) = exploreMode { return s.id == shrine.id }
            return false
        }()
        return ShrinePinView(
            shrine: shrine,
            isSelected: isSelected,
            isCollected: collectedIds.contains(shrine.stampSlotId),
            onTap: { handleSelectShrine(shrine) }
        )
    }

    private func mapItemPin(for item: MKMapItem) -> some View {
        let isSelected: Bool = {
            if case .mapItemDetail(let w) = exploreMode { return w.item === item }
            return false
        }()
        return SearchResultPinView(
            item: item,
            isSelected: isSelected,
            onTap: { handleSelectMapItem(item) }
        )
    }

    private var destinationPulseMarker: some View {
        ZStack {
            Circle()
                .stroke(Color.blue.opacity(0.3), lineWidth: 2)
                .frame(width: 60, height: 60)
                .scaleEffect(destinationPulse ? 1.5 : 1.0)
                .opacity(destinationPulse ? 0 : 0.6)
                .animation(.easeOut(duration: 1.5).repeatForever(autoreverses: false), value: destinationPulse)
            Circle()
                .stroke(Color.blue.opacity(0.4), lineWidth: 2)
                .frame(width: 40, height: 40)
                .scaleEffect(destinationPulse ? 1.3 : 1.0)
                .opacity(destinationPulse ? 0 : 0.8)
                .animation(.easeOut(duration: 1.5).repeatForever(autoreverses: false).delay(0.3), value: destinationPulse)
            Circle().fill(Color.blue).frame(width: 16, height: 16)
                .shadow(color: Color.blue.opacity(0.4), radius: 4)
            Circle().stroke(.white, lineWidth: 3).frame(width: 16, height: 16)
        }
        .onAppear { destinationPulse = true }
    }

    // MARK: - Actions

    private func dismissDetailSheet() {
        withAnimation(.spring(duration: 0.35, bounce: 0)) {
            showDetailSheet = false
            exploreMode = .exploring
        }
    }

    private func handleSelectShrine(_ shrine: Shrine) {
        withAnimation(.spring(duration: 0.4, bounce: 0)) {
            exploreMode = .placeDetail(shrine)
            sheetDetent = .fraction(0.4)
            showDetailSheet = true
            position = .region(MKCoordinateRegion(
                center: shrine.coordinate,
                span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
            ))
        }
    }

    private func handleSelectMapItem(_ item: MKMapItem) {
        let wrapper = MapItemWrapper(item: item)
        withAnimation(.spring(duration: 0.4, bounce: 0)) {
            exploreMode = .mapItemDetail(wrapper)
            sheetDetent = .fraction(0.3)
            showDetailSheet = true
        }
        if let coord = item.placemark.location?.coordinate {
            withAnimation(.spring(duration: 0.4, bounce: 0)) {
                position = .region(MKCoordinateRegion(
                    center: coord,
                    span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
                ))
            }
        }
    }

    private func endNavigation() {
        withAnimation(.spring(duration: 0.35, bounce: 0)) {
            directionsService.clear()
            showDetailSheet = false
            exploreMode = .exploring
            showRecenterButton = false
            destinationPulse = false
        }
    }

    private func startDirections(to destination: CLLocationCoordinate2D, name: String?, shrine: Shrine? = nil, mapItem: MapItemWrapper? = nil) {
        guard let userCoord = locationService.currentLocation?.coordinate else { return }
        directionsOriginShrine = shrine
        directionsOriginMapItem = mapItem
        directionsService.calculateAllRoutes(from: userCoord, to: destination, name: name)

        withAnimation(.spring(duration: 0.35, bounce: 0)) {
            exploreMode = .directions
            sheetDetent = .fraction(0.45)
            showDetailSheet = true
            destinationPulse = true
        }

        // Zoom to show both user and destination
        zoomToRoute(userCoord: userCoord, destCoord: destination)
    }

    private func dismissDirections() {
        directionsService.clear()
        destinationPulse = false

        // Go back to the place detail that started directions
        if let shrine = directionsOriginShrine {
            withAnimation(.spring(duration: 0.35, bounce: 0)) {
                exploreMode = .placeDetail(shrine)
                sheetDetent = .fraction(0.4)
                position = .region(MKCoordinateRegion(
                    center: shrine.coordinate,
                    span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
                ))
            }
        } else if let wrapper = directionsOriginMapItem {
            withAnimation(.spring(duration: 0.35, bounce: 0)) {
                exploreMode = .mapItemDetail(wrapper)
                sheetDetent = .fraction(0.3)
            }
        } else {
            dismissDetailSheet()
        }
        directionsOriginShrine = nil
        directionsOriginMapItem = nil
    }

    private func beginNavigation() {
        guard let userCoord = locationService.currentLocation?.coordinate else { return }
        directionsService.startNavigation(from: userCoord)

        withAnimation(.spring(duration: 0.4, bounce: 0)) {
            exploreMode = .navigating
            sheetDetent = .fraction(0.25)
        }

        // Zoom to show the route
        zoomToRoute()
    }

    private func zoomToRoute(userCoord: CLLocationCoordinate2D? = nil, destCoord: CLLocationCoordinate2D? = nil) {
        if let route = directionsService.route {
            let rect = route.polyline.boundingMapRect
            let padded = rect.insetBy(dx: -rect.size.width * 0.2, dy: -rect.size.height * 0.2)
            withAnimation(.spring(duration: 0.6, bounce: 0)) {
                position = .rect(padded)
            }
        } else if let u = userCoord, let d = destCoord {
            // Before route is calculated, show both points
            let minLat = min(u.latitude, d.latitude)
            let maxLat = max(u.latitude, d.latitude)
            let minLon = min(u.longitude, d.longitude)
            let maxLon = max(u.longitude, d.longitude)
            let center = CLLocationCoordinate2D(
                latitude: (minLat + maxLat) / 2,
                longitude: (minLon + maxLon) / 2
            )
            let span = MKCoordinateSpan(
                latitudeDelta: (maxLat - minLat) * 1.5 + 0.005,
                longitudeDelta: (maxLon - minLon) * 1.5 + 0.005
            )
            withAnimation(.spring(duration: 0.6, bounce: 0)) {
                position = .region(MKCoordinateRegion(center: center, span: span))
            }
        }
    }

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
