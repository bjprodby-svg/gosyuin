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
                // ── Stamp Collection ──
                Section {
                    Button {
                        let uncollectedShrines = Shrine.samples.filter { shrine in
                            !collectedStamps.contains { $0.slotId == shrine.stampSlotId }
                        }
                        promptShrine = uncollectedShrines.first ?? Shrine.samples[0]
                        showCollectionPrompt = true
                    } label: {
                        Label("Collect a Stamp", systemImage: "seal.fill")
                    }

                    Button {
                        addStamps(count: 1)
                        debugMessage = "Added 1 stamp (total: \(collectedStamps.count))"
                    } label: {
                        Label("Add 1 Stamp (silent)", systemImage: "plus.circle")
                    }

                    Button {
                        addStamps(count: 5)
                        debugMessage = "Added 5 stamps (total: \(collectedStamps.count))"
                    } label: {
                        Label("Add 5 Stamps (silent)", systemImage: "plus.circle.fill")
                    }

                    Button {
                        setStampsToNextLevelUp()
                    } label: {
                        Label("Set to Next Level-Up", systemImage: "arrow.up.circle")
                    }
                } header: {
                    Text("Stamp Collection")
                } footer: {
                    Text("Stamps: \(collectedStamps.count) | Level: Lv.\(CollectorLevel.level(for: collectedStamps.count).rawValue) \(CollectorLevel.level(for: collectedStamps.count).kanji)")
                }

                // ── Tip Jar ──
                Section {
                    Button {
                        tipPromptController.resetAll()
                        debugMessage = "Next stamp collection will show tip card"
                    } label: {
                        Label("Force Tip on Next Collect", systemImage: "arrow.clockwise")
                    }

                    Button {
                        showTipPreview = true
                    } label: {
                        Label("Preview Tip Jar Card", systemImage: "eye")
                    }
                } header: {
                    Text("Tip Jar")
                }

                // ── Reset ──
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

                if let msg = debugMessage {
                    Section {
                        Text(msg)
                            .font(.caption)
                            .foregroundStyle(Color.matcha)
                    }
                }
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

    // MARK: - Debug Helpers

    #if DEBUG
    private func addStamps(count: Int) {
        let existingIds = Set(collectedStamps.map(\.slotId))
        let available = Shrine.samples
            .map(\.stampSlotId)
            .filter { !existingIds.contains($0) }
        for slotId in available.prefix(count) {
            modelContext.insert(CollectedStamp(slotId: slotId))
        }
    }

    private func setStampsToNextLevelUp() {
        let currentLevel = CollectorLevel.level(for: collectedStamps.count)
        guard let nextLevel = currentLevel.next else {
            debugMessage = "Already at max level"
            return
        }
        let needed = nextLevel.threshold - 1
        let diff = needed - collectedStamps.count
        if diff > 0 {
            addStamps(count: diff)
            debugMessage = "Set to \(needed) stamps. Next collect → Lv.\(nextLevel.rawValue) \(nextLevel.kanji)"
        } else {
            debugMessage = "Already at \(collectedStamps.count) stamps, collect to level up"
        }
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
