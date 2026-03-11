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
                            .foregroundStyle(.secondary)
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    ShareLink(item: shareImage, preview: SharePreview("My Gosyuin Journey", image: shareImage)) {
                        Image(systemName: "square.and.arrow.up.circle.fill")
                            .font(.title2)
                            .symbolRenderingMode(.hierarchical)
                            .foregroundStyle(.secondary)
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

    var body: some View {
        VStack(spacing: 24) {
            // Header
            headerSection

            // Japan map
            mapSection

            // Stats
            statsSection

            // Progress
            progressSection

            // Branding
            brandingSection
        }
        .padding(.vertical, 28)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(color: .black.opacity(0.08), radius: 16, y: 6)
    }

    // MARK: - Header

    private var headerSection: some View {
        HStack(alignment: .center) {
            VStack(alignment: .leading, spacing: 2) {
                Text("MY GOSYUIN JOURNEY")
                    .font(.system(size: 13, weight: .bold, design: .monospaced))
                    .foregroundStyle(Color(red: 0.35, green: 0.32, blue: 0.28))
                    .tracking(1.5)
                Text(level.kanji + " " + level.title)
                    .font(.system(size: 18, weight: .bold))
                    .foregroundStyle(level.color)
            }

            Spacer()

            ZStack {
                Circle()
                    .fill(level.color.opacity(0.1))
                    .frame(width: 44, height: 44)
                Image(systemName: level.icon)
                    .font(.system(size: 18, weight: .bold))
                    .foregroundStyle(level.color)
            }
        }
        .padding(.horizontal, 24)
    }

    // MARK: - Map

    private var mapSection: some View {
        Canvas { context, size in
            drawJapanMap(context: context, size: size)
            drawConnectionLines(context: context, size: size)
            drawVisitedShrines(context: context, size: size)
        }
        .frame(height: 200)
        .padding(.horizontal, 20)
        .background(
            RoundedRectangle(cornerRadius: 14)
                .fill(Color(red: 0.97, green: 0.96, blue: 0.94))
                .padding(.horizontal, 16)
        )
    }

    // MARK: - Stats (3 big numbers)

    private var statsSection: some View {
        HStack(spacing: 0) {
            statItem(value: "\(stamps.count)", label: "Visited", color: Color.vermillion)
            statDivider
            statItem(value: "\(categoriesVisited.count)", label: "Types", color: Color(red: 0.45, green: 0.30, blue: 0.60))
            statDivider
            statItem(value: "\(prefectures.count)", label: "Regions", color: Color(red: 0.20, green: 0.50, blue: 0.70))
        }
        .padding(.horizontal, 24)
    }

    private func statItem(value: String, label: String, color: Color) -> some View {
        VStack(spacing: 4) {
            Text(value)
                .font(.system(size: 36, weight: .bold, design: .rounded))
                .foregroundStyle(color)
            Text(label)
                .font(.system(size: 11, weight: .medium))
                .foregroundStyle(Color(red: 0.5, green: 0.48, blue: 0.45))
        }
        .frame(maxWidth: .infinity)
    }

    private var statDivider: some View {
        Rectangle()
            .fill(Color.black.opacity(0.06))
            .frame(width: 1, height: 40)
    }

    // MARK: - Progress

    private var progressSection: some View {
        let total = max(Shrine.samples.count, 1)
        let progress = Double(stamps.count) / Double(total)

        return VStack(spacing: 6) {
            GeometryReader { geo in
                ZStack(alignment: .leading) {
                    Capsule()
                        .fill(Color.black.opacity(0.05))
                    Capsule()
                        .fill(Color.vermillion.gradient)
                        .frame(width: geo.size.width * progress)
                }
            }
            .frame(height: 6)

            HStack {
                Text("\(Int(progress * 100))% complete")
                    .font(.system(size: 10, weight: .medium))
                    .foregroundStyle(Color.black.opacity(0.3))
                Spacer()
                Text("\(stamps.count) / \(total)")
                    .font(.system(size: 10, weight: .bold, design: .monospaced))
                    .foregroundStyle(Color.black.opacity(0.3))
            }
        }
        .padding(.horizontal, 24)
    }

    // MARK: - Branding

    private var brandingSection: some View {
        HStack(spacing: 4) {
            Text("⛩")
                .font(.system(size: 10))
            Text("GosyuinMap")
                .font(.system(size: 10, weight: .medium))
                .foregroundStyle(Color.black.opacity(0.2))
        }
    }

    // MARK: - Map Drawing

    private func drawJapanMap(context: GraphicsContext, size: CGSize) {
        let mapRect = CGRect(x: 12, y: 8, width: size.width - 24, height: size.height - 16)

        for island in JapanCoordinates.allIslands {
            let points = island.map { mapPoint(lat: $0.lat, lon: $0.lon, in: mapRect) }
            let path = catmullRomPath(points: points, closed: true, alpha: 0.5)

            context.fill(path, with: .color(Color(red: 0.85, green: 0.83, blue: 0.78).opacity(0.7)))
            context.stroke(path, with: .color(Color(red: 0.65, green: 0.62, blue: 0.58).opacity(0.5)), lineWidth: 0.8)
        }
    }

    /// Centripetal Catmull-Rom spline for smooth coastlines
    private func catmullRomPath(points: [CGPoint], closed: Bool, alpha: CGFloat) -> Path {
        var path = Path()
        guard points.count > 2 else {
            if let first = points.first {
                path.move(to: first)
                for p in points.dropFirst() { path.addLine(to: p) }
                if closed { path.closeSubpath() }
            }
            return path
        }

        let pts: [CGPoint]
        if closed {
            pts = [points[points.count - 1]] + points + [points[0], points[1]]
        } else {
            let first = CGPoint(x: 2 * points[0].x - points[1].x, y: 2 * points[0].y - points[1].y)
            let last = CGPoint(x: 2 * points[points.count - 1].x - points[points.count - 2].x,
                               y: 2 * points[points.count - 1].y - points[points.count - 2].y)
            pts = [first] + points + [last]
        }

        path.move(to: pts[1])

        for i in 1..<(pts.count - 2) {
            let p0 = pts[i - 1], p1 = pts[i], p2 = pts[i + 1], p3 = pts[min(i + 2, pts.count - 1)]

            let d1 = hypot(p1.x - p0.x, p1.y - p0.y)
            let d2 = hypot(p2.x - p1.x, p2.y - p1.y)
            let d3 = hypot(p3.x - p2.x, p3.y - p2.y)

            let t1 = pow(d1, alpha)
            let t2 = pow(d2, alpha)
            let t3 = pow(d3, alpha)

            guard t1 > 0, t2 > 0, t3 > 0 else {
                path.addLine(to: p2)
                continue
            }

            let cp1 = CGPoint(
                x: (t1 * t1 * p2.x - t2 * t2 * p0.x + (2 * t1 * t1 + 3 * t1 * t2 + t2 * t2) * p1.x) / (3 * t1 * (t1 + t2)),
                y: (t1 * t1 * p2.y - t2 * t2 * p0.y + (2 * t1 * t1 + 3 * t1 * t2 + t2 * t2) * p1.y) / (3 * t1 * (t1 + t2))
            )
            let cp2 = CGPoint(
                x: (t3 * t3 * p1.x - t2 * t2 * p3.x + (2 * t3 * t3 + 3 * t3 * t2 + t2 * t2) * p2.x) / (3 * t3 * (t3 + t2)),
                y: (t3 * t3 * p1.y - t2 * t2 * p3.y + (2 * t3 * t3 + 3 * t3 * t2 + t2 * t2) * p2.y) / (3 * t3 * (t3 + t2))
            )

            path.addCurve(to: p2, control1: cp1, control2: cp2)
        }

        if closed { path.closeSubpath() }
        return path
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
            context.stroke(arc, with: .color(Color.vermillion.opacity(0.15)),
                           style: StrokeStyle(lineWidth: 0.8, lineCap: .round))
        }
    }

    private func mapPoint(lat: Double, lon: Double, in rect: CGRect) -> CGPoint {
        let minLat = 25.5, maxLat = 46.0
        let minLon = 127.0, maxLon = 146.5
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
