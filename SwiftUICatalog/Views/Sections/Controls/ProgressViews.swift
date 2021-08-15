//
//  ProgressViews.swift
//  SwiftUICatalog
//
// MIT License
//
// Copyright (c) 2021 Ali Ghayeni H
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
    
    @State private var progress = 0.5
    
    @State private var loadAmount = 0.0
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        
        ScrollView {
            HeaderView(title: "ProgressView in SwiftUI")
            Group {
                VStack {
                    Text("Use a progress view to show that a task is making progress towards completion. A progress view can show both determinate (percentage complete) and indeterminate (progressing or not) types of progress.")
                        .multilineTextAlignment(.leading)
                        .fixedSize(horizontal: false, vertical: true)
                    Spacer(minLength: 20)
                    Text("Create a determinate progress view by initializing a ProgressView with a binding to a numeric value that indicates the progress, and a total value that represents completion of the task. By default, the progress is 0.0 and the total is 1.0.")
                        .multilineTextAlignment(.leading)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding()
                    
                    Spacer(minLength: 10)
                    
                    Text("Progress Views")
                    VStack {
                        ProgressView(value: progress)
                        Button("More", action: { progress += 0.05 })
                    }
                    Spacer(minLength: 40)
                    
                    Text("Styling Progress Views")
                    /**
                     Styling Progress Views
                     
                     You can customize the appearance and interaction of progress views by creating styles that conform to the ProgressViewStyle protocol. To set a specific style for all progress view instances within a view, use the progressViewStyle(_:) modifier.
                     */
                    VStack {
                        ProgressView(value: 0.25)
                        ProgressView(value: 0.75)
                    }
                    .progressViewStyle(DarkBlueShadowProgressViewStyle())
                    Spacer(minLength: 40)
                }
                .padding()
                VStack {
                    Text("Styling Progress View + Timer")
                    VStack {
                        ProgressView("Loading…", value: loadAmount, total: 100.0)
                    }
                    .progressViewStyle(DarkBlueShadowProgressViewStyle())
                    .onReceive(timer) { _ in
                        if loadAmount < 100.0 {
                            loadAmount += 1.0
                        }
                    }
                }
                .padding()
            }
        }
    }
}

/**
 Styling Progress Views
 
 In the following example, a custom style adds a dark blue shadow to all progress views within the enclosing VStack:
 */
struct DarkBlueShadowProgressViewStyle: ProgressViewStyle {
    func makeBody(configuration: Configuration) -> some View {
        ProgressView(configuration)
            .shadow(color: Color(red: 0, green: 0, blue: 0.6),
                    radius: 4.0, x: 1.0, y: 2.0)
    }
}

struct ProgressViews_Previews: PreviewProvider {
    static var previews: some View {
        ProgressViews()
    }
}
