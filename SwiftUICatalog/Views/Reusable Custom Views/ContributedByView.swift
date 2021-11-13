//
//  ContributedByView.swift
//  SwiftUICatalog
//
//  Created by Barbara Rodeker on 13.11.21.
//

import SwiftUI

struct ContributedByView: View {
    
    /// contributor's name
    let name: String
    /// link of the contributor
    let link: String
    
    var body: some View {
        
        Button(action: {
            UIApplication.shared.open(URL(string: link)!)
            
        },
               label: {
            
            Text("Created by \(name)")
                .fontWeight(.ultraLight)
                .italic()
                .padding(9)
                .modifier(ButtonRoundedModifier(radius: 6,
                                                lineWidth: 1.0,
                                                
                                                color: Color("secondary")))
        })
        

        
        
    }
}

struct ContributedByView_Previews: PreviewProvider {
    static var previews: some View {
        ContributedByView(name: "Johnny", link: "www.google.com")
    }
}
