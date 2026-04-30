import SwiftUI
import SwiftData
import MapKit

// MARK: - Shrine Place Detail (Apple Maps style)

struct PlaceDetailContent: View {
    let shrine: Shrine
    var isEnriching: Bool = false
    let onDirections: () -> Void
    let onBack: () -> Void

    @Query private var collectedStamps: [CollectedStamp]

    private var isCollected: Bool {
        let slotId = shrine.effectiveStampSlotId
        return slotId > 0 && collectedStamps.contains { $0.slotId == slotId }
    }

    var body: some View {
        VStack(spacing: 0) {
            peekSection
            Divider()
            ScrollView {
                VStack(spacing: DS.Spacing.xl) {
                    photoGallery

                    // Collect prompt stays near the top so users see it immediately
                    if !isCollected && shrine.effectiveStampSlotId > 0 {
                        collectPrompt
                    }

                    aboutSection

                    if !shrine.mustSee.isEmpty {
                        mustSeeCard
                    }

                    infoCards

                    if !shrine.highlights.isEmpty {
                        highlightsSection
                    }

                    if !shrine.tips.isEmpty {
                        tipsSection
                    }

                    if let reviews = shrine.reviews, !reviews.isEmpty {
                        reviewsSection(reviews)
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
                            .foregroundStyle(Color.subtitleText)

                        if let rating = shrine.rating {
                            HStack(spacing: 2) {
                                Image(systemName: "star.fill")
                                    .font(.system(size: 10))
                                    .foregroundStyle(.orange)
                                Text(String(format: "%.1f", rating))
                                    .font(.caption.weight(.medium))
                                if let count = shrine.userRatingCount {
                                    Text("(\(count))")
                                        .font(.caption2)
                                        .foregroundStyle(Color.captionText)
                                }
                            }
                        }

                        if let openNow = shrine.openNow {
                            Text(openNow ? "Open" : "Closed")
                                .font(.caption.weight(.semibold))
                                .foregroundStyle(openNow ? .green : .red)
                        }
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
                HStack(spacing: 0) {
                    RoundedRectangle(cornerRadius: 1.5)
                        .fill(Color.vermillion)
                        .frame(width: 3, height: 22)
                    Text(shrine.tagline)
                        .font(.subheadline.weight(.medium))
                        .foregroundStyle(Color.bodyText)
                        .italic()
                        .padding(.leading, DS.Spacing.sm)
                        .fixedSize(horizontal: false, vertical: true)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.vertical, 2)
            } else {
                Text(shrine.address)
                    .font(.subheadline)
                    .foregroundStyle(Color.subtitleText)
            }

            actionButtons
        }
        .padding(DS.Spacing.lg)
        .padding(.top, DS.Spacing.xs)
    }

    // MARK: - Action Buttons (Apple Maps circular style)

    private var actionButtons: some View {
        HStack(spacing: DS.Spacing.xl) {
            circleActionButton(icon: "arrow.triangle.turn.up.right.diamond.fill", label: "Directions", color: .blue) {
                onDirections()
            }

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
                        .foregroundStyle(Color.subtitleText)
                }
            }
            .buttonStyle(AppleMapButtonStyle())

            Spacer()
        }
        .padding(.top, DS.Spacing.sm)
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
                    .foregroundStyle(Color.subtitleText)
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
        Group {
            if !shrine.description.isEmpty {
                VStack(alignment: .leading, spacing: DS.Spacing.sm) {
                    Text("About")
                        .font(.headline)
                    Text(shrine.description)
                        .font(.subheadline)
                        .foregroundStyle(Color.subtitleText)
                        .fixedSize(horizontal: false, vertical: true)
                        .lineSpacing(3)
                }
            }
        }
    }

    // MARK: - Must See

