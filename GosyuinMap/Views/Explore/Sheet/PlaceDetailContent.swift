import SwiftUI
import SwiftData
import MapKit

// MARK: - Shrine Place Detail (Apple Maps style)

struct PlaceDetailContent: View {
    let shrine: Shrine
    let onDirections: () -> Void
    let onBack: () -> Void

    @Query private var collectedStamps: [CollectedStamp]

    private var isCollected: Bool {
        collectedStamps.contains { $0.slotId == shrine.stampSlotId }
    }

    var body: some View {
        VStack(spacing: 0) {
            peekSection
            Divider()
            ScrollView {
                VStack(spacing: DS.Spacing.xl) {
                    photoGallery
                    aboutSection

                    if !shrine.mustSee.isEmpty {
                        mustSeeCard
                    }

                    if !shrine.highlights.isEmpty {
                        highlightsSection
                    }

                    infoCards

                    if !shrine.tips.isEmpty {
                        tipsSection
                    }

                    if !isCollected {
                        collectPrompt
                    }

                    heroMap
                }
                .padding(DS.Spacing.lg)
                .padding(.bottom, DS.Spacing.xxl)
            }
        }
    }

    // MARK: - Peek Section (Apple Maps style header)

    private var peekSection: some View {
        VStack(alignment: .leading, spacing: DS.Spacing.sm) {
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: DS.Spacing.xs) {
                    Text(shrine.name)
                        .font(.title2.bold())

                    HStack(spacing: DS.Spacing.xs) {
                        Image(systemName: shrine.category.icon)
                            .font(.caption2)
                            .foregroundStyle(.white)
                            .padding(4)
                            .background(shrine.category.color, in: RoundedRectangle(cornerRadius: 4))
                        Text(shrine.category.displayName)
                            .font(.caption.weight(.medium))
                            .foregroundStyle(.secondary)
                    }
                }

                Spacer()

                if isCollected {
                    Label("Collected", systemImage: "checkmark.seal.fill")
                        .font(.caption.weight(.semibold))
                        .foregroundStyle(.white)
                        .padding(.horizontal, DS.Spacing.sm)
                        .padding(.vertical, DS.Spacing.xs)
                        .background(Color.vermillion, in: Capsule())
                }

                Button(action: onBack) {
                    Image(systemName: "xmark.circle.fill")
                        .font(.title2)
                        .symbolRenderingMode(.hierarchical)
                        .foregroundStyle(.secondary)
                }
            }

            if !shrine.tagline.isEmpty {
                Text(shrine.tagline)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .italic()
            } else {
                Text(shrine.address)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }

