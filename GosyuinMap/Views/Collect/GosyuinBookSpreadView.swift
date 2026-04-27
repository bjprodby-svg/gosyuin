import SwiftUI
import SwiftData

/// A gosyuin-cho (御朱印帳) book spread showing the latest collected stamp
/// and a teaser for the next one. Used as a header in CollectView.
struct GosyuinBookSpreadView: View {
    let collectedStamps: [CollectedStamp]

    private var latestCollected: CollectedStamp? {
        collectedStamps.sorted { $0.collectedDate > $1.collectedDate }.first
    }

    private var latestStamp: StampDefinition? {
        guard let latest = latestCollected else { return nil }
        return StampDefinition.all.first { $0.id == latest.slotId }
    }

    private var collectedIds: Set<Int> {
        Set(collectedStamps.map(\.slotId))
    }

    private var nextUncollected: StampDefinition? {
        StampDefinition.all.first { !collectedIds.contains($0.id) }
    }

    var body: some View {
        HStack(spacing: 0) {
            leftPage
                .frame(maxWidth: .infinity)
            spine
            rightPage
                .frame(maxWidth: .infinity)
        }
        .frame(height: 170)
        .background(bookBackground)
        .clipShape(RoundedRectangle(cornerRadius: DS.Radius.lg))
        .shadow(color: .black.opacity(0.08), radius: 4, y: 2)
    }

    // MARK: - Left Page

    private var leftPage: some View {
        VStack(spacing: DS.Spacing.sm) {
            HStack {
                Image(systemName: "chevron.left")
                    .font(.caption2)
                    .foregroundStyle(Color.captionText)
                Text("Latest")
                    .font(.caption2.weight(.semibold))
                    .foregroundStyle(Color.subtitleText)
                Spacer()
            }

            if let stamp = latestStamp, let collected = latestCollected {
                GosyuinStampView(
                    stamp: stamp,
                    size: 80,
                    showDate: false,
                    collectedDate: collected.collectedDate
                )

                Text(stamp.name)
                    .font(.system(size: 11, weight: .semibold, design: .serif))
                    .foregroundStyle(Color.bodyText)
                    .lineLimit(1)

                Text(relativeDate(collected.collectedDate))
                    .font(.caption2)
                    .foregroundStyle(Color.captionText)
            } else {
                emptyPageContent
            }
        }
        .padding(DS.Spacing.md)
    }

    // MARK: - Right Page

    private var rightPage: some View {
        VStack(spacing: DS.Spacing.sm) {
            HStack {
                Spacer()
                Text("Next")
                    .font(.caption2.weight(.semibold))
                    .foregroundStyle(Color.subtitleText)
                Image(systemName: "chevron.right")
                    .font(.caption2)
                    .foregroundStyle(Color.captionText)
            }

            if let next = nextUncollected {
                ZStack {
                    if next.id % 2 != 0 {
                        HexagonShape()
                            .fill(next.color.opacity(0.06))
                            .frame(width: 80, height: 80)
                        HexagonShape()
                            .stroke(
                                next.color.opacity(0.2),
                                style: StrokeStyle(lineWidth: 1, dash: [4, 3])
                            )
                            .frame(width: 80, height: 80)
                    } else {
                        Circle()
                            .fill(next.color.opacity(0.06))
                            .frame(width: 80, height: 80)
                        Circle()
                            .strokeBorder(
                                next.color.opacity(0.2),
                                style: StrokeStyle(lineWidth: 1, dash: [4, 3])
                            )
                            .frame(width: 80, height: 80)
                    }

                    VStack(spacing: DS.Spacing.xs) {
                        Image(systemName: "questionmark")
                            .font(.system(size: 22, weight: .light))
                            .foregroundStyle(next.color.opacity(0.4))
                        Image(systemName: next.icon)
                            .font(.system(size: 10))
                            .foregroundStyle(next.color.opacity(0.25))
                    }
                }

                Text("Discover more...")
                    .font(.system(size: 11, weight: .medium, design: .serif))
                    .foregroundStyle(Color.subtitleText)
            } else {
                // All collected!
                VStack(spacing: DS.Spacing.sm) {
                    IconBadge(icon: "star.fill", size: 52, color: .vermillion)
                    Text("Complete!")
                        .font(.system(size: 12, weight: .bold, design: .serif))
                        .foregroundStyle(Color.vermillion)
                }
            }

            Spacer(minLength: 0)
        }
        .padding(DS.Spacing.md)
    }

    // MARK: - Spine

    private var spine: some View {
        ZStack {
            Rectangle()
                .fill(
                    LinearGradient(
                        colors: [
                            .black.opacity(0.08),
                            .black.opacity(0.02),
                            .black.opacity(0.06)
                        ],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .frame(width: 8)

            Rectangle()
                .fill(Color.divider)
                .frame(width: 0.5)
        }
    }

    // MARK: - Book Background

    private var bookBackground: some View {
        ZStack {
            // Washi paper base
            LinearGradient(
                colors: [
                    Color(red: 0.97, green: 0.95, blue: 0.91),
                    Color(red: 0.95, green: 0.92, blue: 0.87)
                ],
                startPoint: .top,
                endPoint: .bottom
            )

            // Subtle page fold gradient on edges
            HStack {
                LinearGradient(
                    colors: [.black.opacity(0.04), .clear],
                    startPoint: .leading,
                    endPoint: .trailing
                )
                .frame(width: 12)
                Spacer()
                LinearGradient(
                    colors: [.clear, .black.opacity(0.04)],
                    startPoint: .leading,
                    endPoint: .trailing
                )
                .frame(width: 12)
            }
        }
    }

    // MARK: - Empty State

    private var emptyPageContent: some View {
        VStack(spacing: DS.Spacing.sm) {
            IconBadge(icon: "book.closed", size: 52, color: .placeholderIcon)
            Text("Start exploring!")
                .font(.caption)
                .foregroundStyle(Color.captionText)
        }
        .frame(height: 80)
    }

    // MARK: - Helpers

    private func relativeDate(_ date: Date) -> String {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .short
        return formatter.localizedString(for: date, relativeTo: .now)
    }
}

#Preview("With Stamps") {
    GosyuinBookSpreadView(
        collectedStamps: [
            CollectedStamp(slotId: 1, collectedDate: .now.addingTimeInterval(-86400 * 2)),
            CollectedStamp(slotId: 2, collectedDate: .now.addingTimeInterval(-86400 * 5)),
            CollectedStamp(slotId: 3, collectedDate: .now)
        ]
    )
    .padding()
}

#Preview("Empty") {
    GosyuinBookSpreadView(collectedStamps: [])
        .padding()
}
