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
                                .foregroundStyle(.secondary)
                            Text("\(directionsService.remainingMinutes) min")
                                .font(.title3.monospacedDigit())
                                .foregroundStyle(.secondary)
                        }
                        Text("Arrive by \(directionsService.formattedETA)")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                }

                Spacer()

                Button(action: onEndNavigation) {
                    Image(systemName: "xmark")
                        .font(.caption.weight(.semibold))
                        .foregroundStyle(.secondary)
                        .frame(width: 28, height: 28)
                        .background(Color(.systemGray5), in: Circle())
                }
            }

            // Progress bar
            if !directionsService.isArrived {
                GeometryReader { geo in
                    ZStack(alignment: .leading) {
                        Capsule()
                            .fill(Color(.systemGray5))
                            .frame(height: 5)
                        Capsule()
                            .fill(Color.vermillion)
                            .frame(
                                width: max(8, geo.size.width * directionsService.progress),
                                height: 5
                            )
                            .animation(.easeInOut(duration: 0.5), value: directionsService.progress)
                    }
                }
                .frame(height: 5)
            }

            // Destination name row
            if let name = directionsService.destinationName {
                HStack(spacing: DS.Spacing.sm) {
                    ZStack {
                        Circle()
                            .fill(Color.vermillion.opacity(0.12))
                            .frame(width: 28, height: 28)
                        Text("\u{26E9}")
                            .font(.system(size: 13))
                    }
                    Text(name)
                        .font(.subheadline.weight(.medium))
                        .lineLimit(1)
                    Spacer()
                    Image(systemName: "figure.walk")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            }
        }
        .padding(DS.Spacing.lg)
    }
}
