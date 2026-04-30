import SwiftUI

struct LevelDetailView: View {
    let collectedIds: Set<Int>
    let stampCount: Int
    let achievementsByCategory: [(category: AchievementCategory, achievements: [Achievement])]
    @Environment(\.dismiss) private var dismiss

    private var level: CollectorLevel {
        CollectorLevel.level(for: stampCount)
    }
    private var unlockedCount: Int {
        Achievement.all.filter { $0.requirement(collectedIds, Shrine.samples) }.count
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: DS.Spacing.xl) {
                    levelProgressSection
                    achievementsSection
                }
                .padding(DS.Spacing.lg)
            }
            .background(Color.pageBackground)
            .navigationTitle("Progress")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button { dismiss() } label: {
                        Image(systemName: "xmark.circle.fill")
                            .font(.title2)
                            .symbolRenderingMode(.hierarchical)
                            .foregroundStyle(Color.subtitleText)
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Text("\(unlockedCount)/\(Achievement.all.count)")
                        .font(.caption.weight(.semibold))
                        .foregroundStyle(Color.captionText)
                }
            }
        }
    }

    // MARK: - Level Progress

    private var levelProgressSection: some View {
        VStack(spacing: DS.Spacing.lg) {
            // Flat-illustration avatar badge with a kanji chip overlay.
            ZStack(alignment: .bottomTrailing) {
                AvatarView(level: level, size: 110)
                    .shadow(color: level.color.opacity(0.4), radius: 14, y: 4)
                // Small kanji chip overlay — cultural marker
                Text(level.kanji)
                    .font(.system(size: 12, weight: .bold))
                    .foregroundStyle(.white)
                    .padding(.horizontal, 7)
                    .padding(.vertical, 3)
                    .background(level.color, in: Capsule())
                    .overlay(
                        Capsule().strokeBorder(.white, lineWidth: 1.5)
                    )
                    .offset(x: 6, y: 6)
            }
            .popIn()

            VStack(spacing: DS.Spacing.xs) {
                Text("Lv.\(level.rawValue) \(level.title)")
                    .font(.title3.weight(.bold))
                Text(level.subtitle)
                    .font(.subheadline)
                    .foregroundStyle(Color.subtitleText)
            }

            AnimatedCounter(
                value: stampCount,
                font: DS.Font.statHero,
                color: level.color
            )

            if let next = level.next {
                VStack(spacing: DS.Spacing.sm) {
                    ProgressBar(
                        progress: level.progressToNext(current: stampCount),
                        color: level.color,
                        height: 12
                    )
                    HStack {
                        Text("\(stampCount) stamps")
                            .font(DS.Font.progressLabel)
                            .foregroundStyle(Color.captionText)
                        Spacer()
                        Text("\(next.threshold) → Lv.\(next.rawValue) \(next.title)")
                            .font(DS.Font.progressLabel)
                            .foregroundStyle(level.color)
                    }
                }
                .padding(.horizontal, DS.Spacing.lg)
            }
        }
        .frame(maxWidth: .infinity)
        .cardStyle()
    }

    // MARK: - Achievements

    private var achievementsSection: some View {
        VStack(alignment: .leading, spacing: DS.Spacing.md) {
            SectionHeader(
                title: "Achievements",
                icon: "medal",
                trailing: "\(unlockedCount)/\(Achievement.all.count)"
            )

            ForEach(achievementsByCategory, id: \.category) { section in
                VStack(alignment: .leading, spacing: DS.Spacing.md) {
                    HStack(spacing: DS.Spacing.xs) {
                        Image(systemName: section.category.icon)
                            .font(.caption.weight(.semibold))
                            .foregroundStyle(Color.captionText)
                        Text(section.category.displayName)
                            .font(.subheadline.weight(.semibold))
                    }

                    ForEach(Array(section.achievements.enumerated()), id: \.element.id) { index, achievement in
                        let unlocked = achievement.requirement(collectedIds, Shrine.samples)
                        HStack(spacing: DS.Spacing.md) {
                            IconBadge(
                                icon: achievement.icon,
                                size: 40,
                                color: unlocked ? achievement.color : .placeholderIcon
                            )

                            VStack(alignment: .leading, spacing: 3) {
                                Text(achievement.title)
                                    .font(.subheadline.weight(.medium))
                                    .foregroundStyle(unlocked ? .primary : Color.captionText)
                                Text(achievement.description)
                                    .font(.caption)
                                    .foregroundStyle(Color.subtitleText)

                                if let progressLabel = achievement.progressLabel {
                                    let label = progressLabel(collectedIds, Shrine.samples)
                                    HStack(spacing: DS.Spacing.xs) {
                                        ProgressBar(
                                            progress: progressFraction(label),
                                            color: unlocked ? achievement.color : .placeholderIcon,
                                            height: 4,
                                            useGradient: false
                                        )
                                        Text(label)
                                            .font(.caption2.weight(.medium).monospacedDigit())
                                            .foregroundStyle(Color.captionText)
                                            .fixedSize()
                                    }
                                }
                            }
                            Spacer()

                            if unlocked {
                                Image(systemName: "checkmark.circle.fill")
                                    .font(.body)
                                    .foregroundStyle(achievement.color)
                            }
                        }
                        .padding(.vertical, DS.Spacing.xs)
                        .appearAnimation(delay: DS.Anim.stagger(index))
                    }
                }
                .cardStyle()
            }
        }
    }

    private func progressFraction(_ label: String) -> CGFloat {
        let parts = label.split(separator: "/")
        guard parts.count == 2,
              let current = Double(parts[0]),
              let total = Double(parts[1]),
              total > 0 else { return 0 }
        return min(1.0, CGFloat(current / total))
    }
}
