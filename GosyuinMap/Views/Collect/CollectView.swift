import SwiftUI
import SwiftData

struct CollectView: View {
    @Query private var collectedStamps: [CollectedStamp]
    @Environment(\.modelContext) private var modelContext
    @State private var appeared = false

    private let columns = Array(repeating: GridItem(.flexible(), spacing: DS.Spacing.md), count: 3)

    private var collectedIds: Set<Int> {
        Set(collectedStamps.map(\.slotId))
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: DS.Spacing.xl) {
                    headerSection

                    LazyVGrid(columns: columns, spacing: DS.Spacing.md) {
                        ForEach(Array(StampDefinition.all.enumerated()), id: \.element.id) { index, stamp in
                            NavigationLink(value: stamp) {
                                if collectedIds.contains(stamp.id) {
                                    CollectedStampCard(stamp: stamp)
                                } else {
                                    UncollectedStampCard()
                                }
                            }
                            .buttonStyle(.stamp)
                            .opacity(appeared ? 1 : 0)
                            .scaleEffect(appeared ? 1 : 0.7)
                            .animation(
                                .spring(duration: 0.5, bounce: 0.3)
                                    .delay(Double(index) * 0.04),
                                value: appeared
                            )
                        }
                    }
                }
                .padding(DS.Spacing.lg)
            }
            .background(Color.pageBackground)
            .navigationTitle("Stamp Book")
            .navigationBarTitleDisplayMode(.large)
            .navigationDestination(for: StampDefinition.self) { stamp in
                StampDetailView(stamp: stamp)
            }
            .onAppear {
                withAnimation { appeared = true }
            }
            #if DEBUG
            .onAppear(perform: seedSampleDataIfNeeded)
            #endif
        }
        .sensoryFeedback(.impact(.medium), trigger: collectedStamps.count)
    }

    // MARK: - Header

    private var headerSection: some View {
        VStack(alignment: .leading, spacing: DS.Spacing.sm) {
            Text("Progress")
                .font(.subheadline.weight(.semibold))
                .foregroundStyle(.secondary)

            HStack(spacing: 3) {
                ForEach(StampDefinition.all) { stamp in
                    RoundedRectangle(cornerRadius: 2)
                        .fill(collectedIds.contains(stamp.id) ? Color.vermillion : Color.progressEmpty)
                        .frame(height: 6)
                        .animation(.spring(duration: 0.4), value: collectedIds.contains(stamp.id))
                }
            }

            HStack {
                Text("\(collectedStamps.count) / \(StampDefinition.all.count)")
                    .font(.caption.weight(.medium))
                    .foregroundStyle(.secondary)

                Spacer()

                if collectedStamps.count == StampDefinition.all.count {
                    Label("Complete!", systemImage: "star.fill")
                        .font(.caption.weight(.bold))
                        .foregroundStyle(.vermillion)
                }
            }
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

// MARK: - Collected Stamp Card

private struct CollectedStampCard: View {
    let stamp: StampDefinition

    var body: some View {
        ZStack {
            // 朱印風の二重枠
            RoundedRectangle(cornerRadius: DS.Radius.sm)
                .strokeBorder(stamp.color.opacity(0.3), lineWidth: 1.5)

            RoundedRectangle(cornerRadius: 6)
                .strokeBorder(stamp.color.opacity(0.5), lineWidth: 0.5)
                .padding(3)

            VStack(spacing: 2) {
                Text(stamp.stampSymbol)
                    .font(.system(size: 28))

                Text(stamp.name)
                    .font(.system(size: 10, weight: .bold, design: .serif))
                    .foregroundStyle(stamp.color)
                    .lineLimit(1)
                    .minimumScaleFactor(0.6)

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
        .clipShape(RoundedRectangle(cornerRadius: DS.Radius.sm))
        .shadow(color: stamp.color.opacity(0.1), radius: 2, y: 1)
    }
}

// MARK: - Uncollected Stamp Card

private struct UncollectedStampCard: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: DS.Radius.sm)
                .fill(Color.progressEmpty)

            // 薄い破線枠
            RoundedRectangle(cornerRadius: DS.Radius.sm)
                .strokeBorder(
                    Color.placeholderIcon.opacity(0.4),
                    style: StrokeStyle(lineWidth: 1, dash: [4, 3])
                )

            Text("?")
                .font(.system(size: 24, weight: .light, design: .serif))
                .foregroundStyle(Color.placeholderIcon)
        }
        .aspectRatio(1, contentMode: .fit)
    }
}

#Preview {
    CollectView()
        .modelContainer(for: [Gosyuin.self, CollectedStamp.self], inMemory: true)
}
