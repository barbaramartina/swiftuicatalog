//
//  ColumnsLayoutView.swift
//  Catalog
//
//  Created by Barbara Personal on 2024-11-30.
//

import SwiftUI

struct ColumnsLayoutView: View {
    private let imageNames = (1...8).map { "landmark\($0)" }
    /// columns for the layout
    private let columns = [
        Column(boxes: [.rectangle, .squared, .rectangle]),
        Column(boxes: [.squared, .rectangle, .squared, .squared]),
        Column(boxes: [.rectangle, .squared]),
    ]

    var body: some View {
        ScrollView(showsIndicators: false) {
            PhotoGalleryDynamicLayout(columns: 3, spacing: 2) {
                ForEach(0..<80) { index in
                    Color.clear
                        .overlay {
                            Image(imageNames.randomElement()!)
                                .resizable()
                                .scaledToFill()
                        }
                        .clipped()
                }
            }
            .padding()
        }
    }
}

#Preview {
    ColumnsLayoutView()
}
