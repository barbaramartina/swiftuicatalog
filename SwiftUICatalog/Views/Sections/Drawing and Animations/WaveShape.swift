//
//  WaveShape.swift
//  Catalog
//
//  Created by Barbara Personal on 2025-05-06.
//

import Foundation
import SwiftUI

struct WaveShape: Shape {
    var amplitude: CGFloat = 20
    var frequency: CGFloat = 2
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let width = rect.width
        let height = rect.height
        
        path.move(to: CGPoint(x: 0, y: height / 2))
        
        for x in stride(from: 0, to: width, by: 1) {
            let relativeX = x / width
            let angle = relativeX * frequency * 2 * .pi
            let y = height / 2 + sin(angle) * amplitude
            
            path.addLine(to: CGPoint(x: x, y: y))
        }
        
        // Close the path to form a filled shape
        path.addLine(to: CGPoint(x: width, y: height))
        path.addLine(to: CGPoint(x: 0, y: height))
        path.closeSubpath()
        
        return path
    }
}
