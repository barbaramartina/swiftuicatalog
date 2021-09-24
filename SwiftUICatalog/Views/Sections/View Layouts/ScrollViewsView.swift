//
//  ScrollViewsView.swift
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
/// Examples on how to use  SCROLLVIEWS  in SwiftUI
/// OFFICIAL DOCUMENTATION:     https://developer.apple.com/documentation/swiftui/scrollview
/// https://developer.apple.com/documentation/swiftui/scrollviewreader
/// https://developer.apple.com/documentation/swiftui/scrollviewproxy
///

struct ScrollViewsView: View {
    
    @Namespace var topID
    @Namespace var bottomID
    
    var body: some View {
        ScrollView {
            HeaderView( title: "Scroll views in SwiftUI")
            // MARK: -Vertical Scroll View
            Group {
                Text("ScrollView")
                    .fontWeight(.heavy)
                Text("The scroll view displays its content within the scrollable content region. As the user performs platform-appropriate scroll gestures, the scroll view adjusts what portion of the underlying content is visible. ScrollView can scroll horizontally, vertically, or both, but does not provide zooming functionality.")
                    .fontWeight(.light)
            }
            .padding()
            Text("Vertical ScrollView")
                .fontWeight(.heavy)
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(0..<20) {
                        Text("Cell \($0)")
                            .foregroundColor(.white)
                            .font(.largeTitle)
                            .frame(width: 200, height: 200)
                            .background(Color.blue)
                    }
                }
            }
            .frame(height: 350)
            // MARK: -Horizontal Scroll View
            Text("Horizontal ScrollView")
                .fontWeight(.heavy)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(0..<20) {
                        Text("Cell \($0)")
                            .foregroundColor(.white)
                            .font(.largeTitle)
                            .frame(width: 200, height: 200)
                            .background(Color.gray)
                    }
                }
            }
            // MARK: -Scroll View Reader
            Group {
                Text("ScrollViewReader + ScrollViewProxy")
                    .fontWeight(.heavy)
                Text("A view that provides programmatic scrolling, by working with a proxy to scroll to known child views.")
                    .fontWeight(.light)
                Text("The following example creates a ScrollView containing 100 views that together display a color gradient. It also contains two buttons, one each at the top and bottom. The top button tells the ScrollViewProxy to scroll to the bottom button, and vice versa.")
                    .fontWeight(.light)
                Text("A proxy value that supports programmatic scrolling of the scrollable views within a view hierarchy.")
                    .fontWeight(.light)
            }
            .padding()
            ScrollViewReader { proxy in
                ScrollView {
                    Button("Scroll to Bottom") {
                        withAnimation {
                            proxy.scrollTo(bottomID)
                        }
                    }
                    .id(topID)
                    
                    VStack(spacing: 0) {
                        ForEach(0..<100) { i in
                            color(fraction: Double(i) / 100)
                                .frame(height: 32)
                        }
                    }
                    
                    Button("Top") {
                        withAnimation {
                            proxy.scrollTo(topID)
                        }
                    }
                    .id(bottomID)
                }
            }
            .frame(height: 350)
        }
    }
    
    func color(fraction: Double) -> Color {
        Color(red: fraction, green: 1 - fraction, blue: 0.5)
    }
}

struct ScrollViewsView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewsView()
    }
}
