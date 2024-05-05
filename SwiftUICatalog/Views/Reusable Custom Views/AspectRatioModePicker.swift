//
//  AspectRatioModePicker.swift
//  SwiftUICatalog
//
//  Created by Barbara Rodeker on 2024-03-30.
//

import Foundation
import SwiftUI

struct AspectRatioModePicker: View {
    
    /// possible test aspects ratios to apply to an image
    private let aspectRatios: [CGFloat] = [0.25, 0.40, 0.75, 1]
    @Binding var selection: CGFloat
    
    enum Mode: String, CaseIterable {
        case fill
        case fit
        
        var contentMode: ContentMode {
            switch self {
            case .fill: ContentMode.fill
            case .fit: ContentMode.fit
            }
        }
    }
    /// possible content modes to choose from
    let modes: [Mode] = Mode.allCases
    /// the currently selected content mode
    @Binding var mode: Mode
    
    var body: some View {
        Picker("content mode", selection: $mode) {
            ForEach(modes, id: \.self) {
                Text($0.rawValue)
                    .tag($0)
            }
        }
    }
}
