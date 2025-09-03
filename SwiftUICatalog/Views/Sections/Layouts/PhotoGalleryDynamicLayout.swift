//
//  PhotoGalleryDynamicLayout.swift
//  SwiftUICatalog
//
//  Created by Barbara Rodeker on 03/09/25.
//

import Foundation
import SwiftUI

struct PhotoGalleryDynamicLayout: Layout {
    let columns: Int
    let spacing: CGFloat

    init(columns: Int = 2, spacing: CGFloat = 8) {
        self.columns = columns
        self.spacing = spacing
    }

    func sizeThatFits(
        proposal: ProposedViewSize,
        subviews: Subviews,
        cache: inout ()
    ) -> CGSize {
        
        guard subviews.isEmpty == false else { return .zero }

        let proposedSize = proposal.replacingUnspecifiedDimensions()
        // Calculate column widths
        let availableWidth = proposedSize.width
        let totalSpacing = CGFloat(columns - 1) * spacing
        let columnWidth = (availableWidth - totalSpacing) / CGFloat(columns)

        // Calculate heights for each column
        var columnHeights = Array(repeating: CGFloat(0), count: columns)

        for _ in subviews {
            let height = [columnWidth, columnWidth * 2, columnWidth * 1.3, columnWidth / 2, columnWidth * 1.6].randomElement()!

            // Find the shortest column to place this item
            let shortestColumnIndex =
                columnHeights.enumerated()
                .min(by: { $0.element < $1.element })?
                .offset ?? 0

            // Add to the shortest column's height
            columnHeights[shortestColumnIndex] += height + spacing
        }

        // Total height is the tallest column's height
        let totalHeight = columnHeights.max() ?? 0

        return CGSize(width: availableWidth, height: totalHeight)
    }

    func placeSubviews(
        in bounds: CGRect,
        proposal: ProposedViewSize,
        subviews: Subviews,
        cache: inout ()
    ) {
        guard !subviews.isEmpty else { return }

        // Calculate column widths
        let availableWidth = bounds.width
        let totalSpacing = CGFloat(columns - 1) * spacing
        let columnWidth = (availableWidth - totalSpacing) / CGFloat(columns)

        // Track current Y position for each column
        var columnHeights = Array(repeating: bounds.minY, count: columns)

        for subview in subviews {
            let height = [columnWidth, columnWidth * 2, columnWidth * 1.3].randomElement()!

            // Find the shortest column
            let (shortestColumnIndex, shortestColumnY) =
                columnHeights.enumerated()
                .min(by: { $0.element < $1.element })!

            // Calculate X position for this column
            let xPosition =
                bounds.minX + (columnWidth + spacing)
                * CGFloat(shortestColumnIndex)

            // Place the subview
            subview.place(
                at: CGPoint(
                    x: xPosition + columnWidth / 2,
                    y: shortestColumnY + height / 2
                ),
                anchor: .center,
                proposal: ProposedViewSize(CGSize(width: columnWidth, height: height))
            )

            // Update the column height
            columnHeights[shortestColumnIndex] += height + spacing
        }
    }
}
