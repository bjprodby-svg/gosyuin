import SwiftUI
import SwiftData

/// Modern stamp book: level header, stat tiles, recent-stamps carousel,
/// then a searchable, category-sectioned grid of every stamp.
/// Collected stamps show their artwork; uncollected show a silhouette.
struct CollectView: View {
    @Query private var collectedStamps: [CollectedStamp]
    @State private var selectedCategory: ShrineCategory? = nil
    @State private var searchText = ""
    @State private var showPassport = false
    @State private var showSettings = false
    @State private var showLevelDetail = false

    private let gridColumns = [
        GridItem(.flexible(), spacing: DS.Spacing.md),
        GridItem(.flexible(), spacing: DS.Spacing.md),
        GridItem(.flexible(), spacing: DS.Spacing.md)
    ]

    /// Washi paper tone shared with the section cards
    private let washi = Color(red: 0.98, green: 0.96, blue: 0.93)

    private var collectedIds: Set<Int> {
        Set(collectedStamps.map(\.slotId))
    }

    private var level: CollectorLevel {
        CollectorLevel.level(for: collectedStamps.count)
    }

    private var unlockedAchievements: [Achievement] {
        Achievement.all.filter { $0.requirement(collectedIds, Shrine.samples) }
    }

    private var achievementsByCategory: [(category: AchievementCategory, achievements: [Achievement])] {
        AchievementCategory.allCases.compactMap { cat in
            let items = Achievement.all.filter { $0.category == cat }
            guard !items.isEmpty else { return nil }
            let sorted = items.sorted { a, b in
                let aUnlocked = a.requirement(collectedIds, Shrine.samples)
                let bUnlocked = b.requirement(collectedIds, Shrine.samples)
                if aUnlocked != bUnlocked { return aUnlocked }
                return false
            }
            return (category: cat, achievements: sorted)
        }
    }

    private static let cachedStampsByCategory: [(category: ShrineCategory, stamps: [StampDefinition])] = {
        let shrineMap = Dictionary(uniqueKeysWithValues: Shrine.samples.map { ($0.stampSlotId, $0) })
        var grouped: [ShrineCategory: [StampDefinition]] = [:]
        for stamp in StampDefinition.all {
            let cat = shrineMap[stamp.id]?.category ?? .jinja
            grouped[cat, default: []].append(stamp)
        }
        return ShrineCategory.allCases
            .compactMap { cat in
                guard let stamps = grouped[cat], !stamps.isEmpty else { return nil }
                return (category: cat, stamps: stamps)
            }
    }()

    private var stampsByCategory: [(category: ShrineCategory, stamps: [StampDefinition])] {
        Self.cachedStampsByCategory
    }

    private func matchesSearch(_ stamp: StampDefinition) -> Bool {
        guard !searchText.isEmpty else { return true }
        return stamp.name.localizedCaseInsensitiveContains(searchText)
            || stamp.subtitle.localizedCaseInsensitiveContains(searchText)
    }

    /// Sections currently visible after applying the category filter + search.
    private var visibleSections: [(category: ShrineCategory, stamps: [StampDefinition])] {
        stampsByCategory
            .filter { selectedCategory == nil || $0.category == selectedCategory }
            .compactMap { section -> (category: ShrineCategory, stamps: [StampDefinition])? in
                let stamps = section.stamps.filter(matchesSearch)
                guard !stamps.isEmpty else { return nil }
                return (category: section.category, stamps: stamps)
            }
    }

    /// Latest collections, newest first, paired with their stamp definitions.
    private var recentStamps: [(record: CollectedStamp, stamp: StampDefinition)] {
        collectedStamps
            .sorted { $0.collectedDate > $1.collectedDate }
            .prefix(8)
            .compactMap { record -> (record: CollectedStamp, stamp: StampDefinition)? in
                guard let stamp = StampDefinition.all.first(where: { $0.id == record.slotId }) else { return nil }
                return (record: record, stamp: stamp)
            }
    }

