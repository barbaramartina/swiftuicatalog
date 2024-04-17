//
//  DocumentationLinkView.swift
//  SwiftUICatalog
//
//  Created by Barbara Rodeker on 13.11.21.
//

import Foundation
import SwiftUI

/// A view with a link to Apple Docs
struct DocumentationLinkView: View, Identifiable {
    
    var id: String {
        return link
    }
        
    /// documentation link
    let link: String
    
    /// name of the component been documented
    let name: String
    
    init(link: String, name: String? = nil) {
        self.link = link
        self.name = name ?? "documentation"
    }
    
    var body: some View {
        Button(action: {
            UIApplication.shared.open(URL(string: link)!)
        }, label: {
            HStack {
                Text("[ \(name)")
                    .padding(8)
                    .fontWeight(.bold)
                Image(systemName: "link")
                Text("]")
                    .padding(8)

            }
            .fontWeight(.bold)
            .foregroundColor(Color("YellowMedium"))
            .background(.primary)
        })
        .modifier(ViewAlignmentModifier(alignment: .leading))
    }
}

struct DocumentationLinkView_Previews: PreviewProvider {
    static var previews: some View {
        DocumentationLinkView(link: "www.apple.com")
    }
}
