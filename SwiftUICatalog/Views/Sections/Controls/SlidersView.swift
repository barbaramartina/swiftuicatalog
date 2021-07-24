//
//  SlidersView.swift
//  SwiftUICatalog
//
// MIT License
//
// Copyright (c) 2021 Barbara M. Rodeker
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

import SwiftUI

///
/// Examples on how to use SLIDERS in SwiftUI
/// OFFICIAL DOCUMENTATION https://developer.apple.com/documentation/swiftui/slider
/// 
struct SlidersView: View {
    
    // MARK: - Properties
    
    @State private var grams1 = 15.0
    @State private var grams2 = 15.0
    @State private var grams3 = 15.0
    @State private var isEditing1 = false
    @State private var isEditing2 = false
    @State private var isEditing3 = false

    // MARK: - Body
    
    
    var body: some View {

        List {
            HeaderView(title: "Slider with continued values")
            VStack {
                Slider(
                    value: $grams1,
                    in: 0...1000,
                    onEditingChanged: { editing in
                        isEditing1 = editing
                    }
                )
                .padding(30)
                Text("\(grams1)")
                    .foregroundColor(isEditing1 ? .blue : .black)
            }
            .padding(10)
            // end of v stack
            
            HeaderView(title: "Slider with steps")
            VStack {
                Slider(
                    value: $grams2,
                    in: 0...1000,
                    step: 20,
                    onEditingChanged: { editing in
                        isEditing2 = editing
                    }
                )
                .padding(30)
                Text("\(grams2)")
                    .foregroundColor(isEditing2 ? .blue : .black)
            }
            .padding(10)
            // end of v stack
            
            HeaderView(title: "Slider with VoiceOver Label & min / max values")
            VStack {
                Slider(value: $grams3,
                       in: 0...1000,
                       onEditingChanged: { editing in
                        isEditing3 = editing
                       },
                       minimumValueLabel: Label(
                        title: { Text("50") },
                        icon: { Image(systemName: "circle") }
                       ),
                       maximumValueLabel: Label(
                        title: { Text("900") },
                        icon: { Image(systemName: "circle") }
                        
                       ),
                       label: {
                        Text("This is a slider for grams")
                       })
                    .padding(30)
            }
            .padding(10)
            // end of v stack

        }
        // end of LIST
    }
}

struct SlidersView_Previews: PreviewProvider {
    static var previews: some View {
        SlidersView()
    }
}