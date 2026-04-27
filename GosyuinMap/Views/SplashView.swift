import SwiftUI

struct SplashView: View {
    @State private var scale: CGFloat = 0.6
    @State private var opacity: Double = 0
    @State private var ringScale: CGFloat = 0.5
    @State private var ringOpacity: Double = 0
    @State private var innerRingScale: CGFloat = 0.6
    @State private var innerRingOpacity: Double = 0

    var body: some View {
        ZStack {
            Color.pageBackground
                .ignoresSafeArea()

            VStack(spacing: DS.Spacing.xl) {
                ZStack {
                    // Outer expanding ring
                    Circle()
                        .strokeBorder(Color.vermillion.opacity(0.15), lineWidth: 2)
                        .frame(width: 140, height: 140)
                        .scaleEffect(ringScale)
                        .opacity(ringOpacity)

                    // Inner accent ring
                    Circle()
                        .strokeBorder(Color.vermillion.opacity(0.25), lineWidth: 1.5)
                        .frame(width: 110, height: 110)
                        .scaleEffect(innerRingScale)
                        .opacity(innerRingOpacity)

                    // Torii gate icon via Canvas drawing
                    ZStack {
                        Circle()
                            .fill(Color.vermillion.opacity(0.08))
                            .frame(width: 88, height: 88)
                        CategoryIconView(
                            category: .jinja,
                            size: 48,
                            color: Color.vermillion
                        )
                    }
                    .scaleEffect(scale)
                }

                VStack(spacing: DS.Spacing.sm) {
                    Text("GosyuinMap")
                        .font(.title.bold())
                        .foregroundStyle(Color.vermillion)
                    Text("Shrine Stamp Collector")
                        .font(.subheadline)
                        .foregroundStyle(Color.subtitleText)
                }
                .opacity(opacity)
            }
        }
        .task {
            withAnimation(.spring(duration: 0.6, bounce: 0.3)) {
                scale = 1.0
            }
            withAnimation(.easeOut(duration: 0.8)) {
                ringScale = 1.4
                ringOpacity = 1.0
            }
            withAnimation(.easeOut(duration: 0.7).delay(0.1)) {
                innerRingScale = 1.2
                innerRingOpacity = 1.0
            }
            withAnimation(.easeIn(duration: 0.4).delay(0.3)) {
                opacity = 1.0
            }
            withAnimation(.easeOut(duration: 0.6).delay(0.5)) {
                ringOpacity = 0
                innerRingOpacity = 0
            }
        }
    }
}

#Preview {
    SplashView()
}
