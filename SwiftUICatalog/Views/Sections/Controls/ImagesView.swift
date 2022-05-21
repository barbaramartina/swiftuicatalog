//
//  ImagesComponentView.swift
//  SwiftUICatalog
//
// MIT License
//
// Copyright (c) 2021 Barbara M. Rodeker
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//

//

import SwiftUI

///
/// A view showing different usages
/// of the SwiftUI IMAGE control
/// OFFICIAL DOCUMENTATION https://developer.apple.com/documentation/swiftui/image
///
struct ImagesComponentView: View, Comparable {
    
    let id: String = "ImagesComponentView"

    var body: some View {
        
        PageContainer(content:
             
        ScrollView {
            
            DocumentationLinkView(link: "https://developer.apple.com/documentation/swiftui/image")

            // MARK: - SF Symbols
            
            // Contextual information: a short intro to the elements we are showcasing
            Group {
                Text("Images with SF Symbols")
                    .fontWeight(.heavy)
                Text("With over 3,100 symbols, SF Symbols is a library designed by Apple. You can find more about SF Symbols in https://developer.apple.com/sf-symbols")
                    .fontWeight(.light)
                HStack(alignment: .center, spacing: 20) {
                    Image(systemName: "house.circle")
                    Image(systemName: "square.circle")
                    Image(systemName: "dpad")
                }
            }
            .padding()
            
            Group {
                Text("Images from Bundle")
                    .fontWeight(.heavy)
                Text("Images can be uploaded from the app bundle, just the same as with UIKit, images can be scaled, resized, tiled, framed and also you can overlays on top of images to mask them to different shapes.")
                    .fontWeight(.light)
               // Credits: https://pixabay.com/photos/dog-pet-corgi-animal-canine-6394502/
                Text("Corgie scaled to fit")
                    .fontWeight(.semibold)
                Image("corgie-love")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)

                Text("Corgie scaled to fill")
                        .fontWeight(.semibold)
                Image("corgie-love")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 200)

                Text("Corgie aspect ratio")
                        .fontWeight(.semibold)
                Image("corgie-love")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)

                Text("Corgie and circled overlay")
                    .fontWeight(.semibold)
                Image("corgie-love")
                    .resizable()
                    .scaledToFit()
                    .overlay(
                        Color.gray
                            .opacity(0.5)
                    )
                    .clipShape(Circle())
                    .frame(width: 200, height: 200)

            }
            .padding()
            
            Group {
                Text("Corgie fitting in a fixed frame")
                    .fontWeight(.semibold)
                Image("corgie-love")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 400, alignment: .topLeading)
                    .border(Color.blue)
                    .clipped()
                
                Text("Tiled corgie")
                    .fontWeight(.semibold)
                Image("corgie-love")
                    .resizable(resizingMode: .tile)
                    .frame(width: 370, height: 900, alignment: .topLeading)
                    .border(Color.blue)
            }
            .padding()
            
            ContributedByView(name: "Barbara Martina",
                              link: "https://github.com/barbaramartina")
                .padding(.top, 80)


        })
      
    }
}

struct ImagesComponentView_Previews: PreviewProvider {
    static var previews: some View {
        ImagesComponentView()
            .previewLayout(.sizeThatFits)
    }
}

// MARK: - HASHABLE

extension ImagesComponentView {
    
    static func == (lhs: ImagesComponentView, rhs: ImagesComponentView) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }


}



