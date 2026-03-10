import MapKit
import ActivityKit

// MARK: - Transport Mode

enum TransportMode: String, CaseIterable, Identifiable {
    case walking, automobile, transit

    var id: String { rawValue }

    var mkTransportType: MKDirectionsTransportType {
        switch self {
        case .walking: .walking
        case .automobile: .automobile
        case .transit: .transit
        }
    }

    var icon: String {
        switch self {
        case .walking: "figure.walk"
        case .automobile: "car.fill"
        case .transit: "tram.fill"
        }
    }

    var label: String {
        switch self {
        case .walking: "Walk"
        case .automobile: "Drive"
        case .transit: "Transit"
        }
    }
}

// MARK: - Route Option (per transport mode)

struct RouteOption: Identifiable {
    let id = UUID()
    let mode: TransportMode
    let route: MKRoute?
    let error: String?

    var duration: TimeInterval { route?.expectedTravelTime ?? 0 }
    var distance: CLLocationDistance { route?.distance ?? 0 }

    var formattedDuration: String {
        let minutes = Int(duration / 60)
        if minutes < 60 { return "\(minutes) min" }
        let hours = minutes / 60
        let mins = minutes % 60
        return mins > 0 ? "\(hours) hr \(mins) min" : "\(hours) hr"
    }

    var formattedDistance: String {
        if distance < 1000 {
            return "\(Int(distance)) m"
        } else {
            return String(format: "%.1f km", distance / 1000)
        }
    }
}

@MainActor
@Observable
final class DirectionsService {
    var route: MKRoute?
    var isCalculating = false
    var destinationName: String?
    var destinationCoordinate: CLLocationCoordinate2D?
    var remainingDistance: CLLocationDistance = 0
    var initialDistance: CLLocationDistance = 0
    var isArrived = false
    var selectedTransportMode: TransportMode = .walking
    var routeOptions: [RouteOption] = []

    private var activity: Activity<GosyuinActivityAttributes>?

    // MARK: - Route Preview (calculate all transport modes)

    func calculateAllRoutes(from origin: CLLocationCoordinate2D, to destination: CLLocationCoordinate2D, name: String?) {
        isCalculating = true
        destinationName = name
        destinationCoordinate = destination

        Task {
            var options: [RouteOption] = []

            for mode in TransportMode.allCases {
                let request = MKDirections.Request()
                request.source = MKMapItem(placemark: MKPlacemark(coordinate: origin))
                request.destination = MKMapItem(placemark: MKPlacemark(coordinate: destination))
                request.transportType = mode.mkTransportType

                let directions = MKDirections(request: request)
                do {
                    let response = try await directions.calculate()
                    options.append(RouteOption(mode: mode, route: response.routes.first, error: nil))
                } catch {
                    options.append(RouteOption(mode: mode, route: nil, error: "Not available"))
                }
            }

            routeOptions = options
            // Auto-select best available mode and show preview route
            if let best = options.first(where: { $0.route != nil }) {
                selectedTransportMode = best.mode
                route = best.route
            }
            isCalculating = false
        }
    }

    /// Update the preview route when transport mode changes
    func selectPreviewRoute(mode: TransportMode) {
        selectedTransportMode = mode
        if let option = routeOptions.first(where: { $0.mode == mode }), let r = option.route {
            route = r
        }
    }

    // MARK: - Start Navigation with selected mode

    func startNavigation(from origin: CLLocationCoordinate2D) {
        guard let dest = destinationCoordinate else { return }
        isArrived = false

        if let option = routeOptions.first(where: { $0.mode == selectedTransportMode }), let r = option.route {
            route = r
            remainingDistance = r.distance
            initialDistance = r.distance
            startLiveActivity()
        } else {
            calculateRoute(from: origin, to: dest, name: destinationName)
        }
    }

    // MARK: - Route Calculation (single mode, legacy)

    func calculateRoute(from origin: CLLocationCoordinate2D, to destination: CLLocationCoordinate2D, name: String?) {
        isCalculating = true
        destinationName = name
        destinationCoordinate = destination
        isArrived = false

        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: MKPlacemark(coordinate: origin))
        request.destination = MKMapItem(placemark: MKPlacemark(coordinate: destination))
        request.transportType = selectedTransportMode.mkTransportType

