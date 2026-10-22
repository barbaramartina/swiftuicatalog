// MARK: - MCP Metadata
// @symbol: DividedModifier
// @category: swiftui
// @tags: views
// ---

//
//  Divided.swift
//  SwiftUICatalog
//
//  Created by Barbara Rodeker on 2023-11-26.
//

import Foundation
import SwiftUI

struct Divided: ViewModifier {

    func body(content: Content) -> some View {
        content
        Divider()
            .padding(.vertical)
    }
}
