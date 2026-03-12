import SwiftUI
import SwiftData
import CoreLocation

@main
struct GosyuinMapApp: App {
    @State private var hasCompletedOnboarding = false
    @State private var showSplash = true
    @State private var showTestStampPrompt = false

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

                    // Test stamp button — always on top, center of screen
                    if !showSplash {
                        Button {
                            showTestStampPrompt = true
                        } label: {
                            Text("Test Stamp")
                                .font(.headline.bold())
                                .foregroundColor(.white)
                                .padding(.horizontal, 24)
                                .padding(.vertical, 14)
                                .background(Color.red)
                                .clipShape(Capsule())
                                .shadow(color: .black.opacity(0.5), radius: 10, y: 5)
                        }
                        .zIndex(2)
                    }
                }
                .task {
                    try? await Task.sleep(for: .seconds(1.5))
                    withAnimation(.easeOut(duration: 0.4)) {
                        showSplash = false
                    }
                }
                .sheet(isPresented: $showTestStampPrompt) {
                    StampCollectionPrompt(
                        shrine: Shrine(
                            id: UUID(uuidString: "FFFFFFFF-FFFF-FFFF-FFFF-FFFFFFFFFFFF")!,
                            name: "Test Shrine",
                            address: "Current Location",
                            description: "Debug test",
                            coordinate: CLLocationCoordinate2D(latitude: 35.6895, longitude: 139.6917),
                            stampSlotId: 1,
                            category: .jinja
                        ),
                        onCollect: { },
                        onDismiss: { showTestStampPrompt = false }
                    )
                    .presentationDetents([.medium])
                    .presentationDragIndicator(.visible)
                }
            }
        }
        .modelContainer(for: [CollectedStamp.self])
    }
}