    private var completionPercent: Int {
        let total = StampDefinition.all.count
        guard total > 0 else { return 0 }
        return Int((Double(collectedStamps.count) / Double(total) * 100).rounded())
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: DS.Spacing.xl) {
                    levelCard

                    statsRow

                    if collectedStamps.isEmpty {
                        emptyStateCard
                    } else {
                        recentSection
                    }
                }
                .padding(.horizontal, DS.Spacing.lg)
                .padding(.top, DS.Spacing.lg)

                // Sticky category filter + sectioned stamp grid
                LazyVStack(alignment: .leading, spacing: DS.Spacing.lg, pinnedViews: [.sectionHeaders]) {
                    Section {
                        if visibleSections.isEmpty {
                            ContentUnavailableView.search(text: searchText)
                                .padding(.top, DS.Spacing.xl)
                        } else {
                            ForEach(visibleSections, id: \.category) { section in
                                categorySection(section)
                            }
                        }
                    } header: {
                        categoryFilter
                            .padding(.vertical, DS.Spacing.sm)
                            .background(Color.pageBackground)
                    }
                }
                .padding(.horizontal, DS.Spacing.lg)
                .padding(.top, DS.Spacing.md)
                .padding(.bottom, DS.Spacing.xxl)
            }
            .background(Color.pageBackground)
            .navigationTitle("Stamp Book")
            .navigationBarTitleDisplayMode(.large)
            .searchable(text: $searchText, prompt: "Search shrines & temples")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button { showSettings = true } label: {
                        Image(systemName: "gearshape")
                            .font(.body.weight(.medium))
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button { showPassport = true } label: {
                        Image(systemName: "person.text.rectangle")
                            .font(.body.weight(.medium))
                    }
                }
            }
            .sheet(isPresented: $showSettings) {
                SettingsView()
            }
            .sheet(isPresented: $showPassport) {
                ShrinePassportView()
            }
            .sheet(isPresented: $showLevelDetail) {
                LevelDetailView(
                    collectedIds: collectedIds,
                    stampCount: collectedStamps.count,
                    achievementsByCategory: achievementsByCategory
                )
            }
            .navigationDestination(for: StampDefinition.self) { stamp in
                StampDetailView(stamp: stamp)
            }
        }
        .sensoryFeedback(.impact(weight: .medium), trigger: collectedStamps.count)
    }

    // MARK: - Level Card

    private var levelCard: some View {
        Button { showLevelDetail = true } label: {
            HStack(spacing: DS.Spacing.lg) {
                // Flat-illustration avatar badge with a soft level-color glow.
                AvatarView(level: level, size: 72)
                    .shadow(color: level.color.opacity(0.35), radius: 10, y: 3)

                VStack(alignment: .leading, spacing: DS.Spacing.xs) {
                    HStack(spacing: DS.Spacing.xs) {
                        Text("Lv.\(level.rawValue)")
                            .font(DS.Font.chipLabel)
                            .foregroundStyle(.white)
                            .padding(.horizontal, 6)
                            .padding(.vertical, 2)
                            .background(level.color, in: Capsule())
                        Text(level.title)
                            .font(.headline)
                            .foregroundStyle(Color.bodyText)
                    }
                    Text(level.subtitle)
                        .font(.caption.weight(.medium))
                        .foregroundStyle(Color.subtitleText)

                    if level.next != nil {
                        VStack(alignment: .leading, spacing: 4) {
                            ProgressBar(
                                progress: level.progressToNext(current: collectedStamps.count),
                                color: level.color,
                                height: 10
                            )
                            if let toNext = level.stampsToNext(current: collectedStamps.count) {
                                Text("\(toNext) to go")
                                    .font(DS.Font.statCaption.weight(.semibold))
                                    .foregroundStyle(level.color)
                            }
                        }
                    } else {
                        Text("Max level reached!")
                            .font(.caption.weight(.semibold))
                            .foregroundStyle(level.color)
                    }
                }

                Spacer()

                VStack(spacing: 2) {
                    AnimatedCounter(
                        value: collectedStamps.count,
                        font: DS.Font.statMedium,
                        color: level.color
                    )
                    Text("/ \(StampDefinition.all.count)")
                        .font(.caption2)
                        .foregroundStyle(Color.captionText)
                }

                Image(systemName: "chevron.right")
                    .font(.caption.weight(.semibold))
                    .foregroundStyle(Color.captionText)
            }
            .cardStyle()
        }
        .buttonStyle(.pressable)
    }

    // MARK: - Stat Tiles

    private var statsRow: some View {
        HStack(spacing: DS.Spacing.md) {
            statTile(icon: "seal.fill", value: collectedStamps.count, caption: "Collected", color: .vermillion)
            statTile(icon: "chart.pie.fill", value: completionPercent, suffix: "%", caption: "Complete", color: .kincha)
            statTile(icon: "rosette", value: unlockedAchievements.count, caption: "Badges", color: .matcha)
        }
    }

    private func statTile(icon: String, value: Int, suffix: String = "", caption: String, color: Color) -> some View {
        VStack(spacing: DS.Spacing.xs) {
            Image(systemName: icon)
                .font(.caption)
                .foregroundStyle(color)
            HStack(alignment: .firstTextBaseline, spacing: 1) {
                AnimatedCounter(value: value, font: DS.Font.statSmall, color: .bodyText)
                if !suffix.isEmpty {
                    Text(suffix)
                        .font(.caption.weight(.bold))
                        .foregroundStyle(Color.bodyText)
                }
            }
            Text(caption.uppercased())
                .font(DS.Font.statCaption)
                .foregroundStyle(Color.captionText)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, DS.Spacing.md)
        .background(Color.cardBackground, in: RoundedRectangle(cornerRadius: DS.Radius.md))
        .shadow(color: .black.opacity(0.05), radius: 3, y: 1)
    }

    // MARK: - Recent Stamps Carousel

    private var recentSection: some View {
        VStack(alignment: .leading, spacing: DS.Spacing.md) {
            SectionHeader(title: "Recent Stamps", icon: "clock")

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: DS.Spacing.md) {
                    ForEach(recentStamps, id: \.record.id) { item in
                        recentCard(stamp: item.stamp, date: item.record.collectedDate)
                    }
                }
                .scrollTargetLayout()
            }
            .scrollTargetBehavior(.viewAligned)
            .scrollClipDisabled()
        }
    }

    private func recentCard(stamp: StampDefinition, date: Date) -> some View {
        NavigationLink(value: stamp) {
            VStack(spacing: DS.Spacing.sm) {
                GosyuinStampView(stamp: stamp, size: 92, showDate: false)

                VStack(spacing: 2) {
                    Text(stamp.name)
                        .font(.caption.weight(.semibold))
                        .foregroundStyle(Color.bodyText)
                        .lineLimit(1)
                    Text(date, format: .dateTime.month().day())
                        .font(.caption2)
                        .foregroundStyle(Color.captionText)
                }
            }
            .padding(DS.Spacing.md)
            .frame(width: 132)
            .background(Color.cardBackground, in: RoundedRectangle(cornerRadius: DS.Radius.lg))
            .shadow(color: .black.opacity(0.06), radius: 3, y: 1)
        }
        .buttonStyle(.pressable)
    }

    // MARK: - Empty State

    private var emptyStateCard: some View {
        VStack(spacing: DS.Spacing.lg) {
            IconBadge(icon: "building.columns", size: 72, color: .vermillion)

            VStack(spacing: DS.Spacing.xs) {
                Text("Start Your Journey")
                    .font(.title3.bold())
                Text("Visit a shrine or temple and get within 100m to collect your first stamp.")
                    .font(.subheadline)
                    .foregroundStyle(Color.subtitleText)
                    .multilineTextAlignment(.center)
                    .fixedSize(horizontal: false, vertical: true)
            }

            VStack(alignment: .leading, spacing: DS.Spacing.sm) {
                stepRow(number: "1", text: "Open the Explore tab")
                stepRow(number: "2", text: "Find a shrine nearby on the map")
                stepRow(number: "3", text: "Walk within 100m to collect your stamp")
            }
            .padding(DS.Spacing.md)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color.vermillion.opacity(0.05), in: RoundedRectangle(cornerRadius: DS.Radius.md))
        }
        .cardStyle()
    }

    private func stepRow(number: String, text: String) -> some View {
        HStack(spacing: DS.Spacing.sm) {
            Text(number)
                .font(.caption.bold())
                .foregroundStyle(.white)
                .frame(width: 20, height: 20)
                .background(Color.vermillion, in: Circle())
            Text(text)
                .font(.caption.weight(.medium))
                .foregroundStyle(Color.bodyText)
            Spacer()
        }
    }

    // MARK: - Category Filter (sticky header)

    private var categoryFilter: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: DS.Spacing.sm) {
                // "All" — text-only since no category icon
                chipButton(label: "All", isSelected: selectedCategory == nil) {
                    withAnimation(DS.Anim.select) {
                        selectedCategory = nil
                    }
                }
                ForEach(stampsByCategory, id: \.category) { section in
                    let cat = section.category
                    let collected = section.stamps.filter { collectedIds.contains($0.id) }.count
                    iconChipButton(
                        icon: cat.icon,
                        count: "\(collected)/\(section.stamps.count)",
                        accessibilityLabel: "\(cat.displayName) \(collected) of \(section.stamps.count)",
                        isSelected: selectedCategory == cat,
                        color: cat.color
                    ) {
                        withAnimation(DS.Anim.select) {
                            selectedCategory = selectedCategory == cat ? nil : cat
                        }
                    }
                }
            }
            .padding(.horizontal, 1) // avoid clipped edge highlight
        }
        .mask(
            // Fade the right edge so users see chips are scrollable
            HStack(spacing: 0) {
                Rectangle().fill(.black)
                LinearGradient(
                    colors: [.black, .clear],
                    startPoint: .leading,
                    endPoint: .trailing
                )
                .frame(width: 24)
            }
        )
        .sensoryFeedback(.selection, trigger: selectedCategory)
    }

    private func chipButton(label: String, isSelected: Bool, color: Color = .vermillion, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            Text(label)
                .font(.caption.weight(.semibold))
                .foregroundStyle(isSelected ? .white : .primary)
                .padding(.horizontal, 14)
                .padding(.vertical, 7)
                .background(isSelected ? color : Color(.quaternarySystemFill), in: Capsule())
        }
        .buttonStyle(.pressable)
    }

    /// Compact category chip — icon + count only. Full name is in accessibility label.
    private func iconChipButton(
        icon: String,
        count: String,
        accessibilityLabel: String,
        isSelected: Bool,
        color: Color,
        action: @escaping () -> Void
    ) -> some View {
        Button(action: action) {
            HStack(spacing: 5) {
                Image(systemName: icon)
                    .font(.caption.weight(.semibold))
                Text(count)
                    .font(.caption.weight(.semibold).monospacedDigit())
            }
            .foregroundStyle(isSelected ? .white : color)
            .padding(.horizontal, 12)
            .padding(.vertical, 7)
            .background(
                Capsule()
                    .fill(isSelected ? color : color.opacity(0.10))
            )
            .overlay(
                Capsule()
                    .strokeBorder(isSelected ? .clear : color.opacity(0.22), lineWidth: 1)
            )
        }
        .buttonStyle(.pressable)
        .accessibilityLabel(accessibilityLabel)
    }

    // MARK: - Stamp Grid Sections

    private func categorySection(_ section: (category: ShrineCategory, stamps: [StampDefinition])) -> some View {
        VStack(alignment: .leading, spacing: DS.Spacing.md) {
            HStack(spacing: DS.Spacing.sm) {
                Image(systemName: section.category.icon)
                    .font(.caption.weight(.semibold))
                    .foregroundStyle(section.category.color)
                Text(section.category.displayName)
                    .font(.subheadline.weight(.semibold))
                    .foregroundStyle(Color.bodyText)
                Spacer()
                let collected = section.stamps.filter { collectedIds.contains($0.id) }.count
                Text("\(collected)/\(section.stamps.count)")
                    .font(DS.Font.chipLabel)
                    .foregroundStyle(Color.captionText)
                    .contentTransition(.numericText())
                    .animation(DS.Anim.select, value: collected)
            }

            LazyVGrid(columns: gridColumns, spacing: DS.Spacing.md) {
                ForEach(section.stamps) { stamp in
                    stampCell(stamp)
                }
            }
        }
        .padding(DS.Spacing.lg)
        .background(washi, in: RoundedRectangle(cornerRadius: DS.Radius.lg))
        .shadow(color: .black.opacity(0.05), radius: 3, y: 1)
    }

    private func stampCell(_ stamp: StampDefinition) -> some View {
        let isCollected = collectedIds.contains(stamp.id)
        return NavigationLink(value: stamp) {
            GeometryReader { geo in
                let size = geo.size.width
                Group {
                    if isCollected {
                        GosyuinStampView(
                            stamp: stamp,
                            size: size,
                            showDate: false,
                            collectedDate: collectedStamps.first { $0.slotId == stamp.id }?.collectedDate
                        )
                        .transition(.scale(scale: 0.5).combined(with: .opacity))
                    } else {
                        UncollectedStampCard(stampId: stamp.id)
                            .transition(.opacity)
                    }
                }
                .frame(width: size, height: size)
                .animation(DS.Anim.reveal, value: isCollected)
            }
            .aspectRatio(1, contentMode: .fit)
        }
        .buttonStyle(.stamp)
        // Cells gently fade + scale in as they scroll into view
        .scrollTransition(.interactive) { content, phase in
            content
                .opacity(phase.isIdentity ? 1 : 0.35)
                .scaleEffect(phase.isIdentity ? 1 : 0.9)
        }
    }
}

