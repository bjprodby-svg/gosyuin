import SwiftUI

@MainActor
@Observable
final class TipPromptController {
    @ObservationIgnored @AppStorage("tipPromptDismissedForever")
    private var dismissedForever = false

    @ObservationIgnored @AppStorage("tipPromptLastShownStampCount")
    private var lastShownAtCount = 0

    @ObservationIgnored @AppStorage("tipPromptsEnabled")
    var isEnabled: Bool = true

    #if DEBUG
    @ObservationIgnored @AppStorage("tipPromptForceNext")
    var forceShowNext: Bool = false
    #endif

    func shouldShowTipPrompt(currentStampCount: Int) -> Bool {
        #if DEBUG
        if forceShowNext {
            forceShowNext = false
            return true
        }
        #endif
        guard isEnabled, !dismissedForever else { return false }
        guard currentStampCount >= 5 else { return false }
        guard currentStampCount % 5 == 0 else { return false }
        guard currentStampCount != lastShownAtCount else { return false }
        return true
    }

    func recordShown(atStampCount: Int) {
        lastShownAtCount = atStampCount
    }

    func dismissForever() {
        dismissedForever = true
    }

    func resetDismissal() {
        dismissedForever = false
    }

    #if DEBUG
    func resetAll() {
        dismissedForever = false
        lastShownAtCount = 0
        isEnabled = true
        forceShowNext = true
    }
    #endif
}
