//
//  ProgressViews.swift
//  SwiftUICatalog
//
// MIT License
//
// Copyright (c) 2021 Barbara Martina Rodeker
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
/// Examples on how to use  PROGRESS VIEW  in SwiftUI
/// OFFICIAL DOCUMENTATION:     https://developer.apple.com/documentation/swiftui/progressview
///

struct ProgressViews: View, Comparable {

    let id: String = "ProgressViews"

    @State private var progress = 0.0
    private let timer = Timer.publish(every: 0.5,
                                      on: .main,
                                      in: .common).autoconnect()


    var body: some View {

        PageContainer(content: ScrollView {

            DocumentationLinkView(link: "https://developer.apple.com/documentation/swiftui/progressview", name: "PROGRESS VIEW")

            plainProgressViews
            tintedProgressView
            subviewsInProgressView

            ContributedByView(name: "Barbara Martina",
                              link: "https://github.com/barbaramartina")
            .padding(.top, 80)

        }
            .padding()
                      // end scroll view
            .onReceive(timer) { _ in
                if progress < 100 {
                    progress += 2
                }
            }
        )

    }

    private var plainProgressViews: some View {
        Group {
            Text("Are used to indicate steps in a tasks or to show the user feedback while waiting. The first example is a linear progress view with text")
                .fontWeight(.light)
                .padding(.bottom)
                .modifier(ViewAlignmentModifier(alignment: .leading))

            ProgressView("Downloading…",
                         value: progress,
                         total: 100)

            Text("Simple progress views, with an spinner can be configured when no value are passed as parameter")
                .fontWeight(.light)
                .padding(.vertical, Style.VerticalPadding.medium.rawValue)
                .modifier(ViewAlignmentModifier(alignment: .leading))

            ProgressView()

            Text("A spinner can also be shown with a text associated")
                .fontWeight(.light)
                .padding(.vertical, Style.VerticalPadding.medium.rawValue)
                .modifier(ViewAlignmentModifier(alignment: .leading))

            ProgressView("Downloading")

            ProgressView("Please wait...")
                .progressViewStyle(CircularProgressViewStyle(tint: .accentColor))

        }
    }

    private var subviewsInProgressView: some View {
        Group {
            Text("Also any view can be included inside the progress view, such as in this case, a button")
                .fontWeight(.light)
                .padding(.vertical, Style.VerticalPadding.medium.rawValue)
                .modifier(ViewAlignmentModifier(alignment: .leading))

            ProgressView {
                Button(action: {
                    // to do: your cancellation logic
                }) {
                    Text("Cancel download")
                        .fontWeight(.heavy)
                        .foregroundColor(.accentColor)
                }
                .padding()
                .background(Color("YellowMedium"))
                .cornerRadius(5)
            }

        }
    }

    private var tintedProgressView: some View {
        Group {
            Text("The color of the spinner can be chosen with a tint color")
                .fontWeight(.light)
                .padding(.vertical, Style.VerticalPadding.medium.rawValue)
                .modifier(ViewAlignmentModifier(alignment: .leading))

            ProgressView("Please wait...", value: progress,

                         total: 100)
            .progressViewStyle(LinearProgressViewStyle(tint: .accentColor))
            .foregroundColor(Color("YellowMedium"))

        }
    }
}

struct ProgressViews_Previews: PreviewProvider {
    static var previews: some View {
        ProgressViews()
    }
}

// MARK: - HASHABLE

extension ProgressViews {

    static func == (lhs: ProgressViews, rhs: ProgressViews) -> Bool {
        return lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }


}



