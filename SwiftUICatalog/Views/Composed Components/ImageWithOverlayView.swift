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
struct ImageWithOverlayView<Overlay: View>: View {
    
    let image: String
    let overlay: Overlay
    let verticalAlignment: VerticalAlignment
    let horizontalAligment: HorizontalAlignment
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading,
                                    vertical: .top)) {
            Image(image)
                .resizable()
                .scaledToFit()
            overlay
                .padding()
        }
    }
}

struct ImageWithOverlayView_Previews: PreviewProvider {
    static var previews: some View {
        ImageWithOverlayView(image: "cocker",
                             overlay: Text("Nice puppy :)"),
                             verticalAlignment: .top,
                             horizontalAligment: .leading)
    }
}
