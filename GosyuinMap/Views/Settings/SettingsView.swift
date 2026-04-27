import SwiftUI
import SwiftData

struct SettingsView: View {
    @AppStorage("tipPromptsEnabled") private var tipPromptsEnabled = true

    #if DEBUG
    @Query private var collectedStamps: [CollectedStamp]
    @Environment(\.modelContext) private var modelContext
    @State private var tipPromptController = TipPromptController()
    @State private var showTipPreview = false
    @State private var showCollectionPrompt = false
    @State private var debugMessage: String?
    @State private var promptShrine: Shrine = Shrine.samples[0]
    @AppStorage("hasCompletedOnboarding") private var hasCompletedOnboarding = true

    private var currentLevel: CollectorLevel {
        CollectorLevel.level(for: collectedStamps.count)
    }
    private var collectedIds: Set<Int> {
        Set(collectedStamps.map(\.slotId))
    }
    private var unlockedBadges: [Achievement] {
        Achievement.all.filter { $0.requirement(collectedIds, Shrine.samples) }
    }
    #endif

    var body: some View {
        NavigationStack {
            List {
                Section {
                    NavigationLink {
                        TipJarFullView()
                    } label: {
                        Label("Tip Jar", systemImage: "heart.fill")
                            .foregroundStyle(Color.kincha)
                    }

                    Toggle(isOn: $tipPromptsEnabled) {
                        Label("Show Tip Prompts", systemImage: "bell.badge")
                    }
                    .tint(Color.vermillion)
                } header: {
                    Text("Support")
                } footer: {
                    Text("Tip prompts appear occasionally after collecting stamps. You can always tip directly from the Tip Jar above.")
                }

                #if DEBUG
                debugStatusCard
                debugCollectionSection
                debugTipSection
                debugScenarioSection
                debugResetSection
                #endif
            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
            #if DEBUG
            .sheet(isPresented: $showTipPreview) {
                VStack {
                    Text("Tip Card Preview")
                        .font(.headline)
                        .padding(.top, DS.Spacing.xl)
                    TipJarCard(
                        tipStore: TipStore(),
                        onDismissForever: {},
                        onDismiss: { showTipPreview = false }
                    )
                    .padding(DS.Spacing.lg)
                    Spacer()
                }
                .presentationDetents([.medium])
            }
            .sheet(isPresented: $showCollectionPrompt) {
                StampCollectionPrompt(
                    shrine: promptShrine,
                    onCollect: {
                        let stamp = CollectedStamp(slotId: promptShrine.stampSlotId)
                        modelContext.insert(stamp)
                    },
                    onDismiss: { showCollectionPrompt = false }
                )
                .presentationDetents([.large])
            }
            #endif
        }
    }

    // MARK: - Debug Sections

    #if DEBUG

    // ── Status Dashboard ──

    private var debugStatusCard: some View {
        Section {
            VStack(spacing: DS.Spacing.md) {
                // Level display
                HStack(spacing: DS.Spacing.md) {
                    ZStack {
                        Circle()
                            .fill(currentLevel.color.gradient)
                            .frame(width: 48, height: 48)
                        Text(currentLevel.kanji)
                            .font(.system(size: 18, weight: .bold))
                            .foregroundStyle(.white)
                    }

                    VStack(alignment: .leading, spacing: 2) {
                        Text("Lv.\(currentLevel.rawValue) \(currentLevel.title)")
                            .font(.subheadline.weight(.semibold))
                        if let next = currentLevel.next {
                            let toNext = next.threshold - collectedStamps.count
                            Text("\(toNext) stamps to Lv.\(next.rawValue) \(next.kanji)")
                                .font(.caption)
                                .foregroundStyle(Color.subtitleText)
                        } else {
                            Text("Max level reached")
                                .font(.caption)
                                .foregroundStyle(Color.kincha)
                        }
                    }

                    Spacer()

                    VStack(spacing: 2) {
                        Text("\(collectedStamps.count)")
                            .font(DS.Font.statMedium)
                            .foregroundStyle(currentLevel.color)
                        Text("stamps")
                            .font(.caption2)
                            .foregroundStyle(Color.captionText)
                    }
                }

                // Progress bar
                if currentLevel.next != nil {
                    ProgressBar(
                        progress: currentLevel.progressToNext(current: collectedStamps.count),
                        color: currentLevel.color,
                        height: 6
                    )
                }

                // Badges
                HStack(spacing: DS.Spacing.sm) {
                    Image(systemName: "medal.fill")
                        .font(.caption)
                        .foregroundStyle(Color.kincha)
                    Text("\(unlockedBadges.count)/\(Achievement.all.count) badges")
                        .font(.caption.weight(.medium))
                        .foregroundStyle(Color.subtitleText)
                    Spacer()
                }
            }
            .padding(.vertical, DS.Spacing.xs)
        } header: {
            HStack {
                Text("Debug Dashboard")
                Spacer()
                if let msg = debugMessage {
                    Text(msg)
                        .font(.caption2)
                        .foregroundStyle(Color.matcha)
                }
            }
        }
    }

    // ── Stamp Collection ──

    private var debugCollectionSection: some View {
        Section {
            Button {
                let uncollected = Shrine.samples.filter { shrine in
                    !collectedStamps.contains { $0.slotId == shrine.stampSlotId }
                }
                promptShrine = uncollected.randomElement() ?? Shrine.samples[0]
                showCollectionPrompt = true
            } label: {
                HStack {
                    Label("Collect a Stamp", systemImage: "seal.fill")
                        .foregroundStyle(Color.vermillion)
                    Spacer()
                    Text("Full animation")
                        .font(.caption)
                        .foregroundStyle(Color.captionText)
                }
            }

            Stepper {
                HStack {
                    Label("Add Stamps", systemImage: "plus.circle")
                    Spacer()
                    Text("\(collectedStamps.count)")
                        .font(.subheadline.monospacedDigit().weight(.semibold))
                        .foregroundStyle(currentLevel.color)
                }
            } onIncrement: {
                addStamps(count: 1)
                debugMessage = "+1 stamp"
            } onDecrement: {
                removeLastStamp()
                debugMessage = "-1 stamp"
            }
        } header: {
            Text("Stamp Collection")
        }
    }

    // ── Tip Jar ──

    private var debugTipSection: some View {
        Section {
            Button {
                tipPromptController.resetAll()
                debugMessage = "Tip forced for next collect"
            } label: {
                Label("Force Tip on Next Collect", systemImage: "yensign.circle")
            }

            Button {
                showTipPreview = true
            } label: {
                Label("Preview Tip Card", systemImage: "eye")
            }
        } header: {
            Text("Tip Jar")
        }
    }

    // ── Quick Scenarios ──

    private var debugScenarioSection: some View {
        Section {
            Button {
                setStampsToNextLevelUp()
                tipPromptController.resetAll()
                let uncollected = Shrine.samples.filter { shrine in
                    !collectedStamps.contains { $0.slotId == shrine.stampSlotId }
                }
                promptShrine = uncollected.randomElement() ?? Shrine.samples[0]
                showCollectionPrompt = true
            } label: {
                HStack {
                    Label("Level Up + Tip + Collect", systemImage: "star.fill")
                        .foregroundStyle(Color.kincha)
                    Spacer()
                    Text("All-in-one")
                        .font(.caption)
                        .foregroundStyle(Color.captionText)
                }
            }

            Button {
                clearAllStamps()
                addStamps(count: 4)
                tipPromptController.resetAll()
                let uncollected = Shrine.samples.filter { shrine in
                    !collectedStamps.contains { $0.slotId == shrine.stampSlotId }
                }
                promptShrine = uncollected.randomElement() ?? Shrine.samples[0]
                showCollectionPrompt = true
            } label: {
                HStack {
                    Label("5th Stamp + First Tip", systemImage: "5.circle.fill")
                        .foregroundStyle(Color.matcha)
                    Spacer()
                    Text("First tip trigger")
                        .font(.caption)
                        .foregroundStyle(Color.captionText)
                }
            }

            Button {
                clearAllStamps()
                promptShrine = Shrine.samples[0]
                showCollectionPrompt = true
            } label: {
                HStack {
                    Label("First Ever Stamp", systemImage: "sunrise.fill")
                        .foregroundStyle(Color.indigo)
                    Spacer()
                    Text("Fresh start")
                        .font(.caption)
                        .foregroundStyle(Color.captionText)
                }
            }
        } header: {
            Text("Quick Scenarios")
        } footer: {
            Text("One-tap test flows combining multiple features.")
        }
    }

    // ── Reset ──

    private var debugResetSection: some View {
        Section {
            Button {
                hasCompletedOnboarding = false
                debugMessage = "Restart app to see onboarding"
            } label: {
                Label("Reset Onboarding", systemImage: "arrow.counterclockwise")
            }

            Button(role: .destructive) {
                clearAllStamps()
                debugMessage = "All stamps cleared"
            } label: {
                Label("Clear All Stamps", systemImage: "trash")
            }
        } header: {
            Text("Reset")
        }
    }

    // MARK: - Helpers

    private func addStamps(count: Int) {
        let existingIds = Set(collectedStamps.map(\.slotId))
        let available = Shrine.samples
            .map(\.stampSlotId)
            .filter { !existingIds.contains($0) }
        let calendar = Calendar.current
        for (i, slotId) in available.prefix(count).enumerated() {
            let date = calendar.date(byAdding: .day, value: -(count - i), to: .now) ?? .now
            modelContext.insert(CollectedStamp(slotId: slotId, collectedDate: date))
        }
    }

    private func removeLastStamp() {
        guard let last = collectedStamps.sorted(by: { $0.collectedDate > $1.collectedDate }).first else { return }
        modelContext.delete(last)
    }

    private func setStampsToNextLevelUp() {
        let currentCount = collectedStamps.count
        let level = CollectorLevel.level(for: currentCount)
        guard let next = level.next else {
            debugMessage = "Already max level"
            return
        }
        let needed = next.threshold - 1
        let diff = needed - currentCount
        if diff > 0 {
            addStamps(count: diff)
        }
        debugMessage = "→ Lv.\(next.rawValue) \(next.kanji) on next collect"
    }

    private func clearAllStamps() {
        for stamp in collectedStamps {
            modelContext.delete(stamp)
        }
    }
    #endif
}

#Preview {
    SettingsView()
        .modelContainer(for: [CollectedStamp.self], inMemory: true)
}
