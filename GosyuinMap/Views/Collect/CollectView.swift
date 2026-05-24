import SwiftUI
import SwiftData

struct CollectView: View {
    @Query private var collectedStamps: [CollectedStamp]
    @Environment(\.modelContext) private var modelContext
    @State private var appeared = false
    @State private var selectedCategory: ShrineCategory? = nil
    @State private var showSettings = false
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

    private var totalStamps: Int { StampDefinition.all.count }

    private var progress: Double {
        guard totalStamps > 0 else { return 0 }
        return Double(collectedStamps.count) / Double(totalStamps)
    }

    private var thisWeekCount: Int {
        let calendar = Calendar.current
        guard let weekAgo = calendar.date(byAdding: .day, value: -7, to: .now) else { return 0 }
        return collectedStamps.filter { $0.collectedDate >= weekAgo }.count
    }

    private var thisMonthCount: Int {
        let calendar = Calendar.current
        guard let monthAgo = calendar.date(byAdding: .day, value: -30, to: .now) else { return 0 }
        return collectedStamps.filter { $0.collectedDate >= monthAgo }.count
    }

    private var lastCollectedDate: Date? {
        collectedStamps.map(\.collectedDate).max()
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: DS.Spacing.xl) {
                    statsHero

                    if collectedStamps.isEmpty {
                        emptyStateCard
                            .transition(.scale(scale: 0.95).combined(with: .opacity))
                    }

                    categoryFilter

                    gosyuinBook
                }
                .padding(DS.Spacing.lg)
                .padding(.bottom, DS.Spacing.xxl)
            }
            .background(Color.pageBackground)
            .navigationTitle("Stamp Book")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button { showSettings = true } label: {
                        Image(systemName: "gearshape")
                            .font(.body.weight(.medium))
                    }
                }
            }
            .sheet(isPresented: $showSettings) {
                SettingsView()
            }
            .navigationDestination(for: StampDefinition.self) { stamp in
                StampDetailView(stamp: stamp)
            }
            .onAppear {
                withAnimation(DS.Anim.collect) { appeared = true }
            }
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

    // MARK: - Stats Hero

    private var statsHero: some View {
        VStack(spacing: DS.Spacing.lg) {
            // Label
            HStack {
                Text("STAMPS COLLECTED")
                    .font(DS.Font.sectionLabel)
                    .foregroundStyle(Color.subtitleText)
                    .tracking(1.5)
                Spacer()
                Text("\(Int(progress * 100))%")
                    .font(DS.Font.chipLabel)
                    .foregroundStyle(Color.vermillion)
            }

            // Big count + denominator
            HStack(alignment: .firstTextBaseline, spacing: DS.Spacing.sm) {
                AnimatedCounter(
                    value: collectedStamps.count,
                    font: DS.Font.statHero,
                    color: .vermillion
                )
                Text("/ \(totalStamps)")
                    .font(.title3.weight(.semibold).monospacedDigit())
                    .foregroundStyle(Color.captionText)
                Spacer()
            }

            // Progress bar
            ProgressBar(progress: progress, color: .vermillion, height: 10)

            // Sub-stats row
            HStack(spacing: 0) {
                subStat(value: "\(thisWeekCount)", label: "This week")
                subStatDivider
                subStat(value: "\(thisMonthCount)", label: "This month")
                subStatDivider
                subStat(value: lastCollectedLabel, label: "Last stamp")
            }
        }
        .cardStyle()
    }

    private var lastCollectedLabel: String {
        guard let date = lastCollectedDate else { return "—" }
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d"
        return formatter.string(from: date)
    }

    private func subStat(value: String, label: String) -> some View {
        VStack(spacing: 2) {
            Text(value)
                .font(DS.Font.statSmall.monospacedDigit())
                .foregroundStyle(Color.bodyText)
            Text(label)
                .font(DS.Font.statCaption)
                .foregroundStyle(Color.subtitleText)
        }
        .frame(maxWidth: .infinity)
    }

    private var subStatDivider: some View {
        Rectangle()
            .fill(Color.divider)
            .frame(width: 1, height: 28)
    }

    // MARK: - Category Filter

    private var categoryFilter: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: DS.Spacing.sm) {
                // "All" — text-only since no category icon
                chipButton(label: "All", isSelected: selectedCategory == nil) {
                    withAnimation(DS.Anim.select) {
                        selectedCategory = nil
                        currentBookPage = 0
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
                            currentBookPage = 0
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
        .buttonStyle(.plain)
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
        .buttonStyle(.plain)
        .accessibilityLabel(accessibilityLabel)
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
                            let isCollected = collectedIds.contains(stamp.id)
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
                }
            }
            .padding(.horizontal, DS.Spacing.lg)
            .padding(.vertical, DS.Spacing.md)

            Spacer()
        }
        .background(Color(red: 0.98, green: 0.96, blue: 0.93))
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
                withAnimation(DS.Anim.select) {
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
                withAnimation(DS.Anim.select) {
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

#Preview {
    CollectView()
        .modelContainer(for: [CollectedStamp.self], inMemory: true)
}
