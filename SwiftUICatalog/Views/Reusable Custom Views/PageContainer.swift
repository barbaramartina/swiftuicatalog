//
//  PageContainer.swift
//  SwiftUICatalog
//
//  Created by Barbara Rodeker on 2022-05-21.
//

import SwiftUI

struct PageContainer<Content>: View where Content: View {
    
    let content: Content
    
    var body: some View {
        ZStack {
            Color("LightBraun")
                .ignoresSafeArea()
            
            content
            
        }
    }
}

struct PageContainer_Previews: PreviewProvider {
    static var previews: some View {
        PageContainer(content: Text("Content"))
    }
}
