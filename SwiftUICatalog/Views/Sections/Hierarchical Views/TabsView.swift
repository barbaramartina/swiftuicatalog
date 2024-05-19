//
//  TabsView.swift
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
/// Examples on how to use  TAB VIEWS  in SwiftUI
/// OFFICIAL DOCUMENTATION:
/// https://developer.apple.com/documentation/swiftui/tabview
///

struct TabsView: View, Comparable {
    
    let id: String = "TabsView"
    
    @Environment(\.openURL) var openURL
    
    var body: some View {
        
        PageContainer(content:
                        
                        VStack(alignment: .leading) {
            
            DocumentationLinkView(link: "ttps://developer.apple.com/documentation/swiftui/tabview")
            
            intro
            example1
                .padding(.top, Style.HorizontalPadding.large.rawValue * 4)
                .modifier(Divided())
            
            ContributedByView(name: "Ali Ghayeni H",
                              link: "https://github.com/alighayeni")
            .padding(.top, 80)
            
            
        })
    }
    
    private var intro: some View {
        Group {
            Text("A view that switches between multiple child views using interactive user interface elements. \n\nTo create a user interface with tabs, place views in a TabView and apply the tabItem(_:) modifier to the contents of each tab. On iOS, you can also use one of the badge modifiers, like badge(_:), to assign a badge to each of the tabs. \n\nTo provide optional, extra information about a view, use a badge. The badge's text should be as brief as feasible. Only list rows, tab bars, and menus have badges.")
                .fontWeight(.light)
        }
        
    }
    
    private var example1: some View {
        TabView {
            Text("The First Tab")
                .tabItem {
                    Image(systemName: "1.square.fill")
                    Text("First")
                }
            Text("Another Tab")
                .tabItem {
                    Image(systemName: "2.square.fill")
                    Text("Second")
                }
                .badge(10)
            Text("The Last Tab")
                .tabItem {
                    Image(systemName: "3.square.fill")
                    Text("Third")
                }
                .badge("!")
        }
        .font(.headline)
    }
}

struct TabsView_Previews: PreviewProvider {
    static var previews: some View {
        TabsView()
    }
}

// MARK: - HASHABLE

extension TabsView {
    
    static func == (lhs: TabsView, rhs: TabsView) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    
}


