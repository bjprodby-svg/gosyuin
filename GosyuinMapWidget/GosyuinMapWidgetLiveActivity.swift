import ActivityKit
import WidgetKit
import SwiftUI

struct GosyuinMapWidgetLiveActivity: Widget {
    private let vermillion = Color(red: 0.80, green: 0.15, blue: 0.15)
    private let matcha = Color(red: 0.20, green: 0.55, blue: 0.30)

    var body: some WidgetConfiguration {
        ActivityConfiguration(for: GosyuinActivityAttributes.self) { context in
            if context.state.isNavigating {
                navigationLockScreen(context: context)
            } else {
                proximityLockScreen(context: context)
            }
        } dynamicIsland: { context in
            if context.state.isNavigating {
                navigationDynamicIsland(context: context)
            } else {
                proximityDynamicIsland(context: context)
            }
        }
    }

    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    // MARK: - Navigation Mode
    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

    @ViewBuilder
    private func navigationLockScreen(context: ActivityViewContext<GosyuinActivityAttributes>) -> some View {
        let arrived = context.state.distance < 100 && context.state.distance >= 0

        VStack(spacing: 8) {
            HStack(spacing: 12) {
                // Icon
                ZStack {
                    Circle()
                        .fill(arrived ? matcha : vermillion)
                        .frame(width: 40, height: 40)
                    if arrived {
                        Image(systemName: "checkmark")
                            .font(.body.bold())
                            .foregroundStyle(.white)
                    } else {
                        Image(systemName: "figure.walk")
                            .font(.body)
                            .foregroundStyle(.white)
                    }
                }

                VStack(alignment: .leading, spacing: 2) {
                    if arrived {
                        Text("You've arrived!")
                            .font(.headline)
                    } else {
                        Text(context.state.shrineName)
                            .font(.headline)
                            .lineLimit(1)
                    }

                    if arrived {
                        Text(context.state.shrineName)
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    } else {
                        HStack(spacing: 8) {
                            Text(formatDistance(context.state.distance))
                                .font(.caption.bold().monospacedDigit())
                            Text("·")
                                .foregroundStyle(.secondary)
                            Text("\(context.state.estimatedMinutes) min")
                                .font(.caption.monospacedDigit())
                                .foregroundStyle(.secondary)
                        }
                    }
                }

                Spacer()

                if !arrived {
                    Text("\u{26E9}")
                        .font(.title2)
                }
            }

            // Progress bar
            if !arrived {
                GeometryReader { geo in
                    ZStack(alignment: .leading) {
                        Capsule()
                            .fill(Color(.systemGray5))
                            .frame(height: 4)

                        Capsule()
                            .fill(vermillion)
                            .frame(width: max(8, geo.size.width * progressValue(context: context)), height: 4)
                    }
                }
                .frame(height: 4)
            }
        }
        .padding()
    }

    private func navigationDynamicIsland(context: ActivityViewContext<GosyuinActivityAttributes>) -> DynamicIsland {
        let arrived = context.state.distance < 100

        return DynamicIsland {
            DynamicIslandExpandedRegion(.leading) {
                if arrived {
                    Image(systemName: "checkmark.circle.fill")
                        .font(.title2)
                        .foregroundStyle(matcha)
                } else {
                    Image(systemName: "figure.walk")
                        .font(.title2)
                        .foregroundStyle(vermillion)
                }
            }
            DynamicIslandExpandedRegion(.trailing) {
                if arrived {
                    Text("Arrived!")
                        .font(.caption.bold())
                        .foregroundStyle(matcha)
                } else {
                    VStack(alignment: .trailing, spacing: 1) {
                        Text(formatDistance(context.state.distance))
                            .font(.caption.bold().monospacedDigit())
                        Text("\(context.state.estimatedMinutes) min")
                            .font(.caption2.monospacedDigit())
                            .foregroundStyle(.secondary)
                    }
                }
            }
            DynamicIslandExpandedRegion(.center) {
                Text(context.state.shrineName)
                    .font(.headline)
                    .lineLimit(1)
            }
            DynamicIslandExpandedRegion(.bottom) {
                if arrived {
                    Text("You've arrived at your destination")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                } else {
                    // Progress bar
                    GeometryReader { geo in
                        ZStack(alignment: .leading) {
                            Capsule()
                                .fill(Color(.systemGray5))
                                .frame(height: 3)
                            Capsule()
                                .fill(vermillion)
                                .frame(width: max(4, geo.size.width * progressValue(context: context)), height: 3)
                        }
                    }
                    .frame(height: 3)
                    .padding(.top, 4)
                }
            }
        } compactLeading: {
            if arrived {
                Image(systemName: "checkmark.circle.fill")
                    .font(.caption)
                    .foregroundStyle(matcha)
            } else {
                Image(systemName: "figure.walk")
                    .font(.caption)
                    .foregroundStyle(vermillion)
            }
        } compactTrailing: {
            if arrived {
                Text("Here!")
                    .font(.caption2.bold())
                    .foregroundStyle(matcha)
            } else {
                Text(formatDistance(context.state.distance))
                    .font(.caption2.bold().monospacedDigit())
            }
        } minimal: {
            Image(systemName: "figure.walk")
                .font(.caption)
                .foregroundStyle(vermillion)
        }
    }

    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    // MARK: - Proximity Mode (Original)
    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

    @ViewBuilder
    private func proximityLockScreen(context: ActivityViewContext<GosyuinActivityAttributes>) -> some View {
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

    private func proximityDynamicIsland(context: ActivityViewContext<GosyuinActivityAttributes>) -> DynamicIsland {
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

    // MARK: - Helpers

    private func formatDistance(_ meters: Int) -> String {
        if meters < 1000 {
            return "\(meters)m"
        } else {
            return String(format: "%.1fkm", Double(meters) / 1000)
        }
    }

    private func progressValue(context: ActivityViewContext<GosyuinActivityAttributes>) -> Double {
        // Estimate progress based on distance
        // Assume initial distance was about 2x current for simplicity
        let total = max(Double(context.state.distance) * 2, 500)
        return max(0.05, min(0.95, 1 - Double(context.state.distance) / total))
    }
}
