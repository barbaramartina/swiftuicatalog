//
//  CollectionsViews.swift
//  SwiftUICatalog
//
//  Created by Barbara Rodeker on 06.02.22.
//

import SwiftUI

struct CollectionsViews: View {
    var body: some View {
        
        VStack {
            HeaderView( title: "Examples of views presented in collections, i.e: horizontal carrousels, table views, 2x2 columns grid.")
            ContributionWantedView()
        }
        
    }
}

struct CollectionsViews_Previews: PreviewProvider {
    static var previews: some View {
        CollectionsViews()
    }
}
