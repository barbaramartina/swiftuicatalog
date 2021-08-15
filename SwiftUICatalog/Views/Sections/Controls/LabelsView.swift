//
//  LabelsView.swift
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



import SwiftUI

///
/// Examples on how to use LABELS in SwiftUI
/// OFFICIAL DOCUMENTATION https://developer.apple.com/documentation/swiftui/label
///
struct LabelsView: View {
    
    // Label Style
    // https://developer.apple.com/documentation/swiftui/labelstyle
    // please note that: some of the label style is available from iOS version 14.5 or above.
    var titleOnly: TitleOnlyLabelStyle = TitleOnlyLabelStyle.init()
    
    // Custom label Style
    /// For more extensive customization or to create a completely new label style,
    /// you'll need to adopt the ``LabelStyle`` protocol and implement a
    /// ``LabelStyleConfiguration`` for the new style.
    var redBorderedLabelStyle: RedBorderedLabelStyle = RedBorderedLabelStyle.init()
    
    var body: some View {
        
        ScrollView {
            
            HeaderView(title: "Labels in SwiftUI")

            // MARK: - LABEL TYPE
            Group {
                
                // Contextual information: a short intro to the elements we are showcasing
                Group {
                    Text("Label Types")
                        .fontWeight(.heavy)
                    Text("You can create a label in SwiftUI by adding an icon to it, using only a text or conbining text and icons in one label")
                        .fontWeight(.light)
                }
                .padding()
                
                VStack {
                    Spacer()
                    HStack {
                        Text("Label with icon:")
                        Spacer()
                        Label("Lightning",
                              systemImage: "bolt.fill")
                    }
                    Spacer()
                    HStack{
                        Text("Only label:")
                        Spacer()
                        Label("Lightning",
                              systemImage: "bolt.fill")
                            .labelStyle(titleOnly)
                    }
                    /* available only on iOS version 14.5 or above */
                    /// Conversely, there's also an icon-only label style:
                    ///
                    ///     Label("Lightning", systemImage: "bolt.fill")
                    ///         .labelStyle(IconOnlyLabelStyle())
                    ///
                    /// Some containers might apply a different default label style, such as only
                    /// showing icons within toolbars on macOS and iOS. To opt in to showing both
                    /// the title and the icon, you can apply the ``TitleAndIconLabelStyle`` label
                    /// style:
                    ///
                    ///     Label("Lightning", systemImage: "bolt.fill")
                    ///         .labelStyle(TitleAndIconLabelStyle())
                    ///
                    /// You can also create a customized label style by modifying an existing
                    /// style; this example adds a red border to the default label style:
                    ///
                    ///     struct RedBorderedLabelStyle : LabelStyle {
                    ///         func makeBody(configuration: Configuration) -> some View {
                    ///             Label(configuration)
                    ///                 .border(Color.red)
                    ///         }
                    ///     }
                    ///
                    
                    Spacer()
                    HStack{
                        Text("Only icon:")
                        Spacer()
                        Label("", systemImage: "bolt.fill")
                    }
                    Spacer()
                    HStack {
                        Text("Label, icon and custom style:")
                        Spacer()
                        Label("Lightning",
                              systemImage: "bolt.fill")
                            .labelStyle(redBorderedLabelStyle)
                        
                    }
                    Spacer()
                    
                    /// you csn customise the label with Text views check the following example
                    HStack {
                        Text("Label, icon and font:")
                        Spacer()
                        Label("Lightning",
                              systemImage: "bolt.fill")
                            .font(.title)
                    }
                }
                .padding()
            }
            
            // MARK: - LABEL GROUPS
            Group {
                VStack{
                    Group {
                        Text( "Label groups")
                            .fontWeight(.heavy)
                        Text("Labels can be grouped in other containers to layout them as a group")
                            .fontWeight(.light)
                    }
                    .padding()
                    
                    VStack {
                        Label("Rain", systemImage: "cloud.rain")
                        Label("Snow", systemImage: "snow")
                        Label("Sun", systemImage: "sun.max")
                    }
                    .foregroundColor(.accentColor)
                    .padding()
                    
                    /// To apply a common label style to a group of labels, apply the style
                    /// to the view hierarchy that contains the labels:
                    VStack {
                        Label("Rain", systemImage: "cloud.rain")
                        Label("Snow", systemImage: "snow")
                        Label("Sun", systemImage: "sun.max")
                    }
                    .labelStyle(titleOnly)
                    .padding()
                    
                
                    VStack {
                        Label("", systemImage: "cloud.rain")
                        Label("", systemImage: "snow")
                        Label("", systemImage: "sun.max")
                    }
                    .foregroundColor(.accentColor)
}
            }
            Spacer()
            
            // MARK: - LABEL WITH CUSTOM VIEWS
            Group{
                VStack {
                    Group {
                        Text( "Label With Custom Views")
                            .fontWeight(.heavy)
                        Text("It's also possible to make labels using views to compose the label's icon")
                            .fontWeight(.light)
                    }
                    .padding()
                    
                    /// It's also possible to make labels using views to compose the label's icon
                    /// programmatically, rather than using a pre-made image. In this example, the
                    /// icon portion of the label uses a filled ``Circle`` overlaid
                    /// with the user's initials:
                    Label {
                        Text("Lightning Body")
                            .font(.body)
                            .foregroundColor(.primary)
                        Text("Lightning SubHeadline")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    } icon: {
                        Circle()
                            .fill(Color.accentColor)
                            .frame(width: 44, height: 44, alignment: .center)
                            .overlay(Text("A+").foregroundColor(.white))
                    }
                    .padding()
                }
              
            }
            
            // MARK: - TRUNCATION AND MULTILINE
            Group {
                Group {
                    Text("truncations and multiline")
                        .fontWeight(.heavy)
                    Text("Similar configuration as there were in UIKit can be applied in SwiftUI to manage truncation and multiline text in a label")
                        .fontWeight(.light)
                }
                .padding()
                
                Label(
                    title: { Text("Very long text truncated")
                        .multilineTextAlignment(.center)
                    },
                    icon: {}
                )
                .frame(width: 150, height: 100, alignment: .center)
                .lineLimit(1)
                .allowsTightening(false)
                .truncationMode(.middle)
                
                Label(
                    title: { Text("Multiline text arranged in how many lines as it is needed")
                        .multilineTextAlignment(.center)
                    },
                    icon: {}
                )
                .lineLimit(2)
                .minimumScaleFactor(0.6)
                .allowsTightening(true)
                .truncationMode(.middle)
            }
       
        }
    }
}

/// You can also create a customized label style by modifying an existing
/// style; this example adds a red border to the default label style:
struct RedBorderedLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        Label(configuration)
            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 2)
    }
}

struct LabelsView_Previews: PreviewProvider {
    static var previews: some View {
        LabelsView()
    }
}
