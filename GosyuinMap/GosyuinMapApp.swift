import SwiftUI
import SwiftData

@main
struct GosyuinMapApp: App {
    @State private var showSplash = true
    @State private var worshipManager = WorshipSessionManager()

    var body: some Scene {
        WindowGroup {
            ZStack {
                ContentView()
                    .environment(worshipManager)

                if showSplash {
                    SplashView()
                        .transition(.opacity)
                        .zIndex(1)
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    withAnimation(.easeOut(duration: 0.4)) {
                        showSplash = false
                    }
                }
            }
        }
        .modelContainer(for: [Gosyuin.self, CollectedStamp.self])
    }
}
