import ActivityKit
import Foundation
import Observation

@Observable
final class WorshipSessionManager {
    private(set) var currentActivity: Activity<GosyuinActivityAttributes>?
    private(set) var currentStep: WorshipStep = .temizu
    private(set) var isActive: Bool = false
    private(set) var shrineName: String = ""
    private(set) var startDate: Date = .now

    func startSession(shrine: String) {
        guard !isActive else { return }
        shrineName = shrine
        currentStep = .temizu
        startDate = .now
        isActive = true

        let attributes = GosyuinActivityAttributes(gosyuinName: shrine)
        let state = GosyuinActivityAttributes.ContentState(
            templeName: shrine,
            status: currentStep.label,
            currentStep: currentStep,
            startDate: startDate
        )

        do {
            let content = ActivityContent(state: state, staleDate: nil)
            currentActivity = try Activity.request(
                attributes: attributes,
                content: content,
                pushType: nil
            )
        } catch {
            print("Failed to start Live Activity: \(error)")
        }
    }

    func advanceStep() {
        guard isActive, let next = currentStep.next else { return }
        currentStep = next
        updateActivity()
    }

    func completeSession() {
        guard isActive else { return }
        let finalState = GosyuinActivityAttributes.ContentState(
            templeName: shrineName,
            status: "完了",
            currentStep: .gosyuin,
            startDate: startDate
        )

        Task {
            let content = ActivityContent(state: finalState, staleDate: nil)
            await currentActivity?.end(content, dismissalPolicy: .after(.now + 30))
        }

        resetState()
    }

    func cancelSession() {
        guard isActive else { return }
        let state = GosyuinActivityAttributes.ContentState(
            templeName: shrineName,
            status: "中止",
            currentStep: currentStep,
            startDate: startDate
        )

        Task {
            let content = ActivityContent(state: state, staleDate: nil)
            await currentActivity?.end(content, dismissalPolicy: .immediate)
        }

        resetState()
    }

    private func updateActivity() {
        let state = GosyuinActivityAttributes.ContentState(
            templeName: shrineName,
            status: currentStep.label,
            currentStep: currentStep,
            startDate: startDate
        )

        Task {
            let content = ActivityContent(state: state, staleDate: nil)
            await currentActivity?.update(content)
        }
    }

    private func resetState() {
        isActive = false
        currentActivity = nil
        shrineName = ""
        currentStep = .temizu
    }
}
