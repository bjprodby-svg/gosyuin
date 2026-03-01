import SwiftUI

struct SplashView: View {
    @State private var scale: CGFloat = 0.6
    @State private var opacity: Double = 0
    @State private var ringScale: CGFloat = 0.5
    @State private var ringOpacity: Double = 0

    var body: some View {
        ZStack {
            Color.pageBackground
                .ignoresSafeArea()

            VStack(spacing: DS.Spacing.lg) {
                ZStack {
                    // 朱色のリングエフェクト
                    Circle()
                        .strokeBorder(Color.vermillion.opacity(0.2), lineWidth: 2)
                        .frame(width: 120, height: 120)
                        .scaleEffect(ringScale)
                        .opacity(ringOpacity)

                    Text("\u{26E9}")
                        .font(.system(size: 72))
                        .scaleEffect(scale)
                }

                VStack(spacing: DS.Spacing.xs) {
                    Text("GosyuinMap")
                        .font(.title.bold())
                        .foregroundStyle(Color.vermillion)
                    Text("Shrine Stamp Collector")
                        .font(.subheadline)
                        .foregroundStyle(Color.bodyText)
                }
                .opacity(opacity)
            }
        }
        .task {
            withAnimation(.spring(duration: 0.6, bounce: 0.3)) {
                scale = 1.0
            }
            withAnimation(.easeOut(duration: 0.8)) {
                ringScale = 1.3
                ringOpacity = 1.0
            }
            withAnimation(.easeIn(duration: 0.4).delay(0.3)) {
                opacity = 1.0
            }
            withAnimation(.easeOut(duration: 0.6).delay(0.5)) {
                ringOpacity = 0
            }
        }
    }
}

#Preview {
    SplashView()
}
