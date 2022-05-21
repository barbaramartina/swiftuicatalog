//
//  File.swift
//  SwiftUICatalog
//
//  Created by Barbara Rodeker on 2022-05-21.
//

import SwiftUI

struct ListSectionFontModifier: ViewModifier {
    
    var font = Font.system(.title).weight(.black)

    func body(content: Content) -> some View {
        content
            .font(font)
            .foregroundColor(.accentColor)
            .padding(.top, 16)
            .padding(.bottom, 16)

    }
}

