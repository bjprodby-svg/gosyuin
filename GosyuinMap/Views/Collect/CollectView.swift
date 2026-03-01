import SwiftUI
import SwiftData

struct CollectView: View {
    @Query private var collectedStamps: [CollectedStamp]
    @Environment(\.modelContext) private var modelContext

    private let columns = Array(repeating: GridItem(.flexible(), spacing: 12), count: 3)

    private var collectedIds: Set<Int> {
        Set(collectedStamps.map(\.slotId))
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    headerSection

                    LazyVGrid(columns: columns, spacing: 12) {
                        ForEach(StampDefinition.all) { stamp in
                            NavigationLink(value: stamp) {
                                if collectedIds.contains(stamp.id) {
                                    CollectedStampCard(stamp: stamp)
                                } else {
                                    UncollectedStampCard()
                                }
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }
                .padding()
            }
            .background(Color(.systemBackground))
            .navigationTitle("Stamp Book")
            .navigationBarTitleDisplayMode(.large)
            .navigationDestination(for: StampDefinition.self) { stamp in
                StampDetailView(stamp: stamp)
            }
            #if DEBUG
            .onAppear(perform: seedSampleDataIfNeeded)
            #endif
        }
    }

    // MARK: - Header

    private var headerSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Progress")
                .font(.subheadline)
                .foregroundStyle(.secondary)

            HStack(spacing: 4) {
                ForEach(StampDefinition.all) { stamp in
                    RoundedRectangle(cornerRadius: 2)
                        .fill(collectedIds.contains(stamp.id) ? Color.vermillion : Color(.systemGray5))
                        .frame(height: 4)
                }
            }

            Text("\(collectedStamps.count) / \(StampDefinition.all.count)")
                .font(.caption)
                .foregroundStyle(.secondary)
        }
    }

    // MARK: - Seed (Debug Only)

    #if DEBUG
    private func seedSampleDataIfNeeded() {
        guard collectedStamps.isEmpty else { return }
        let calendar = Calendar.current
        for slotId in 1...8 {
            let daysAgo = (8 - slotId) * 5
            let date = calendar.date(byAdding: .day, value: -daysAgo, to: .now) ?? .now
            modelContext.insert(CollectedStamp(slotId: slotId, collectedDate: date))
        }
    }
    #endif
}

// MARK: - Collected Stamp Card (Traditional Gosyuin Style)

private struct CollectedStampCard: View {
    let stamp: StampDefinition

    var body: some View {
        ZStack {
            // 外枠 — 二重線の印章風ボーダー
            RoundedRectangle(cornerRadius: 6)
                .strokeBorder(stamp.color.opacity(0.3), lineWidth: 1.5)

            RoundedRectangle(cornerRadius: 4)
                .strokeBorder(stamp.color.opacity(0.5), lineWidth: 0.5)
                .padding(3)

            VStack(spacing: 2) {
                // 中央シンボル
                Text(stamp.stampSymbol)
                    .font(.system(size: 28))

                // 神社名（縦書き風に2行）
                Text(stamp.name)
                    .font(.system(size: 10, weight: .bold, design: .serif))
                    .foregroundStyle(stamp.color)
                    .lineLimit(1)
                    .minimumScaleFactor(0.6)

                // 所在地
                Text(stamp.subtitle)
                    .font(.system(size: 7, design: .serif))
                    .foregroundStyle(stamp.color.opacity(0.6))
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
            }
            .padding(6)
        }
        .aspectRatio(1, contentMode: .fit)
        .background(Color.cardBackground)
        .clipShape(RoundedRectangle(cornerRadius: 6))
    }
}

// MARK: - Uncollected Stamp Card

private struct UncollectedStampCard: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 6)
                .fill(Color(.systemGray6))

            Text("\u{26E9}")
                .font(.system(size: 24))
                .foregroundStyle(Color(.systemGray4))
        }
        .aspectRatio(1, contentMode: .fit)
    }
}

#Preview {
    CollectView()
        .modelContainer(for: [Gosyuin.self, CollectedStamp.self], inMemory: true)
}