        let directions = MKDirections(request: request)
        Task {
            defer { isCalculating = false }
            do {
                let response = try await directions.calculate()
                route = response.routes.first
                if let route {
                    remainingDistance = route.distance
                    initialDistance = route.distance
                    startLiveActivity()
                }
            } catch {
                route = nil
            }
        }
    }

    // MARK: - Open in Maps App

    func openInMapsApp() {
        guard let dest = destinationCoordinate else { return }
        let placemark = MKPlacemark(coordinate: dest)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = destinationName

        let launchOptions: [String: Any]
        switch selectedTransportMode {
        case .walking:
            launchOptions = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeWalking]
        case .automobile:
            launchOptions = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving]
        case .transit:
            launchOptions = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeTransit]
        }
        mapItem.openInMaps(launchOptions: launchOptions)
    }

    // MARK: - Real-Time Tracking

    func updateRemainingDistance(from location: CLLocation) {
        guard let dest = destinationCoordinate else { return }
        let destLocation = CLLocation(latitude: dest.latitude, longitude: dest.longitude)
        remainingDistance = location.distance(from: destLocation)

        if remainingDistance < 100 && !isArrived {
            isArrived = true
            markArrived()
        } else {
            updateLiveActivity()
        }
    }

    // MARK: - Clear

    func clear() {
        endLiveActivity()
        route = nil
        destinationName = nil
        destinationCoordinate = nil
        remainingDistance = 0
        initialDistance = 0
        isCalculating = false
        isArrived = false
    }

    // MARK: - Formatted Properties

    var formattedRemainingDistance: String {
        formatDistance(remainingDistance)
    }

    var formattedTotalDistance: String {
        guard let route else { return "" }
        return formatDistance(route.distance)
    }

    var remainingMinutes: Int {
        // Walking speed ~80m/min
        max(1, Int(remainingDistance / 80))
    }

    var formattedETA: String {
        let arrival = Date.now.addingTimeInterval(TimeInterval(remainingMinutes * 60))
        let formatter = DateFormatter()
        formatter.dateFormat = "H:mm"
        return formatter.string(from: arrival)
    }

    var progress: Double {
        guard initialDistance > 0 else { return 0 }
        return max(0, min(1, 1 - remainingDistance / initialDistance))
    }

    var nextStep: String? {
        guard let steps = route?.steps, steps.count > 1 else { return nil }
        // Skip the first step (it's usually "Start")
        let meaningful = steps.filter { !$0.instructions.isEmpty }
        return meaningful.dropFirst().first?.instructions
    }

    // MARK: - Live Activity

    private func startLiveActivity() {
        guard ActivityAuthorizationInfo().areActivitiesEnabled else { return }
        let attributes = GosyuinActivityAttributes(shrineName: destinationName ?? "Shrine")
        let state = GosyuinActivityAttributes.ContentState(
            shrineName: destinationName ?? "Shrine",
            distance: Int(remainingDistance),
            isCollected: false,
            isNavigating: true,
            estimatedMinutes: remainingMinutes
        )
        do {
            let content = ActivityContent(state: state, staleDate: nil)
            activity = try Activity.request(
                attributes: attributes,
                content: content,
                pushType: nil
            )
        } catch {
            print("Failed to start navigation Live Activity: \(error)")
        }
    }

    private func updateLiveActivity() {
        guard let activity else { return }
        let state = GosyuinActivityAttributes.ContentState(
            shrineName: destinationName ?? "Shrine",
            distance: Int(remainingDistance),
            isCollected: false,
            isNavigating: true,
            estimatedMinutes: remainingMinutes
        )
        Task {
            let content = ActivityContent(state: state, staleDate: nil)
            await activity.update(content)
        }
    }

    private func markArrived() {
        guard let activity else { return }
        let state = GosyuinActivityAttributes.ContentState(
            shrineName: destinationName ?? "Shrine",
            distance: 0,
            isCollected: false,
            isNavigating: true,
            estimatedMinutes: 0
        )
        Task {
            let content = ActivityContent(state: state, staleDate: nil)
            await activity.update(content)
            try? await Task.sleep(for: .seconds(8))
            await activity.end(content, dismissalPolicy: .immediate)
            self.activity = nil
        }
    }

    private func endLiveActivity() {
        guard let activity else { return }
        Task {
            await activity.end(nil, dismissalPolicy: .immediate)
            self.activity = nil
        }
    }

    // MARK: - Helpers

    private func formatDistance(_ meters: CLLocationDistance) -> String {
        if meters < 1000 {
            return "\(Int(meters))m"
        } else {
            return String(format: "%.1fkm", meters / 1000)
        }
    }
}
