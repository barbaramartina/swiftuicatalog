//
//  ColorPickersView.swift
//  SwiftUICatalog
//
// MIT License
//
// Copyright (c) 2021 Ali Ghayeni H
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
/// Examples on how to use COLOR PICKERS in SwiftUI
/// OFFICIAL DOCUMENTATION https://developer.apple.com/documentation/swiftui/colorpicker
///
struct ColorPickersView: View {
    
    @State private var bgColor =
        Color(.sRGB, red: 0.98, green: 0.9, blue: 0.2)
    
    var body: some View {
        
        ScrollView{
            Group {
                VStack {
                    HeaderView( title:"Color Picker in SwiftUI")
                    Text("The color picker provides a color well that shows the currently selected color, and displays the larger system color picker that allows users to select a new color.")
                        .padding()
                    ColorPicker("Alignment Guides",
                                selection: $bgColor)
                    HStack{
                        Text("with opacity")
                            .fontWeight(.ultraLight)
                        Spacer()
                    }
                    Spacer(minLength: 40)
                    ColorPicker("Alignment Guides",
                                selection: $bgColor,
                                supportsOpacity: false)
                    HStack{
                        Text("without opacity")
                            .fontWeight(.ultraLight)
                        Spacer()
                    }
                }
            }
            .padding()
        }
    }
}

struct ColorPickersView_Previews: PreviewProvider {
    static var previews: some View {
        ColorPickersView()
    }
}
