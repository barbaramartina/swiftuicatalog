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
    /// required to allow customization in iPads / style side bar
    @State private var customization = TabViewCustomization()
    /// allowed for selecting a tab
    @State private var currentTab = 0

    @Environment(\.openURL) var openURL

    var body: some View {
        example1
            .onAppear {
                // this simulate a selection of a given tab
                currentTab = 2
            }
    }

    private var example1: some View {
        // for selection to work, do not forget to add "value", this was tricky and I could not find much examples about it
        TabView(selection: $currentTab) {
            Tab("First", systemImage: "1.square.fill", value: 0) {
                Text("Content of the first tab")
            }
            .customizationID("tab.1")
            Tab("Second", systemImage: "2.square.fill", value: 1) {
                Text("Content of the second tab")
            }
            // this allow a tab or tab section to be customized (only in the style = sidebarAdaptable)
            .customizationID("tab.2")
            .badge("P")
            Tab("Thrid", systemImage: "3.square.fill", value: 2) {
                Text("Content of the third tab")
            }
            .customizationID("tab.3")
            .badge(10)
            // use a section to organize the content - in iOS that does not have any effect, but it does in iPad.
            TabSection("Section") {
                Tab("Tab section 1", systemImage: "3.square.fill", value: 3) {
                    Text("Content - tab 1")
                }
                Tab("Tab section 2", systemImage: "3.square.fill", value: 4) {
                    Text("Content - tab 2")
                }
            }
            // this prevent customization from happening
            .customizationBehavior(.disabled, for: .sidebar, .tabBar)
        }
        // this will make the tab view adapt to the specific ios/ios/macOS/etc style...but also in iPads it allow the tab bar to be on the top when chosen by the user
        .tabViewStyle(.sidebarAdaptable)
        .tabViewCustomization($customization)
    }
}

#Preview {

    TabsView()

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
