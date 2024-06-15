//
//  LayoutPriorityView.swift
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

struct LayoutPriorityView: View, Comparable {
    let id: String = "LayoutPriorityView"
    
    @State private var isConfirm = false
    
    var body: some View {
        PageContainer(content: ScrollView {
            VStack(alignment: .leading) {
                DocumentationLinkView(link: "https://developer.apple.com/documentation/swiftui/view/layoutpriority(_:)", name: "layoutPriority(_:)")
                
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

private extension LayoutPriorityView {
    var introduction: some View {
        VStack(alignment: .leading) {
            Text("layoutPriority(_:)")
                .fontWeight(.heavy)
            Text("Sets the priority by which a parent layout should apportion space to this child.")
                .fontWeight(.light)
            Text("iOS 13.0+")
                .fontWeight(.light)
                .padding(.top, 3)
        }
    }
    
    var content: some View {
        HStack {
            Text("Life is too short to wait! Start now.")
                .background(Color.blue.opacity(0.5))
                .layoutPriority(1)
            
            Text("Only in the darkness you can see stars.")
                .background(Color.green.opacity(0.5))
        }
        .padding(5)
        .background(Color.red.opacity(0.5))
        .frame(maxWidth: .infinity, alignment: .center)
    }
}

extension LayoutPriorityView {
    static func == (lhs: LayoutPriorityView, rhs: LayoutPriorityView) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