    private var mustSeeCard: some View {
        VStack(alignment: .leading, spacing: DS.Spacing.md) {
            HStack(spacing: DS.Spacing.sm) {
                IconBadge(icon: "eye.fill", size: 28, color: shrine.category.color, filled: true)
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
            if let weekdays = shrine.weekdayHours, !weekdays.isEmpty {
                weekdayHoursCard(weekdays)
            }
            if !shrine.bestSeason.isEmpty {
                infoRow(icon: "leaf.fill", title: "Best Season", detail: shrine.bestSeason, color: .matcha)
            }
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
                    .foregroundStyle(Color.subtitleText)
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

    private func weekdayHoursCard(_ weekdays: [String]) -> some View {
        VStack(alignment: .leading, spacing: DS.Spacing.sm) {
            HStack(spacing: DS.Spacing.sm) {
                Image(systemName: "calendar")
                    .font(.subheadline)
                    .foregroundStyle(.orange)
                    .frame(width: 28, height: 28)
                Text("Opening Hours")
                    .font(.caption.weight(.semibold))
                    .foregroundStyle(Color.subtitleText)
            }
            ForEach(weekdays, id: \.self) { day in
                Text(day)
                    .font(.caption)
                    .foregroundStyle(Color.bodyText)
            }
        }
        .padding(DS.Spacing.md)
        .background(Color.cardBackground, in: RoundedRectangle(cornerRadius: DS.Radius.md))
        .shadow(color: .black.opacity(0.03), radius: 1, y: 1)
    }

    // MARK: - Reviews (Google)

    private func reviewsSection(_ reviews: [PlaceReview]) -> some View {
        VStack(alignment: .leading, spacing: DS.Spacing.md) {
            HStack(spacing: DS.Spacing.sm) {
                Image(systemName: "text.quote")
                    .font(.caption)
                    .foregroundStyle(.blue)
                Text("Reviews")
                    .font(.headline)
            }

            ForEach(reviews.prefix(5)) { review in
                VStack(alignment: .leading, spacing: DS.Spacing.xs) {
                    HStack(spacing: DS.Spacing.sm) {
                        Text(review.authorName)
                            .font(.caption.weight(.semibold))
                        Spacer()
                        HStack(spacing: 2) {
                            ForEach(0..<5, id: \.self) { i in
                                Image(systemName: i < review.rating ? "star.fill" : "star")
                                    .font(.system(size: 9))
                                    .foregroundStyle(i < review.rating ? Color.orange : Color.gray.opacity(0.3))
                            }
                        }
                        Text(review.relativeTime)
                            .font(.caption2)
                            .foregroundStyle(Color.captionText)
                    }
                    Text(review.text)
                        .font(.caption)
                        .foregroundStyle(Color.bodyText)
                        .lineLimit(4)
                }
                .padding(DS.Spacing.md)
                .background(Color.cardBackground, in: RoundedRectangle(cornerRadius: DS.Radius.md))
                .shadow(color: .black.opacity(0.03), radius: 1, y: 1)
            }
        }
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
                    .foregroundStyle(Color.subtitleText)
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
                                .fill(shrine.category.color)
                                .frame(width: 36, height: 36)
                                .shadow(color: shrine.category.color.opacity(0.3), radius: 4, y: 2)
                            Circle()
                                .strokeBorder(.white, lineWidth: 2)
                                .frame(width: 36, height: 36)
                            CategoryIconView(
                                category: shrine.category,
                                size: 16,
                                color: .white
                            )
                        }
                    }
                }
                .frame(height: 180)
                .clipShape(RoundedRectangle(cornerRadius: DS.Radius.lg))
                .allowsHitTesting(false)

                Text(shrine.address)
                    .font(.caption2)
                    .foregroundStyle(Color.subtitleText)
                    .padding(.horizontal, DS.Spacing.sm)
                    .padding(.vertical, DS.Spacing.xs)
                    .background(.ultraThinMaterial, in: Capsule())
                    .padding(DS.Spacing.sm)
            }
        }
    }
}
