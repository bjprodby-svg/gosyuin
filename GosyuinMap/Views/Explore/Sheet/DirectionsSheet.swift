import SwiftUI
import MapKit

/// Apple Maps-style directions view shown inline in the detail sheet.
struct DirectionsSheet: View {
    @Bindable var directionsService: DirectionsService
    let userLocation: CLLocation?
    let onStartNavigation: () -> Void
    let onDismiss: () -> Void

    private var availableModes: [TransportMode] { [.walking, .transit] }

    private var selectedOption: RouteOption? {
        directionsService.routeOptions.first(where: { $0.mode == directionsService.selectedTransportMode })
    }

    private var transitUnavailable: Bool {
        directionsService.selectedTransportMode == .transit &&
        (selectedOption == nil || selectedOption?.route == nil)
    }

    var body: some View {
        VStack(spacing: 0) {
            // Top bar: close + destination
            topBar
            Divider()

            if directionsService.isCalculating {
                Spacer()
                ProgressView()
                    .padding()
                Spacer()
            } else {
                ScrollView {
                    VStack(spacing: DS.Spacing.lg) {
                        // Transport mode selector
                        transportSelector
                            .padding(.top, DS.Spacing.md)

                        // Go button (Apple Maps: big green button)
                        goButton

                        // Route summary
                        if !transitUnavailable, let option = selectedOption, option.route != nil {
                            routeDetails(option)
                        }

                        // Transit fallback
                        if transitUnavailable {
                            transitFallback
                        }
                    }
                    .padding(.horizontal, DS.Spacing.lg)
                    .padding(.bottom, DS.Spacing.xxl)
                }
            }
        }
    }

    // MARK: - Top Bar

    private var topBar: some View {
        HStack {
            Button(action: onDismiss) {
                Image(systemName: "chevron.left")
                    .font(.body.weight(.semibold))
                    .foregroundStyle(.blue)
            }
            Spacer()
            if let name = directionsService.destinationName {
                Text(name)
                    .font(.subheadline.weight(.semibold))
                    .lineLimit(1)
            }
            Spacer()
            // Balance the back button
            Image(systemName: "chevron.left")
                .font(.body.weight(.semibold))
                .foregroundStyle(.clear)
        }
        .padding(.horizontal, DS.Spacing.lg)
        .padding(.vertical, DS.Spacing.md)
    }

    // MARK: - Transport Mode Selector (Apple Maps style pill tabs)

    private var transportSelector: some View {
        HStack(spacing: 0) {
            ForEach(availableModes) { mode in
                let option = directionsService.routeOptions.first { $0.mode == mode }
                let hasRoute = option?.route != nil
                let isSelected = directionsService.selectedTransportMode == mode

                Button {
                    withAnimation(.spring(duration: 0.2, bounce: 0)) {
                        directionsService.selectPreviewRoute(mode: mode)
                    }
                } label: {
                    HStack(spacing: DS.Spacing.xs) {
                        Image(systemName: mode.icon)
                            .font(.caption.weight(.semibold))

                        if hasRoute, let option {
                            Text(option.formattedDuration)
                                .font(.caption.weight(.semibold))
                        }
                    }
                    .padding(.horizontal, DS.Spacing.lg)
                    .padding(.vertical, 8)
                    .frame(maxWidth: .infinity)
                    .background(
                        isSelected ? Color.blue : Color(.quaternarySystemFill),
                        in: Capsule()
                    )
                    .foregroundStyle(isSelected ? .white : .primary)
                }
                .buttonStyle(.plain)
            }
        }
    }

    // MARK: - Go Button (Apple Maps style)

    @ViewBuilder
    private var goButton: some View {
        if directionsService.selectedTransportMode == .walking, selectedOption?.route != nil {
            Button(action: onStartNavigation) {
                Text("Go")
                    .font(.title3.bold())
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 14)
                    .background(Color.green, in: RoundedRectangle(cornerRadius: 14))
            }
            .buttonStyle(AppleMapButtonStyle())
        } else if transitUnavailable {
            Button {
                directionsService.openInMapsApp()
            } label: {
                Label("Open in Maps", systemImage: "arrow.up.forward.app.fill")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 14)
                    .background(Color.blue, in: RoundedRectangle(cornerRadius: 14))
            }
            .buttonStyle(AppleMapButtonStyle())
        }
    }

    // MARK: - Route Details

    private func routeDetails(_ option: RouteOption) -> some View {
        VStack(spacing: DS.Spacing.md) {
            // Duration + Distance row
            HStack {
                Label(option.formattedDuration, systemImage: "clock")
                    .font(.subheadline.weight(.medium))
                Spacer()
                Label(option.formattedDistance, systemImage: "arrow.triangle.swap")
                    .font(.subheadline.weight(.medium))
                    .foregroundStyle(.secondary)
            }
            .padding(DS.Spacing.md)
            .background(Color(.quaternarySystemFill), in: RoundedRectangle(cornerRadius: 10))

            // Steps
            if directionsService.selectedTransportMode == .walking,
               let steps = option.route?.steps.filter({ !$0.instructions.isEmpty }),
               !steps.isEmpty {
                VStack(alignment: .leading, spacing: 0) {
                    ForEach(Array(steps.enumerated()), id: \.offset) { index, step in
                        HStack(alignment: .top, spacing: DS.Spacing.md) {
                            // Step icon
                            Image(systemName: stepIcon(for: step.instructions))
                                .font(.caption)
                                .foregroundStyle(.blue)
                                .frame(width: 24, height: 24)
                                .background(Color.blue.opacity(0.1), in: Circle())

                            VStack(alignment: .leading, spacing: 2) {
                                Text(step.instructions)
                                    .font(.subheadline)
                                    .lineLimit(2)
                                if step.distance > 0 {
                                    Text(formatDistance(step.distance))
                                        .font(.caption)
                                        .foregroundStyle(.secondary)
                                }
                            }

                            Spacer()
                        }
                        .padding(.vertical, 10)

                        if index < steps.count - 1 {
                            Divider()
                                .padding(.leading, 36)
                        }
                    }
                }
                .padding(.horizontal, DS.Spacing.md)
                .background(Color(.quaternarySystemFill), in: RoundedRectangle(cornerRadius: 10))
            }

            // Open in Maps secondary button
            Button {
                directionsService.openInMapsApp()
            } label: {
                Label("Open in Maps", systemImage: "map.fill")
                    .font(.subheadline.weight(.medium))
                    .foregroundStyle(.blue)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 10)
            }
            .buttonStyle(.plain)
        }
    }

    // MARK: - Transit Fallback

    private var transitFallback: some View {
        VStack(spacing: DS.Spacing.md) {
            Image(systemName: "tram.fill")
                .font(.largeTitle)
                .foregroundStyle(.blue.opacity(0.6))
            Text("Transit directions available\nin Apple Maps")
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, DS.Spacing.xl)
    }

    // MARK: - Helpers

    private func stepIcon(for instruction: String) -> String {
        let lower = instruction.lowercased()
        if lower.contains("left") { return "arrow.turn.up.left" }
        if lower.contains("right") { return "arrow.turn.up.right" }
        if lower.contains("straight") || lower.contains("continue") { return "arrow.up" }
        if lower.contains("start") { return "location.fill" }
        if lower.contains("arrive") || lower.contains("destination") { return "mappin.circle.fill" }
        return "arrow.up"
    }

    private func formatDistance(_ meters: CLLocationDistance) -> String {
        if meters < 1000 {
            return "\(Int(meters)) m"
        } else {
            return String(format: "%.1f km", meters / 1000)
        }
    }
}
