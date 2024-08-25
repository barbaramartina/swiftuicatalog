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
        self.name = name ?? "Documentation"
    }
    
    var body: some View {
        Button(action: {
            UIApplication.shared.open(URL(string: link)!)
        }, label: {
            HStack {
                Image(systemName: "book.and.wrench")
                    .accessibilityLabel("Documentation")
                    .accessibilityHint("Touching this button will take you outside the application and into the browser, where you can access more information about the current example.")
            }
            .padding(12)
            .fontWeight(.bold)
            .foregroundColor(Color("Medium"))
            .background(.primary)
            .modifier(RoundedBordersModifier(radius: 8, lineWidth: 1))
        })
        .padding(.bottom, 16)
        .modifier(ViewAlignmentModifier(alignment: .trailing))
        .accessibilityAddTraits(.isButton)
    }
}

struct DocumentationLinkView_Previews: PreviewProvider {
    static var previews: some View {
        DocumentationLinkView(link: "www.apple.com")
    }
}
