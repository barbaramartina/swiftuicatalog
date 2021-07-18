//
//  TextsComponentsView.swift
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
/// of the SwiftUI TEXT control
/// OFFICIAL DOCUMENTATION https://developer.apple.com/documentation/swiftui/text
///
struct TextsComponentsView: View {
    
    @State private var textFieldValue: String = ""
    @State private var secureFieldValue: String = ""
    
    var body: some View {
        ScrollView {
            // MARK: - FONTS
            Group {
                HeaderView(title: "Available fonts")

                Spacer()
                Group {
                    Text("Title")
                        .font(.title)
                    Text("Title 2")
                        .font(.title2)
                    Text("Title 3")
                        .font(.title3)
                }
                .padding(5)
                Spacer()
                Spacer()

            }
            // MARK: - FONT WEIGHTS
            Group {
                HeaderView(title: "Available font weights")

                Group {
                    Text("Weight Black")
                        .fontWeight(.black)
                    Text("Weight Heavy")
                        .fontWeight(.heavy)
                    Text("Weight Bold")
                        .fontWeight(.bold)
                    Text("Weight Semibold")
                        .fontWeight(.semibold)
                    Text("Weight Medium")
                        .fontWeight(.medium)
                    Text("Weight Regular")
                        .fontWeight(.regular)
                    Text("Weight Light")
                        .fontWeight(.light)
                    Text("Weight Ultra light")
                        .fontWeight(.ultraLight)
                    Text("Weight Thin")
                        .fontWeight(.thin)

                }
                .padding(5)
                Spacer()

            }
            // MARK: - FONTS ITALIC, BOLD
            Group {
                HeaderView(title: "Text, italic, bold")

                Group {
                    Text("Italic")
                        .italic()
                    Text("Bold")
                        .bold()
                    Text("Underline")
                        .underline()
                    Text("Strike through")
                        .strikethrough()
                    Text("Kerning")
                        .kerning(2.0)
                    Text("Tracking")
                        .tracking(3.0)
                    Text("With shadow")
                        .shadow(color: .blue,
                                radius: 12,
                                x: 1.0,
                                y: 3.0)

                }
                .padding(5)
                Spacer()
            }
            // MARK: - TRUNCATION AND MULTILINE
            Group {
                HeaderView(title: "Text, truncations and multiline")

                Text("Very long text truncated")
                    .frame(width: 150)
                    .lineLimit(1)
                    .minimumScaleFactor(0.8)
                    .allowsTightening(false)
                    .truncationMode(.middle)
                Text("Multiline text arranged in how many lines as it is needed")
                    .multilineTextAlignment(.center)
            }
            .padding(5)
            // MARK: - TRANSLATIONS
            Group {
                HeaderView(title: "Text and translations")

                Group {
                    // automatically looks in the bundle localised strings file
                    Text("translated")
                    // skip trying to localise the string
                    Text(verbatim: "nottranslated")
                }
                .padding(5)
                Spacer()
            }
            // MARK: - TEXT AND DATES
            Group {
                Group {
                    HeaderView(title: "Text and dates")
                    HStack {
                        Text("Text with date:")
                        Spacer()
                        Text(Date(), style: Text.DateStyle.date)
                    }
                    HStack {
                        Text("Text with date offset:")
                        Spacer()
                        Text(Date(), style: Text.DateStyle.offset)
                    }
                    HStack {
                        Text("Text with date relative:")
                        Spacer()
                        Text(Date(), style: Text.DateStyle.relative)
                    }
                    HStack {
                        Text("Text with style time:")
                        Spacer()
                        Text(Date(), style: Text.DateStyle.time)
                    }
                    HStack {
                        Text("Text with date timer:")
                        Spacer()
                        Text(Date(), style: Text.DateStyle.timer)
                    }
                }
                .padding(5)
                Spacer()
            }
            // MARK: - text controls
            Group {
                Group {
                    HeaderView(title: "Text controls")

                    HStack {
                        Text("Text field:")
                        Spacer()
                        TextField("text-field-localised-key", text: $textFieldValue)
                    }
                    .padding(10)
                    HStack {
                        Text("Secure Text field")
                        Spacer()
                        SecureField("Secure field",
                                    text: $secureFieldValue)
                    }
                    .padding(10)
                }
                .padding(5)
                Spacer()
            }


        }
    }
}

struct TextsComponentsView_Previews: PreviewProvider {
    static var previews: some View {
        TextsComponentsView()
    }
}
