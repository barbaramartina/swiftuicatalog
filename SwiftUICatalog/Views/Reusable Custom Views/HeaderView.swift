//
//  HeaderView.swift
//  SwiftUICatalog
//
//  Created by Barbara Rodeker on 12.07.21.
//

import SwiftUI


struct HeaderView: View {
    var title: String
    
    var body: some View {
        Text(title.uppercased())
            .font(.title)
            .fontWeight(.black)
            .foregroundColor(.accentColor)
            .multilineTextAlignment(.center)
            .padding(.top, 24)
            .padding(.bottom, 16)
    }
}
