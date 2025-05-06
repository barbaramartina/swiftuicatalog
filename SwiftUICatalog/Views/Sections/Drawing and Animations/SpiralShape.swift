//
//  SpiralShape.swift
//  Catalog
//
//  Created by Barbara Personal on 2025-05-06.
//

import Foundation
import SwiftUI

struct SpiralShape: Shape {
    var turns: CGFloat = 5
    var spacing: CGFloat = 5
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let maxRadius = min(rect.width, rect.height) / 2
        let steps = 1000
        let angleStep = 2 * .pi * turns / CGFloat(steps)
        
        for i in 0..<steps {
            let angle = CGFloat(i) * angleStep
            let radius = spacing * angle / (2 * .pi)
            
            if radius > maxRadius { break }
            
            let x = center.x + radius * cos(angle)
            let y = center.y + radius * sin(angle)
            
            if i == 0 {
                path.move(to: CGPoint(x: x, y: y))
            } else {
                path.addLine(to: CGPoint(x: x, y: y))
            }
        }
        
        return path
    }
}

