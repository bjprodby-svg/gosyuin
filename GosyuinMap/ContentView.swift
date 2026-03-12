import SwiftUI
import SwiftData

struct ContentView: View {
    var body: some View {
        TabView {
            Tab {
                ExploreView()
            } label: {
                Label {
                    Text("Explore")
                } icon: {
                    Image(systemName: "mappin.and.ellipse")
                }
            }
            Tab {
                CollectView()
            } label: {
                Label {
                    Text("Collect")
                } icon: {
                    Image(systemName: "seal.fill")
                }
            }
            Tab {
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
    }
}

#Preview {
    ContentView()
        .modelContainer(for: [CollectedStamp.self], inMemory: true)
}
