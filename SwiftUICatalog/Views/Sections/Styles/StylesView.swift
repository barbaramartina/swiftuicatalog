//
//  StylesView.swift
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
/// Multiple examples on how to apply styles to different SwiftUI
/// components
/// OFFICIAL DOCUMENTATION https://developer.apple.com/documentation/swiftui/view-styles
///
struct StylesView: View, Comparable {
    
    let id: String = "StylesView"
    
    var body: some View {
        
        VStack {
            HeaderView( title: "Styling views in SwiftUI")
            ContributionWantedView()
        }

    }
}

struct StylesView_Previews: PreviewProvider {
    static var previews: some View {
        StylesView()
    }
}

// MARK: - HASHABLE

extension StylesView {
    
    static func == (lhs: StylesView, rhs: StylesView) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }


}


