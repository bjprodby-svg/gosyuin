import ActivityKit
import Foundation
import Observation
import OSLog

private let logger = Logger(subsystem: "com.bjprodby.gosyuinmap", category: "ProximityActivity")

@MainActor
@Observable
final class ProximityActivityManager {
    private(set) var currentActivity: Activity<GosyuinActivityAttributes>?
    private(set) var isActive: Bool = false

    func startActivity(shrine: String, distance: Int) {
        guard !isActive else { return }
        isActive = true

        let attributes = GosyuinActivityAttributes(shrineName: shrine)
        let state = GosyuinActivityAttributes.ContentState(
            shrineName: shrine,
            distance: distance,
            isCollected: false
        )

        do {
            let content = ActivityContent(state: state, staleDate: nil)
            currentActivity = try Activity.request(
                attributes: attributes,
                content: content,
                pushType: nil
            )
        } catch {
            logger.error("Failed to start Live Activity: \(error.localizedDescription)")
            isActive = false
        }
    }

    func updateDistance(_ distance: Int, shrine: String) {
        let state = GosyuinActivityAttributes.ContentState(
            shrineName: shrine,
            distance: distance,
            isCollected: false
        )

        let activity = currentActivity
        Task {
            let content = ActivityContent(state: state, staleDate: nil)
            await activity?.update(content)
        }
    }

    func markCollected(shrine: String) {
        let state = GosyuinActivityAttributes.ContentState(
            shrineName: shrine,
            distance: 0,
            isCollected: true
        )

        let activity = currentActivity
        Task {
            let content = ActivityContent(state: state, staleDate: nil)
            await activity?.update(content)
            try? await Task.sleep(for: .seconds(5))
            await activity?.end(content, dismissalPolicy: .immediate)
        }

        isActive = false
        currentActivity = nil
    }

    func endActivity() {
        guard isActive else { return }
        let activity = currentActivity
        Task {
            await activity?.end(nil, dismissalPolicy: .immediate)
        }

        isActive = false
        currentActivity = nil
    }
}
