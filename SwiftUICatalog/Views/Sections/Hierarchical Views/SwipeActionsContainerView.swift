// MARK: - MCP Metadata
// @symbol: SwipeActionsContainerView
// @category: swiftui
// @tags: containers, controls, layouts, user-input
// ---

//
//  OutlinesGroupsView.swift
//  SwiftUICatalog
//
// MIT License
//
// Copyright (c) 2021 Ali Ghayeni h
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

/// Key Points Demonstrated:
/// - .swipeActionsContainer() - The essential modifier that enables swipe coordination outside of List containers
/// - .swipeActions(edge:allowsFullSwipe:content:) - Applied to individual rows within the container
/// - Automatic coordination:
///       Only one row’s swipe actions revealed at a time
///       Scrolling dismisses open actions
///       Tapping outside the active row dismisses actions
/// Custom layouts work - Unlike List, this works with ScrollView, LazyVStack, custom FlowLayout, etc.
///

// Sample data model
struct Item: Identifiable {
    let id = UUID()
    let title: String
    let color: Color
}

struct SwipeActionsContainerDemo: View {
    @State private var items: [Item] = [
        Item(title: "Delete Item 1", color: .red),
        Item(title: "Delete Item 2", color: .blue),
        Item(title: "Delete Item 3", color: .green),
        Item(title: "Delete Item 4", color: .orange),
        Item(title: "Delete Item 5", color: .purple)
    ]
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 12) {
                ForEach(items) { item in
                    HStack {
                        Circle()
                            .fill(item.color)
                            .frame(width: 40, height: 40)
                        
                        Text(item.title)
                            .font(.headline)
                        
                        Spacer()
                    }
                    .padding()
                    .background(Color(.systemBackground))
                    .cornerRadius(12)
                    // Apply swipe actions to each row
                    .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                        Button(role: .destructive) {
                            // Remove item on delete
                            if let index = items.firstIndex(where: { $0.id == item.id }) {
                                items.remove(at: index)
                            }
                        } label: {
                            Label("Delete", systemImage: "trash")
                        }
                        // Add more actions as needed
                        Button {
                            // Archive action
                        } label: {
                            Label("Archive", systemImage: "folder.fill")
                        }
                        .tint(.blue)
                    }
                    .swipeActions(content: {
                        Text("delete")
                    }, onPresentationChanged: { isPresented in
                        print("Swipe actions for \(item.title) are now \(isPresented ? "visible" : "hidden")")
                    })

                }
            }
            .padding()
        }
        .swipeActionsContainer()
        .navigationTitle("Swipe Actions Container Demo")
    }
}

// Preview
struct SwipeActionsContainerDemo_Previews: PreviewProvider {
    static var previews: some View {
        SwipeActionsContainerDemo()
    }
}

