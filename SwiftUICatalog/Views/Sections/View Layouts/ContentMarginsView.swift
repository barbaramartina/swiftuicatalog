//
//  ContentMarginsView.swift
//  SwiftUICatalog
//
//

import SwiftUI

///
/// Examples on how to use CONTENT MARGINS in SwiftUI
/// OFFICIAL DOCUMENTATION: https://developer.apple.com/documentation/swiftui/scrollview/contentmargins(_:for:)
///

struct ContentMarginsView: View {

    let id: String = "ContentMarginsView"

    var body: some View {
        PageContainer(
            content:
                VStack(alignment: .leading, spacing: 24) {

                    DocumentationLinkView(
                        link: "https://developer.apple.com/documentation/swiftui/scrollview/contentmargins(_:for:)",
                        name: "CONTENT MARGINS"
                    )

                    introductionTexts

                    // Example 1: contentMargins vs Padding
                    VStack(alignment: .leading, spacing: 12) {
                        Text("1. contentMargins vs Padding")
                            .font(.headline)
                        
                        Text("Standard padding on a ScrollView's content pushes the scroll indicators inward. `.contentMargins` keeps them at the edge of the screen while adding padding to the content.")
                            .font(.caption)
                            .foregroundColor(.secondary)

                        HStack {
                            PaddingExample()
                            ContentMarginsExample()
                        }
                    }

                    // Example 2: safeAreaInset interaction
                    VStack(alignment: .leading, spacing: 12) {
                        Text("2. Interaction with safeAreaInset")
                            .font(.headline)
                        
                        Text("Using `.safeAreaInset` allows you to place elements over the scroll content while `.contentMargins` ensures the content doesn't get hidden behind them.")
                            .font(.caption)
                            .foregroundColor(.secondary)

                        SafeAreaInsetExample()
                    }
                }
        )
    }

    private var introductionTexts: some View {
        Group {
            Text("Content Margins in SwiftUI")
                .fontWeight(.heavy)
                .font(.title)
            Text(
                "The `.contentMargins` modifier allows you to add padding to the content of a scroll view without moving the scroll indicators."
            )
            .fontWeight(.light)
            .font(.body)
        }
    }
}

// MARK: - Subviews

struct PaddingExample: View {
    var body: some View {
        VStack {
            Text("Padding")
                .font(.caption2)
                .fontWeight(.bold)
            
            ScrollView {
                VStack {
                    ForEach(0..<20) { i in
                        Text("Item \(i)")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue.opacity(0.2))
                            .cornerRadius(8)
                    }
                }
            }
            .padding(.horizontal, 20) // This pushes the scrollbar inward
            .frame(height: 200)
            .border(Color.gray)
        }
    }
}

struct ContentMarginsExample: View {
    var body: some View {
        VStack {
            Text("Content Margins")
                .font(.caption2)
                .fontWeight(.bold)
            
            ScrollView {
                VStack {
                    ForEach(0..<20) { i in
                        Text("Item \(i)")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.green.opacity(0.2))
                            .cornerRadius(8)
                    }
                }
            }
            .contentMargins(.horizontal, 20, for: .scrollContent) // Scrollbar stays at edge
            .frame(height: 200)
            .border(Color.gray)
        }
    }
}

struct SafeAreaInsetExample: View {
    var body: some View {
        ScrollView {
            VStack {
                ForEach(0..<20) { i in
                    Text("Item \(i)")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(8)
                }
            }
            .contentMargins(.horizontal, 20, for: .scrollContent)
        }
        .frame(height: 300)
        .border(Color.gray)
        .safeAreaInset(edge: .bottom) {
            Text("Floating Footer")
                .frame(maxWidth: .infinity)
                .padding()
                .background(.ultraThinMaterial)
                .cornerRadius(12)
                .padding()
        }
    }
}

#Preview {
    ContentMarginsView()
}

// MARK: - HASHABLE

extension ContentMarginsView: Comparable {
    static func < (lhs: ContentMarginsView, rhs: ContentMarginsView) -> Bool {
        lhs.id < rhs.id
    }
    
    static func == (lhs: ContentMarginsView, rhs: ContentMarginsView) -> Bool {
        lhs.id == rhs.id
    }
}
