import SwiftUI
import MapKit

struct SearchSheetView: View {
    var searchService: ShrineSearchService
    let region: MKCoordinateRegion
    let onSelect: (MKMapItem) -> Void

    @Environment(\.dismiss) private var dismiss
    @State private var query = ""
    @FocusState private var isFocused: Bool

    private let suggestions = ["神社", "寺", "神宮", "大社", "天満宮", "稲荷"]

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                searchBar

                if searchService.isSearching {
                    Spacer()
                    ProgressView("Searching...")
                        .foregroundStyle(.secondary)
                    Spacer()
                } else if searchService.results.isEmpty && !query.isEmpty {
                    Spacer()
                    ContentUnavailableView(
                        "No Results",
                        systemImage: "magnifyingglass",
                        description: Text("Try a different search term")
                    )
                    Spacer()
                } else if searchService.results.isEmpty {
                    suggestionChips
                    Spacer()
                } else {
                    resultsList
                }
            }
            .navigationTitle("Search Shrines")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Close") { dismiss() }
                }
            }
        }
        .presentationDetents([.medium, .large])
        .onAppear {
            isFocused = true
        }
    }

    // MARK: - Search Bar

    private var searchBar: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundStyle(.secondary)
            TextField("Search shrines & temples", text: $query)
                .textFieldStyle(.plain)
                .focused($isFocused)
                .onSubmit {
                    searchService.search(query: query, in: region)
                }
            if !query.isEmpty {
                Button {
                    query = ""
                    searchService.clear()
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundStyle(.secondary)
                }
            }
        }
        .padding(12)
        .background(Color(.secondarySystemGroupedBackground), in: RoundedRectangle(cornerRadius: 12))
        .padding()
    }

    // MARK: - Suggestion Chips

    private var suggestionChips: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Suggestions")
                .font(.subheadline.weight(.medium))
                .foregroundStyle(.secondary)

            FlowLayout(spacing: 8) {
                ForEach(suggestions, id: \.self) { suggestion in
                    Button {
                        query = suggestion
                        searchService.search(query: suggestion, in: region)
                    } label: {
                        Text(suggestion)
                            .font(.subheadline)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            .background(Color(.secondarySystemGroupedBackground),
                                        in: RoundedRectangle(cornerRadius: 20))
                    }
                    .buttonStyle(.plain)
                }
            }
        }
        .padding()
    }

    // MARK: - Results List

    private var resultsList: some View {
        List(searchService.results, id: \.self) { item in
            Button {
                onSelect(item)
            } label: {
                HStack(spacing: 12) {
                    Image(systemName: "mappin.circle.fill")
                        .font(.title2)
                        .foregroundStyle(.vermillion)

                    VStack(alignment: .leading, spacing: 2) {
                        Text(item.name ?? "Unknown")
                            .font(.subheadline.weight(.medium))
                            .foregroundStyle(.primary)
                        if let address = item.placemark.title {
                            Text(address)
                                .font(.caption)
                                .foregroundStyle(.secondary)
                                .lineLimit(1)
                        }
                    }

                    Spacer()

                    Image(systemName: "chevron.right")
                        .font(.caption)
                        .foregroundStyle(.tertiary)
                }
            }
        }
        .listStyle(.plain)
    }
}

// MARK: - Flow Layout

private struct FlowLayout: Layout {
    var spacing: CGFloat = 8

    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        let result = arrangeSubviews(proposal: proposal, subviews: subviews)
        return result.size
    }

    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        let result = arrangeSubviews(proposal: proposal, subviews: subviews)
        for (index, position) in result.positions.enumerated() {
            subviews[index].place(
                at: CGPoint(x: bounds.minX + position.x, y: bounds.minY + position.y),
                proposal: ProposedViewSize(result.sizes[index])
            )
        }
    }

    private func arrangeSubviews(proposal: ProposedViewSize, subviews: Subviews)
        -> (positions: [CGPoint], sizes: [CGSize], size: CGSize) {
        let maxWidth = proposal.width ?? .infinity
        var positions: [CGPoint] = []
        var sizes: [CGSize] = []
        var x: CGFloat = 0
        var y: CGFloat = 0
        var rowHeight: CGFloat = 0
        var maxX: CGFloat = 0

        for subview in subviews {
            let size = subview.sizeThatFits(.unspecified)
            if x + size.width > maxWidth && x > 0 {
                x = 0
                y += rowHeight + spacing
                rowHeight = 0
            }
            positions.append(CGPoint(x: x, y: y))
            sizes.append(size)
            rowHeight = max(rowHeight, size.height)
            x += size.width + spacing
            maxX = max(maxX, x - spacing)
        }

        return (positions, sizes, CGSize(width: maxX, height: y + rowHeight))
    }
}
