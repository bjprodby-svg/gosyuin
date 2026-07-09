import SwiftUI
import SwiftData

struct ContentView: View {
    private enum AppTab: Hashable {
        case explore, collect, learn
    }

    @State private var selectedTab: AppTab = .explore

    var body: some View {
        TabView(selection: $selectedTab) {
            Tab(value: .explore) {
                ExploreView()
            } label: {
                Label {
                    Text("Explore")
                } icon: {
                    Image(systemName: "mappin.and.ellipse")
                }
            }
            Tab(value: .collect) {
                CollectView()
            } label: {
                Label {
                    Text("Collect")
                } icon: {
                    Image(systemName: "seal.fill")
                }
            }
            Tab(value: .learn) {
                LearnListView()
            } label: {
                Label {
                    Text("Learn")
                } icon: {
                    Image(systemName: "book.fill")
                }
            }
        }
        .tint(Color.vermillion)
        .sensoryFeedback(.selection, trigger: selectedTab)
    }
}

#Preview {
    ContentView()
        .modelContainer(for: [CollectedStamp.self], inMemory: true)
}
