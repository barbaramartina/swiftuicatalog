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
struct ImagesComponentView: View {
    var body: some View {
        ScrollView {
            
            // MARK: - SF Symbols
            Group {
                HeaderView(title: "Images with SF Symbols")
                HStack(alignment: .center, spacing: 20) {
                    Image(systemName: "house.circle")
                    Image(systemName: "square.circle")
                    Image(systemName: "dpad")
                }
            }
            .padding(5)
            
            Group {
                HeaderView(title: "Images from bundle")
                // Credits: https://pixabay.com/photos/dog-pet-corgi-animal-canine-6394502/
                Image("corgie-love")
                    .resizable()
                    .scaledToFit()
                Text("Corgie scaled to fit")
                Image("corgie-love")
                    .resizable()
                    .scaledToFill()
                Text("Corgie scaled to fill")
                Image("corgie-love")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Text("Corgie aspect ratio")
                Image("corgie-love")
                    .resizable()
                    .scaledToFit()
                    .overlay(
                        Color.gray
                            .opacity(0.5)
                    )
                    .clipShape(Circle())
                Text("Corgie and circled overlay")
                Image("corgie-love", label: Text("I'm a lovely and cuddling corgie"))

            }
            .padding(5)
            
            Group {
                HeaderView(title: "Fitting images ")
                
                Image("corgie-love")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 400, alignment: .topLeading)
                    .border(Color.blue)
                    .clipped()
                Text("Corgie fitting in a fixed frame")
                
                Image("corgie-love")
                    .resizable(resizingMode: .tile)
                    .frame(width: 370, height: 900, alignment: .topLeading)
                    .border(Color.blue)
                Text("Tiled corgie")
            }
            .padding(5)

        }
        .padding(.top, 12)
        .padding(.leading, 16)
        .padding(.trailing, 16)
    }
}

struct ImagesComponentView_Previews: PreviewProvider {
    static var previews: some View {
        ImagesComponentView()
            .previewLayout(.sizeThatFits)
    }
}
