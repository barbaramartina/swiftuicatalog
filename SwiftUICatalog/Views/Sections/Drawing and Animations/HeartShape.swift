//
//  HeartShape.swift
//  Catalog
//
//  Created by Barbara Personal on 2025-05-06.
//

import Foundation
import SwiftUI

struct HeartShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let width = rect.width
        let height = rect.height
        
        let centerX = width / 2
        let topHeight = height * 0.3
        
        path.move(to: CGPoint(x: centerX, y: height))
        
        // Left curve
        path.addCurve(
            to: CGPoint(x: 0, y: topHeight),
            control1: CGPoint(x: centerX * 0.5, y: height * 0.85),
            control2: CGPoint(x: 0, y: height * 0.6)
        )
        
        // Top left arc
        path.addArc(
            center: CGPoint(x: centerX * 0.5, y: topHeight),
            radius: centerX * 0.5,
            startAngle: Angle(degrees: 180),
            endAngle: Angle(degrees: 0),
            clockwise: false
        )
        
        // Top right arc
        path.addArc(
            center: CGPoint(x: centerX * 1.5, y: topHeight),
            radius: centerX * 0.5,
            startAngle: Angle(degrees: 180),
            endAngle: Angle(degrees: 0),
            clockwise: false
        )
        
        // Right curve
        path.addCurve(
            to: CGPoint(x: centerX, y: height),
            control1: CGPoint(x: width, y: height * 0.6),
            control2: CGPoint(x: centerX * 1.5, y: height * 0.85)
        )
        
        return path
    }
}

