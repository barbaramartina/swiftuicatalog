//
//  OffsetView.swift
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

struct OffsetView: View, Comparable {
    let id: String = "OffsetView"
    
    @State private var isConfirm = false
    
    var body: some View {
        PageContainer(content: ScrollView {
            VStack(alignment: .leading) {
                DocumentationLinkView(link: "https://developer.apple.com/documentation/swiftui/view/offset(x:y:)", name: "offset(x:y:)")
                
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

private extension OffsetView {
    var introduction: some View {
        VStack(alignment: .leading) {
            Text("offset(x:y:)")
                .fontWeight(.heavy)
            Text("Offset or shift view by specified horizontal or vertical amount.")
                .fontWeight(.light)
            Text("iOS 13.0+")
                .fontWeight(.light)
                .padding(.top, 3)
        }
    }
    
    var content: some View {
        HStack {
            Rectangle()
                .fill(.red)
                .frame(width: 100, height: 100)
            
            Rectangle()
                .fill(.yellow)
                .frame(width: 100, height: 100)
                .offset(x: 0, y: 50)
        }
        .padding(5)
        .background(Color.blue.opacity(0.5))
        .frame(maxWidth: .infinity, alignment: .center)
    }
}

extension OffsetView {
    static func == (lhs: OffsetView, rhs: OffsetView) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
