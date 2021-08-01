//
//  MotionsAnimation.swift
//  SwiftUICatalog
//
//  Created by Barbara Rodeker on 01.08.21.
//

import SwiftUI

struct MotionAnimationView: View {
    
    // MARK: - Properties
    
    @State private var randomShapeCount = Int.random(in: 12...16)
    @State private var isAnimating: Bool = false
    
    // MARK: Functions random
    
    func randomCoordinate(max: CGFloat) -> CGFloat {
        return CGFloat.random(in: 0...max)
    }
    
    func randomSize() -> CGFloat {
        return CGFloat.random(in: 10...500)
    }
    
    func randomScale() -> CGFloat {
        return CGFloat(Double.random(in: 0.1...2.0))
    }
    
    func randomSpeed() -> Double {
        return Double.random(in: 0.025...1.0)
    }
    
    func randomDelay() -> Double {
        return Double.random(in: 0...2)
    }
    
    // MARK: - Body
    

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                
                ForEach(0...randomShapeCount, id: \.self) { item in
                    Circle()
                        .foregroundColor(.accentColor)
                        .opacity(0.15)
                        .frame(width: randomSize(),
                               height: randomSize(), alignment: .center)
                        .scaleEffect(isAnimating ? randomScale() : 1)
                        .position(
                            x: randomCoordinate(max: geometry.size.width),
                            y: randomCoordinate(max: geometry.size.height)
                    )
                        .animation(
                            Animation.interpolatingSpring(stiffness: 0.5,
                                                          damping: 0.5)
                                .repeatForever()
                                .speed(randomSpeed())
                                .delay(randomDelay())
                        )
                        .onAppear(perform: {
                            isAnimating = true
                        })
                }
                // end of loop
                
            }
            // this allows the rendering to be faster and powered by metal
            .drawingGroup()
            // end of z stack
        }
        // end of geometry
    }
}

struct MotionAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        MotionAnimationView()
    }
}
