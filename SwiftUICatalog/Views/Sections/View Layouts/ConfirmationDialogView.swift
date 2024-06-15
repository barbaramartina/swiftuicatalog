//
//  ConfirmationDialogView.swift
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

struct ConfirmationDialogView: View, Comparable {
    let id: String = "ConfirmationDialogView"
    
    @State private var isConfirm = false
    
    var body: some View {
        PageContainer(content: ScrollView {
            VStack(alignment: .leading) {
                DocumentationLinkView(link: "https://developer.apple.com/documentation/swiftui/view/confirmationdialog(_:ispresented:titlevisibility:presenting:actions:)-9ibgk", name: "Confirmation Dialog")
                
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

private extension ConfirmationDialogView {
    var introduction: some View {
        VStack(alignment: .leading) {
            Text("Confirmation Dialog")
                .fontWeight(.heavy)
            Text("Presents a confirmation dialog with a message using data to produce the dialog’s content and a localized string key for the title.")
                .fontWeight(.light)
            Text("iOS 15.0+ | iPadOS 15.0+")
                .fontWeight(.light)
                .padding(.top, 3)
        }
    }
    
    var content: some View {
        Button("Delete Files") {
            isConfirm.toggle()
        }
        .buttonStyle(.borderedProminent)
        .confirmationDialog("Delete Files Confirmation!", isPresented: $isConfirm, titleVisibility: .visible) {
            Button("Confirm") {}
            Button("Delete", role: .destructive) {}
        } message: {
            Text("Do you really want to delete these files?")
        }
    }
}

extension ConfirmationDialogView {
    static func == (lhs: ConfirmationDialogView, rhs: ConfirmationDialogView) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
