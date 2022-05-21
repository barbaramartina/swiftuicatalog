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
struct TextsComponentsView: View, Comparable {
    
    let id: String = "TextsComponentsView"
    
    @State private var textFieldValue: String = ""
    @State private var secureFieldValue: String = ""
    
    var body: some View {
        
        PageContainer(content:

        ScrollView {
            
            DocumentationLinkView(link: "https://developer.apple.com/documentation/swiftui/text")

            
            // MARK: - FONTS
            Group {
                
                // Contextual information: a short intro to the elements we are showcasing
                Group {
                    Text("Available fonts")
                        .fontWeight(.heavy)
                    Text("To apply a specific font to an individual Text View you can use the font modifier. There are already different type of fonts pre-defined")
                        .fontWeight(.light)
                }
                .padding()

                Spacer()
                Group {
                    Group {
                        Text("Headline")
                            .font(.headline)
                        Text("Sub headline")
                            .font(.subheadline)
                        Text("Large title")
                            .font(.largeTitle)
                        Text("Title")
                            .font(.title)
                        Text("Title 2")
                            .font(.title2)
                    }
                    Group {
                        Text("Title 3")
                            .font(.title3)
                        Text("Body")
                            .font(.body)
                        Text("Callout")
                            .font(.callout)
                        Text("Caption")
                            .font(.caption)
                        Text("Caption 2")
                            .font(.caption2)
                        Text("Footnote")
                            .font(.footnote)
                    }

                }
                .padding(5)
                Spacer()
                Spacer()

            }
            
            // MARK: - FONT WEIGHTS
            Group {
                
                Group {
                    Text("Available font weights")
                        .fontWeight(.heavy)
                    Text("Fonts can also be assigned a weight, which will change the appereance of the font")
                        .fontWeight(.light)
                }
                .padding()

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
                Text( "Text, italic, bold")
                    .fontWeight(.heavy)
                    .padding()

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
              
            }
            // MARK: - TRUNCATION AND MULTILINE
            Group {
                Text( "Text, truncations and multiline")
                    .fontWeight(.heavy)
                    .padding()

                Text("Very long text truncated")
                    .frame(width: 150)
                    .lineLimit(1)
                    .minimumScaleFactor(0.8)
                    .allowsTightening(false)
                    .truncationMode(.middle)
                Text("Multiline text arranged in how many lines as it is needed")
                    .multilineTextAlignment(.center)
            }
            
          
            // MARK: - TRANSLATIONS
            Group {
                Text( "Text and translations")
                    .fontWeight(.heavy)
                    .padding()

                Group {
                    // automatically looks in the bundle localised strings file
                    Text("translated")
                    // skip trying to localise the string
                    Text(verbatim: "nottranslated")
                }
              
            }
            
            // MARK: - TEXT AND DATES
            Group {
                Group {
                    Group {
                        Text("Text and dates")
                            .fontWeight(.heavy)
                        Text("There are ways to present a date inside a text element allowing it to be formatted with different styles and timers.")
                            .fontWeight(.light)
                    }
                    .padding()
                    
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
                    
                    Group {
                        Text("Text controls")
                            .fontWeight(.heavy)
                        Text("SwiftUI comes with 2 pre-defined text controls: text fields and secure text field to utilise with for example password entries.")
                            .fontWeight(.light)
                    }
                    .padding()

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
            ContributedByView(name: "Barbara Martina",
                              link: "https://github.com/barbaramartina")
                .padding(.top, 80)


        })
    }
}

struct TextsComponentsView_Previews: PreviewProvider {
    static var previews: some View {
        TextsComponentsView()
    }
}

// MARK: - HASHABLE

extension TextsComponentsView {
    
    static func == (lhs: TextsComponentsView, rhs: TextsComponentsView) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }


}



