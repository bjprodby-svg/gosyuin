import SwiftUI

struct SplashView: View {
    @State private var scale: CGFloat = 0.6
    @State private var opacity: Double = 0

    var body: some View {
        ZStack {
            Color.pageBackground
                .ignoresSafeArea()

            VStack(spacing: 16) {
                Text("\u{26E9}")
                    .font(.system(size: 72))
                    .scaleEffect(scale)

                VStack(spacing: 4) {
                    Text("GosyuinMap")
                        .font(.title.bold())
                        .foregroundStyle(.vermillion)
                    Text("御朱印マップ")
                        .font(.subheadline)
                        .foregroundStyle(.bodyText)
                }
                .opacity(opacity)
            }
        }
        .onAppear {
            withAnimation(.spring(duration: 0.6, bounce: 0.3)) {
                scale = 1.0
            }
            withAnimation(.easeIn(duration: 0.4).delay(0.3)) {
                opacity = 1.0
            }
        }
    }
}

#Preview {
    SplashView()
}
