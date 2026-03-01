import SwiftUI
import SwiftData
import MapKit

struct GosyuinRecordDetailView: View {
    @Bindable var gosyuin: Gosyuin
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    @State private var showingEditSheet = false
    @State private var showingDeleteConfirmation = false
    @State private var appeared = false

    var body: some View {
        ScrollView {
            VStack(spacing: DS.Spacing.xl) {
                header
                infoSection
                if !gosyuin.memo.isEmpty {
                    memoSection
                }
                if gosyuin.latitude != 0 || gosyuin.longitude != 0 {
                    mapSection
                }
                deleteButton
            }
            .padding(DS.Spacing.lg)
            .opacity(appeared ? 1 : 0)
            .offset(y: appeared ? 0 : 12)
        }
        .background(Color.pageBackground)
        .navigationTitle(gosyuin.name)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button("Edit") {
                    showingEditSheet = true
                }
                .foregroundStyle(.vermillion)
            }
        }
        .sheet(isPresented: $showingEditSheet) {
            GosyuinFormView(mode: .edit(gosyuin))
        }
        .confirmationDialog("Delete this record?", isPresented: $showingDeleteConfirmation, titleVisibility: .visible) {
            Button("Delete", role: .destructive) {
                modelContext.delete(gosyuin)
                dismiss()
            }
        }
        .sensoryFeedback(.warning, trigger: showingDeleteConfirmation)
        .onAppear {
            withAnimation(.easeOut(duration: 0.4)) {
                appeared = true
            }
        }
    }

    // MARK: - Header

    private var header: some View {
        VStack(spacing: DS.Spacing.md) {
            ZStack {
                // 外側の篆刻風リング
                Circle()
                    .strokeBorder(
                        Color.vermillion,
                        style: StrokeStyle(lineWidth: 3, dash: [8, 4])
                    )
                    .frame(width: 100, height: 100)

                Circle()
                    .fill(Color.vermillionLight)
                    .frame(width: 88, height: 88)

                Image(systemName: "seal.fill")
                    .font(.system(size: 36))
                    .foregroundStyle(.vermillion)
            }

            Text(gosyuin.name)
                .font(.title2.bold())

            Text(gosyuin.templeName)
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, DS.Spacing.lg)
    }

    // MARK: - Info

    private var infoSection: some View {
        VStack(spacing: DS.Spacing.md) {
            infoRow(
                icon: "building.columns.fill",
                label: "Temple / Shrine",
                value: gosyuin.templeName
            )
            infoRow(
                icon: "calendar",
                label: "Date",
                value: gosyuin.date.formatted(.dateTime.year().month().day())
            )
        }
    }

    private func infoRow(icon: String, label: String, value: String) -> some View {
        HStack(spacing: DS.Spacing.md) {
            Image(systemName: icon)
                .font(.title3)
                .foregroundStyle(.vermillion)
                .frame(width: 28)
            VStack(alignment: .leading, spacing: DS.Spacing.xs) {
                Text(label)
                    .font(.subheadline.weight(.medium))
                Text(value)
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            Spacer()
        }
        .cardStyle()
    }

    // MARK: - Memo

    private var memoSection: some View {
        VStack(alignment: .leading, spacing: DS.Spacing.sm) {
            Label("Memo", systemImage: "note.text")
                .font(.subheadline.weight(.medium))
                .foregroundStyle(.secondary)

            Text(gosyuin.memo)
                .font(.body)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .accentedCard(accentColor: .vermillion)
    }

    // MARK: - Map

    private var mapSection: some View {
        Map {
            Annotation(gosyuin.templeName,
                       coordinate: CLLocationCoordinate2D(latitude: gosyuin.latitude, longitude: gosyuin.longitude)) {
                ZStack {
                    Circle().fill(Color(.label)).frame(width: 36, height: 36)
                        .shadow(color: .black.opacity(0.15), radius: 3)
                    Text("\u{26E9}").font(.system(size: 16))
                        .foregroundStyle(Color(.systemBackground))
                }
            }
        }
        .frame(height: 180)
        .clipShape(RoundedRectangle(cornerRadius: DS.Radius.lg))
        .allowsHitTesting(false)
    }

    // MARK: - Delete

    private var deleteButton: some View {
        Button(role: .destructive) {
            showingDeleteConfirmation = true
        } label: {
            Label("Delete Record", systemImage: "trash")
                .font(.subheadline)
                .foregroundStyle(.red)
                .frame(maxWidth: .infinity)
                .padding(DS.Spacing.lg)
                .background(Color.cardBackground, in: RoundedRectangle(cornerRadius: DS.Radius.md))
        }
        .buttonStyle(.pressable)
    }
}

#Preview {
    NavigationStack {
        GosyuinRecordDetailView(
            gosyuin: Gosyuin(name: "Test", templeName: "Test Temple", memo: "Good visit")
        )
    }
    .modelContainer(for: Gosyuin.self, inMemory: true)
}
