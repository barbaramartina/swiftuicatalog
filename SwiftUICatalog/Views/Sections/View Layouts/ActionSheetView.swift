//
//  ActionSheetView.swift
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

struct ActionSheetView: View, Comparable {
    let id: String = "ActionSheetView"
    
    @State private var isConfirm = false
    
    var body: some View {
        PageContainer(content: ScrollView {
            VStack(alignment: .leading) {
                DocumentationLinkView(link: "https://developer.apple.com/documentation/swiftui/actionsheet", name: "Action Sheet")
                
                introduction
                
                content
                
                ContributedByView(
                    name: "Ahmed Ali",
                    link: "https://github.com/meetAhmed"
                )
                .padding(.top, 80)
            }
        })
    }
}

private extension ActionSheetView {
    var introduction: some View {
        VStack(alignment: .leading) {
            Text("Action Sheet")
                .fontWeight(.heavy)
            Text("An action sheet is a modal view that presents choices related to an action people initiate.")
                .fontWeight(.light)
            Text("iOS 14.0 and below")
                .fontWeight(.light)
                .padding(.top, 3)
        }
    }
    
    var content: some View {
        Button("Delete Files") {
            isConfirm.toggle()
        }
        .buttonStyle(.borderedProminent)
        .actionSheet(isPresented: $isConfirm) {
            ActionSheet(
                title: Text("Delete Files Confirmation!"),
                message: Text("Do you really want to delete these files?"),
                buttons: [
                    .default(Text("Delete")),
                    .destructive(Text("Cancel"))
                ]
            )
        }
    }
}

extension ActionSheetView {
    static func == (lhs: ActionSheetView, rhs: ActionSheetView) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
