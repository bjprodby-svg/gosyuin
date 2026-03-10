import SwiftUI
import MapKit
import CoreLocation

struct FloatingCategoryChips: View {
    let region: MKCoordinateRegion
    let selectedCategory: ShrineCategory?
    let onCategoryTapped: (_ category: ShrineCategory) -> Void

    private let categories: [(display: String, shrineCategory: ShrineCategory)] = [
        ("Shrine", .jinja),
        ("Temple", .tera),
        ("Jingu", .jingu),
        ("Grand Shrine", .taisha),
        ("Tenmangu", .tenmangu),
        ("Inari", .inari),
        ("Hachimangu", .hachimangu),
        ("Daishi", .daishi),
    ]

    private func nearbyCount(for category: ShrineCategory) -> Int {
        Shrine.samples
            .filter { $0.category == category }
            .filter { region.contains($0.coordinate) }
            .count
    }

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: DS.Spacing.sm) {
                ForEach(categories, id: \.display) { category in
                    let count = nearbyCount(for: category.shrineCategory)
                    let isSelected = selectedCategory == category.shrineCategory
                    Button {
                        onCategoryTapped(category.shrineCategory)
                    } label: {
                        HStack(spacing: 6) {
                            Image(systemName: category.shrineCategory.icon)
                                .font(.caption)
                                .foregroundStyle(isSelected ? .white : category.shrineCategory.color)
                            Text(category.display)
                                .font(.subheadline.weight(.medium))
                                .foregroundStyle(isSelected ? .white : .primary)
                            if count > 0 {
                                Text("\(count)")
                                    .font(.caption2.weight(.bold))
                                    .foregroundStyle(isSelected ? category.shrineCategory.color : .white)
                                    .padding(.horizontal, 5)
                                    .padding(.vertical, 1)
                                    .background(
                                        isSelected ? AnyShapeStyle(.white) : AnyShapeStyle(category.shrineCategory.color),
                                        in: Capsule()
                                    )
                            }
                        }
                        .padding(.horizontal, DS.Spacing.md)
                        .padding(.vertical, DS.Spacing.sm)
                        .background(
                            isSelected
                                ? AnyShapeStyle(category.shrineCategory.color)
                                : AnyShapeStyle(.regularMaterial),
                            in: Capsule()
                        )
                        .shadow(color: .black.opacity(0.08), radius: 4, y: 2)
                    }
                    .buttonStyle(AppleMapButtonStyle())
                }
            }
            .padding(.horizontal, DS.Spacing.lg)
        }
    }
}

// MARK: - Helpers

private extension MKCoordinateRegion {
    func contains(_ coordinate: CLLocationCoordinate2D) -> Bool {
        let latMin = center.latitude - span.latitudeDelta / 2
        let latMax = center.latitude + span.latitudeDelta / 2
        let lonMin = center.longitude - span.longitudeDelta / 2
        let lonMax = center.longitude + span.longitudeDelta / 2
        return coordinate.latitude >= latMin && coordinate.latitude <= latMax
            && coordinate.longitude >= lonMin && coordinate.longitude <= lonMax
    }
}
