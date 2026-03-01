import SwiftUI
import SwiftData

struct GosyuinListView: View {
    @Query(sort: \Gosyuin.date, order: .reverse) private var gosyuins: [Gosyuin]
    @Environment(\.modelContext) private var modelContext
    @State private var showingAddSheet = false
    @State private var searchText = ""

    private var filteredGosyuins: [Gosyuin] {
        if searchText.isEmpty { return gosyuins }
        return gosyuins.filter {
            $0.name.localizedCaseInsensitiveContains(searchText)
            || $0.templeName.localizedCaseInsensitiveContains(searchText)
        }
    }

    var body: some View {
        NavigationStack {
            Group {
                if gosyuins.isEmpty {
                    emptyState
                } else {
                    gosyuinList
                }
            }
            .background(Color.pageBackground)
            .navigationTitle("Gosyuin Records")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showingAddSheet = true
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .font(.title3)
                            .foregroundStyle(.vermillion)
                    }
                }
            }
            .sheet(isPresented: $showingAddSheet) {
                GosyuinFormView(mode: .add)
            }
            .sensoryFeedback(.success, trigger: gosyuins.count)
        }
    }

    // MARK: - Empty State

    private var emptyState: some View {
        VStack(spacing: DS.Spacing.lg) {
            Spacer()

            ZStack {
                Circle()
                    .strokeBorder(
                        Color.vermillion.opacity(0.2),
                        style: StrokeStyle(lineWidth: 2, dash: [8, 6])
                    )
                    .frame(width: 100, height: 100)

                Image(systemName: "seal")
                    .font(.system(size: 40))
                    .foregroundStyle(.vermillion.opacity(0.4))
            }

            VStack(spacing: DS.Spacing.sm) {
                Text("No Records Yet")
                    .font(.title3.weight(.semibold))
                    .foregroundStyle(.bodyText)

                Text("Tap + to record your first gosyuin")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }

            Button {
                showingAddSheet = true
            } label: {
                Label("Add Gosyuin", systemImage: "plus")
                    .vermillionButtonStyle()
            }
            .buttonStyle(.pressable)
            .padding(.horizontal, DS.Spacing.xxl)

            Spacer()
        }
        .padding()
    }

    // MARK: - List

    private var gosyuinList: some View {
        List {
            if !gosyuins.isEmpty {
                Section {
                    // 検索バー
                    HStack(spacing: DS.Spacing.sm) {
                        Image(systemName: "magnifyingglass")
                            .foregroundStyle(.secondary)
                        TextField("Search records", text: $searchText)
                            .textFieldStyle(.plain)
                    }
                    .padding(DS.Spacing.md)
                    .background(Color.cardBackground, in: RoundedRectangle(cornerRadius: DS.Radius.md))
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color.clear)
                }
            }

            ForEach(filteredGosyuins) { gosyuin in
                NavigationLink {
                    GosyuinRecordDetailView(gosyuin: gosyuin)
                } label: {
                    GosyuinRow(gosyuin: gosyuin)
                }
                .listRowSeparator(.hidden)
            }
            .onDelete(perform: deleteGosyuins)
        }
        .listStyle(.plain)
        .sensoryFeedback(.impact(.medium), trigger: filteredGosyuins.count)
    }

    private func deleteGosyuins(at offsets: IndexSet) {
        for index in offsets {
            modelContext.delete(filteredGosyuins[index])
        }
    }
}

// MARK: - Gosyuin Row

private struct GosyuinRow: View {
    let gosyuin: Gosyuin

    var body: some View {
        HStack(spacing: DS.Spacing.md) {
            ZStack {
                Circle()
                    .fill(Color.vermillionLight)
                    .frame(width: 48, height: 48)
                Image(systemName: "seal.fill")
                    .font(.title3)
                    .foregroundStyle(.vermillion)
            }

            VStack(alignment: .leading, spacing: DS.Spacing.xs) {
                Text(gosyuin.name)
                    .font(.subheadline.weight(.semibold))
                Text(gosyuin.templeName)
                    .font(.caption)
                    .foregroundStyle(.secondary)
                Text(gosyuin.date.formatted(.dateTime.year().month().day()))
                    .font(.caption2)
                    .foregroundStyle(.tertiary)
            }
        }
        .padding(.vertical, DS.Spacing.xs)
    }
}

#Preview {
    GosyuinListView()
        .modelContainer(for: [Gosyuin.self, CollectedStamp.self], inMemory: true)
}
