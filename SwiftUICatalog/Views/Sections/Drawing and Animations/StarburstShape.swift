//
//  StarburstShape.swift
//  Catalog
//
//  Created by Barbara Personal on 2025-05-06.
//

import Foundation
import SwiftUI

struct StarburstShape: Shape {
    var spikes: Int = 20
    var innerRadiusRatio: CGFloat = 0.4

    func path(in rect: CGRect) -> Path {
        var path = Path()

        let center = CGPoint(x: rect.midX, y: rect.midY)
        let outerRadius = min(rect.width, rect.height) / 2
        let innerRadius = outerRadius * innerRadiusRatio
        let angleStep = .pi * 2 / CGFloat(spikes * 2)

        for i in 0..<(spikes * 2) {
            let radius = (i % 2 == 0) ? outerRadius : innerRadius
            let angle = angleStep * CGFloat(i) - .pi / 2

            let x = center.x + radius * cos(angle)
            let y = center.y + radius * sin(angle)

            if i == 0 {
                path.move(to: CGPoint(x: x, y: y))
            } else {
                path.addLine(to: CGPoint(x: x, y: y))
            }
        }

        path.closeSubpath()
        return path
    }
}
