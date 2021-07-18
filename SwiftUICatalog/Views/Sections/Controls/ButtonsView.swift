//
//  ButtonsComponentsView.swift
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
/// A view showing different usages
/// of the SwiftUI BUTTON control
/// OFFICIAL DOCUMENTATION https://developer.apple.com/documentation/swiftui/button
///
struct ButtonsComponentsView: View {
    
    // MARK: - Properties
    
    @State private var fruits = [ "Apple", "Banana", "Papaya", "Mango"]
    
    @State private var pastedText: String = ""
    
    // MARK: - Body
    

    var body: some View {
        ScrollView {
            // MARK: - basics
            Group {
                HeaderView(title: "The basics of buttons")
                Button(action: {}, label: {
                    Text("Button with text")
                })
                HStack {
                    Text("Button with image:")
                    Spacer()
                    Button(action: {}, label: {
                        Image(systemName: "person")
                    })
                }
                HStack {
                    Text("Button with label:")
                    Spacer()
                    Button(action: {}, label: {
                        Label("Add person",
                              systemImage: "person")
                    })
                }
                HStack {
                    Text("Button with image and text")
                    Spacer()
                    Button(action: {}, label: {
                        Text("Add ")
                        Image(systemName: "person")
                    })
                }
            }
            .padding(5)
            
            // MARK: - styling
            Group {
                HeaderView(title: "Styling buttons")
                Button("Style me: bordered", action: {})
                    .buttonStyle(BorderlessButtonStyle())
                Button("Style me: plain", action: {})
                    .buttonStyle(PlainButtonStyle())
            }
            .padding(5)
            

        }
        .padding(.top, 48)
        
    }
}

struct ButtonsComponentsView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonsComponentsView()
            .previewLayout(.sizeThatFits)
    }
}
