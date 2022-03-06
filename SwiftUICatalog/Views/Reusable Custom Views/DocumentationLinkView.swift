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
            
            VStack {
                HStack {
                    Spacer()
                    Image(systemName: "square.and.arrow.up")
                        .resizable()
                        .frame(width: 24, height: 30)
                        .padding(.trailing, 16)
                }
                Divider()
            }
        })
        
           

    }
}

struct DocumentationLinkView_Previews: PreviewProvider {
    static var previews: some View {
        DocumentationLinkView(link: "www.apple.com")
    }
}
