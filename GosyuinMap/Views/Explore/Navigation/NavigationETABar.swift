import SwiftUI

struct NavigationETABar: View {
    let directionsService: DirectionsService
    let onEndNavigation: () -> Void

    var body: some View {
        VStack(spacing: DS.Spacing.md) {
            // Main row: distance + time + close button
            HStack {
                if directionsService.isArrived {
                    HStack(spacing: DS.Spacing.sm) {
                        Image(systemName: "checkmark.circle.fill")
                            .font(.title2)
                            .foregroundStyle(Color.matcha)
                        Text("You've arrived!")
                            .font(.title3.bold())
                    }
                } else {
                    VStack(alignment: .leading, spacing: 2) {
                        HStack(alignment: .firstTextBaseline, spacing: DS.Spacing.sm) {
                            Text(directionsService.formattedRemainingDistance)
                                .font(.title2.bold().monospacedDigit())
                            Text("\u{00B7}")
                                .font(.title3)
                                .foregroundStyle(Color.subtitleText)
                            Text("\(directionsService.remainingMinutes) min")
                                .font(.title3.monospacedDigit())
                                .foregroundStyle(Color.subtitleText)
                        }
                        Text("Arrive by \(directionsService.formattedETA)")
                            .font(.caption)
                            .foregroundStyle(Color.subtitleText)
                    }
                }

                Spacer()

                Button(action: onEndNavigation) {
                    Image(systemName: "xmark")
                        .font(.caption.weight(.semibold))
                        .foregroundStyle(Color.subtitleText)
                        .frame(width: 28, height: 28)
                        .background(Color(.systemGray5), in: Circle())
                }
            }

            // Progress bar
            if !directionsService.isArrived {
                ProgressBar(
                    progress: directionsService.progress,
                    color: .vermillion,
                    height: 5
                )
            }

            // Destination name row
            if let name = directionsService.destinationName {
                HStack(spacing: DS.Spacing.sm) {
                    IconBadge(icon: "building.columns.fill", size: 28, color: .vermillion)
                    Text(name)
                        .font(.subheadline.weight(.medium))
                        .lineLimit(1)
                    Spacer()
                    Image(systemName: "figure.walk")
                        .font(.caption)
                        .foregroundStyle(Color.subtitleText)
                }
            }
        }
        .padding(DS.Spacing.lg)
    }
}
