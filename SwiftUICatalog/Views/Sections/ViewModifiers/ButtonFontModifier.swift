//
//  ButtonTextModifier.swift
//  SwiftUICatalog
//
//  Created by Barbara Rodeker on 01.08.21.
//

import SwiftUI

struct ButtonFontModifier: ViewModifier {
    
    private let font = Font.system(.title).weight(.bold)

    func body(content: Content) -> some View {
        content
            .font(font)
            .foregroundColor(Color.yellow)
            .padding()

    }
}
