import SwiftUI
import SwiftData

struct StampCollectionPrompt: View {
    let shrine: Shrine
    let onCollect: () -> Void
    let onDismiss: () -> Void

    @State private var collected = false
    @State private var ringScale: CGFloat = 0.8
    @State private var ringOpacity: Double = 0

    var body: some View {
        VStack(spacing: DS.Spacing.xxl) {
            Spacer()

            ZStack {
                Circle()
                    .stroke(Color.vermillion.opacity(0.3), lineWidth: 3)
                    .frame(width: 120, height: 120)
                    .scaleEffect(ringScale)
                    .opacity(ringOpacity)

                if collected {
                    Image(systemName: "checkmark.seal.fill")
                        .font(.system(size: 72))
                        .foregroundStyle(Color.vermillion)
                        .transition(.scale.combined(with: .opacity))
                } else {
                    Text("\u{26E9}")
                        .font(.system(size: 72))
                }
            }

            VStack(spacing: DS.Spacing.sm) {
                Text(collected ? "Stamp Collected!" : "You're at \(shrine.name)!")
                    .font(.title2.bold())
                    .foregroundStyle(Color.bodyText)
                    .multilineTextAlignment(.center)
                    .contentTransition(.numericText())

                Text(collected
                     ? "Check your Stamp Book to see it."
                     : "Collect your shrine stamp now.")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
            }

            Spacer()

            if collected {
                Button {
                    onDismiss()
                } label: {
                    Text("Done")
                        .vermillionButtonStyle()
                }
                .buttonStyle(.pressable)
                .transition(.move(edge: .bottom).combined(with: .opacity))
            } else {
                VStack(spacing: DS.Spacing.md) {
                    Button {
                        withAnimation(.spring(duration: 0.5, bounce: 0.3)) {
                            collected = true
                            ringScale = 1.4
                            ringOpacity = 1
                        }
                        withAnimation(.easeOut(duration: 0.8).delay(0.2)) {
                            ringOpacity = 0
                        }
                        onCollect()
                    } label: {
                        Text("Collect Stamp")
                            .vermillionButtonStyle()
                    }
                    .buttonStyle(.stamp)

                    Button {
                        onDismiss()
                    } label: {
                        Text("Not Now")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                }
            }
        }
        .padding(DS.Spacing.xxl)
        .sensoryFeedback(.success, trigger: collected)
    }
}

#Preview {
    StampCollectionPrompt(
        shrine: Shrine.samples[0],
        onCollect: {},
        onDismiss: {}
    )
}
