import CoreLocation

@MainActor
@Observable
final class LocationService: NSObject, @unchecked Sendable, CLLocationManagerDelegate {
    private let manager = CLLocationManager()
    var authorizationStatus: CLAuthorizationStatus = .notDetermined
    var currentLocation: CLLocation?
    var nearbyShrine: Shrine?
    var collectedSlotIds: Set<Int> = []

    private let proximityThreshold: CLLocationDistance = 100

    override init() {
        super.init()
        manager.delegate = self
        authorizationStatus = manager.authorizationStatus
    }

    func requestPermission() {
        manager.requestWhenInUseAuthorization()
    }

    func startUpdatingLocation() {
        manager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        manager.distanceFilter = 20
        manager.startUpdatingLocation()
    }

    func stopUpdatingLocation() {
        manager.stopUpdatingLocation()
    }

    private func checkProximity() {
        guard let location = currentLocation else {
            nearbyShrine = nil
            return
        }

        let nearest = Shrine.samples
            .filter { !collectedSlotIds.contains($0.stampSlotId) }
            .map { (shrine: $0, distance: location.distance(from: CLLocation(latitude: $0.coordinate.latitude, longitude: $0.coordinate.longitude))) }
            .filter { $0.distance <= proximityThreshold }
            .min(by: { $0.distance < $1.distance })

        nearbyShrine = nearest?.shrine
    }

    // MARK: - CLLocationManagerDelegate

    nonisolated func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        Task { @MainActor [weak self] in
            self?.currentLocation = location
            self?.checkProximity()
        }
    }

    nonisolated func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        let status = manager.authorizationStatus
        Task { @MainActor [weak self] in
            self?.authorizationStatus = status
            if status == .authorizedWhenInUse || status == .authorizedAlways {
                self?.startUpdatingLocation()
            }
        }
    }
}
