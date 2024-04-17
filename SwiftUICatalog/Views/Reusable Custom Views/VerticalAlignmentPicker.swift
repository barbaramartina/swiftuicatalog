//
//  VerticalAlignmentPicker.swift
//  SwiftUICatalog
//
//  Created by Barbara Rodeker on 2024-03-30.
//

import Foundation
import SwiftUI

struct VerticalAlignmentPicker: View {
    
    @Binding var selection: VerticalAlignment
    
    /// alignments for stack view elements
    private let verticalAlignments: [VerticalAlignment] = [.top, .bottom, .center, .firstTextBaseline, .lastTextBaseline]

    var body: some View {
        Picker(selection: $selection, label: Text("alignment")) {
            ForEach(verticalAlignments, id: \.self) {
                Text($0.description)
            }
        }
    }
}
