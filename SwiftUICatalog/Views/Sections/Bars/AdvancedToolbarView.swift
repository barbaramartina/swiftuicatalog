// MARK: - MCP Metadata
// @symbol: AdvancedToolbarView
// @category: swiftui
// @tags: containers, controls, hierarchical, layouts, navigation, user-input
// ---

import SwiftUI

struct AdvancedToolbarView: View {
    @State private var isSearching = false

    var body: some View {
        NavigationStack {
            List(0..<20) { i in
                Text("Item \(i)")
            }
            .navigationTitle("Advanced Toolbar")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button("Add") {
                        print("Add clicked")
                    }
                }
                .visibilityPriority(ToolbarItemVisibilityPriority.init(higherThan: .high)) // High priority, stays visible longer

                ToolbarItem(placement: .primaryAction) {
                    Button("Info") {
                        print("Info clicked")
                    }
                }
                .visibilityPriority(ToolbarItemVisibilityPriority.high)

                ToolbarOverflowMenu {
                    Button("Settings") { print("Settings") }
                    Button("Help") { print("Help") }
                }

                ToolbarItem(placement: .topBarPinnedTrailing) {
                    Button {
                        isSearching.toggle()
                    } label: {
                        Image(systemName: isSearching ? "xmark.circle.fill" : "magnifyingglass")
                    }
                }
            }
            .toolbarBackground(.visible, for: .navigationBar)
        }
    }
}

#Preview {
    AdvancedToolbarView()
}
