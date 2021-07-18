//
//  LinkView.swift
//  SwiftUICatalog
//
//  Created by Barbara Rodeker on 18.07.21.
//

import SwiftUI

struct Link<Destination> : View where Destination : View {
    
    var destination: Destination
    var label: String

    var body: some View {
        NavigationLink(destination: destination) {
            Text(label)
                .font(.title2)
                .fontWeight(.light)
                .foregroundColor(.accentColor)
        }
        .padding(.bottom, 5)
    }
}