// MARK: - Uncollected Stamp Card
//
// Renders a category-aware silhouette (paper-tone tile + category icon + soft tint)
// instead of a generic "?" placeholder. Reduces the depressing-empty-grid effect
// when the user has many uncollected stamps.

private struct UncollectedStampCard: View {
    let stampId: Int
    private var isHexagon: Bool { stampId % 2 != 0 }

    /// Resolve the shrine + its category for this stamp slot. Falls back to .jinja.
    private var category: ShrineCategory {
        Self.categoryForStamp[stampId] ?? .jinja
    }

    private static let categoryForStamp: [Int: ShrineCategory] = {
        Dictionary(uniqueKeysWithValues: Shrine.samples.map { ($0.stampSlotId, $0.category) })
    }()

    var body: some View {
        let tint = category.color
        ZStack {
            // Paper-tone fill with subtle category tint
            Group {
                if isHexagon {
                    HexagonShape()
                        .fill(tint.opacity(0.06))
                    HexagonShape()
                        .strokeBorder(tint.opacity(0.25), lineWidth: 1)
                } else {
                    Circle()
                        .fill(tint.opacity(0.06))
                    Circle()
                        .strokeBorder(tint.opacity(0.25), lineWidth: 1)
                }
            }

            // Category silhouette (soft, 30% opacity)
            Image(systemName: category.icon)
                .font(.system(size: 22, weight: .regular))
                .foregroundStyle(tint.opacity(0.35))
        }
        .aspectRatio(1, contentMode: .fit)
    }
}

// MARK: - Achievements Detail View (full list, shown in sheet)

struct AchievementsDetailView: View {
    let collectedIds: Set<Int>
    let achievementsByCategory: [(category: AchievementCategory, achievements: [Achievement])]
    @Environment(\.dismiss) private var dismiss

    private var unlockedCount: Int {
        Achievement.all.filter { $0.requirement(collectedIds, Shrine.samples) }.count
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: DS.Spacing.xl) {
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
                .padding(DS.Spacing.lg)
            }
            .background(Color.pageBackground)
            .navigationTitle("Achievements")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Text("\(unlockedCount)/\(Achievement.all.count)")
                        .font(.caption.weight(.semibold))
                        .foregroundStyle(Color.captionText)
                }
                ToolbarItem(placement: .topBarLeading) {
                    Button { dismiss() } label: {
                        Image(systemName: "xmark.circle.fill")
                            .font(.title2)
                            .symbolRenderingMode(.hierarchical)
                            .foregroundStyle(Color.subtitleText)
                    }
                }
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

#Preview {
    CollectView()
        .modelContainer(for: [CollectedStamp.self], inMemory: true)
}
