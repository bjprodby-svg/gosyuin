import SwiftUI
import SwiftData

struct CollectView: View {
    @Query private var collectedStamps: [CollectedStamp]
    @Environment(\.modelContext) private var modelContext
    @State private var appeared = false
    @State private var locationService = LocationService()
    @State private var selectedCategory: ShrineCategory? = nil
    @State private var showPassport = false

    private let columns = Array(repeating: GridItem(.flexible(), spacing: DS.Spacing.md), count: 3)

    private var collectedIds: Set<Int> {
        Set(collectedStamps.map(\.slotId))
    }

    private var level: CollectorLevel {
        CollectorLevel.level(for: collectedStamps.count)
    }

    private var unlockedAchievements: [Achievement] {
        Achievement.all.filter { $0.requirement(collectedIds, Shrine.samples) }
    }

    private var lockedAchievements: [Achievement] {
        Achievement.all.filter { !$0.requirement(collectedIds, Shrine.samples) }
    }

    // Group stamps by ShrineCategory
    private var stampsByCategory: [(category: ShrineCategory, stamps: [StampDefinition])] {
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
    }

    private var filteredCategories: [(category: ShrineCategory, stamps: [StampDefinition])] {
        if let selected = selectedCategory {
            return stampsByCategory.filter { $0.category == selected }
        }
        return stampsByCategory
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: DS.Spacing.xl) {
                    // Unified level + achievements + next goal
                    levelCard

                    // Category filter
                    categoryFilter

                    // Stamp grids by category
                    ForEach(filteredCategories, id: \.category) { section in
                        categorySectionView(section.category, stamps: section.stamps)
                    }
                }
                .padding(DS.Spacing.lg)
            }
            .background(Color.pageBackground)
            .navigationTitle("Stamp Book")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button { showPassport = true } label: {
                        Image(systemName: "person.text.rectangle")
                            .font(.body.weight(.medium))
                    }
                }
            }
            .sheet(isPresented: $showPassport) {
                ShrinePassportView()
            }
            .navigationDestination(for: StampDefinition.self) { stamp in
                StampDetailView(stamp: stamp)
            }
            .onAppear {
                withAnimation(.spring(duration: 0.5)) { appeared = true }
            }
            #if DEBUG
            .onAppear(perform: seedSampleDataIfNeeded)
            #endif
        }
        .sensoryFeedback(.impact(weight: .medium), trigger: collectedStamps.count)
    }

    // MARK: - Level Card

    private var levelCard: some View {
        VStack(spacing: DS.Spacing.lg) {
            // Level badge + title
            HStack(spacing: DS.Spacing.md) {
                ZStack {
                    Circle()
                        .fill(level.color.gradient)
                        .frame(width: 56, height: 56)
                    Image(systemName: level.icon)
                        .font(.title2.weight(.bold))
                        .foregroundStyle(.white)
                }
                .shadow(color: level.color.opacity(0.4), radius: 6, y: 2)

                VStack(alignment: .leading, spacing: DS.Spacing.xs) {
                    HStack(spacing: DS.Spacing.xs) {
                        Text(level.kanji)
                            .font(.caption.weight(.bold))
                            .foregroundStyle(level.color)
                        Text("Lv.\(level.rawValue)")
                            .font(.caption2.weight(.medium))
                            .foregroundStyle(.secondary)
                    }
                    Text(level.title)
                        .font(.title3.bold())
                    Text(level.subtitle)
                        .font(.caption2.weight(.medium))
                        .foregroundStyle(.secondary)
                }

                Spacer()

                VStack(spacing: 2) {
                    Text("\(collectedStamps.count)")
                        .font(.system(size: 28, weight: .bold, design: .rounded))
                        .foregroundStyle(level.color)
                    Text("/ \(StampDefinition.all.count)")
                        .font(.caption2)
                        .foregroundStyle(.tertiary)
                }
            }

            // XP bar
            if let next = level.next {
                HStack(spacing: DS.Spacing.sm) {
                    GeometryReader { geo in
                        ZStack(alignment: .leading) {
                            Capsule().fill(Color.progressEmpty)
                            Capsule()
                                .fill(level.color.gradient)
                                .frame(width: geo.size.width * level.progressToNext(current: collectedStamps.count))
                                .animation(.spring(duration: 0.6), value: collectedStamps.count)
                        }
                    }
                    .frame(height: 8)

                    if let toNext = level.stampsToNext(current: collectedStamps.count) {
                        Text("\(toNext) to \(next.title)")
                            .font(.caption2.weight(.medium))
                            .foregroundStyle(.secondary)
                            .fixedSize()
                    }
                }
            } else {
                Text("Max level reached!")
                    .font(.caption.weight(.semibold))
                    .foregroundStyle(level.color)
            }

            // Divider
            Rectangle()
                .fill(Color.primary.opacity(0.06))
                .frame(height: 1)

            // Achievements
            VStack(alignment: .leading, spacing: DS.Spacing.sm) {
                HStack {
                    Text("Achievements")
                        .font(.subheadline.weight(.semibold))
                    Spacer()
                    Text("\(unlockedAchievements.count)/\(Achievement.all.count)")
                        .font(.caption2.weight(.medium))
                        .foregroundStyle(.secondary)
                }

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: DS.Spacing.sm) {
                        ForEach(unlockedAchievements) { achievement in
                            achievementBadge(achievement, unlocked: true)
                        }
                        ForEach(lockedAchievements) { achievement in
                            achievementBadge(achievement, unlocked: false)
                        }
                    }
                }
            }

            // Next goal
            if let nextLocked = lockedAchievements.first {
                HStack(spacing: DS.Spacing.sm) {
                    Image(systemName: "target")
                        .font(.callout)
                        .foregroundStyle(Color.vermillion)

                    Text(nextLocked.description)
                        .font(.caption.weight(.medium))
                        .foregroundStyle(.secondary)

                    Spacer()

                    Image(systemName: nextLocked.icon)
                        .font(.callout)
                        .foregroundStyle(Color.placeholderIcon)
                }
                .padding(DS.Spacing.sm)
                .background(Color.vermillion.opacity(0.06), in: RoundedRectangle(cornerRadius: DS.Radius.sm))
            }
        }
        .padding(DS.Spacing.lg)
        .background(Color.cardBackground, in: RoundedRectangle(cornerRadius: DS.Radius.lg))
        .shadow(color: .black.opacity(0.06), radius: 4, y: 2)
    }

    private func achievementBadge(_ achievement: Achievement, unlocked: Bool) -> some View {
        VStack(spacing: DS.Spacing.xs) {
            ZStack {
                Circle()
                    .fill(unlocked ? achievement.color.opacity(0.15) : Color.progressEmpty)
                    .frame(width: 44, height: 44)
                if unlocked {
                    Circle()
                        .strokeBorder(achievement.color, lineWidth: 2)
                        .frame(width: 44, height: 44)
                }
                Image(systemName: achievement.icon)
                    .font(.body)
                    .foregroundStyle(unlocked ? achievement.color : Color.placeholderIcon)
            }

            Text(achievement.title)
                .font(.system(size: 9, weight: .medium))
                .foregroundStyle(unlocked ? .primary : .tertiary)
                .lineLimit(1)
                .frame(width: 56)
                .multilineTextAlignment(.center)
        }
    }

    // MARK: - Category Filter

    private var categoryFilter: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: DS.Spacing.sm) {
                chipButton(label: "All", isSelected: selectedCategory == nil) {
                    withAnimation(.spring(duration: 0.25)) { selectedCategory = nil }
                }
                ForEach(stampsByCategory, id: \.category) { section in
                    let cat = section.category
                    let collected = section.stamps.filter { collectedIds.contains($0.id) }.count
                    chipButton(
                        label: "\(cat.displayName) \(collected)/\(section.stamps.count)",
                        isSelected: selectedCategory == cat,
                        color: cat.color
                    ) {
                        withAnimation(.spring(duration: 0.25)) {
                            selectedCategory = selectedCategory == cat ? nil : cat
                        }
                    }
                }
            }
        }
    }

    private func chipButton(label: String, isSelected: Bool, color: Color = .vermillion, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            Text(label)
                .font(.caption.weight(.medium))
                .foregroundStyle(isSelected ? .white : .primary)
                .padding(.horizontal, 12)
                .padding(.vertical, 6)
                .background(isSelected ? color : Color(.quaternarySystemFill), in: Capsule())
        }
        .buttonStyle(.plain)
    }

    // MARK: - Category Section

    private func categorySectionView(_ category: ShrineCategory, stamps: [StampDefinition]) -> some View {
        let collected = stamps.filter { collectedIds.contains($0.id) }.count
        let progress = Double(collected) / Double(stamps.count)

        return VStack(alignment: .leading, spacing: DS.Spacing.md) {
            HStack(spacing: DS.Spacing.md) {
                // Progress ring
                ZStack {
                    Circle()
                        .stroke(Color.progressEmpty, lineWidth: 3)
                        .frame(width: 36, height: 36)
                    Circle()
                        .trim(from: 0, to: progress)
                        .stroke(category.color, style: StrokeStyle(lineWidth: 3, lineCap: .round))
                        .frame(width: 36, height: 36)
                        .rotationEffect(.degrees(-90))
                        .animation(.spring(duration: 0.5), value: collected)

                    Image(systemName: category.icon)
                        .font(.system(size: 12))
                        .foregroundStyle(category.color)
                }

                VStack(alignment: .leading, spacing: 2) {
                    Text(category.displayName)
                        .font(.subheadline.weight(.semibold))
                    Text("\(collected)/\(stamps.count) collected")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }

                Spacer()

                if collected == stamps.count {
                    Label("Complete", systemImage: "checkmark.seal.fill")
                        .font(.caption2.weight(.bold))
                        .foregroundStyle(.white)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(category.color, in: Capsule())
                } else {
                    Text("\(Int(progress * 100))%")
                        .font(.caption.weight(.bold).monospacedDigit())
                        .foregroundStyle(category.color)
                }
            }

            LazyVGrid(columns: columns, spacing: DS.Spacing.md) {
                ForEach(stamps) { stamp in
                    NavigationLink(value: stamp) {
                        GeometryReader { geo in
                            let size = geo.size.width
                            if collectedIds.contains(stamp.id) {
                                GosyuinStampView(
                                    stamp: stamp,
                                    size: size,
                                    showDate: false,
                                    collectedDate: collectedStamps.first { $0.slotId == stamp.id }?.collectedDate
                                )
                                .frame(width: size, height: size)
                            } else {
                                UncollectedStampCard(stampId: stamp.id)
                                    .frame(width: size, height: size)
                            }
                        }
                        .aspectRatio(1, contentMode: .fit)
                    }
                    .buttonStyle(.stamp)
                }
            }
        }
        .padding(DS.Spacing.lg)
        .background(Color.cardBackground, in: RoundedRectangle(cornerRadius: DS.Radius.lg))
        .shadow(color: .black.opacity(0.04), radius: 3, y: 1)
    }

    // MARK: - Seed (Debug Only)

    #if DEBUG
    private func seedSampleDataIfNeeded() {
        guard collectedStamps.isEmpty else { return }
        let calendar = Calendar.current
        for slotId in 1...5 {
            let daysAgo = (5 - slotId) * 7
            let date = calendar.date(byAdding: .day, value: -daysAgo, to: .now) ?? .now
            modelContext.insert(CollectedStamp(slotId: slotId, collectedDate: date))
        }
    }
    #endif
}

// MARK: - Uncollected Stamp Card

private struct UncollectedStampCard: View {
    let stampId: Int
    private var isHexagon: Bool { stampId % 2 != 0 }

    var body: some View {
        ZStack {
            if isHexagon {
                HexagonShape()
                    .fill(Color.progressEmpty)
                HexagonShape()
                    .stroke(
                        Color.placeholderIcon.opacity(0.4),
                        style: StrokeStyle(lineWidth: 1, dash: [4, 3])
                    )
            } else {
                Circle()
                    .fill(Color.progressEmpty)
                Circle()
                    .strokeBorder(
                        Color.placeholderIcon.opacity(0.4),
                        style: StrokeStyle(lineWidth: 1, dash: [4, 3])
                    )
            }
            Text("?")
                .font(.system(size: 24, weight: .light))
                .foregroundStyle(Color.placeholderIcon)
        }
        .aspectRatio(1, contentMode: .fit)
    }
}

#Preview {
    CollectView()
        .modelContainer(for: [CollectedStamp.self], inMemory: true)
}
