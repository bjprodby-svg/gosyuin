import SwiftUI

struct OnboardingView: View {
    @Binding var hasCompletedOnboarding: Bool
    @State private var currentPage = 0
    @State private var locationService = LocationService()

    var body: some View {
        ZStack {
            Color.pageBackground
                .ignoresSafeArea()

            TabView(selection: $currentPage) {
                discoverPage.tag(0)
                collectPage.tag(1)
                learnPage.tag(2)
                startPage.tag(3)
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .animation(.easeInOut(duration: 0.4), value: currentPage)

            VStack {
                Spacer()
                pageIndicator
                    .padding(.bottom, DS.Spacing.xxl)
            }
        }
    }

    // MARK: - Pages

    private var discoverPage: some View {
        OnboardingPage(
            onNext: { withAnimation { currentPage = 1 } }
        ) {
            DiscoverScene()
        } text: {
            OnboardingText(
                title: "Sacred Places, All Around You",
                subtitle: "Shrines and temples are hidden throughout your city — each one holding centuries of stories, waiting to be discovered."
            )
        }
    }

    private var collectPage: some View {
        OnboardingPage(
            onNext: { withAnimation { currentPage = 2 } }
        ) {
            CollectScene()
        } text: {
            OnboardingText(
                title: "Walk There, Earn a Stamp",
                subtitle: "Simply visit a shrine in person. When you arrive, a unique stamp is automatically added to your collection."
            )
        }
    }

    private var learnPage: some View {
        OnboardingPage(
            onNext: { withAnimation { currentPage = 3 } }
        ) {
            LearnScene()
        } text: {
            OnboardingText(
                title: "Fall in Love with Every Visit",
                subtitle: "Even if you\u{2019}ve never visited a shrine — discover what makes each one special, what to see, and why it matters."
            )
        }
    }

    private var startPage: some View {
        VStack(spacing: 0) {
            Spacer()

            VStack(spacing: DS.Spacing.xl) {
                StartScene()

                OnboardingText(
                    title: "Every Visit, a Memory",
                    subtitle: "Your journey starts here. Enable location to find sacred places near you and begin building your collection."
                )
            }

            Spacer()

            VStack(spacing: DS.Spacing.md) {
                if locationService.authorizationStatus == .authorizedWhenInUse
                    || locationService.authorizationStatus == .authorizedAlways
                {
                    Label("Location Enabled", systemImage: "checkmark.circle.fill")
                        .font(.headline)
                        .foregroundStyle(Color.matcha)
                        .transition(.scale.combined(with: .opacity))
                }

                Button {
                    if locationService.authorizationStatus == .notDetermined {
                        locationService.requestPermission()
                    }
                    withAnimation(.spring(duration: 0.5)) {
                        hasCompletedOnboarding = true
                    }
                } label: {
                    Text(
                        locationService.authorizationStatus == .notDetermined
                            ? "Enable Location & Start"
                            : "Start Exploring"
                    )
                    .vermillionButtonStyle()
                }
                .buttonStyle(.pressable)

                if locationService.authorizationStatus == .notDetermined {
                    Button {
                        withAnimation(.spring(duration: 0.5)) {
                            hasCompletedOnboarding = true
                        }
                    } label: {
                        Text("Skip for Now")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                }
            }
            .padding(.horizontal, DS.Spacing.xxl)
            .padding(.bottom, 80)
        }
    }

    // MARK: - Page Indicator

    private var pageIndicator: some View {
        HStack(spacing: DS.Spacing.sm) {
            ForEach(0..<4, id: \.self) { index in
                Capsule()
                    .fill(index == currentPage ? Color.vermillion : Color.placeholderIcon)
                    .frame(width: index == currentPage ? 24 : 8, height: 8)
                    .animation(.spring(duration: 0.3), value: currentPage)
            }
        }
    }
}

// MARK: - Shared Components

private struct OnboardingText: View {
    let title: String
    let subtitle: String

    var body: some View {
        VStack(spacing: DS.Spacing.md) {
            Text(title)
                .font(.title2.bold())
                .multilineTextAlignment(.center)

            Text(subtitle)
                .font(.body)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal, DS.Spacing.xl)
        }
    }
}

private struct OnboardingPage<Animation: View, Text: View>: View {
    let onNext: () -> Void
    @ViewBuilder let animation: () -> Animation
    @ViewBuilder let text: () -> Text

