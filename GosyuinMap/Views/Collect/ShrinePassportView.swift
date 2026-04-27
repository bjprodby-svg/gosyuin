import SwiftUI
import SwiftData

// MARK: - Journey Summary View

struct ShrinePassportView: View {
    @Query private var collectedStamps: [CollectedStamp]
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationStack {
            ScrollView {
                JourneyCardContent(stamps: Array(collectedStamps))
                    .padding(DS.Spacing.lg)
                    .padding(.bottom, DS.Spacing.xxl)
            }
            .background(Color.pageBackground)
            .navigationTitle("My Journey")
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
                    ShareLink(item: shareImage, preview: SharePreview("My Gosyuin Journey", image: shareImage)) {
                        Image(systemName: "square.and.arrow.up.circle.fill")
                            .font(.title2)
                            .symbolRenderingMode(.hierarchical)
                            .foregroundStyle(Color.subtitleText)
                    }
                }
            }
        }
    }

    @MainActor
    private var shareImage: Image {
        let renderer = ImageRenderer(content:
            JourneyCardContent(stamps: Array(collectedStamps))
                .frame(width: 390)
        )
        renderer.scale = 3
        if let uiImage = renderer.uiImage {
            return Image(uiImage: uiImage)
        }
        return Image(systemName: "photo")
    }
}

// MARK: - Journey Card Content

private struct JourneyCardContent: View {
    let stamps: [CollectedStamp]
    @State private var trailAppeared = false

    private var collectedIds: Set<Int> {
        Set(stamps.map(\.slotId))
    }

    private var collectedShrines: [Shrine] {
        Shrine.samples.filter { collectedIds.contains($0.stampSlotId) }
    }

    private var level: CollectorLevel {
        CollectorLevel.level(for: stamps.count)
    }

    private var categoriesVisited: Set<ShrineCategory> {
        Set(collectedShrines.map(\.category))
    }

    private var prefectures: Set<String> {
        Set(collectedShrines.compactMap { shrine in
            let addr = shrine.address
            if let idx = addr.firstIndex(of: ",") {
                return String(addr[addr.startIndex..<idx]).trimmingCharacters(in: .whitespaces)
            }
            return addr.components(separatedBy: " ").first
        })
    }

    private var chronological: [Shrine] {
        let dateMap = Dictionary(uniqueKeysWithValues: stamps.map { ($0.slotId, $0.collectedDate) })
        return collectedShrines.sorted {
            (dateMap[$0.stampSlotId] ?? .distantPast) < (dateMap[$1.stampSlotId] ?? .distantPast)
        }
    }

    private var unlockedBadgeCount: Int {
        Achievement.all.filter { $0.requirement(collectedIds, Shrine.samples) }.count
    }

    var body: some View {
        VStack(spacing: 0) {
            headerSection
                .padding(.bottom, DS.Spacing.xl)

            pilgrimageTrail
                .padding(.bottom, DS.Spacing.xl)

            mapSection
                .padding(.bottom, DS.Spacing.xl)

            heroStat
                .padding(.bottom, DS.Spacing.lg)

            supportingStats
                .padding(.bottom, DS.Spacing.xl)

            Divider()
                .foregroundStyle(Color.divider)
                .padding(.horizontal, DS.Spacing.xl)
                .padding(.bottom, DS.Spacing.xl)

            badgeSummary
                .padding(.bottom, DS.Spacing.xl)

            progressSection
                .padding(.bottom, DS.Spacing.lg)

            brandingSection
        }
        .padding(.vertical, 28)
        .background(Color.cardBackground)
        .clipShape(RoundedRectangle(cornerRadius: DS.Radius.xl))
        .shadow(color: .black.opacity(0.08), radius: 16, y: 6)
        .onAppear { trailAppeared = true }
    }

    // MARK: - Header

