// MARK: - MCP Metadata
// @symbol: AdvancedSwipeDemo
// @category: swiftui
// @tags: containers, controls, layouts, user-input
// ---

//
//  NavigationBarsComponentView.swift
//  SwiftUICatalog
//
// MIT License
//
// Copyright (c) 2021 Barbara Martina
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//
//
import Foundation
import SwiftUI

struct AdvancedSwipeDemo: View {
    
    // Sample data model
    struct Item: Identifiable {
        let id = UUID()
        let title: String
        let color: Color
        let deleteId: Int
        let actionTitle: String  // For confirmation dialog context
    }


    // MARK: - State using new item-based pattern
    @State private var selectedItem: Item?
    
    // Sample data
    @State private var items: [Item] = [
        AdvancedSwipeDemo.Item(title: "Delete Item 1", color: .red, deleteId: 1, actionTitle: "Invoice #INV-001"),
        AdvancedSwipeDemo.Item(title: "Delete Item 2", color: .blue, deleteId: 2, actionTitle: "Invoice #INV-002"),
        AdvancedSwipeDemo.Item(title: "Delete Item 3", color: .green, deleteId: 3, actionTitle: "Invoice #INV-003"),
        AdvancedSwipeDemo.Item(title: "Delete Item 4", color: .orange, deleteId: 4, actionTitle: "Invoice #INV-004"),
        AdvancedSwipeDemo.Item(title: "Delete Item 5", color: .purple, deleteId: 5, actionTitle: "Invoice #INV-005")
    ]
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 12) {
                ForEach(items) { item in
                    VStack {
                        HStack {
                            Circle()
                                .fill(item.color)
                                .frame(width: 40, height: 40)
                            
                            Text(item.title)
                                .font(.headline)
                            
                            Spacer()
                        }
                    }
                    .padding()
                    .background(Color(.systemBackground))
                    .cornerRadius(12)
                    // Swipe actions with container coordination
                    .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                        Button(role: .destructive) {
                            // Set item for confirmation dialog (item-based pattern)
                            selectedItem = item
                        } label: {
                            Label("Delete (Press ⌘d to delete)"
                                  , systemImage: "trash")
                        }
                        .tint(.red)
                        .keyboardShortcut(KeyEquivalent(Character("d")), modifiers: [.command])
                        
                        Button {
                            // Archive action
                        } label: {
                            Label("Archive", systemImage: "folder.fill")
                        }
                        .tint(.blue)
                    }

                }
            }
            .padding()
        }
        // Crucial modifier: enables swipe coordination outside of List
        .swipeActionsContainer()
        .toolbarOverflowMenu {
            Button("Action 1") { }
            Button("Action 2") { }
        }
        .navigationTitle("Swipe & Confirmation Demo")
    
        // MARK: - Item-based confirmation dialog (iOS 27)
        .confirmationDialog(
            "Delete Invoice",
            item: $selectedItem,
            titleVisibility: .visible
        ) { item in
            Button("Delete \"\(item.actionTitle)\"", role: .destructive) {
                // Perform deletion
                if let index = items.firstIndex(where: { $0.id == item.id }) {
                    items.remove(at: index)
                }
                // Automatically clears selectedItem after dismissal
            }
            Button("Cancel", role: .cancel) { }
        } message: { item in
            Text(
                "Invoice \(item.actionTitle) will be permanently removed.\nThis action cannot be undone."
            )
        }
    }
}

// Preview
struct AdvancedSwipeDemo_Previews: PreviewProvider {
    static var previews: some View {
        AdvancedSwipeDemo()
    }
}