    var body: some View {
        VStack(spacing: 0) {
            Spacer()
            VStack(spacing: DS.Spacing.xl) {
                animation()
                text()
            }
            Spacer()
            Button(action: onNext) {
                SwiftUI.Text("Next")
                    .vermillionButtonStyle()
            }
            .buttonStyle(.pressable)
            .padding(.horizontal, DS.Spacing.xxl)
            .padding(.bottom, 80)
        }
    }
}

// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
// MARK: - Scene 1: Discover
// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
//
// Illustrated landscape with rolling hills, scattered trees,
// and shrine pins "discovered" by a radar sweep from the user's
// location. Micro-story: "Look — there are sacred places all
// around you, and some are really close."

private struct DiscoverScene: View {
    @State private var appeared = false
    @State private var radarPulse = false
    @State private var nearbyGlow = false

    private let shrines: [(x: CGFloat, y: CGFloat, delay: Double, size: CGFloat, emoji: String)] = [
        (0, -20, 0.1, 48, "\u{26E9}"),     // center — nearest
        (-80, -60, 0.35, 34, "\u{26E9}"),
        (75, -50, 0.50, 34, "\u{1F3EF}"),
        (-55, 40, 0.65, 28, "\u{26E9}"),
        (85, 30, 0.80, 28, "\u{26E9}"),
    ]

