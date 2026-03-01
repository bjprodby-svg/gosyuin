import SwiftUI
import SwiftData
import MapKit

struct ShrineDetailView: View {
    let shrine: Shrine
    @Environment(\.modelContext) private var modelContext
    @Environment(WorshipSessionManager.self) private var worshipManager
    @Query private var collectedStamps: [CollectedStamp]
    @State private var showingGuide = false

    private var isCollected: Bool {
        collectedStamps.contains { $0.slotId == shrine.stampSlotId }
    }

    private var isWorshippingThisShrine: Bool {
        worshipManager.isActive && worshipManager.shrineName == shrine.name
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                heroMap
                shrineInfo

                if isWorshippingThisShrine {
                    worshipSessionSection
                } else {
                    collectButton
                }

                guideLink
            }
            .padding()
        }
        .navigationTitle("Shrine Detail")
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $showingGuide) {
            NavigationStack {
                LearnDetailView(article: GuideArticle.allArticles[0])
                    .toolbar {
                        ToolbarItem(placement: .topBarTrailing) {
                            Button("Close") { showingGuide = false }
                        }
                    }
            }
        }
    }

    // MARK: - Hero Map

    private var heroMap: some View {
        Map {
            Annotation(shrine.name, coordinate: shrine.coordinate) {
                ZStack {
                    Circle()
                        .fill(Color(.label))
                        .frame(width: 36, height: 36)
                        .shadow(color: .black.opacity(0.15), radius: 3)
                    Text("\u{26E9}")
                        .font(.system(size: 16))
                        .foregroundStyle(Color(.systemBackground))
                }
            }
        }
        .frame(height: 200)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .allowsHitTesting(false)
    }

    // MARK: - Shrine Info

    private var shrineInfo: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(shrine.name)
                .font(.title.bold())

            Label(shrine.address, systemImage: "mappin.circle.fill")
                .font(.subheadline)
                .foregroundStyle(.secondary)

            Text(shrine.description)
                .font(.body)
                .foregroundStyle(.bodyText)
                .fixedSize(horizontal: false, vertical: true)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    // MARK: - Worship Session

    private var worshipSessionSection: some View {
        VStack(spacing: 16) {
            HStack(spacing: 0) {
                ForEach(WorshipStep.allCases, id: \.self) { step in
                    stepIndicator(step)
                    if step.rawValue < WorshipStep.allCases.count - 1 {
                        Rectangle()
                            .fill(step.rawValue < worshipManager.currentStep.rawValue
                                  ? Color.vermillion : Color(.systemGray4))
                            .frame(height: 2)
                    }
                }
            }
            .padding()
            .background(Color(.secondarySystemGroupedBackground), in: RoundedRectangle(cornerRadius: 14))

            if let next = worshipManager.currentStep.next {
                Button {
                    worshipManager.advanceStep()
                } label: {
                    Label("Next: \(next.labelEn)", systemImage: "arrow.right.circle.fill")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.vermillion, in: RoundedRectangle(cornerRadius: 14))
                }
            } else {
                Button(action: collectAndComplete) {
                    Label("Collect Stamp", systemImage: "seal.fill")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.vermillion, in: RoundedRectangle(cornerRadius: 14))
                }
            }

            Button(role: .destructive) {
                worshipManager.cancelSession()
            } label: {
                Text("Cancel Worship")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
        }
    }

    private func stepIndicator(_ step: WorshipStep) -> some View {
        let isCurrent = step == worshipManager.currentStep
        let isDone = step.rawValue < worshipManager.currentStep.rawValue

        return VStack(spacing: 4) {
            ZStack {
                Circle()
                    .fill(isDone || isCurrent ? Color.vermillion : Color(.systemGray5))
                    .frame(width: 36, height: 36)
                Image(systemName: step.icon)
                    .font(.system(size: 14))
                    .foregroundStyle(isDone || isCurrent ? .white : Color(.systemGray3))
            }
            Text(step.labelEn)
                .font(.caption2)
                .foregroundStyle(isCurrent ? .vermillion : .secondary)
        }
    }

    // MARK: - Collect Button

    @ViewBuilder
    private var collectButton: some View {
        if isCollected {
            Label("Collected", systemImage: "checkmark.seal.fill")
                .font(.headline)
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color(.systemGray3), in: RoundedRectangle(cornerRadius: 14))
        } else {
            Button {
                worshipManager.startSession(shrine: shrine.name)
            } label: {
                Label("Start Worship", systemImage: "figure.walk")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(
                        Color.vermillion,
                        in: RoundedRectangle(cornerRadius: 14)
                    )
            }
        }
    }

    // MARK: - Guide Link

    private var guideLink: some View {
        Button {
            showingGuide = true
        } label: {
            HStack {
                Image(systemName: "book.fill")
                    .foregroundStyle(.vermillion)
                Text("Shrine Etiquette Guide")
                    .foregroundStyle(.primary)
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundStyle(.tertiary)
            }
            .padding()
            .background(Color(.secondarySystemGroupedBackground), in: RoundedRectangle(cornerRadius: 14))
        }
        .buttonStyle(.plain)
    }

    private func collectAndComplete() {
        let stamp = CollectedStamp(slotId: shrine.stampSlotId)
        modelContext.insert(stamp)
        worshipManager.completeSession()
    }
}

#Preview {
    NavigationStack {
        ShrineDetailView(shrine: Shrine.samples[0])
    }
    .modelContainer(for: [Gosyuin.self, CollectedStamp.self], inMemory: true)
    .environment(WorshipSessionManager())
}