    private var headerSection: some View {
        HStack(alignment: .center) {
            VStack(alignment: .leading, spacing: DS.Spacing.xs) {
                Text("MY GOSYUIN JOURNEY")
                    .font(DS.Font.sectionLabel)
                    .foregroundStyle(Color.subtitleText)
                    .tracking(2.0)

                HStack(alignment: .firstTextBaseline, spacing: DS.Spacing.sm) {
                    Text(level.kanji)
                        .font(.system(size: 28, weight: .bold))
                        .foregroundStyle(level.color)
                    Text(level.title)
                        .font(.system(size: 18, weight: .bold))
                        .foregroundStyle(level.color)
                }

                Text("Lv.\(level.rawValue) \u{2022} \(level.subtitle)")
                    .font(.system(size: 12, weight: .medium))
                    .foregroundStyle(Color.subtitleText)
            }

            Spacer()

            IconBadge(icon: level.icon, size: 52, color: level.color)
        }
        .padding(.horizontal, DS.Spacing.xl)
    }

    // MARK: - Pilgrimage Trail (horizontal path metaphor)

    private var pilgrimageTrail: some View {
        VStack(alignment: .leading, spacing: DS.Spacing.md) {
            GeometryReader { geo in
                let totalWidth = geo.size.width
                let nodeCount = CollectorLevel.allCases.count
                let spacing = totalWidth / CGFloat(nodeCount - 1)

                ZStack(alignment: .leading) {
                    // Background track
                    Capsule()
                        .fill(Color.divider)
                        .frame(height: 3)
                        .padding(.vertical, 16)

                    // Filled track (animated)
                    let currentIndex = CGFloat(level.rawValue - 1) + level.progressToNext(current: stamps.count)
                    let filledWidth = min(totalWidth, spacing * currentIndex)
                    Capsule()
                        .fill(level.color.gradient)
                        .frame(width: trailAppeared ? filledWidth : 0, height: 3)
                        .padding(.vertical, 16)
                        .animation(DS.Anim.collect.delay(0.2), value: trailAppeared)

                    // Milestone nodes
                    ForEach(CollectorLevel.allCases, id: \.rawValue) { lvl in
                        let index = CGFloat(lvl.rawValue - 1)
                        let x = spacing * index
                        let reached = stamps.count >= lvl.threshold
                        let isCurrent = lvl == level
                        let isTerminal = lvl == .hatsumairi || lvl == .shinshi

                        VStack(spacing: 2) {
                            ZStack {
                                if isCurrent {
                                    Circle()
                                        .fill(lvl.color.opacity(0.15))
                                        .frame(width: 32, height: 32)
                                    Circle()
                                        .fill(lvl.color.gradient)
                                        .frame(width: 24, height: 24)
                                    Circle()
                                        .strokeBorder(.white, lineWidth: 2.5)
                                        .frame(width: 24, height: 24)
                                    Image(systemName: lvl.icon)
                                        .font(.system(size: 10, weight: .bold))
                                        .foregroundStyle(.white)
                                } else if reached {
                                    Circle()
                                        .fill(lvl.color)
                                        .frame(width: 14, height: 14)
                                    Image(systemName: "checkmark")
                                        .font(.system(size: 7, weight: .bold))
                                        .foregroundStyle(.white)
                                } else {
                                    Circle()
                                        .fill(Color.progressEmpty)
                                        .frame(width: 10, height: 10)
                                }
                            }
                            .frame(height: 34)

                            if isCurrent || isTerminal {
                                Text(lvl.kanji)
                                    .font(.system(size: 8, weight: .bold))
                                    .foregroundStyle(reached ? lvl.color : Color.captionText)
                            }
                        }
                        .frame(width: 36)
                        .scaleEffect(trailAppeared ? 1 : 0)
                        .animation(DS.Anim.reveal.delay(DS.Anim.stagger(lvl.rawValue - 1, interval: 0.06)), value: trailAppeared)
                        .position(x: x, y: 22)
                    }
                }
            }
            .frame(height: 52)

            // Progress to next level
            if let next = level.next, let toNext = level.stampsToNext(current: stamps.count) {
                HStack {
                    Text("\(toNext) stamps to \(next.kanji) \(next.title)")
                        .font(.system(size: 11, weight: .medium))
                        .foregroundStyle(Color.captionText)
                    Spacer()
                    Text("Lv.\(level.rawValue) \u{2192} Lv.\(next.rawValue)")
                        .font(DS.Font.progressLabel)
                        .foregroundStyle(level.color)
                }
            }
        }
        .padding(.horizontal, DS.Spacing.xl)
    }

    // MARK: - Map

