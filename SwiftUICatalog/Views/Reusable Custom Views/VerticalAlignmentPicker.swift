//
//  VerticalAlignmentPicker.swift
//  SwiftUICatalog
//
//  Created by Barbara Rodeker on 2024-03-30.
//

import Foundation
import SwiftUI

struct VerticalAlignmentPicker: View {
    
    /// alignments for stack view elements
    private let verticalAlignments: [VerticalAlignment] = [.top, .bottom, .center, .firstTextBaseline, .lastTextBaseline]

    var body: some View {
        Picker(selection: $verticalAlignment, label: Text("alignment")) {
            ForEach(verticalAlignments, id: \.self) {
                Text($0.description)
            }
        }
    }
}
