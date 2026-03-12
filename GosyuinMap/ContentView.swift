import SwiftUI
import SwiftData
import CoreLocation

struct ContentView: View {
    @State private var showTestStampPrompt = false
    @State private var testShrine: Shrine?

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
        .overlay(alignment: .bottomLeading) {
            Button {
                let shrine = Shrine(
                    id: UUID(uuidString: "FFFFFFFF-FFFF-FFFF-FFFF-FFFFFFFFFFFF")!,
                    name: "Test Shrine",
                    address: "Current Location",
                    description: "A test shrine for previewing stamp collection.",
                    coordinate: CLLocationCoordinate2D(latitude: 35.6895, longitude: 139.6917),
                    stampSlotId: 1,
                    category: .jinja,
                    tagline: "Debug only"
                )
                testShrine = shrine
                showTestStampPrompt = true
            } label: {
                HStack(spacing: 8) {
                    Image(systemName: "stamp.fill")
                        .font(.body.bold())
                    Text("Test Stamp")
                        .font(.subheadline.bold())
                }
                .foregroundStyle(.white)
                .padding(.horizontal, 16)
                .padding(.vertical, 12)
                .background(Color.vermillion, in: Capsule())
                .shadow(color: .black.opacity(0.3), radius: 6, y: 3)
            }
            .padding(.leading, 20)
            .padding(.bottom, 100)
        }
        .sheet(isPresented: $showTestStampPrompt) {
            if let shrine = testShrine {
                StampCollectionPrompt(
                    shrine: shrine,
                    onCollect: { },
                    onDismiss: {
                        showTestStampPrompt = false
                        testShrine = nil
                    }
                )
                .presentationDetents([.medium])
                .presentationDragIndicator(.visible)
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: [CollectedStamp.self], inMemory: true)
}
