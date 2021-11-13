//
//  StacksView.swift
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
/// Examples on how to use  STACK VIEWS  in SwiftUI
/// OFFICIAL DOCUMENTATION:
/// https://developer.apple.com/documentation/swiftui/hstack
/// https://developer.apple.com/documentation/swiftui/vstack
/// https://developer.apple.com/documentation/swiftui/zstack
/// https://developer.apple.com/documentation/swiftui/lazyhstack
/// https://developer.apple.com/documentation/swiftui/lazyvstack
///

struct StacksView: View {
    
    let colors: [Color] =
        [ Color("secondary"), .green, .blue, .purple]
    
    var body: some View {
        ScrollView () {
            
            Group{
                VStack {
                    HStack {
                        Spacer()
                        HStack {
                            Spacer()
                            DocumentationLinkView(link: "https://developer.apple.com/documentation/swiftui/hstack")
            
                        }
                        .padding(.trailing)

                        HeaderView(title: "Lazy / H - V & Z Stack views in SwiftUI")
                        Spacer()
                    }
                    // contextual information
                    Group {
                        Text("Stacks – equivalent to UIStackView in UIKit – come in three forms: horizontal (HStack), vertical (VStack) and depth-based (ZStack), with the latter being used when you want to place child views so they overlap.")
                            .fontWeight(.light)
                        Text("An example of a Hstack with TextViews")
                            .fontWeight(.heavy)
                        Text("A view that arranges its children in a horizontal line.")
                            .fontWeight(.light)
                    }
                    .padding()
                    
                    // MARK: - Hstack
                    ScrollView (.horizontal) {
                        HStack(
                            alignment: .top,
                            spacing: 8
                        ) {
                            ForEach(
                                1...10,
                                id: \.self
                            ) {
                                Text("Item \($0)")
                            }
                        }.padding()
                    }
                    // contextual information
                    Group {
                        Text("An example of a lazyHstack with TextViews")
                            .fontWeight(.heavy)
                        Text("The stack is “lazy,” in that the stack view doesn’t create items until it needs to render them onscreen.")
                            .fontWeight(.light)
                    }
                    .padding()
                    // MARK: - lazyHstack
                    ScrollView (.horizontal) {
                        LazyHStack(
                            alignment: .top,
                            spacing: 8
                        ) {
                            ForEach(
                                1...100,
                                id: \.self
                            ) {
                                Text("Lazy Item \($0)")
                            }
                        }
                        .padding()
                    }
                    // contextual information
                    Group {
                        Text("An example of a Vstack with TextViews")
                            .fontWeight(.heavy)
                        Text("A view that arranges its children in a vertical line. VStack renders the views all at once, regardless of whether they are on- or offscreen. Use the regular VStack when you have a small number of child views or don’t want the delayed rendering behavior of the “lazy” version.")
                            .fontWeight(.light)
                    }
                    .padding()
                    // MARK: - Vstack
                    ScrollView () {
                        VStack {
                            ForEach(
                                1...10,
                                id: \.self
                            ) {
                                Text("Item \($0)")
                            }
                        }
                    }
                    .frame(maxHeight:150)
                    // contextual information
                    Group {
                        Text("An example of a lazyVstack with TextViews")
                            .fontWeight(.heavy)
                        Text("The stack is “lazy,” in that the stack view doesn’t create items until it needs to render them onscreen.")
                            .fontWeight(.light)
                    }
                    .padding()
                    // MARK: - lazyVstack
                    ScrollView () {
                        LazyVStack {
                            ForEach(
                                1...100,
                                id: \.self
                            ) {
                                Text("Lazy Item \($0)")
                            }
                        }
                    }
                    .frame(maxHeight:150)
                }
                // contextual information
                Group {
                    Text("An example of a ZStack with RectangleViews")
                        .fontWeight(.heavy)
                    Text("The ZStack assigns each successive child view a higher z-axis value than the one before it, meaning later children appear “on top” of earlier ones.")
                        .fontWeight(.light)
                }
                .padding()
                // MARK: - Zstack
                ZStack {
                    ForEach(0..<colors.count) {
                        Rectangle()
                            .fill(colors[$0])
                            .frame(width: 100, height: 100)
                            .offset(x: CGFloat($0) * 10.0,
                                    y: CGFloat($0) * 10.0)
                    }
                }
                Spacer(minLength: 40)
                Group {
                    Text("some text over a picture for example (with ZStack)")
                        .fontWeight(.light)
                }
                .padding()
                ZStack() {
                    Image("labrador")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    Text("labrador")
                        .font(.largeTitle)
                        .background(Color.black)
                        .foregroundColor(.white)
                }
            }
            ContributedByView(name: "Ali Ghayeni H",
                              link: "https://github.com/alighayeni")
                .padding(.top, 80)

        }
    }
}

struct StacksView_Previews: PreviewProvider {
    static var previews: some View {
        StacksView()
    }
}