            // Apple Maps-style action buttons (circular icons)
            actionButtons
        }
        .padding(DS.Spacing.lg)
        .padding(.top, DS.Spacing.xs)
    }

    // MARK: - Action Buttons (Apple Maps circular style)

    private var actionButtons: some View {
        HStack(spacing: DS.Spacing.xl) {
            // Directions — in-app route preview
            circleActionButton(icon: "arrow.triangle.turn.up.right.diamond.fill", label: "Directions", color: .blue) {
                onDirections()
            }

            // Share
            ShareLink(
                item: "\(shrine.name)\n\(shrine.address)",
                subject: Text(shrine.name),
                message: Text(shrine.address)
            ) {
                VStack(spacing: DS.Spacing.xs) {
                    Image(systemName: "square.and.arrow.up")
                        .font(.body.weight(.medium))
                        .foregroundStyle(.blue)
                        .frame(width: 48, height: 48)
                        .background(Color.blue.opacity(0.12), in: Circle())
                    Text("Share")
                        .font(.caption2.weight(.medium))
                        .foregroundStyle(.secondary)
                }
            }
            .buttonStyle(AppleMapButtonStyle())

            Spacer()
        }
        .padding(.top, DS.Spacing.sm)
    }

    private func openInMaps(mode: TransportMode) {
        let placemark = MKPlacemark(coordinate: shrine.coordinate)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = shrine.name
        let launchOptions: [String: Any] = switch mode {
        case .walking: [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeWalking]
        case .automobile: [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving]
        case .transit: [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeTransit]
        }
        mapItem.openInMaps(launchOptions: launchOptions)
    }

    private func circleActionButton(icon: String, label: String, color: Color, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            VStack(spacing: DS.Spacing.xs) {
                Image(systemName: icon)
                    .font(.body.weight(.medium))
                    .foregroundStyle(color)
                    .frame(width: 48, height: 48)
                    .background(color.opacity(0.12), in: Circle())
                Text(label)
                    .font(.caption2.weight(.medium))
                    .foregroundStyle(.secondary)
            }
        }
        .buttonStyle(AppleMapButtonStyle())
    }

    // MARK: - Photo Gallery

    private var photoGallery: some View {
        Group {
            if !shrine.imageURLs.isEmpty {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: DS.Spacing.sm) {
                        ForEach(shrine.imageURLs, id: \.self) { urlString in
                            if let url = URL(string: urlString) {
                                AsyncImage(url: url) { phase in
                                    switch phase {
                                    case .success(let image):
                                        image
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 280, height: 200)
                                            .clipShape(RoundedRectangle(cornerRadius: DS.Radius.lg))
                                    case .failure:
                                        photoPlaceholder
                                    case .empty:
                                        photoPlaceholder
                                            .overlay { ProgressView().tint(.white) }
                                    @unknown default:
                                        photoPlaceholder
                                    }
                                }
                            }
                        }
                    }
                }
                .scrollClipDisabled()
            }
        }
    }

    private var photoPlaceholder: some View {
        LinearGradient(
            colors: [shrine.category.color.opacity(0.5), shrine.category.color.opacity(0.8)],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .frame(width: 280, height: 200)
        .clipShape(RoundedRectangle(cornerRadius: DS.Radius.lg))
        .overlay {
            Image(systemName: shrine.category.icon)
                .font(.system(size: 32))
                .foregroundStyle(.white.opacity(0.4))
        }
    }

    // MARK: - About

    private var aboutSection: some View {
        VStack(alignment: .leading, spacing: DS.Spacing.sm) {
            Text("About")
                .font(.headline)
            Text(shrine.description)
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .fixedSize(horizontal: false, vertical: true)
                .lineSpacing(3)
        }
    }

    // MARK: - Must See

    private var mustSeeCard: some View {
        VStack(alignment: .leading, spacing: DS.Spacing.md) {
            HStack(spacing: DS.Spacing.sm) {
                Image(systemName: "eye.fill")
                    .font(.caption)
                    .foregroundStyle(.white)
                    .padding(6)
                    .background(shrine.category.color, in: Circle())
                Text("Don't Miss")
                    .font(.subheadline.bold())
            }
            Text(shrine.mustSee)
                .font(.subheadline)
                .foregroundStyle(Color.bodyText)
                .fixedSize(horizontal: false, vertical: true)
                .lineSpacing(2)
        }
        .accentedCard(accentColor: shrine.category.color)
    }

    // MARK: - Highlights

    private var highlightsSection: some View {
        VStack(alignment: .leading, spacing: DS.Spacing.md) {
            Text("Highlights")
                .font(.headline)
            VStack(alignment: .leading, spacing: DS.Spacing.md) {
                ForEach(Array(shrine.highlights.enumerated()), id: \.offset) { index, highlight in
                    HStack(alignment: .top, spacing: DS.Spacing.md) {
                        Text("\(index + 1)")
                            .font(.caption.bold())
                            .foregroundStyle(.white)
                            .frame(width: 22, height: 22)
                            .background(shrine.category.color, in: Circle())
                        Text(highlight)
                            .font(.subheadline)
                            .foregroundStyle(Color.bodyText)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                }
            }
            .padding(DS.Spacing.lg)
            .background(Color.cardBackground, in: RoundedRectangle(cornerRadius: DS.Radius.lg))
            .shadow(color: .black.opacity(0.04), radius: 2, y: 1)
        }
    }

    // MARK: - Info Cards

    private var infoCards: some View {
        VStack(spacing: DS.Spacing.sm) {
            if !shrine.access.isEmpty {
                infoRow(icon: "tram.fill", title: "Access", detail: shrine.access, color: .blue)
            }
            if !shrine.hours.isEmpty {
                infoRow(icon: "clock.fill", title: "Hours", detail: shrine.hours, color: .orange)
            }
            infoRow(icon: "leaf.fill", title: "Best Season", detail: shrine.bestSeason, color: .matcha)
        }
    }

    private func infoRow(icon: String, title: String, detail: String, color: Color) -> some View {
        HStack(spacing: DS.Spacing.md) {
            Image(systemName: icon)
                .font(.subheadline)
                .foregroundStyle(color)
                .frame(width: 28, height: 28)
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.caption.weight(.semibold))
                    .foregroundStyle(.secondary)
                Text(detail)
                    .font(.subheadline)
                    .foregroundStyle(Color.bodyText)
                    .fixedSize(horizontal: false, vertical: true)
            }
            Spacer()
        }
        .padding(DS.Spacing.md)
        .background(Color.cardBackground, in: RoundedRectangle(cornerRadius: DS.Radius.md))
        .shadow(color: .black.opacity(0.03), radius: 1, y: 1)
    }

    // MARK: - Tips

    private var tipsSection: some View {
        VStack(alignment: .leading, spacing: DS.Spacing.md) {
            HStack(spacing: DS.Spacing.sm) {
                Image(systemName: "lightbulb.fill")
                    .font(.caption)
                    .foregroundStyle(.orange)
                Text("Visitor Tips")
                    .font(.headline)
            }
            VStack(alignment: .leading, spacing: DS.Spacing.md) {
                ForEach(shrine.tips, id: \.self) { tip in
                    HStack(alignment: .top, spacing: DS.Spacing.sm) {
                        Image(systemName: "checkmark.circle.fill")
                            .font(.caption)
                            .foregroundStyle(.orange)
                            .padding(.top, 2)
                        Text(tip)
                            .font(.caption)
                            .foregroundStyle(Color.bodyText)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                }
            }
            .padding(DS.Spacing.lg)
            .background(Color.cardBackground, in: RoundedRectangle(cornerRadius: DS.Radius.lg))
            .shadow(color: .black.opacity(0.04), radius: 2, y: 1)
        }
    }

    // MARK: - Collect Prompt

    private var collectPrompt: some View {
        HStack(spacing: DS.Spacing.md) {
            Image(systemName: "mappin.and.ellipse")
                .font(.title3)
                .foregroundStyle(Color.vermillion)
                .frame(width: 32)
            VStack(alignment: .leading, spacing: 2) {
                Text("Visit to Collect Stamp")
                    .font(.subheadline.weight(.semibold))
                Text("Get within 100m to collect your stamp")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            Spacer()
        }
        .accentedCard(accentColor: .vermillion)
    }

    // MARK: - Hero Map

    private var heroMap: some View {
        VStack(alignment: .leading, spacing: DS.Spacing.sm) {
            Text("Location")
                .font(.headline)

            ZStack(alignment: .bottomTrailing) {
                Map {
                    Annotation(shrine.name, coordinate: shrine.coordinate) {
                        ZStack {
                            Circle()
                                .fill(Color(.label))
                                .frame(width: 36, height: 36)
                                .shadow(color: .black.opacity(0.15), radius: 3)
                            Text("\u{26E9}")
                                .font(.system(size: 16))
                                .foregroundStyle(Color(.systemBackground))
                        }
                    }
                }
                .frame(height: 180)
                .clipShape(RoundedRectangle(cornerRadius: DS.Radius.lg))
                .allowsHitTesting(false)

                Text(shrine.address)
                    .font(.caption2)
                    .foregroundStyle(.secondary)
                    .padding(.horizontal, DS.Spacing.sm)
                    .padding(.vertical, DS.Spacing.xs)
                    .background(.ultraThinMaterial, in: Capsule())
                    .padding(DS.Spacing.sm)
            }
        }
    }
}

// MARK: - Map Item Detail (Apple Maps style)

struct MapItemDetailContent: View {
    let item: MKMapItem
    let onDirections: () -> Void
    let onBack: () -> Void

    var body: some View {
        VStack(spacing: 0) {
            VStack(alignment: .leading, spacing: DS.Spacing.md) {
                // Header
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: DS.Spacing.xs) {
                        Text(item.name ?? "Unknown")
                            .font(.title2.bold())
                        if let address = item.placemark.title {
                            Text(address)
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                        }
                    }
                    Spacer()
                    Button(action: onBack) {
                        Image(systemName: "xmark.circle.fill")
                            .font(.title2)
                            .symbolRenderingMode(.hierarchical)
                            .foregroundStyle(.secondary)
                    }
                }

                // Action button — in-app directions
                Button(action: onDirections) {
                    Label("Directions", systemImage: "arrow.triangle.turn.up.right.diamond.fill")
                        .font(.subheadline.weight(.medium))
                        .foregroundStyle(.white)
                        .padding(.horizontal, DS.Spacing.lg)
                        .padding(.vertical, 10)
                        .background(.blue, in: Capsule())
                }
                .buttonStyle(AppleMapButtonStyle())
            }
            .padding(DS.Spacing.lg)

            Spacer()
        }
    }
}
