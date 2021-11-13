//
//  ProgressViews.swift
//  SwiftUICatalog
//
// MIT License
//
// Copyright (c) 2021 Barbara Martina Rodeker
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
/// Examples on how to use  PROGRESS VIEW  in SwiftUI
/// OFFICIAL DOCUMENTATION:     https://developer.apple.com/documentation/swiftui/progressview
///

struct ProgressViews: View {
    
    @State private var progress = 0.0
    let timer = Timer.publish(every: 0.5,
                              on: .main,
                              in: .common).autoconnect()
    
    
    var body: some View {
        
        ScrollView {
            
            HeaderView(title: "ProgressView in SwiftUI")
            
            // Contextual information: a short intro to the elements we are showcasing
            Group {
                
                Group {
               
                    Text("Are used to indicate steps in a tasks or to show the user feedback while waiting. The first example is a linear progress view with text")
                        .fontWeight(.light)
                    
                    ProgressView("Downloading…", value: progress,
                                 
                                 total: 100)
                    
                    Text("Simple progress views, with an spinner can be configured when no value are passed as parameter")
                        .fontWeight(.light)
                    
                    ProgressView()
                    
                    Text("A spinner can also be shown with a text associated")
                        .fontWeight(.light)
                    
                    ProgressView("Downloading")
                       
                    ProgressView("Please wait...")
                        .progressViewStyle(CircularProgressViewStyle(tint: .accentColor))
                }
                
                Text("The color of the spinner can be chosen with a tint color")
                    .fontWeight(.light)
                
                ProgressView("Please wait...", value: progress,
                             
                             total: 100)
                    .progressViewStyle(LinearProgressViewStyle(tint: .accentColor))
                    .foregroundColor(Color("secondary"))
                
                Text("Also any view can be included inside the progress view, such as in this case, a button")
                    .fontWeight(.light)
                
                ProgressView {
                    Button(action: {
                        // to do: your cancellation logic
                    }) {
                        Text("Cancel download")
                            .fontWeight(.heavy)
                            .foregroundColor(.accentColor)
                    }
                    .padding()
                    .background(Color("secondary"))
                    .cornerRadius(5)
                }
                
                
                
            }
            .padding()
            
            ContributedByView(name: "Barbara Martina",
                              link: "https://github.com/barbaramartina")
                .padding(.top, 80)

        }
        // end scroll view
        .onReceive(timer) { _ in
            if progress < 100 {
                progress += 2
            }
        }
        
    }
}

struct ProgressViews_Previews: PreviewProvider {
    static var previews: some View {
        ProgressViews()
    }
}
