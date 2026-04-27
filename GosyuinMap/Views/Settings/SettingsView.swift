import SwiftUI

struct SettingsView: View {
    @AppStorage("tipPromptsEnabled") private var tipPromptsEnabled = true
    #if DEBUG
    @State private var tipPromptController = TipPromptController()
    @State private var showTipPreview = false
    @State private var debugMessage: String?
    #endif

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

                #if DEBUG
                Section {
                    Button {
                        tipPromptController.resetAll()
                        debugMessage = "Next stamp collection will show tip card"
                    } label: {
                        Label("Force Tip on Next Collect", systemImage: "arrow.clockwise")
                    }

                    Button {
                        showTipPreview = true
                    } label: {
                        Label("Preview Tip Jar Card", systemImage: "eye")
                    }
                } header: {
                    Text("Debug")
                } footer: {
                    if let msg = debugMessage {
                        Text(msg)
                            .foregroundStyle(Color.matcha)
                    }
                }
                #endif
            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
            #if DEBUG
            .sheet(isPresented: $showTipPreview) {
                VStack {
                    Text("Tip Card Preview")
                        .font(.headline)
                        .padding(.top, DS.Spacing.xl)
                    TipJarCard(
                        tipStore: TipStore(),
                        onDismissForever: {},
                        onDismiss: { showTipPreview = false }
                    )
                    .padding(DS.Spacing.lg)
                    Spacer()
                }
                .presentationDetents([.medium])
            }
            #endif
        }
    }
}

#Preview {
    SettingsView()
}
