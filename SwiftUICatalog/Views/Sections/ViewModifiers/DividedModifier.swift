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
        VStack {
            content
            Divider()
                .padding(.vertical, Style.VerticalPadding.medium.rawValue)
        }
    }
}

