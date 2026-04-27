import SwiftUI

struct SettingsView: View {
    @AppStorage("tipPromptsEnabled") private var tipPromptsEnabled = true

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
            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    SettingsView()
}
