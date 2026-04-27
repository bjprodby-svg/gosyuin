import SwiftUI

// MARK: - Animation Sequence (async/await choreography)

@MainActor
enum AnimationSequence {
    static func step(
        _ animation: Animation = DS.Anim.collect,
        delay: Duration = .zero,
        body: @escaping () -> Void
    ) async {
        if delay > .zero {
            try? await Task.sleep(for: delay)
        }
        withAnimation(animation) {
            body()
        }
    }

    static func perform(
        delay: Duration = .zero,
        body: @escaping () -> Void
    ) async {
        if delay > .zero {
            try? await Task.sleep(for: delay)
        }
        body()
    }
}

// MARK: - Animated Counter

struct AnimatedCounter: View {
    let value: Int
    var font: SwiftUI.Font = DS.Font.statMedium
    var color: Color = .vermillion

    var body: some View {
        Text("\(value)")
            .font(font)
            .foregroundStyle(color)
            .contentTransition(.numericText())
            .animation(DS.Anim.collect, value: value)
    }
}

// MARK: - View Modifiers

struct AppearAnimationModifier: ViewModifier {
    let delay: Double
    @State private var appeared = false

    func body(content: Content) -> some View {
        content
            .opacity(appeared ? 1 : 0)
            .offset(y: appeared ? 0 : 16)
            .animation(DS.Anim.entrance.delay(delay), value: appeared)
            .onAppear { appeared = true }
    }
}

struct PopInModifier: ViewModifier {
    let delay: Double
    @State private var popped = false

    func body(content: Content) -> some View {
        content
            .scaleEffect(popped ? 1 : 0)
            .opacity(popped ? 1 : 0)
            .animation(DS.Anim.reveal.delay(delay), value: popped)
            .onAppear { popped = true }
    }
}

struct SlideUpModifier: ViewModifier {
    let delay: Double
    let offset: CGFloat
    @State private var appeared = false

    func body(content: Content) -> some View {
        content
            .opacity(appeared ? 1 : 0)
            .offset(y: appeared ? 0 : offset)
            .animation(DS.Anim.contentAppear.delay(delay), value: appeared)
            .onAppear { appeared = true }
    }
}

struct CelebrationPopModifier: ViewModifier {
    let color: Color
    @State private var fired = false

    func body(content: Content) -> some View {
        content
            .scaleEffect(fired ? 1.0 : 0.3)
            .opacity(fired ? 1 : 0)
            .background {
                Circle()
                    .stroke(color.opacity(0.3), lineWidth: 3)
                    .scaleEffect(fired ? 1.8 : 0.8)
                    .opacity(fired ? 0 : 1)
                    .animation(DS.Anim.ringFade, value: fired)
            }
            .animation(DS.Anim.celebration, value: fired)
            .onAppear { fired = true }
    }
}

struct PulseLoopModifier: ViewModifier {
    let scale: CGFloat
    @State private var pulsing = false

    func body(content: Content) -> some View {
        content
            .scaleEffect(pulsing ? scale : 1.0)
            .opacity(pulsing ? 0 : 0.6)
            .animation(DS.Anim.pulse, value: pulsing)
            .onAppear { pulsing = true }
    }
}

// MARK: - View Extensions

extension View {
    func appearAnimation(delay: Double = 0) -> some View {
        modifier(AppearAnimationModifier(delay: delay))
    }

    func popIn(delay: Double = 0) -> some View {
        modifier(PopInModifier(delay: delay))
    }

    func slideUp(delay: Double = 0, offset: CGFloat = 20) -> some View {
        modifier(SlideUpModifier(delay: delay, offset: offset))
    }

    func celebrationPop(color: Color = .vermillion) -> some View {
        modifier(CelebrationPopModifier(color: color))
    }

    func pulseLoop(scale: CGFloat = 1.3) -> some View {
        modifier(PulseLoopModifier(scale: scale))
    }
}
