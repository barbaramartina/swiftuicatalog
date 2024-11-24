//
//  ContributedByView.swift
//  SwiftUICatalog
//
//  Created by Barbara Rodeker on 13.11.21.
//

import SwiftUI

struct ContributedByView: View, Identifiable {
    
    var id: String {
        return name + link
    }
    
    /// contributor's name
    let name: String
    /// link of the contributor
    let link: String
    
    var body: some View {
        
        Button(action: {
            UIApplication.shared.open(URL(string: link)!)
            
        },
               label: {
            
            Spacer()
            Text("Created by \(name)")
                .fontWeight(.regular)
                .padding(9)
                .padding(.trailing, 16)
        })
        
        
        
        
    }
}

#Preview {
    
        ContributedByView(name: "Johnny", link: "www.google.com")
    
}
