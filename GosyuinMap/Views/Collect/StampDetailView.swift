import SwiftUI
import SwiftData
import MapKit

struct StampDetailView: View {
    let stamp: StampDefinition
    @Query private var collectedStamps: [CollectedStamp]
    @State private var showingMap = false

    private var collectedStamp: CollectedStamp? {
        collectedStamps.first { $0.slotId == stamp.id }
    }

    private var shrine: Shrine? {
        Shrine.samples.first { $0.stampSlotId == stamp.id }
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                stampHeader

                if let collected = collectedStamp {
                    collectedSection(collected)
                } else if shrine != nil {
                    uncollectedKnownSection
                } else {
                    unknownSection
                }
            }
            .padding()
        }
        .background(Color(.systemBackground))
        .navigationTitle(stamp.name)
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $showingMap) {
            if let shrine {
                shrineMapSheet(shrine)
            }
        }
    }

    // MARK: - Stamp Header

    private var stampHeader: some View {
        VStack(spacing: DS.Spacing.lg) {
            GosyuinArtworkView(
                stamp: stamp,
                collectedDate: collectedStamp?.collectedDate
            )
            .frame(width: 280)

            Text(stamp.name)
                .font(.title2.bold())
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical)
    }

    // MARK: - Collected

    private func collectedSection(_ collected: CollectedStamp) -> some View {
        VStack(spacing: 16) {
            infoRow(
                icon: "calendar",
                label: "Collected on",
                value: collected.collectedDate.formatted(.dateTime.year().month().day())
            )

            if let shrine {
                infoRow(icon: "mappin.circle.fill", label: shrine.name, value: shrine.address)
            }
        }
    }

    private func infoRow(icon: String, label: String, value: String) -> some View {
        HStack(spacing: 12) {
            Image(systemName: icon)
                .font(.title3)
                .foregroundStyle(stamp.color)
                .frame(width: 28)
            VStack(alignment: .leading, spacing: 2) {
                Text(label)
                    .font(.subheadline.weight(.medium))
                Text(value)
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            Spacer()
        }
        .padding()
        .background(Color(.secondarySystemGroupedBackground), in: RoundedRectangle(cornerRadius: 12))
    }

    // MARK: - Uncollected (Known Shrine)

    private var uncollectedKnownSection: some View {
        VStack(spacing: 16) {
            Text("This stamp has not been collected yet")
                .font(.subheadline)
                .foregroundStyle(.secondary)

            Button {
                showingMap = true
            } label: {
                Label("View on Map", systemImage: "map.fill")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(stamp.color, in: RoundedRectangle(cornerRadius: 14))
            }
        }
    }

    // MARK: - Unknown

    private var unknownSection: some View {
        VStack(spacing: 12) {
            Image(systemName: "questionmark.circle")
                .font(.system(size: 48))
                .foregroundStyle(Color(.systemGray4))
            Text("Not discovered yet")
                .font(.headline)
                .foregroundStyle(.secondary)
            Text("Explore more shrines to discover this stamp")
                .font(.caption)
                .foregroundStyle(.tertiary)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 32)
    }

    // MARK: - Map Sheet

    private func shrineMapSheet(_ shrine: Shrine) -> some View {
        NavigationStack {
            Map {
                Annotation(shrine.name, coordinate: shrine.coordinate) {
                    ZStack {
                        Circle().fill(Color(.label)).frame(width: 36, height: 36)
                            .shadow(color: .black.opacity(0.15), radius: 3)
                        Text("\u{26E9}").font(.system(size: 16))
                            .foregroundStyle(Color(.systemBackground))
                    }
                }
            }
            .navigationTitle(shrine.name)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Close") { showingMap = false }
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        StampDetailView(stamp: StampDefinition.all[0])
    }
    .modelContainer(for: [CollectedStamp.self], inMemory: true)
}
