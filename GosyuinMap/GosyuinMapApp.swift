import SwiftUI
import SwiftData

@main
struct GosyuinMapApp: App {
    @State private var hasCompletedOnboarding = false
    @State private var showSplash = true

    init() {
        GooglePlacesService.configure(apiKey: Secrets.googlePlacesAPIKey)
    }

    var body: some Scene {
        WindowGroup {
            if !hasCompletedOnboarding {
                OnboardingView(hasCompletedOnboarding: $hasCompletedOnboarding)
            } else {
                ZStack {
                    ContentView()

                    if showSplash {
                        SplashView()
                            .transition(.opacity)
                            .zIndex(1)
                    }
                }
                .task {
                    try? await Task.sleep(for: .seconds(1.5))
                    withAnimation(.easeOut(duration: 0.4)) {
                        showSplash = false
                    }
                }
            }
        }
        .modelContainer(
            for: [CollectedStamp.self],
            migrationPlan: CollectedStampMigrationPlan.self
        )
    }
}