    var body: some View {
        ZStack {
            // ── Background: sky ──
            RoundedRectangle(cornerRadius: 24)
                .fill(
                    LinearGradient(
                        colors: [
                            Color(red: 0.93, green: 0.96, blue: 0.98),
                            Color.pageBackground,
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .frame(width: 320, height: 320)
                .opacity(appeared ? 1 : 0)
                .animation(.easeIn(duration: 0.4), value: appeared)

            // ── Background: rolling hills ──
            hillLayer(width: 340, height: 70, yOffset: 85, color: Color.matcha.opacity(0.08))
            hillLayer(width: 280, height: 55, yOffset: 95, color: Color.matcha.opacity(0.06))
            hillLayer(width: 320, height: 45, yOffset: 110, color: Color.matcha.opacity(0.04))

            // ── Decorative trees & buildings ──
            decorativeElements

            // ── Radar pulse ──
            ForEach(0..<3, id: \.self) { i in
                Circle()
                    .stroke(
                        Color.vermillion.opacity([0.15, 0.10, 0.06][i]),
                        lineWidth: [2.0, 1.5, 1.0][i]
                    )
                    .frame(width: [180, 230, 280][i], height: [180, 230, 280][i])
                    .scaleEffect(radarPulse ? [1.3, 1.35, 1.4][i] : 0.8)
                    .opacity(radarPulse ? 0 : [0.6, 0.4, 0.25][i])
                    .animation(
                        .easeOut(duration: 2.5)
                            .repeatForever(autoreverses: false)
                            .delay(Double(i) * 0.4),
                        value: radarPulse
                    )
            }

            // ── "Nearby" range dashed circle ──
            Circle()
                .strokeBorder(
                    Color.vermillion.opacity(0.2),
                    style: StrokeStyle(lineWidth: 1, dash: [6, 4])
                )
                .frame(width: 140, height: 140)
                .opacity(appeared ? 1 : 0)
                .animation(.easeIn(duration: 0.5).delay(0.8), value: appeared)

            // ── Shrine pins ──
            ForEach(0..<shrines.count, id: \.self) { i in
                let s = shrines[i]
                shrinePin(index: i, shrine: s)
                    .offset(x: s.x, y: s.y)
                    .scaleEffect(appeared ? 1 : 0)
                    .opacity(appeared ? 1 : 0)
                    .animation(
                        .spring(duration: 0.6, bounce: 0.4).delay(s.delay),
                        value: appeared
                    )
            }

            // ── Distance label on second pin ──
            Text("350m")
                .font(.system(size: 9, weight: .medium, design: .rounded))
                .foregroundStyle(.secondary)
                .padding(.horizontal, 5)
                .padding(.vertical, 2)
                .background(Color.cardBackground.opacity(0.9), in: Capsule())
                .offset(x: shrines[1].x, y: shrines[1].y + 24)
                .opacity(appeared ? 1 : 0)
                .animation(.easeIn(duration: 0.3).delay(0.65), value: appeared)

            // ── User location dot ──
            ZStack {
                Circle()
                    .fill(.blue.opacity(0.15))
                    .frame(width: 28, height: 28)
                Circle()
                    .fill(.blue)
                    .frame(width: 14, height: 14)
                Circle()
                    .stroke(.white, lineWidth: 3)
                    .frame(width: 14, height: 14)
            }
            .shadow(color: .blue.opacity(0.3), radius: 4)
            .offset(x: -20, y: 20)
        }
        .frame(height: 340)
        .task {
            appeared = true
            radarPulse = true
            try? await Task.sleep(for: .seconds(1.2))
            nearbyGlow = true
        }
    }

    private func hillLayer(width: CGFloat, height: CGFloat, yOffset: CGFloat, color: Color) -> some View {
        Ellipse()
            .fill(color)
            .frame(width: width, height: height)
            .offset(y: yOffset)
            .opacity(appeared ? 1 : 0)
            .animation(.easeIn(duration: 0.5).delay(0.1), value: appeared)
    }

    private var decorativeElements: some View {
        Group {
            // Trees
            Image(systemName: "tree.fill")
                .font(.system(size: 16))
                .foregroundStyle(Color.matcha.opacity(0.18))
                .offset(x: -110, y: -30)

            Image(systemName: "tree.fill")
                .font(.system(size: 13))
                .foregroundStyle(Color.matcha.opacity(0.14))
                .offset(x: 105, y: 50)

            Image(systemName: "tree.fill")
                .font(.system(size: 10))
                .foregroundStyle(Color.matcha.opacity(0.10))
                .offset(x: -100, y: 70)

            // Buildings
            Image(systemName: "building.2.fill")
                .font(.system(size: 11))
                .foregroundStyle(Color(.systemGray4).opacity(0.2))
                .offset(x: 100, y: -70)

            // Cloud
            Image(systemName: "cloud.fill")
                .font(.system(size: 14))
                .foregroundStyle(Color(.systemGray5).opacity(0.4))
                .offset(x: -70, y: -120)

            Image(systemName: "cloud.fill")
                .font(.system(size: 10))
                .foregroundStyle(Color(.systemGray5).opacity(0.3))
                .offset(x: 80, y: -110)
        }
        .opacity(appeared ? 1 : 0)
        .animation(.easeIn(duration: 0.6).delay(0.2), value: appeared)
    }

    @ViewBuilder
    private func shrinePin(index: Int, shrine: (x: CGFloat, y: CGFloat, delay: Double, size: CGFloat, emoji: String)) -> some View {
        if index == 0 {
            // ── Nearest shrine: badge style with distance ──
            ZStack {
                // Glow pulse
                RoundedRectangle(cornerRadius: DS.Radius.md)
                    .fill(Color.vermillion.opacity(0.15))
                    .frame(width: shrine.size + 30, height: shrine.size + 6)
                    .scaleEffect(nearbyGlow ? 1.15 : 0.95)
                    .opacity(nearbyGlow ? 0 : 0.8)
                    .animation(
                        .easeOut(duration: 1.5).repeatForever(autoreverses: false),
                        value: nearbyGlow
                    )

                RoundedRectangle(cornerRadius: DS.Radius.md)
                    .fill(Color.vermillion)
                    .frame(width: shrine.size + 24, height: shrine.size)
                    .shadow(color: Color.vermillion.opacity(0.3), radius: 6, y: 3)

                HStack(spacing: 4) {
                    Text(shrine.emoji)
                        .font(.system(size: 22))
                    Text("120m")
                        .font(.system(size: 11, weight: .bold, design: .rounded))
                        .foregroundStyle(.white)
                }
            }
        } else {
            // ── Standard circle pin ──
            ZStack {
                Circle()
                    .fill(Color(.label))
                    .frame(width: shrine.size, height: shrine.size)
                    .shadow(color: .black.opacity(0.15), radius: 4, y: 2)
                Text(shrine.emoji)
                    .font(.system(size: index <= 2 ? 15 : 12))
            }
        }
    }
}

// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
// MARK: - Scene 2: Collect
// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
//
// A journey illustration: a winding path through gentle hills
// leads from the user to a shrine. The user walks the path,
// arrives, and a stamp drops into the stamp book with celebration.
// Micro-story: "Your feet take you there → stamp is yours."

private struct CollectScene: View {
    @State private var phase = 0

    private let confetti: [(x: CGFloat, y: CGFloat, size: CGFloat, colorIdx: Int)] = [
        (-50, -45, 5, 0), (35, -50, 6, 1), (-20, -55, 4, 2), (50, -30, 5, 3),
        (-40, -25, 6, 0), (25, -58, 4, 1), (55, -15, 5, 2), (-35, -38, 4, 3),
    ]
    private let confettiColors: [Color] = [.vermillion, .kincha, .matcha, .indigo]

    var body: some View {
        VStack(spacing: 16) {
            // ── Journey scene ──
            ZStack {
                // Sky + ground
                RoundedRectangle(cornerRadius: 20)
                    .fill(
                        LinearGradient(
                            colors: [
                                Color(red: 0.95, green: 0.93, blue: 0.88),
                                Color(red: 0.92, green: 0.95, blue: 0.90),
                            ],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                    .frame(width: 300, height: 140)

                // Ground hills
                Ellipse()
                    .fill(Color.matcha.opacity(0.10))
                    .frame(width: 340, height: 50)
                    .offset(y: 50)
                Ellipse()
                    .fill(Color.matcha.opacity(0.06))
                    .frame(width: 260, height: 35)
                    .offset(y: 58)

                // Trees along the path
                Image(systemName: "tree.fill")
                    .font(.system(size: 14))
                    .foregroundStyle(Color.matcha.opacity(0.20))
                    .offset(x: -40, y: -15)
                Image(systemName: "tree.fill")
                    .font(.system(size: 11))
                    .foregroundStyle(Color.matcha.opacity(0.15))
                    .offset(x: 30, y: -25)
                Image(systemName: "tree.fill")
                    .font(.system(size: 9))
                    .foregroundStyle(Color.matcha.opacity(0.12))
                    .offset(x: -80, y: 10)

                // Curved walking path
                WalkPath()
                    .stroke(
                        Color.kincha.opacity(0.25),
                        style: StrokeStyle(lineWidth: 2, dash: [8, 5])
                    )
                    .frame(width: 220, height: 40)
                    .offset(y: 10)

                // Shrine (destination)
                ZStack {
                    Circle()
                        .fill(Color(.label))
                        .frame(width: 44, height: 44)
                        .shadow(color: .black.opacity(0.15), radius: 4, y: 3)
                    Text("\u{26E9}")
                        .font(.system(size: 20))
                }
                .offset(x: 90, y: 5)

                // Arrival ripples
                ForEach(0..<2, id: \.self) { i in
                    Circle()
                        .stroke(Color.vermillion.opacity(0.4), lineWidth: 1.5)
                        .frame(width: 44, height: 44)
                        .scaleEffect(phase >= 2 ? 2.2 + CGFloat(i) * 0.5 : 1.0)
                        .opacity(phase >= 2 ? 0 : 0.6)
                        .offset(x: 90, y: 5)
                        .animation(
                            .easeOut(duration: 0.8).delay(Double(i) * 0.1),
                            value: phase
                        )
                }

                // Confetti burst
                ForEach(0..<confetti.count, id: \.self) { i in
                    let c = confetti[i]
                    Circle()
                        .fill(confettiColors[c.colorIdx])
                        .frame(width: c.size, height: c.size)
                        .offset(x: phase >= 3 ? c.x : 0, y: phase >= 3 ? c.y : 0)
                        .opacity(phase >= 3 ? 0 : 0.8)
                        .animation(
                            .easeOut(duration: 0.9).delay(Double(i) * 0.03),
                            value: phase
                        )
                }

                // Walking user dot
                ZStack {
                    Circle().fill(.blue).frame(width: 14, height: 14)
                    Circle().stroke(.white, lineWidth: 2.5).frame(width: 14, height: 14)
                }
                .shadow(color: .blue.opacity(0.3), radius: 3)
                .offset(x: phase >= 1 ? 65 : -100, y: 10)
                .opacity(phase >= 2 ? 0 : 1)
            }
            .frame(height: 140)
            .clipShape(RoundedRectangle(cornerRadius: 20))

            // ── Stamp Book ──
            VStack(spacing: 6) {
                Text("STAMP BOOK")
                    .font(.system(size: 9, weight: .semibold, design: .rounded))
                    .foregroundStyle(.secondary)
                    .tracking(2)

                ZStack {
                    RoundedRectangle(cornerRadius: 14)
                        .fill(Color.cardBackground)
                        .frame(width: 280, height: 84)
                        .shadow(color: .black.opacity(0.06), radius: 4, y: 2)
                        .overlay(
                            RoundedRectangle(cornerRadius: 14)
                                .strokeBorder(Color.vermillion.opacity(0.12), lineWidth: 1)
                        )

                    HStack(spacing: 8) {
                        stampSlot(filled: phase >= 3, symbol: "\u{26E9}", isHexagon: true)
                        stampSlot(filled: false, symbol: "?", isHexagon: false)
                        stampSlot(filled: false, symbol: "?", isHexagon: true)
                        stampSlot(filled: false, symbol: "?", isHexagon: false)
                        stampSlot(filled: false, symbol: "?", isHexagon: true)
                    }
                }
            }

            // "Collected!" badge
            Group {
                if phase >= 4 {
                    Label("Collected!", systemImage: "checkmark.seal.fill")
                        .font(.caption.bold())
                        .foregroundStyle(Color.vermillion)
                        .padding(.horizontal, DS.Spacing.md)
                        .padding(.vertical, 6)
                        .background(Color.vermillion.opacity(0.1), in: Capsule())
                        .transition(.scale.combined(with: .opacity))
                }
            }
            .frame(height: 26)
        }
        .frame(height: 340)
        .task {
            try? await Task.sleep(for: .seconds(0.5))
            withAnimation(.easeInOut(duration: 1.2)) { phase = 1 }

            try? await Task.sleep(for: .seconds(1.4))
            withAnimation(.spring(duration: 0.3)) { phase = 2 }

            try? await Task.sleep(for: .seconds(0.5))
            withAnimation(.spring(duration: 0.5, bounce: 0.5)) { phase = 3 }

            try? await Task.sleep(for: .seconds(0.5))
            withAnimation(.spring(duration: 0.3)) { phase = 4 }
        }
    }

    @ViewBuilder
    private func stampSlot(filled: Bool, symbol: String, isHexagon: Bool) -> some View {
        ZStack {
            if isHexagon {
                HexagonShape()
                    .fill(filled ? Color.vermillion.opacity(0.1) : Color(.systemGray6))
                    .frame(width: 44, height: 44)
                if filled {
                    HexagonShape()
                        .stroke(Color.vermillion.opacity(0.5), lineWidth: 1.5)
                        .frame(width: 44, height: 44)
                } else {
                    HexagonShape()
                        .stroke(
                            Color(.systemGray4).opacity(0.4),
                            style: StrokeStyle(lineWidth: 1, dash: [3, 3])
                        )
                        .frame(width: 44, height: 44)
                }
            } else {
                Circle()
                    .fill(filled ? Color.vermillion.opacity(0.1) : Color(.systemGray6))
                    .frame(width: 44, height: 44)
                if filled {
                    Circle()
                        .strokeBorder(Color.vermillion.opacity(0.5), lineWidth: 1.5)
                        .frame(width: 44, height: 44)
                } else {
                    Circle()
                        .strokeBorder(
                            Color(.systemGray4).opacity(0.4),
                            style: StrokeStyle(lineWidth: 1, dash: [3, 3])
                        )
                        .frame(width: 44, height: 44)
                }
            }

            Text(symbol)
                .font(.system(size: filled ? 20 : 14))
                .foregroundStyle(filled ? Color.vermillion : Color(.systemGray4))
                .scaleEffect(filled ? 1.0 : 0.8)
                .animation(.spring(duration: 0.4, bounce: 0.5), value: filled)
        }
    }
}

/// Curved walking path
private struct WalkPath: Shape {
    func path(in rect: CGRect) -> Path {
        Path { p in
            p.move(to: CGPoint(x: rect.minX, y: rect.midY + 10))
            p.addQuadCurve(
                to: CGPoint(x: rect.maxX, y: rect.midY - 5),
                control: CGPoint(x: rect.midX, y: rect.midY - 25)
            )
        }
    }
}

// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
// MARK: - Scene 3: Learn
// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
//
// A "travel guide" card that progressively reveals content,
// showing how the app turns strangers into fans. Stacked cards
// behind give a "deck of knowledge" feel. A mini phone frame
// makes it feel like a real app preview.
// Micro-story: "Know nothing → read → discover highlights → love it."

private struct LearnScene: View {
    @State private var appeared = false
    @State private var phase = 0

    var body: some View {
        ZStack {
            // ── Background depth cards (magazine stack feel) ──
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.cardBackground)
                .frame(width: 250, height: 200)
                .shadow(color: .black.opacity(0.03), radius: 3, y: 1)
                .rotationEffect(.degrees(3))
                .offset(x: 8, y: 14)
                .opacity(appeared ? 0.4 : 0)
                .animation(.easeIn(duration: 0.4).delay(0.1), value: appeared)

            RoundedRectangle(cornerRadius: 16)
                .fill(Color.cardBackground)
                .frame(width: 270, height: 215)
                .shadow(color: .black.opacity(0.04), radius: 4, y: 2)
                .rotationEffect(.degrees(-2.5))
                .offset(x: -6, y: 10)
                .opacity(appeared ? 0.6 : 0)
                .animation(.easeIn(duration: 0.4).delay(0.05), value: appeared)

            // ── Main card ──
            VStack(spacing: 0) {
                // Mini phone status bar
                HStack {
                    Circle().fill(Color(.systemGray5)).frame(width: 5, height: 5)
                    Spacer()
                    RoundedRectangle(cornerRadius: 2)
                        .fill(Color(.systemGray5))
                        .frame(width: 36, height: 4)
                    Spacer()
                    Circle().fill(Color(.systemGray5)).frame(width: 5, height: 5)
                }
                .padding(.horizontal, DS.Spacing.md)
                .padding(.top, 8)
                .padding(.bottom, 4)

                Divider().padding(.horizontal, 8)

                // Card content with progressive phases
                VStack(alignment: .leading, spacing: 9) {
                    // Phase 1: Hero photo placeholder
                    if phase >= 1 {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(
                                LinearGradient(
                                    colors: [Color.vermillion.opacity(0.15), Color.kincha.opacity(0.12)],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .frame(height: 60)
                            .overlay {
                                HStack {
                                    VStack(alignment: .leading, spacing: 2) {
                                        Text("Meiji Jingu")
                                            .font(.system(size: 14, weight: .bold))
                                        HStack(spacing: 3) {
                                            Image(systemName: "building.columns")
                                                .font(.system(size: 8))
                                                .foregroundStyle(.white)
                                                .padding(3)
                                                .background(Color.vermillion, in: RoundedRectangle(cornerRadius: 3))
                                            Text("Shrine")
                                                .font(.system(size: 9, weight: .medium))
                                                .foregroundStyle(.secondary)
                                        }
                                    }
                                    Spacer()
                                    Text("\u{26E9}")
                                        .font(.system(size: 28))
                                        .opacity(0.3)
                                }
                                .padding(.horizontal, 10)
                            }
                            .transition(.move(edge: .top).combined(with: .opacity))
                    }

                    // Phase 2: Description
                    if phase >= 2 {
                        Text("A tranquil forest sanctuary where 100-year-old trees line the path to Japan\u{2019}s most visited shrine\u{2026}")
                            .font(.system(size: 10))
                            .foregroundStyle(.secondary)
                            .lineSpacing(2)
                            .lineLimit(3)
                            .transition(.opacity)
                    }

                    // Phase 3: "Must See" highlight
                    if phase >= 3 {
                        HStack(spacing: 5) {
                            Image(systemName: "eye.fill")
                                .font(.system(size: 8))
                                .foregroundStyle(.white)
                                .padding(3)
                                .background(Color.vermillion, in: Circle())
                            Text("12m cypress torii gate")
                                .font(.system(size: 10, weight: .semibold))
                                .foregroundStyle(Color.vermillion)
                        }
                        .padding(.horizontal, 8)
                        .padding(.vertical, 5)
                        .background(Color.vermillion.opacity(0.06), in: RoundedRectangle(cornerRadius: 6))
                        .transition(.move(edge: .trailing).combined(with: .opacity))
                    }

                    // Phase 4: Heart
                    if phase >= 4 {
                        HStack(spacing: 4) {
                            Image(systemName: "heart.fill")
                                .font(.system(size: 10))
                                .foregroundStyle(Color.vermillion)
                            Text("I want to visit!")
                                .font(.system(size: 10, weight: .medium))
                                .foregroundStyle(Color.vermillion.opacity(0.8))
                        }
                        .transition(.scale.combined(with: .opacity))
                    }
                }
                .padding(DS.Spacing.md)

                Spacer(minLength: 0)
            }
            .frame(width: 290, height: 250)
            .background(Color.cardBackground, in: RoundedRectangle(cornerRadius: 16))
            .shadow(color: .black.opacity(0.08), radius: 8, y: 4)
            .opacity(appeared ? 1 : 0)
            .animation(.easeIn(duration: 0.3), value: appeared)
        }
        .frame(height: 340)
        .task {
            appeared = true

            try? await Task.sleep(for: .seconds(0.4))
            withAnimation(.spring(duration: 0.5)) { phase = 1 }

            try? await Task.sleep(for: .seconds(0.6))
            withAnimation(.spring(duration: 0.4)) { phase = 2 }

            try? await Task.sleep(for: .seconds(0.7))
            withAnimation(.spring(duration: 0.5, bounce: 0.3)) { phase = 3 }

            try? await Task.sleep(for: .seconds(0.8))
            withAnimation(.spring(duration: 0.6, bounce: 0.4)) { phase = 4 }
        }
    }
}

// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
// MARK: - Scene 4: Start
// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
//
// A dramatic gateway scene. A large torii gate rises against
// a warm sunrise glow, with mountains behind, cherry blossom
// petals floating, and a path of light leading through.
// Emotional climax: "The gate is open — your journey begins."

private struct StartScene: View {
    @State private var appeared = false
    @State private var sparkle = false

    private let petals: [(x: CGFloat, y: CGFloat, size: CGFloat, dur: Double)] = [
        (-65, -70, 6, 2.8), (70, -75, 5, 3.2),
        (-40, 15, 7, 2.5), (90, 5, 4, 3.0),
        (-85, 50, 5, 3.4), (50, 65, 4, 2.9),
        (-100, -20, 5, 3.1), (105, -40, 6, 2.7),
        (-25, 80, 4, 3.3), (60, -90, 5, 2.6),
    ]

    var body: some View {
        ZStack {
            // ── Warm sunrise glow ──
            Circle()
                .fill(
                    RadialGradient(
                        colors: [
                            Color(red: 1.0, green: 0.92, blue: 0.80).opacity(0.4),
                            Color.vermillion.opacity(0.10),
                            Color.vermillion.opacity(0.03),
                            Color.clear,
                        ],
                        center: .center,
                        startRadius: 10,
                        endRadius: 170
                    )
                )
                .frame(width: 340, height: 340)
                .scaleEffect(appeared ? 1.0 : 0.3)
                .opacity(appeared ? 1 : 0)
                .animation(.easeOut(duration: 1.2), value: appeared)

            // ── Mountain silhouettes ──
            ZStack {
                // Far mountain
                MountainShape()
                    .fill(Color.matcha.opacity(0.07))
                    .frame(width: 300, height: 80)
                    .offset(y: 50)
                // Near hill
                Ellipse()
                    .fill(Color.matcha.opacity(0.05))
                    .frame(width: 220, height: 45)
                    .offset(y: 72)
            }
            .opacity(appeared ? 1 : 0)
            .animation(.easeIn(duration: 0.8).delay(0.2), value: appeared)

            // ── Light path through the gate ──
            GatePath()
                .fill(
                    LinearGradient(
                        colors: [
                            Color(red: 1.0, green: 0.92, blue: 0.80).opacity(0.15),
                            Color.clear,
                        ],
                        startPoint: .bottom,
                        endPoint: .top
                    )
                )
                .frame(width: 120, height: 90)
                .offset(y: 55)
                .opacity(appeared ? 1 : 0)
                .animation(.easeIn(duration: 0.6).delay(0.4), value: appeared)

            // ── Cherry blossom petals ──
            ForEach(0..<petals.count, id: \.self) { i in
                let p = petals[i]
                Circle()
                    .fill(Color(red: 1.0, green: 0.78, blue: 0.84).opacity(0.5))
                    .frame(width: p.size, height: p.size)
                    .offset(x: p.x, y: p.y + (sparkle ? 12 : -12))
                    .opacity(appeared ? 0.6 : 0)
                    .animation(.easeIn(duration: 0.8).delay(0.6), value: appeared)
                    .animation(
                        .easeInOut(duration: p.dur)
                            .repeatForever(autoreverses: true)
                            .delay(Double(i) * 0.2),
                        value: sparkle
                    )
            }

            // ── Torii gate ──
            Text("\u{26E9}")
                .font(.system(size: 140))
                .offset(y: appeared ? 0 : 25)
                .scaleEffect(appeared ? 1.0 : 0.35)
                .opacity(appeared ? 1 : 0)
                .animation(.spring(duration: 0.9, bounce: 0.25), value: appeared)

            // ── Orbiting sparkles ──
            ForEach(0..<8, id: \.self) { i in
                Image(systemName: "sparkle")
                    .font(.system(size: [15, 10, 13, 8, 12, 9, 11, 7][i]))
                    .foregroundStyle(Color.vermillion.opacity(0.45))
                    .offset(
                        x: cos(Double(i) * .pi / 4) * (sparkle ? 115 : 65),
                        y: sin(Double(i) * .pi / 4) * (sparkle ? 115 : 65)
                    )
                    .opacity(sparkle ? 0.7 : 0)
                    .scaleEffect(sparkle ? 1.0 : 0.3)
                    .animation(
                        .easeInOut(duration: 1.8)
                            .repeatForever(autoreverses: true)
                            .delay(Double(i) * 0.15),
                        value: sparkle
                    )
            }
        }
        .frame(height: 340)
        .task {
            appeared = true
            try? await Task.sleep(for: .seconds(0.6))
            sparkle = true
        }
    }
}

/// Triangle-ish mountain silhouette
private struct MountainShape: Shape {
    func path(in rect: CGRect) -> Path {
        Path { p in
            p.move(to: CGPoint(x: rect.minX, y: rect.maxY))
            p.addLine(to: CGPoint(x: rect.width * 0.25, y: rect.minY + rect.height * 0.3))
            p.addQuadCurve(
                to: CGPoint(x: rect.width * 0.45, y: rect.minY),
                control: CGPoint(x: rect.width * 0.35, y: rect.minY + rect.height * 0.1)
            )
            p.addQuadCurve(
                to: CGPoint(x: rect.width * 0.65, y: rect.minY + rect.height * 0.2),
                control: CGPoint(x: rect.width * 0.55, y: rect.minY)
            )
            p.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            p.closeSubpath()
        }
    }
}

/// Trapezoidal light path through gate
private struct GatePath: Shape {
    func path(in rect: CGRect) -> Path {
        Path { p in
            p.move(to: CGPoint(x: rect.midX - 18, y: rect.minY))
            p.addLine(to: CGPoint(x: rect.midX + 18, y: rect.minY))
            p.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            p.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            p.closeSubpath()
        }
    }
}

#Preview {
    OnboardingView(hasCompletedOnboarding: .constant(false))
}
