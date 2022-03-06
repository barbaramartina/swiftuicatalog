//
//  CanvasView.swift
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
/// Examples on how to use  CANVAS  in SwiftUI
/// OFFICIAL DOCUMENTATION:
/// https://developer.apple.com/documentation/swiftui/canvas
///

struct CanvasView: View {
    
    let spaces: [CGRect] = [CGRect(x: 0,
                                   y: 0,
                                   width: 100,
                                   height: 100),
                            CGRect(x: 10,
                                   y: 10,
                                   width: 10,
                                   height: 10),
                            CGRect(x: 100,
                                   y: 0,
                                   width: 200,
                                   height: 200)]
    let circle = Image(systemName: "circle")
    let square = Image(systemName: "square")
    
    enum ViewId: Int {
        case circle
        case square
    }
    
    var body: some View {
        
        ScrollView {
            HStack {
                Spacer()
                DocumentationLinkView(link: "https://developer.apple.com/documentation/swiftui/canvas")
            }
            .padding(.trailing)
            
            Group {
                Text("Canvas views")
                    .fontWeight(.heavy)
                Text("A canvas can be used to render 2D drawings You can use a graphic context and draw on it.")
                    .fontWeight(.light)
                
                Canvas { context, size in
                    context.stroke(
                        Path(ellipseIn: CGRect(origin: .zero, size: size)),
                        with: .color(.purple),
                        lineWidth: 4)
                    
                    let halfSize = size.applying(CGAffineTransform(scaleX: 0.5, y: 0.5))
                    context.clip(to: Path(CGRect(origin: .zero, size: halfSize)))
                    context.fill(
                        Path(ellipseIn: CGRect(origin: .zero, size: size)),
                        with: .color(.yellow))
                }
                .frame(width: 300, height: 200)
                .border(Color.blue)
                // end of canvas 1
                
                Text("Or you can use a canvas and fill it with renderable SwiftUI views.")
                    .fontWeight(.light)
                
                Canvas { context, size in
                    if let circle = context.resolveSymbol(id: ViewId.circle) {
                        for rect in spaces {
                            context.draw(circle, in: rect)
                        }
                    }
                    if let square = context.resolveSymbol(id: ViewId.square) {
                        for rect in spaces {
                            context.draw(square, in: rect)
                        }
                    }
                } symbols: {
                    circle.tag(ViewId.circle)
                    square.tag(ViewId.square)
                }
                .frame(width: 300, height: 200)
                .border(Color.blue)
                // end of canvas 2
                
                
            }
            .padding()
            
            ContributedByView(name: "Barbara Martina",
                              link: "https://github.com/barbaramartina")
                .padding(.top, 80)

            
        }
    }
}

struct CanvasView_Previews: PreviewProvider {
    static var previews: some View {
        CanvasView()
    }
}