    private var mapSection: some View {
        Canvas { context, size in
            drawJapanMap(context: context, size: size)
            drawConnectionLines(context: context, size: size)
            drawVisitedShrines(context: context, size: size)
        }
        .frame(height: 200)
        .padding(.horizontal, DS.Spacing.xl)
        .background(
            RoundedRectangle(cornerRadius: DS.Radius.lg)
                .fill(Color.pageBackground)
                .padding(.horizontal, DS.Spacing.lg)
        )
    }

    // MARK: - Hero Stat (Visited count, prominent)

    private var heroStat: some View {
        VStack(spacing: 2) {
            AnimatedCounter(
                value: stamps.count,
                font: DS.Font.statHero,
                color: .vermillion
            )
            Text("Shrines Visited")
                .font(.system(size: 13, weight: .semibold))
                .foregroundStyle(Color.subtitleText)
                .tracking(0.5)
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, DS.Spacing.xl)
    }

    // MARK: - Supporting Stats (smaller row)

    private var supportingStats: some View {
        HStack(spacing: 0) {
            supportingStat(value: "\(categoriesVisited.count)", label: "Types", icon: "square.grid.2x2", color: Color(red: 0.45, green: 0.30, blue: 0.60))
            supportingDivider
            supportingStat(value: "\(prefectures.count)", label: "Regions", icon: "map", color: Color(red: 0.20, green: 0.50, blue: 0.70))
            supportingDivider
            supportingStat(value: "\(unlockedBadgeCount)", label: "Badges", icon: "seal", color: Color(red: 0.80, green: 0.55, blue: 0.20))
        }
        .padding(.horizontal, DS.Spacing.xl)
    }

    private func supportingStat(value: String, label: String, icon: String, color: Color) -> some View {
        VStack(spacing: DS.Spacing.xs) {
            HStack(spacing: 3) {
                Image(systemName: icon)
                    .font(.system(size: 10))
                    .foregroundStyle(color.opacity(0.6))
                Text(value)
                    .font(DS.Font.statSmall)
                    .foregroundStyle(color)
            }
            Text(label)
                .font(DS.Font.statCaption)
                .foregroundStyle(Color.subtitleText)
        }
        .frame(maxWidth: .infinity)
    }

    private var supportingDivider: some View {
        Rectangle()
            .fill(Color.divider)
            .frame(width: 1, height: 32)
    }

    // MARK: - Badge Summary

    private var badgeSummary: some View {
        VStack(spacing: DS.Spacing.md) {
            SectionHeader(
                title: "Achievements",
                icon: "seal.fill",
                iconColor: .vermillion,
                trailing: "\(unlockedBadgeCount)/\(Achievement.all.count)"
            )

            VStack(spacing: DS.Spacing.sm) {
                ForEach(AchievementCategory.allCases, id: \.rawValue) { cat in
                    let badges = Achievement.all.filter { $0.category == cat }
                    let unlocked = badges.filter { $0.requirement(collectedIds, Shrine.samples) }.count

                    HStack(spacing: DS.Spacing.sm) {
                        Image(systemName: cat.icon)
                            .font(.system(size: 11, weight: .semibold))
                            .foregroundStyle(Color.captionText)
                            .frame(width: 18)

                        Text(cat.displayName)
                            .font(.system(size: 11, weight: .semibold))
                            .foregroundStyle(Color.subtitleText)
                            .lineLimit(1)
                            .fixedSize(horizontal: true, vertical: false)

                        Spacer()

                        ProgressBar(
                            progress: badges.isEmpty ? 0 : Double(unlocked) / Double(badges.count),
                            color: .vermillion,
                            height: 4,
                            useGradient: false
                        )
                        .frame(width: 60)

                        Text("\(unlocked)/\(badges.count)")
                            .font(DS.Font.progressLabel)
                            .foregroundStyle(Color.captionText)
                            .frame(width: 32, alignment: .trailing)
                    }
                }
            }
        }
        .padding(.horizontal, DS.Spacing.xl)
    }

    // MARK: - Progress

