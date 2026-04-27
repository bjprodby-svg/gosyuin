import SwiftUI
import SwiftData

struct CollectView: View {
    @Query private var collectedStamps: [CollectedStamp]
    @Environment(\.modelContext) private var modelContext
    @State private var appeared = false
    @State private var locationService = LocationService()
    @State private var selectedCategory: ShrineCategory? = nil
    @State private var showPassport = false
    @State private var showAllAchievements = false
    @State private var currentBookPage: Int = 0

    private let bookColumns = [
        GridItem(.flexible(), spacing: DS.Spacing.md),
        GridItem(.flexible(), spacing: DS.Spacing.md),
        GridItem(.flexible(), spacing: DS.Spacing.md)
    ]
    private let stampsPerPage = 6

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

    /// All stamps for the current filter, used by the book
    private var bookStamps: [StampDefinition] {
        if let selected = selectedCategory {
            return stampsByCategory.first { $0.category == selected }?.stamps ?? []
        }
        return stampsByCategory.flatMap(\.stamps)
    }

    private var bookPages: [[StampDefinition]] {
        stride(from: 0, to: bookStamps.count, by: stampsPerPage).map {
            Array(bookStamps[$0..<min($0 + stampsPerPage, bookStamps.count)])
        }
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: DS.Spacing.xl) {
                    levelCard
                    achievementsSummary

                    if collectedStamps.isEmpty {
                        emptyStateCard
                    }

                    categoryFilter

                    // Gosyuin Book
                    gosyuinBook
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
            .sheet(isPresented: $showAllAchievements) {
                AchievementsDetailView(
                    collectedIds: collectedIds,
                    achievementsByCategory: achievementsByCategory
                )
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

    // MARK: - Level Card

    private var levelCard: some View {
        HStack(spacing: DS.Spacing.lg) {
            ZStack {
                Circle()
                    .fill(level.color.gradient)
                    .frame(width: 64, height: 64)
                VStack(spacing: 0) {
                    Text(level.kanji)
                        .font(.system(size: 22, weight: .bold))
                        .foregroundStyle(.white)
                    Image(systemName: level.icon)
                        .font(.system(size: 12, weight: .bold))
                        .foregroundStyle(.white.opacity(0.8))
                }
            }
            .shadow(color: level.color.opacity(0.4), radius: 8, y: 3)

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
                }
                Text(level.subtitle)
                    .font(.caption.weight(.medium))
                    .foregroundStyle(Color.subtitleText)

                if level.next != nil {
                    HStack(spacing: DS.Spacing.sm) {
                        ProgressBar(
                            progress: level.progressToNext(current: collectedStamps.count),
                            color: level.color,
                            height: 6
                        )
                        if let toNext = level.stampsToNext(current: collectedStamps.count) {
                            Text("\(toNext) to go")
                                .font(DS.Font.statCaption)
                                .foregroundStyle(Color.captionText)
                                .fixedSize()
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
                Text("\(collectedStamps.count)")
                    .font(DS.Font.statMedium)
                    .foregroundStyle(level.color)
                Text("/ \(StampDefinition.all.count)")
                    .font(.caption2)
                    .foregroundStyle(Color.captionText)
            }
        }
        .cardStyle()
    }

    // MARK: - Achievements Summary (compact, tappable)

    private var achievementsSummary: some View {
        Button { showAllAchievements = true } label: {
            HStack(spacing: DS.Spacing.md) {
                // Recent unlocked badges (show up to 3)
                HStack(spacing: -8) {
                    ForEach(unlockedAchievements.suffix(3)) { badge in
                        IconBadge(icon: badge.icon, size: 32, color: badge.color)
                            .background(Color.cardBackground, in: Circle())
                    }
                }

                VStack(alignment: .leading, spacing: 2) {
                    Text("\(unlockedAchievements.count)/\(Achievement.all.count) Achievements")
                        .font(.subheadline.weight(.semibold))
                        .foregroundStyle(Color.bodyText)

                    if let nextLocked = lockedAchievements.first {
                        HStack(spacing: DS.Spacing.xs) {
                            Text("Next:")
                                .font(.caption)
                                .foregroundStyle(Color.captionText)
                            Text(nextLocked.description)
                                .font(.caption)
                                .foregroundStyle(Color.subtitleText)
                                .lineLimit(1)
                        }
                    }
                }

                Spacer()

                Image(systemName: "chevron.right")
                    .font(.caption.weight(.semibold))
                    .foregroundStyle(Color.captionText)
            }
            .cardStyle()
        }
        .buttonStyle(.pressable)
    }

    // MARK: - Category Filter

    private var categoryFilter: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: DS.Spacing.sm) {
                chipButton(label: "All", isSelected: selectedCategory == nil) {
                    withAnimation(.spring(duration: 0.25)) {
                        selectedCategory = nil
                        currentBookPage = 0
                    }
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
                            currentBookPage = 0
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

    // MARK: - Gosyuin Book (paginated, book-style)

    private var gosyuinBook: some View {
        VStack(spacing: 0) {
            // Book cover header
            bookHeader

            // Paged stamp spreads
            TabView(selection: $currentBookPage) {
                ForEach(bookPages.indices, id: \.self) { pageIndex in
                    bookPage(stamps: bookPages[pageIndex], pageNumber: pageIndex + 1)
                        .tag(pageIndex)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .frame(height: 340)

            // Page indicator
            bookFooter
        }
        .background(Color.cardBackground, in: RoundedRectangle(cornerRadius: DS.Radius.lg))
        .shadow(color: .black.opacity(0.06), radius: 4, y: 2)
    }

    private var bookHeader: some View {
        HStack {
            if let cat = selectedCategory {
                Image(systemName: cat.icon)
                    .font(.caption)
                    .foregroundStyle(cat.color)
                Text(cat.displayName)
                    .font(.caption.weight(.semibold))
                    .foregroundStyle(Color.bodyText)
            } else {
                Image(systemName: "book.closed.fill")
                    .font(.caption)
                    .foregroundStyle(Color.vermillion)
                Text("All Stamps")
                    .font(.caption.weight(.semibold))
                    .foregroundStyle(Color.bodyText)
            }
            Spacer()
            let total = bookStamps.count
            let collected = bookStamps.filter { collectedIds.contains($0.id) }.count
            Text("\(collected)/\(total)")
                .font(DS.Font.chipLabel)
                .foregroundStyle(Color.captionText)
        }
        .padding(.horizontal, DS.Spacing.lg)
        .padding(.top, DS.Spacing.lg)
        .padding(.bottom, DS.Spacing.sm)
    }

    private func bookPage(stamps: [StampDefinition], pageNumber: Int) -> some View {
        VStack(spacing: 0) {
            // Washi paper page
            LazyVGrid(columns: bookColumns, spacing: DS.Spacing.md) {
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
            .padding(.horizontal, DS.Spacing.lg)
            .padding(.vertical, DS.Spacing.md)

            Spacer()
        }
        .background(
            // Washi paper texture
            ZStack {
                Color(red: 0.98, green: 0.96, blue: 0.93)
                // Subtle fiber lines
                Canvas { context, size in
                    for i in 0..<8 {
                        let y = CGFloat(i) * size.height / 8 + CGFloat.random(in: -5...5)
                        var path = Path()
                        path.move(to: CGPoint(x: 0, y: y))
                        path.addLine(to: CGPoint(x: size.width, y: y + CGFloat.random(in: -2...2)))
                        context.stroke(path, with: .color(Color.black.opacity(0.02)), lineWidth: 0.5)
                    }
                }
            }
        )
        // Book spine shadow on leading edge
        .overlay(alignment: .leading) {
            LinearGradient(
                colors: [.black.opacity(0.06), .clear],
                startPoint: .leading,
                endPoint: .trailing
            )
            .frame(width: 8)
        }
        .clipShape(RoundedRectangle(cornerRadius: DS.Radius.sm))
        .padding(.horizontal, DS.Spacing.sm)
    }

    private var bookFooter: some View {
        HStack {
            Button {
                withAnimation(.spring(duration: 0.3)) {
                    currentBookPage = max(0, currentBookPage - 1)
                }
            } label: {
                Image(systemName: "chevron.left")
                    .font(.caption.weight(.semibold))
                    .foregroundStyle(currentBookPage > 0 ? Color.bodyText : Color.captionText)
            }
            .disabled(currentBookPage == 0)

            Spacer()

            Text("Page \(currentBookPage + 1) of \(max(bookPages.count, 1))")
                .font(.caption2.weight(.medium))
                .foregroundStyle(Color.captionText)

            Spacer()

            Button {
                withAnimation(.spring(duration: 0.3)) {
                    currentBookPage = min(bookPages.count - 1, currentBookPage + 1)
                }
            } label: {
                Image(systemName: "chevron.right")
                    .font(.caption.weight(.semibold))
                    .foregroundStyle(currentBookPage < bookPages.count - 1 ? Color.bodyText : Color.captionText)
            }
            .disabled(currentBookPage >= bookPages.count - 1)
        }
        .padding(.horizontal, DS.Spacing.lg)
        .padding(.vertical, DS.Spacing.md)
    }

    // MARK: - Seed (Debug Only)

    #if DEBUG
    private func seedSampleDataIfNeeded() {
        let calendar = Calendar.current
        let existingIds = Set(collectedStamps.map(\.slotId))
        let designedStampIds = [
            1, 2, 3, 19, 21, 27, 28, 29, 36, 41, 42, 46, 47, 48, 49, 82, 262,
        ]
        let missing = designedStampIds.filter { !existingIds.contains($0) }
        guard !missing.isEmpty else { return }
        for (index, slotId) in missing.enumerated() {
            let daysAgo = (missing.count - index) * 3
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

                            ForEach(section.achievements) { achievement in
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
