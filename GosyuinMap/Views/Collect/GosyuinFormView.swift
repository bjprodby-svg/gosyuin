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
    @State private var didSave = false
    @FocusState private var focusedField: Field?

    private enum Field { case name, temple, memo }

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
                Section {
                    HStack(spacing: DS.Spacing.md) {
                        Image(systemName: "seal.fill")
                            .foregroundStyle(.vermillion)
                            .frame(width: 20)
                        TextField("Gosyuin Name", text: $name)
                            .focused($focusedField, equals: .name)
                    }
                    HStack(spacing: DS.Spacing.md) {
                        Image(systemName: "building.columns")
                            .foregroundStyle(.vermillion)
                            .frame(width: 20)
                        TextField("Temple / Shrine Name", text: $templeName)
                            .focused($focusedField, equals: .temple)
                    }
                    DatePicker("Date", selection: $date, displayedComponents: .date)
                } header: {
                    Text("Gosyuin Info")
                        .font(.subheadline.weight(.semibold))
                }

                Section {
                    TextField("Notes (optional)", text: $memo, axis: .vertical)
                        .lineLimit(3...6)
                        .focused($focusedField, equals: .memo)
                } header: {
                    Text("Memo")
                        .font(.subheadline.weight(.semibold))
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
                        .fontWeight(.bold)
                        .foregroundStyle(isValid ? .vermillion : .secondary)
                        .disabled(!isValid)
                }
            }
            .onAppear {
                if case .edit(let gosyuin) = mode {
                    name = gosyuin.name
                    templeName = gosyuin.templeName
                    date = gosyuin.date
                    memo = gosyuin.memo
                } else {
                    focusedField = .name
                }
            }
            .sensoryFeedback(.success, trigger: didSave)
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
        didSave.toggle()
        dismiss()
    }
}

#Preview("Add") {
    GosyuinFormView(mode: .add)
        .modelContainer(for: Gosyuin.self, inMemory: true)
}
