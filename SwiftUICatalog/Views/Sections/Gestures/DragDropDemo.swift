import SwiftUI

// 1. Model conforming to Identifiable
struct Card: Identifiable {
    let id: String
    let color: Color
    let title: String
}

// 2. Helper extension on Array to apply the ReorderDifference
extension Array {
    mutating func apply<CollectionID: Hashable & Sendable>(
        difference: ReorderDifference<Element.ID, CollectionID>
    ) where Element: Identifiable, Element.ID: Sendable {
        guard let sourceIndex = firstIndex(where: { $0.id == difference.sources[0] }) else { return }
        let movedElement = remove(at: sourceIndex)
        
        let destination: Int
        switch difference.destination.position {
        case let .before(value):
            guard let index = firstIndex(where: { $0.id == value }) else { return }
            destination = index
        case .end:
            destination = endIndex
        }
        
        insert(movedElement, at: destination)
    }
}

// 3. Main Reorderable View
struct DragDropDemo: View {
    @State private var cards: [Card] = [
        Card(id: "blue", color: .blue, title: "Blue Card"),
        Card(id: "green", color: .green, title: "Green Card"),
        Card(id: "yellow", color: .yellow, title: "Yellow Card"),
        Card(id: "orange", color: .orange, title: "Orange Card"),
        Card(id: "pink", color: .pink, title: "Pink Card")
    ]

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 12) {
                    // ForEach marked with .reorderable()
                    ForEach(cards) { card in
                        CardSimpleView(card: card)
                    }
                    .reorderable()
                }
                .padding()
                // The container handles the reorder scope and applies changes
                .reorderContainer(for: Card.self) { difference in
                    cards.apply(difference: difference)
                }
            }
            .navigationTitle("Reorder Cards")
        }
    }
}

// 4. Subview representing each card
struct CardSimpleView: View {
    let card: Card

    var body: some View {
        HStack {
            Text(card.title)
                .font(.headline)
                .foregroundColor(.white)
            Spacer()
            Image(systemName: "line.3.horizontal")
                .foregroundColor(.white.opacity(0.7))
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(card.color)
        .cornerRadius(12)
    }
}

#Preview {
    DragDropDemo()
}
