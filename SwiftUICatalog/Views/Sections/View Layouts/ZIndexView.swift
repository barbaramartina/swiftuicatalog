//
//  ZIndexView.swift
//  SwiftUICatalog
//
// MIT License
//
// Copyright (c) 2024 Ahmed Ali
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

import SwiftUI

struct ZIndexView: View, Comparable {
    let id: String = "ZIndexView"
    
    @State private var isConfirm = false
    
    var body: some View {
        PageContainer(content: ScrollView {
            VStack(alignment: .leading) {
                DocumentationLinkView(link: "https://developer.apple.com/documentation/swiftui/view/zindex(_:)", name: "zIndex")
                
                introduction
                
                content
                
                ContributedByView(
                    name: "Ahmed Ali",
                    link: "https://github.com/meetAhmed"
                )
                .padding(.top, 50)
            }
        })
    }
}

private extension ZIndexView {
    var introduction: some View {
        VStack(alignment: .leading) {
            Text("zIndex")
                .fontWeight(.heavy)
            Text("Controls the display order of overlapping views.")
                .fontWeight(.light)
            Text("iOS 13.0+")
                .fontWeight(.light)
                .padding(.top, 3)
        }
    }
    
    var content: some View {
        VStack(spacing: 0) {
            Text("Without zindex")
                .fontWeight(.light)
            VStack(spacing: 0) {
                Rectangle()
                    .fill(.green)
                    .frame(width: 80, height: 80)
                
                Rectangle()
                    .fill(.blue)
                    .frame(width: 80, height: 80)
                    .rotationEffect(.degrees(45))
            }
            
            Text("Zindex applied to green box")
                .fontWeight(.light)
                .padding(.top, 50)
            VStack(spacing: 0) {
                Rectangle()
                    .fill(.green)
                    .frame(width: 80, height: 80)
                    .zIndex(1)
                
                Rectangle()
                    .fill(.blue)
                    .frame(width: 80, height: 80)
                    .rotationEffect(.degrees(45))
            }
        }
        .frame(maxWidth: .infinity, alignment: .center)
    }
}

extension ZIndexView {
    static func == (lhs: ZIndexView, rhs: ZIndexView) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
