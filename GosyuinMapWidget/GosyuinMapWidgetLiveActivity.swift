import ActivityKit
import WidgetKit
import SwiftUI

struct GosyuinMapWidgetLiveActivity: Widget {
    private let vermillion = Color(red: 0.80, green: 0.15, blue: 0.15)

    var body: some WidgetConfiguration {
        ActivityConfiguration(for: GosyuinActivityAttributes.self) { context in
            lockScreenView(context: context)
        } dynamicIsland: { context in
            DynamicIsland {
                DynamicIslandExpandedRegion(.leading) {
                    if context.state.isCollected {
                        Image(systemName: "checkmark.seal.fill")
                            .font(.title2)
                            .foregroundStyle(vermillion)
                    } else {
                        Text("\u{26E9}")
                            .font(.title2)
                    }
                }
                DynamicIslandExpandedRegion(.trailing) {
                    if context.state.isCollected {
                        Text("Collected!")
                            .font(.caption.bold())
                            .foregroundStyle(vermillion)
                    } else {
                        Text("\(context.state.distance)m")
                            .font(.caption.bold())
                            .foregroundStyle(.secondary)
                    }
                }
                DynamicIslandExpandedRegion(.center) {
                    Text(context.state.shrineName)
                        .font(.headline)
                        .lineLimit(1)
                }
                DynamicIslandExpandedRegion(.bottom) {
                    if context.state.isCollected {
                        Text("Stamp added to your collection")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    } else {
                        Text("You're near this shrine")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                }
            } compactLeading: {
                Text("\u{26E9}")
                    .font(.caption)
            } compactTrailing: {
                if context.state.isCollected {
                    Image(systemName: "checkmark.seal.fill")
                        .font(.caption)
                        .foregroundStyle(vermillion)
                } else {
                    Text("\(context.state.distance)m")
                        .font(.caption2)
                }
            } minimal: {
                Text("\u{26E9}")
                    .font(.caption)
            }
        }
    }

    @ViewBuilder
    private func lockScreenView(context: ActivityViewContext<GosyuinActivityAttributes>) -> some View {
        HStack(spacing: 12) {
            if context.state.isCollected {
                Image(systemName: "checkmark.seal.fill")
                    .font(.title2)
                    .foregroundStyle(vermillion)
            } else {
                Text("\u{26E9}")
                    .font(.title2)
            }

            VStack(alignment: .leading, spacing: 2) {
                Text(context.state.shrineName)
                    .font(.headline)
                if context.state.isCollected {
                    Text("Stamp collected!")
                        .font(.caption)
                        .foregroundStyle(vermillion)
                } else {
                    Text("\(context.state.distance)m away")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            }

            Spacer()
        }
        .padding()
    }
}
