//
//  GraphicContextsView.swift
//  SwiftUICatalog
//
// MIT License
//
// Copyright (c) 2021 Barbara Martina
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

import SwiftUI

///
/// Examples on how to use  GRAPHIC CONTEXT  in SwiftUI
/// OFFICIAL DOCUMENTATION:
/// https://developer.apple.com/documentation/swiftui/graphicscontext
///

struct GraphicContextsView: View, Comparable {
    
    let id: String = "GraphicContextsView"
    
   /// width of the path we want to work with
    private let width: CGFloat = 200
    /// height of the path we want to work with
    private let height: CGFloat = 200
    /// path to use for rendering different drawings
    private let path = Path(ellipseIn: CGRect(origin: .zero, size: CGSize(width: 150, height: 150)))
    /// colors for the gradients to showcase
    private let gradientColors: [Color] = [.yellow.opacity(0.5),
                                  .blue.opacity(0.4)]
    
    var body: some View {
        
        PageContainer(content:

        ScrollView {
            
            DocumentationLinkView(link: "https://developer.apple.com/documentation/swiftui/graphicscontext")
            
            Group {
                Text("Graphic Contexts")
                    .fontWeight(.heavy)
                
                Text("A view providing a space for 2D drawing, images, texts or even other views. You can create copies of the initial context, this will add an extra drawing (transparent) layer in a tree")
                    .fontWeight(.light)
                
                HStack {
                    Spacer()
                    Canvas { context, size in
                        
                        // drawing directives sorting matters. Try out changing this .fill to the end to see how it renders.
                        context.fill(
                            path,
                            with: .color(.blue))
                        
                        context.fill(path,
                                     with: .linearGradient(Gradient(colors:gradientColors),
                                                           startPoint: .zero,
                                                           endPoint: CGPoint(x: size.width, y: size.height)))
                        
                        // draw in a second context / layer
                        var copyOfContext = context
                        let halfSize = size.applying(CGAffineTransform(scaleX: 0.5, y: 0.5))
                        copyOfContext.clip(to: Path(CGRect(origin: .zero, size: halfSize)))
                        copyOfContext.fill(
                            Path(ellipseIn: CGRect(origin: .zero, size: size)),
                            with: .color(.yellow))
                        
                        
                        
                    }
                    .frame(width: width)
                    Spacer()
                    
                }
                .frame(height: height)
                // end canvas 1: context and copy of context
                
                // MARK: - gradients
         
                Text("Linear gradient")
                    .fontWeight(.heavy)
                
                GradientContainer(name: "Linear",
                                  height: height,
                                  width: width,
                                  gradient: .linearGradient(Gradient(colors: gradientColors),
                                                        
                                                        startPoint: .zero,
                                                        
                                                        endPoint: CGPoint(x: width, y: height)),
                                  path: path)
                // end linear gradient
                
                
                // radial gradient
                Text("Radial gradient")
                    .fontWeight(.heavy)
                
                GradientContainer(name: "Radial",
                                  height: height,
                                  width: width,
                                  gradient: .radialGradient(Gradient(colors: gradientColors),
                                                        center: CGPoint(x: 60, y: 60),
                                                        startRadius: 2,
                                                        endRadius: 150),
                                  path: path)
                // end radial gradient
                
                // conic gradient
                GradientContainer(name: "Conic",
                                  height: height,
                                  width: width,
                                  gradient: .conicGradient(Gradient(colors: gradientColors),
                                                       center: CGPoint(x: 70, y: 70),
                                                       angle: Angle(degrees: 45),
                                                       options: .linearColor),
                                  path: path)
                // end conic gradient
                
            }
            .padding()
            // end group
            
            ContributedByView(name: "Barbara Martina",
                              link: "https://github.com/barbaramartina")
                .padding(.top, 80)

            
        })
        // end of page container
        
    }
}

struct GraphicContextsView_Previews: PreviewProvider {
    static var previews: some View {
        GraphicContextsView()
    }
}

/// Auxiliar view to stack a gradient in a horizontal stack view
private struct GradientContainer: View {
    
    let name: String
    let height: CGFloat
    let width: CGFloat
    let gradient: GraphicsContext.Shading
    let path: Path
    
    var body: some View {
        
        VStack {
            Text(name)
                .fontWeight(.heavy)
            
            HStack {
                Spacer()
                Canvas {  context, size in
                    
                    context.fill(path,
                                 with: gradient)
                    
                    
                }
                .frame(width: width)
                Spacer()

            }
            .frame(height: height)
        }

    }

}

// MARK: - HASHABLE

extension GraphicContextsView {
    
    static func == (lhs: GraphicContextsView, rhs: GraphicContextsView) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }


}


