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
                GosyuinListView()
            } label: {
                Label {
                    Text("Records")
                } icon: {
                    Image(systemName: "book.closed.fill")
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
        .tint(.vermillion)
    }
}

#Preview {
    ContentView()
        .modelContainer(for: [Gosyuin.self, CollectedStamp.self], inMemory: true)
}
