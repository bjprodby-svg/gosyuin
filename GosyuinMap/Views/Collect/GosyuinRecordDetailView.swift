import SwiftUI
import SwiftData
import MapKit

struct GosyuinRecordDetailView: View {
    @Bindable var gosyuin: Gosyuin
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    @State private var showingEditSheet = false
    @State private var showingDeleteConfirmation = false

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
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
            .padding()
        }
        .background(Color(.systemBackground))
        .navigationTitle(gosyuin.name)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button("Edit") {
                    showingEditSheet = true
                }
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
    }

    // MARK: - Header

    private var header: some View {
        VStack(spacing: 12) {
            ZStack {
                Circle()
                    .strokeBorder(
                        Color.vermillion,
                        style: StrokeStyle(lineWidth: 3, dash: [6, 4])
                    )
                    .frame(width: 100, height: 100)
                Circle()
                    .fill(Color.vermillion.opacity(0.10))
                    .frame(width: 88, height: 88)
                Image(systemName: "seal.fill")
                    .font(.system(size: 36))
                    .foregroundStyle(.vermillion)
            }

            Text(gosyuin.name)
                .font(.title2.bold())
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical)
    }

    // MARK: - Info

    private var infoSection: some View {
        VStack(spacing: 12) {
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
        HStack(spacing: 12) {
            Image(systemName: icon)
                .font(.title3)
                .foregroundStyle(.vermillion)
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

    // MARK: - Memo

    private var memoSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Label("Memo", systemImage: "note.text")
                .font(.subheadline.weight(.medium))
                .foregroundStyle(.secondary)

            Text(gosyuin.memo)
                .font(.body)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding()
        .background(Color(.secondarySystemGroupedBackground), in: RoundedRectangle(cornerRadius: 12))
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
        .clipShape(RoundedRectangle(cornerRadius: 16))
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
                .padding()
                .background(Color(.secondarySystemGroupedBackground), in: RoundedRectangle(cornerRadius: 12))
        }
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