    private var progressSection: some View {
        let total = max(Shrine.samples.count, 1)
        let progress = Double(stamps.count) / Double(total)

        return VStack(spacing: 6) {
            ProgressBar(progress: progress, color: .vermillion, height: 6)

            HStack {
                Text("\(Int(progress * 100))% complete")
                    .font(DS.Font.statCaption)
                    .foregroundStyle(Color.captionText)
                Spacer()
                Text("\(stamps.count) / \(total)")
                    .font(DS.Font.progressLabel)
                    .foregroundStyle(Color.captionText)
            }
        }
        .padding(.horizontal, DS.Spacing.xl)
    }

    // MARK: - Branding

    private var brandingSection: some View {
        HStack(spacing: DS.Spacing.xs) {
            Image(systemName: "building.columns")
                .font(.system(size: 9))
                .foregroundStyle(Color.captionText.opacity(0.5))
            Text("GosyuinMap")
                .font(DS.Font.statCaption)
                .foregroundStyle(Color.captionText.opacity(0.5))
        }
    }

    // MARK: - Map Drawing

    private func drawJapanMap(context: GraphicsContext, size: CGSize) {
        let mapRect = CGRect(x: 12, y: 8, width: size.width - 24, height: size.height - 16)

        for island in JapanCoordinates.allIslands {
            var path = Path()
            for (i, pt) in island.enumerated() {
                let p = mapPoint(lat: pt.lat, lon: pt.lon, in: mapRect)
                if i == 0 { path.move(to: p) } else { path.addLine(to: p) }
            }
            path.closeSubpath()

            context.fill(path, with: .color(Color(red: 0.85, green: 0.83, blue: 0.78).opacity(0.7)))
            context.stroke(path, with: .color(Color(red: 0.65, green: 0.62, blue: 0.58).opacity(0.5)), lineWidth: 0.8)
        }
    }

    private func drawVisitedShrines(context: GraphicsContext, size: CGSize) {
        let mapRect = CGRect(x: 12, y: 8, width: size.width - 24, height: size.height - 16)

        for shrine in collectedShrines {
            let pt = mapPoint(lat: shrine.coordinate.latitude, lon: shrine.coordinate.longitude, in: mapRect)

            var glow = Path()
            glow.addEllipse(in: CGRect(x: pt.x - 7, y: pt.y - 7, width: 14, height: 14))
            context.fill(glow, with: .color(shrine.category.color.opacity(0.25)))

            var dot = Path()
            dot.addEllipse(in: CGRect(x: pt.x - 3.5, y: pt.y - 3.5, width: 7, height: 7))
            context.fill(dot, with: .color(shrine.category.color))

            var center = Path()
            center.addEllipse(in: CGRect(x: pt.x - 1.2, y: pt.y - 1.2, width: 2.4, height: 2.4))
            context.fill(center, with: .color(.white.opacity(0.9)))
        }
    }

    private func drawConnectionLines(context: GraphicsContext, size: CGSize) {
        let mapRect = CGRect(x: 12, y: 8, width: size.width - 24, height: size.height - 16)
        guard chronological.count > 1 else { return }

        let limit = min(chronological.count, 20)
        for i in 0..<(limit - 1) {
            let p1 = mapPoint(lat: chronological[i].coordinate.latitude, lon: chronological[i].coordinate.longitude, in: mapRect)
            let p2 = mapPoint(lat: chronological[i + 1].coordinate.latitude, lon: chronological[i + 1].coordinate.longitude, in: mapRect)

            let midY = min(p1.y, p2.y) - 10
            var arc = Path()
            arc.move(to: p1)
            arc.addQuadCurve(to: p2, control: CGPoint(x: (p1.x + p2.x) / 2, y: midY))
            context.stroke(arc, with: .color(Color.vermillion.opacity(0.35)),
                           style: StrokeStyle(lineWidth: 1.2, lineCap: .round, dash: [4, 3]))
        }
    }

    private func mapPoint(lat: Double, lon: Double, in rect: CGRect) -> CGPoint {
        let minLat = 30.0, maxLat = 46.0
        let minLon = 128.0, maxLon = 146.0
        let x = rect.minX + (lon - minLon) / (maxLon - minLon) * rect.width
        let y = rect.minY + (1 - (lat - minLat) / (maxLat - minLat)) * rect.height
        return CGPoint(x: x, y: y)
    }
}

// MARK: - Preview

#Preview {
    ShrinePassportView()
        .modelContainer(for: [CollectedStamp.self], inMemory: true)
}
