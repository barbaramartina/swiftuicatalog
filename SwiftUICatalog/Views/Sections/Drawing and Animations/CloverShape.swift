//
//  CloverShape.swift
//  Catalog
//
//  Created by Barbara Personal on 2025-05-06.
//

import Foundation
import SwiftUI
import CoreGraphics

struct CloverShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let petalRadius = min(rect.width, rect.height) * 0.25
        
        for i in 0..<4 {
            let angle = Angle.degrees(Double(i) * 90)
            let offset = CGPoint(
                x: center.x + cos(angle.radians) * petalRadius,
                y: center.y + sin(angle.radians) * petalRadius
            )
            
            path.addEllipse(in: CGRect(
                x: offset.x - petalRadius,
                y: offset.y - petalRadius,
                width: petalRadius * 2,
                height: petalRadius * 2
            ))
        }
        
        return path
    }
}

