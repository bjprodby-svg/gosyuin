import SwiftUI

struct OnboardingView: View {
    @AppStorage("hasCompletedOnboarding") private var hasCompletedOnboarding = false
    @State private var currentPage = 0
    @State private var locationService = LocationService()

    var body: some View {
        ZStack {
            Color.pageBackground
                .ignoresSafeArea()

            TabView(selection: $currentPage) {
                welcomePage.tag(0)
                locationPage.tag(1)
                readyPage.tag(2)
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .animation(.easeInOut(duration: 0.3), value: currentPage)

            VStack {
                Spacer()
                pageIndicator
                    .padding(.bottom, DS.Spacing.xxl)
            }
        }
    }

    // MARK: - Page 1: Welcome

    private var welcomePage: some View {
        VStack(spacing: DS.Spacing.xxl) {
            Spacer()

            VStack(spacing: DS.Spacing.lg) {
                Text("\u{26E9}")
                    .font(.system(size: 80))

                Text("Collect Shrine Stamps")
                    .font(.largeTitle.bold())
                    .foregroundStyle(Color.bodyText)
                    .multilineTextAlignment(.center)

                Text("Visit real shrines and temples across Japan to collect unique stamps for your digital stamp book.")
                    .font(.body)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, DS.Spacing.xxl)
            }

            Spacer()

            Button {
                withAnimation { currentPage = 1 }
            } label: {
                Text("Next")
                    .vermillionButtonStyle()
            }
            .buttonStyle(.pressable)
            .padding(.horizontal, DS.Spacing.xxl)
            .padding(.bottom, 60)
        }
    }

    // MARK: - Page 2: Location

    private var locationPage: some View {
        VStack(spacing: DS.Spacing.xxl) {
            Spacer()

            VStack(spacing: DS.Spacing.lg) {
                Image(systemName: "location.fill")
                    .font(.system(size: 60))
                    .foregroundStyle(Color.vermillion)

                Text("Auto-Collect Nearby")
                    .font(.largeTitle.bold())
                    .foregroundStyle(Color.bodyText)
                    .multilineTextAlignment(.center)

                Text("Enable location access so we can detect when you're near a shrine and let you collect stamps automatically.")
                    .font(.body)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, DS.Spacing.xxl)
            }

            Spacer()

            VStack(spacing: DS.Spacing.md) {
                if locationService.authorizationStatus == .authorizedWhenInUse
                    || locationService.authorizationStatus == .authorizedAlways {
                    Label("Location Enabled", systemImage: "checkmark.circle.fill")
                        .font(.headline)
                        .foregroundStyle(Color.matcha)
                        .transition(.scale.combined(with: .opacity))
                }

                Button {
                    if locationService.authorizationStatus == .notDetermined {
                        locationService.requestPermission()
                    }
                    withAnimation { currentPage = 2 }
                } label: {
                    Text(locationService.authorizationStatus == .notDetermined
                         ? "Enable Location"
                         : "Next")
                        .vermillionButtonStyle()
                }
                .buttonStyle(.pressable)

                if locationService.authorizationStatus == .notDetermined {
                    Button {
                        withAnimation { currentPage = 2 }
                    } label: {
                        Text("Skip for Now")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                }
            }
            .padding(.horizontal, DS.Spacing.xxl)
            .padding(.bottom, 60)
        }
    }

    // MARK: - Page 3: Ready

    private var readyPage: some View {
        VStack(spacing: DS.Spacing.xxl) {
            Spacer()

            VStack(spacing: DS.Spacing.lg) {
                Text("\u{1F3EF}")
                    .font(.system(size: 80))

                Text("Ready to Explore")
                    .font(.largeTitle.bold())
                    .foregroundStyle(Color.bodyText)
                    .multilineTextAlignment(.center)

                Text("Find shrines on the map, visit them in person, and build your stamp collection.")
                    .font(.body)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, DS.Spacing.xxl)
            }

            Spacer()

            Button {
                withAnimation {
                    hasCompletedOnboarding = true
                }
            } label: {
                Text("Start Exploring")
                    .vermillionButtonStyle()
            }
            .buttonStyle(.pressable)
            .padding(.horizontal, DS.Spacing.xxl)
            .padding(.bottom, 60)
        }
    }

    // MARK: - Page Indicator

    private var pageIndicator: some View {
        HStack(spacing: DS.Spacing.sm) {
            ForEach(0..<3, id: \.self) { index in
                Circle()
                    .fill(index == currentPage ? Color.vermillion : Color.placeholderIcon)
                    .frame(width: 8, height: 8)
                    .scaleEffect(index == currentPage ? 1.2 : 1.0)
                    .animation(.spring(duration: 0.3), value: currentPage)
            }
        }
    }
}

#Preview {
    OnboardingView()
}
