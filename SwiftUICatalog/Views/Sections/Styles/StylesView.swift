//
//  StylesView.swift
//  SwiftUICatalog
//
// MIT License
//
// Copyright (c) 2021 Barbara Martina
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
/// Multiple examples on how to apply styles to different SwiftUI
/// components
/// OFFICIAL DOCUMENTATION https://developer.apple.com/documentation/swiftui/view-styles
///
struct StylesView: View, Comparable {
    
    let id: String = "StylesView"

    @State private var selectedPickerString: String = ""
    @State private var toggleValue: Bool = false

    var body: some View {
        
        ScrollView {
            HeaderView( title: "Styling views in SwiftUI")

            DocumentationLinkView(link: "https://developer.apple.com/documentation/swiftui/view-styles")

            // contextual information
            Group {
                Text("Styling views is giving the views a certain appereance. Swift provides styles depending on the type of view, and it also allows you to define your custom style for a particular type of view.")
                    .fontWeight(.light)
            }
            .padding()

            // styling Toggles
            // https://developer.apple.com/documentation/swiftui/togglestyle
            Group {
                Divider()
                Text("Styling Toggles")
                    .fontWeight(.heavy)
                HStack {
                    Text("Automatic style:")
                    Spacer()
                    Toggle(isOn: $toggleValue) {
                        Text("Toggle")
                    }
                    .toggleStyle(.automatic)
                }
                HStack {
                    Text("Button style:")
                    Spacer()
                    Toggle(isOn: $toggleValue) {
                        Text("Toggle")
                    }
                    .toggleStyle(.button)
                }
                HStack {
                    Text("Switch style:")
                    Spacer()
                    Toggle(isOn: $toggleValue) {
                        Text("Toggle")
                    }
                    .toggleStyle(.switch)
                }

            }
            .padding()
            // end styling toggles

            // Styling buttons with all the possible already implemented styles in Swift + 1 custom style
            Group {
                Text("Styling buttons")
                    .fontWeight(.heavy)
                HStack {
                    Text("Automatic button style: ")
                        .fontWeight(.light)
                    Spacer()
                    Button("Example action") { }
                        .buttonStyle(.automatic)
                }
                HStack {
                    Text("Bordered button style: ")
                        .fontWeight(.light)
                    Spacer()
                    Button("Example action") { }
                        .buttonStyle(.bordered)
                }
                HStack {
                    Text("Border less button style: ")
                        .fontWeight(.light)
                    Spacer()
                    Button("Example action") { }
                        .buttonStyle(.borderless)
                }
                HStack {
                    Text("Border prominent less button style: ")
                        .fontWeight(.light)
                    Spacer()
                    Button("Example action") { }
                        .buttonStyle(.borderedProminent)
                }
                HStack {
                    Text("Plain button style: ")
                        .fontWeight(.light)
                    Spacer()
                    Button("Example action") { }
                        .buttonStyle(.plain)
                }
                HStack {
                    Text("My own button style: ")
                        .fontWeight(.light)
                    Spacer()
                    Button("Example action") { }
                        .buttonStyle(MyOwnButtonStyle())
                }

            }
            .padding()
            // end buttons styles


            // styling Pickers
            // https://developer.apple.com/documentation/swiftui/pickerstyle
            Group {
                Divider()
                Text("Styling Pickers")
                    .fontWeight(.heavy)
                HStack {
                    Text("Automatic style:")
                    Spacer()
                    Picker("Option", selection: $selectedPickerString) {
                        Text("Option 1")
                        Text("Option 2")
                        Text("Option 3")
                    }
                    .pickerStyle(.automatic)
                }
                HStack {
                    Text("Inline style:")
                    Spacer()
                    Picker("Option", selection: $selectedPickerString) {
                        Text("Option 1")
                        Text("Option 2")
                        Text("Option 3")
                    }
                    .pickerStyle(.inline)
                }
                HStack {
                    Text("Menu style:")
                    Spacer()
                    Picker("Option", selection: $selectedPickerString) {
                        Text("Option 1")
                        Text("Option 2")
                        Text("Option 3")
                    }
                    .pickerStyle(.menu)
                }
                HStack {
                    Text("Segmented style:")
                    Spacer()
                    Picker("Option", selection: $selectedPickerString) {
                        Text("Option 1")
                        Text("Option 2")
                        Text("Option 3")
                    }
                    .pickerStyle(.segmented)
                }
                HStack {
                    Text("Menu style:")
                    Spacer()
                    Picker("Option", selection: $selectedPickerString) {
                        Text("Option 1")
                        Text("Option 2")
                        Text("Option 3")
                    }
                    .pickerStyle(.wheel)
                }

                if #available(iOS 16.0, *) {
                    HStack {
                        Text("Navigation Link style:")
                        Spacer()
                        Picker("Option", selection: $selectedPickerString) {
                            Text("Option 1")
                            Text("Option 2")
                            Text("Option 3")
                        }
                        .pickerStyle(.navigationLink)
                    }
                } else {
                    // Fallback on earlier versions
                }
            }
            .padding()
            // end of styling pickers
        }

    }
}

struct StylesView_Previews: PreviewProvider {
    static var previews: some View {
        StylesView()
    }
}

// MARK: - HASHABLE

extension StylesView {
    
    static func == (lhs: StylesView, rhs: StylesView) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }


}


