import SwiftUI
import SwiftData

struct GosyuinListView: View {
    @Query(sort: \Gosyuin.date, order: .reverse) private var gosyuins: [Gosyuin]
    @Environment(\.modelContext) private var modelContext
    @State private var showingAddSheet = false

    var body: some View {
        NavigationStack {
            Group {
                if gosyuins.isEmpty {
                    emptyState
                } else {
                    gosyuinList
                }
            }
            .navigationTitle("Gosyuin Records")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showingAddSheet = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddSheet) {
                GosyuinFormView(mode: .add)
            }
        }
    }

    // MARK: - Empty State

    private var emptyState: some View {
        ContentUnavailableView {
            Label("No Records", systemImage: "seal")
        } description: {
            Text("Tap + to record your first gosyuin")
        } actions: {
            Button {
                showingAddSheet = true
            } label: {
                Text("Add Gosyuin")
            }
        }
    }

    // MARK: - List

    private var gosyuinList: some View {
        List {
            ForEach(gosyuins) { gosyuin in
                NavigationLink {
                    GosyuinRecordDetailView(gosyuin: gosyuin)
                } label: {
                    GosyuinRow(gosyuin: gosyuin)
                }
            }
            .onDelete(perform: deleteGosyuins)
        }
        .listStyle(.plain)
    }

    private func deleteGosyuins(at offsets: IndexSet) {
        for index in offsets {
            modelContext.delete(gosyuins[index])
        }
    }
}

// MARK: - Gosyuin Row

private struct GosyuinRow: View {
    let gosyuin: Gosyuin

    var body: some View {
        HStack(spacing: 12) {
            ZStack {
                Circle()
                    .fill(Color.vermillion.opacity(0.12))
                    .frame(width: 48, height: 48)
                Image(systemName: "seal.fill")
                    .font(.title3)
                    .foregroundStyle(.vermillion)
            }

            VStack(alignment: .leading, spacing: 4) {
                Text(gosyuin.name)
                    .font(.headline)
                Text(gosyuin.templeName)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                Text(gosyuin.date.formatted(.dateTime.year().month().day()))
                    .font(.caption)
                    .foregroundStyle(.tertiary)
            }
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    GosyuinListView()
        .modelContainer(for: [Gosyuin.self, CollectedStamp.self], inMemory: true)
}
