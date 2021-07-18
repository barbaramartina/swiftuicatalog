//
//  EffectsModifiersView.swift
//  SwiftUICatalog
//
// MIT License
//
// Copyright (c) 2021 Barbara Martina Rodeker
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
/// Examples on how to use  Effects Modifiers  in SwiftUI
/// To see all available modifiers select a view in anypreview and inspect the "Effects Modifiers" section
///

struct EffectsModifiersView: View {
    var body: some View {
        
        List {

            Group {
                
                VStack(alignment: .center) {
                    
                    HeaderView(title: "Border & blur effect")
                    Image("corgie-love")
                        .resizable()
                        .scaledToFill()
                        // border effect
                        .border(Color.pink, width: 10)
                        .frame(width: 200, height: 200)
                }
                
            }
            // blur effect
            .blur(radius: 1.0)
            // end of group
            
            Group {
                
                HeaderView(title: "Clip Shape & color inverted effect")
                Image("corgie-love")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 300, height: 300)
                    .clipShape(Circle())
                
                
            }
            .colorInvert()
            // end of group

            Group {
                HeaderView(title: "Brigthness effect")
                Image("corgie-love")
                    .resizable()
                    .scaledToFill()
                    .brightness(0.3)
            }
            // end of group

            Group {
                HeaderView(title: "Color multiply & Contrast effect")
                Image("corgie-love")
                    .resizable()
                    .scaledToFill()
                    
            }
            // color effect
            .colorMultiply(.blue)
            // Defines the content shape for hit testing.
            .contentShape(Circle())
            .contrast(3.0)
             // end of group

            Group {
                
                HeaderView(title: "Blend mode effect")
                HStack {
                    VStack {
                        Color.yellow.frame(width: 50, height: 50, alignment: .center)
                        Color.red.frame(width: 50, height: 50, alignment: .center)
                            .rotationEffect(.degrees(45))
                            .padding(-20)
                            // blend mode
                            .blendMode(.colorBurn)
                    }
                    .padding(10)
                    VStack {
                        Color.yellow.frame(width: 50, height: 50, alignment: .center)
                        Color.red.frame(width: 50, height: 50, alignment: .center)
                            .rotationEffect(.degrees(45))
                            .padding(-20)
                            // blend mode
                            .blendMode(.luminosity)
                    }
                    .padding(10)
                    VStack {
                        Color.yellow.frame(width: 50, height: 50, alignment: .center)
                        Color.red.frame(width: 50, height: 50, alignment: .center)
                            .rotationEffect(.degrees(45))
                            .padding(-20)
                            // blend mode
                            .blendMode(.lighten)
                    }
                    .padding(10)

                    VStack {
                        Color.yellow.frame(width: 50, height: 50, alignment: .center)
                        Color.red.frame(width: 50, height: 50, alignment: .center)
                            .rotationEffect(.degrees(45))
                            .padding(-20)
                            // blend mode
                            .blendMode(.exclusion)
                    }
                    .padding(10)

                }
            }
        }
        // accent color effect
        .accentColor(.green)
    }
}

struct EffectsModifiersView_Previews: PreviewProvider {
    static var previews: some View {
        EffectsModifiersView()
    }
}
