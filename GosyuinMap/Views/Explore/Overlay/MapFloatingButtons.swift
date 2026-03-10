import SwiftUI
import MapKit

struct MapFloatingButtons: View {
    @Binding var mapStyleOption: MapStyleOption
    let onRecenterTapped: () -> Void

    var body: some View {
        VStack(spacing: DS.Spacing.sm) {
            // Map style picker
            Menu {
                ForEach(MapStyleOption.allCases) { option in
                    Button {
                        mapStyleOption = option
                    } label: {
                        Label(option.label, systemImage: option.icon)
                    }
                }
            } label: {
                Image(systemName: mapStyleOption.icon)
                    .font(.body.weight(.medium))
                    .foregroundStyle(.primary)
                    .frame(width: 44, height: 44)
                    .background(.regularMaterial, in: Circle())
                    .shadow(color: .black.opacity(0.1), radius: 4, y: 2)
            }

            // Location re-center
            Button(action: onRecenterTapped) {
                Image(systemName: "location.fill")
                    .font(.body.weight(.medium))
                    .foregroundStyle(.blue)
                    .frame(width: 44, height: 44)
                    .background(.regularMaterial, in: Circle())
                    .shadow(color: .black.opacity(0.1), radius: 4, y: 2)
            }
            .buttonStyle(AppleMapButtonStyle())
        }
    }
}
