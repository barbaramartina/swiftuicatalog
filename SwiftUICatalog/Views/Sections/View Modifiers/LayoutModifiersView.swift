//
//  LayoutModifiersView.swift
//  SwiftUICatalog
//
// MIT License
//
// Copyright (c) 2021 { YOUR NAME HERE 🏆 }
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
/// Examples on how to use  Layout Modifiers  in SwiftUI
/// OFFICIAL DOCUMENTATION:
/// Open the "Add modifier" panels in XCode and inspect all possible "Layout Modifiers" to provide examples here
///

struct LayoutModifiersView: View, Comparable {
    
    let id: String = "LayoutModifiersView"

    /// current stack view alignment
    @State var verticalAlignment: VerticalAlignment = .center

    /// some offset to exemplify individual item's alignment
    let offsets: [CGFloat] = [-15, -50, 15, 50]
    /// current selected offset
    @State var offset: CGFloat = -15

    /// current aspect ratio
    @State var aspectRatio: CGFloat = 0.8
    /// the currently selected content mode
    @State var mode: AspectRatioModePicker.Mode = .fill

    var body: some View {
        
        ScrollView {
            anchorPreferences
            alignmentExamples
        }

    }

    private var anchorPreferences: some View {
        Group {
            VStack {
                Text("A view can be modified in its aspect ratio an content mode")
                    .fontWeight(.light)
                    .padding()
                Image(systemName: "paperplane")
                    .resizable()
                    .aspectRatio(aspectRatio, contentMode: mode.contentMode)
                    .frame(width: 100, height: 100)
                AspectRatioModePicker(aspectRatio: $aspectRatio,
                                      mode: $mode)
                .pickerStyle(.palette)
                .padding()
            }
        }
    }


    private var alignmentExamples: some View {
        Group {
            DocumentationLinkView(link: "https://developer.apple.com/documentation/swiftui/view/alignmentguide(_:computevalue:)-6y3u2")

            VStack {
                Text("Views can be vertically aligned in respect to each other using precise offsets for each view, or using the view dimensions to calculate offsets")
                    .fontWeight(.light)
                    .padding()
                HStack {
                    Text("Alignment guide")
                    Image(systemName: "lasso")
                        .alignmentGuide(VerticalAlignment.center) { _ in
                            offset
                        }
                }
                Picker("test offsets", selection: $offset) {
                    ForEach(offsets, id: \.self) {
                        Text($0.description)
                            .tag($0)
                    }
                }
                .pickerStyle(.palette)
                .padding()
            }
            Divider()
            VStack {
                Text("Horizontal stack views can have different alignments in each of their views, which could make the overall layout look nicer or achieve a particular design requirement")
                    .fontWeight(.light)
                    .padding()
                HStack(alignment: verticalAlignment) {
                    Image(systemName: "eraser")
                    Text("Delete")
                        .font(.caption)
                    Text("Note")
                        .font(.title)
                }
                .padding()
                .border(.secondary, width: 1)
                Picker(selection: $verticalAlignment, label: Text("alignment")) {
                    ForEach(verticalAlignments, id: \.self) {
                        Text($0.description)
                    }
                }
                .pickerStyle(.wheel)
                .padding()

            }

        }
    }
}

struct LayoutModifiersView_Previews: PreviewProvider {
    static var previews: some View {
        LayoutModifiersView()
    }
}


// MARK: - HASHABLE

extension LayoutModifiersView {
    
    static func == (lhs: LayoutModifiersView, rhs: LayoutModifiersView) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }


}

extension VerticalAlignment: Hashable {
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.description)
    }

}

extension VerticalAlignment {

    var description: String {
        switch self {
        case .bottom: "bottom"
        case .top: "top"
        case .center: "center"
        case .firstTextBaseline: "first base line"
        case .lastTextBaseline: "last base line"
        default:
            ""
        }
    }

}
