//
//  ImageWithOverlayView.swift
//  SwiftUICatalog
//
//  Created by Barbara Rodeker on 06.02.22.
//

import SwiftUI

///
/// Composing views can be achieved by parametrizing
/// A View with another View
///
/// In this case you can pass any type of view to
/// be presented as an overlay on top of an image
///
struct ImageWithOverlayView<Overlay: View>: View, Identifiable {
    
    let id: String = "ImageWithOverlayView"
    
    let image: String
    let overlay: Overlay
    let alignment: Alignment
    
    var body: some View {
        ZStack(alignment: alignment) {
            Image(image)
                .resizable()
                .scaledToFit()
            overlay
                .padding()
        }
        
        // Another Alternative implementation for simple composiitions can be done by using the standard overlay modifier
//        Image(image)
//            .resizable()
//            .scaledToFit()
//            .overlay(overlay, alignment: aligment)

    }
}

struct ImageWithOverlayView_Previews: PreviewProvider {
    static var previews: some View {
        ImageWithOverlayView(image: "cocker",
                             overlay: Text("Nice puppy :)"),
                             alignment: Alignment(horizontal: .leading,
                                                  vertical: .top))
    }
}
