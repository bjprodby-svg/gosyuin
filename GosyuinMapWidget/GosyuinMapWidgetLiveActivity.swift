import ActivityKit
import WidgetKit
import SwiftUI

struct GosyuinMapWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: GosyuinActivityAttributes.self) { context in
            // Lock Screen / StandBy banner
            lockScreenView(context: context)
        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded
                DynamicIslandExpandedRegion(.leading) {
                    Image(systemName: "building.columns.fill")
                        .font(.title2)
                        .foregroundStyle(Color(red: 0.80, green: 0.15, blue: 0.15))
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text(context.state.startDate, style: .timer)
                        .font(.caption)
                        .foregroundStyle(.secondary)
                        .multilineTextAlignment(.trailing)
                }
                DynamicIslandExpandedRegion(.center) {
                    Text(context.state.templeName)
                        .font(.headline)
                        .lineLimit(1)
                }
                DynamicIslandExpandedRegion(.bottom) {
                    VStack(spacing: 8) {
                        stepProgressBar(currentStep: context.state.currentStep)
                        stepLabels(currentStep: context.state.currentStep)
                    }
                    .padding(.horizontal, 4)
                }
            } compactLeading: {
                Text("\u{26E9}")
                    .font(.caption)
            } compactTrailing: {
                Text(context.state.templeName)
                    .font(.caption2)
                    .lineLimit(1)
            } minimal: {
                Text("\u{26E9}")
                    .font(.caption)
            }
        }
    }

    // MARK: - Lock Screen View

    @ViewBuilder
    private func lockScreenView(context: ActivityViewContext<GosyuinActivityAttributes>) -> some View {
        VStack(spacing: 12) {
            HStack {
                Text("\u{26E9}")
                    .font(.title3)
                Text(context.state.templeName)
                    .font(.headline)
                Spacer()
                Text(context.state.startDate, style: .timer)
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }

            stepProgressBar(currentStep: context.state.currentStep)

            HStack(spacing: 0) {
                ForEach(WorshipStep.allCases, id: \.self) { step in
                    VStack(spacing: 2) {
                        Image(systemName: step.icon)
                            .font(.caption2)
                        Text(step.label)
                            .font(.caption2)
                    }
                    .foregroundStyle(
                        step.rawValue <= context.state.currentStep.rawValue
                            ? Color(red: 0.80, green: 0.15, blue: 0.15)
                            : .secondary
                    )
                    .frame(maxWidth: .infinity)
                }
            }
        }
        .padding()
    }

    // MARK: - Step Progress Bar

    private func stepProgressBar(currentStep: WorshipStep) -> some View {
        let progress = Double(currentStep.rawValue + 1) / Double(WorshipStep.allCases.count)
        return GeometryReader { geo in
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 3)
                    .fill(Color(.systemGray5))
                    .frame(height: 6)
                RoundedRectangle(cornerRadius: 3)
                    .fill(Color(red: 0.80, green: 0.15, blue: 0.15))
                    .frame(width: geo.size.width * progress, height: 6)
            }
        }
        .frame(height: 6)
    }

    // MARK: - Step Labels

    private func stepLabels(currentStep: WorshipStep) -> some View {
        HStack(spacing: 0) {
            ForEach(WorshipStep.allCases, id: \.self) { step in
                HStack(spacing: 2) {
                    Image(systemName: step.icon)
                        .font(.system(size: 10))
                    Text(step.label)
                        .font(.system(size: 10))
                }
                .foregroundStyle(
                    step.rawValue <= currentStep.rawValue
                        ? Color(red: 0.80, green: 0.15, blue: 0.15)
                        : .secondary
                )
                .frame(maxWidth: .infinity)
            }
        }
    }
}
