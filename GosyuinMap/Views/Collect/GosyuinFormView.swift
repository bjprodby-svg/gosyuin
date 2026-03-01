import SwiftUI
import SwiftData

struct GosyuinFormView: View {
    enum Mode {
        case add
        case edit(Gosyuin)
    }

    let mode: Mode
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss

    @State private var name = ""
    @State private var templeName = ""
    @State private var date = Date.now
    @State private var memo = ""

    private var isEditing: Bool {
        if case .edit = mode { return true }
        return false
    }

    private var isValid: Bool {
        !name.trimmingCharacters(in: .whitespaces).isEmpty
        && !templeName.trimmingCharacters(in: .whitespaces).isEmpty
    }

    var body: some View {
        NavigationStack {
            Form {
                Section("Gosyuin Info") {
                    TextField("Name", text: $name)
                    TextField("Temple / Shrine Name", text: $templeName)
                    DatePicker("Date", selection: $date, displayedComponents: .date)
                }

                Section("Memo") {
                    TextField("Notes (optional)", text: $memo, axis: .vertical)
                        .lineLimit(3...6)
                }
            }
            .navigationTitle(isEditing ? "Edit Gosyuin" : "New Gosyuin")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") { dismiss() }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Save") { save() }
                        .fontWeight(.semibold)
                        .disabled(!isValid)
                }
            }
            .onAppear {
                if case .edit(let gosyuin) = mode {
                    name = gosyuin.name
                    templeName = gosyuin.templeName
                    date = gosyuin.date
                    memo = gosyuin.memo
                }
            }
        }
    }

    private func save() {
        switch mode {
        case .add:
            let gosyuin = Gosyuin(
                name: name.trimmingCharacters(in: .whitespaces),
                templeName: templeName.trimmingCharacters(in: .whitespaces),
                date: date,
                memo: memo.trimmingCharacters(in: .whitespaces)
            )
            modelContext.insert(gosyuin)
        case .edit(let gosyuin):
            gosyuin.name = name.trimmingCharacters(in: .whitespaces)
            gosyuin.templeName = templeName.trimmingCharacters(in: .whitespaces)
            gosyuin.date = date
            gosyuin.memo = memo.trimmingCharacters(in: .whitespaces)
        }
        dismiss()
    }
}

#Preview("Add") {
    GosyuinFormView(mode: .add)
        .modelContainer(for: Gosyuin.self, inMemory: true)
}
