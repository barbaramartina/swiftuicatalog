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

struct GraphicContextsView: View {
    
    private let path = Path(ellipseIn: CGRect(origin: .zero, size: CGSize(width: 150, height: 150)))
    
    var body: some View {
        
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
                                     with: .linearGradient(Gradient(colors: [.white.opacity(0.5), .black.opacity(0.4)]),
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
                    .frame(width: 150)
                    Spacer()
                    
                }
                .frame(height: 150)
                // end canvas 1
                
                // MARK: - gradients
                
                Text("In a canvas you can draw different types of gradients")
                    .fontWeight(.light)
                
                Text("Linear gradient")
                    .fontWeight(.heavy)
                
                
                HStack {
                    Spacer()
                    Canvas {  context, size in
                        
                        context.fill(path,
                                     with: .linearGradient(Gradient(colors: [.white.opacity(0.5), .black.opacity(0.4)]),
                                                           
                                                           startPoint: .zero,
                                                           
                                                           endPoint: CGPoint(x: size.width, y: size.height)))
                        
                        
                    }
                    .frame(width: 150)
                    Spacer()

                }
                .frame(height: 150)
                // end linear gradient
                
                
                // radial gradient
                Text("Radial gradient")
                    .fontWeight(.heavy)
                
                HStack {
                    Spacer()
                    Canvas {  context, size in
                        
                        context.fill(path,
                                     with: .radialGradient(Gradient(colors: [.blue.opacity(0.8), .white.opacity(0.1)]),
                                                           center: CGPoint(x: 60, y: 60),
                                                           startRadius: 2,
                                                           endRadius: 150))
                        
                        
                    }
                    .frame(width: 150)

                    Spacer()
                }
                .frame(height: 150)
                
                
                // end canvas gradients
                
            }
            // end group
            
            ContributedByView(name: "Barbara Martina",
                              link: "https://github.com/barbaramartina")
                .padding(.top, 80)

            
        }
        
    }
}

struct GraphicContextsView_Previews: PreviewProvider {
    static var previews: some View {
        GraphicContextsView()
    }
}
