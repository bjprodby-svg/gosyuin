import SwiftUI
import SwiftData
import MapKit

struct StampDetailView: View {
    let stamp: StampDefinition
    @Query private var collectedStamps: [CollectedStamp]
    @State private var showingMap = false
    @State private var appeared = false

    private var collectedStamp: CollectedStamp? {
        collectedStamps.first { $0.slotId == stamp.id }
    }

    private var shrine: Shrine? {
        Shrine.samples.first { $0.stampSlotId == stamp.id }
    }

    var body: some View {
        ScrollView {
            VStack(spacing: DS.Spacing.xl) {
                stampHeader

                if let collected = collectedStamp {
                    collectedSection(collected)
                } else if shrine != nil {
                    uncollectedKnownSection
                } else {
                    unknownSection
                }
            }
            .padding(DS.Spacing.lg)
            .opacity(appeared ? 1 : 0)
            .offset(y: appeared ? 0 : 12)
        }
        .background(Color.pageBackground)
        .navigationTitle(stamp.name)
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $showingMap) {
            if let shrine {
                shrineMapSheet(shrine)
            }
        }
        .onAppear {
            withAnimation(.easeOut(duration: 0.4)) {
                appeared = true
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
                .foregroundStyle(Color.bodyText)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, DS.Spacing.lg)
    }

    // MARK: - Collected

    private func collectedSection(_ collected: CollectedStamp) -> some View {
        VStack(spacing: DS.Spacing.md) {
            infoRow(
                icon: "calendar",
                label: "Collected on",
                value: collected.collectedDate.formatted(.dateTime.year().month().day())
            )

            if let shrine {
                infoRow(icon: "mappin.circle.fill", label: shrine.name, value: shrine.address)

                Button {
                    showingMap = true
                } label: {
                    HStack(spacing: DS.Spacing.sm) {
                        Image(systemName: "map.fill")
                            .font(.subheadline)
                        Text("View Location")
                    }
                    .font(.subheadline.weight(.semibold))
                    .foregroundStyle(stamp.color)
                    .frame(maxWidth: .infinity)
                    .padding(DS.Spacing.md)
                    .background(stamp.color.opacity(0.1), in: RoundedRectangle(cornerRadius: DS.Radius.md))
                }
                .buttonStyle(.pressable)
            }
        }
    }

    private func infoRow(icon: String, label: String, value: String) -> some View {
        HStack(spacing: DS.Spacing.md) {
            IconBadge(icon: icon, size: 36, color: stamp.color)
            VStack(alignment: .leading, spacing: 2) {
                Text(label)
                    .font(.subheadline.weight(.medium))
                    .foregroundStyle(Color.bodyText)
                Text(value)
                    .font(.caption)
                    .foregroundStyle(Color.subtitleText)
            }
            Spacer()
        }
        .cardStyle()
    }

    // MARK: - Uncollected (Known Shrine)

    private var uncollectedKnownSection: some View {
        VStack(spacing: DS.Spacing.lg) {
            VStack(spacing: DS.Spacing.sm) {
                IconBadge(icon: "seal", size: 48, color: stamp.color)
                Text("This stamp has not been collected yet")
                    .font(.subheadline)
                    .foregroundStyle(Color.subtitleText)
                    .multilineTextAlignment(.center)
            }

            Button {
                showingMap = true
            } label: {
                HStack(spacing: DS.Spacing.sm) {
                    Image(systemName: "map.fill")
                        .font(.headline)
                    Text("View on Map")
                }
                .vermillionButtonStyle()
            }
            .buttonStyle(.pressable)
        }
    }

    // MARK: - Unknown

    private var unknownSection: some View {
        VStack(spacing: DS.Spacing.md) {
            IconBadge(icon: "questionmark.circle", size: 64, color: .placeholderIcon)
            Text("Not discovered yet")
                .font(.headline)
                .foregroundStyle(Color.subtitleText)
            Text("Explore more shrines to discover this stamp")
                .font(.caption)
                .foregroundStyle(Color.captionText)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, DS.Spacing.xxl)
    }

    // MARK: - Map Sheet

    private func shrineMapSheet(_ shrine: Shrine) -> some View {
        NavigationStack {
            Map {
                Annotation(shrine.name, coordinate: shrine.coordinate) {
                    ZStack {
                        Circle()
                            .fill(shrine.category.color)
                            .frame(width: 36, height: 36)
                            .shadow(color: shrine.category.color.opacity(0.3), radius: 4, y: 2)
                        Circle()
                            .strokeBorder(.white, lineWidth: 2)
                            .frame(width: 36, height: 36)
                        CategoryIconView(
                            category: shrine.category,
                            size: 16,
                            color: .white
                        )
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
