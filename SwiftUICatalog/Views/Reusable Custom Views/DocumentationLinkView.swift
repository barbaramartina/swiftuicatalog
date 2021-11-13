//
//  DocumentationLinkView.swift
//  SwiftUICatalog
//
//  Created by Barbara Rodeker on 13.11.21.
//

import SwiftUI

/// A view with a link to Apple Docs
struct DocumentationLinkView: View {
    
    let link: String
    
    var body: some View {
        
        Button(action: {
            UIApplication.shared.open(URL(string: link)!)
            
        },
               label: {
           
            Text("official docs")
                .fontWeight(.ultraLight)
                .padding(9)
            Image("apple-icon")
                .resizable()
                .frame(width: 30, height: 30)
                .padding(.leading, -16)
        })
           

    }
}

struct DocumentationLinkView_Previews: PreviewProvider {
    static var previews: some View {
        DocumentationLinkView(link: "www.apple.com")
    }
}
