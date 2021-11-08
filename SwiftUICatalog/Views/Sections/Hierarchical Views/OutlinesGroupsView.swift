//
//  OutlinesGroupsView.swift
//  SwiftUICatalog
//
// MIT License
//
// Copyright (c) 2021 Ali Ghayeni h
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
/// Examples on how to use  OUTLINE GROUPs  in SwiftUI
/// OFFICIAL DOCUMENTATION:     https://developer.apple.com/documentation/swiftui/outlinegroup
///

struct OutlinesGroupsView: View {
    
    @Environment(\.openURL) var openURL

    struct FileItem: Hashable, Identifiable, CustomStringConvertible {
        var id: Self { self }
        var name: String
        var children: [FileItem]? = nil
        var description: String {
            switch children {
            case nil:
                return "📄 \(name)"
            case .some(let children):
                return children.isEmpty ? "📂 \(name)" : "📁 \(name)"
            }
        }
    }
    
    let data =
        FileItem(name: "Users", children:
                    [FileItem(name: " user1234", children:
                                [FileItem(name: "   Photos", children:
                                            [FileItem(name: "photo001.jpg"),
                                             FileItem(name: "photo002.jpg")]),
                                 FileItem(name: "   Movies", children:
                                            [FileItem(name: "movie001.mp4")]),
                                 FileItem(name: "   Documents", children: [])
                                ]),
                     FileItem(name: " newuser", children:
                                [FileItem(name: "   Documents", children: [])
                                ])
                    ])
    
    
    var body: some View {
        ScrollView {
            // Contextual information: a short intro to the elements we are showcasing
            Group {
                Text("Outlines Group Views")
                    .fontWeight(.heavy)
                Text("A structure that computes views and disclosure groups on demand from an underlying collection of tree-structured, identified data.")
                    .fontWeight(.light)
            }
            .padding()
            
            Group {
                Text("Use an outline group when you need a view that can represent a hierarchy of data by using disclosure views. This allows the user to navigate the tree structure by using the disclosure views to expand and collapse branches.")
                    .fontWeight(.light)
            }
            .padding()
            
            Group {
                OutlineGroup(data, children: \.children) { item in
                    Text("\(item.description)")}
            }
            .padding()
            
            HStack{
                Spacer()
                Button(action: {
                    openURL(URL(string: "https://developer.apple.com/documentation/swiftui/outlinegroup")!)
                }, label: {
                    Text("the OutlineGroup Doc!")
                })
            }
            .padding(.trailing, 10)
        }
    }
}

struct OutlinesGroupsView_Previews: PreviewProvider {
    static var previews: some View {
        OutlinesGroupsView()
    }
}
