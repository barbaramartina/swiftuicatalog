//
//  ButtonsComponentsView.swift
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



import SwiftUI

///
/// A view showing different usages
/// of the SwiftUI BUTTON control
/// OFFICIAL DOCUMENTATION https://developer.apple.com/documentation/swiftui/button
///
struct ButtonsComponentsView: View, Comparable {
    
    // MARK: - Properties
    
    let id: String = "ButtonsComponentsView"
    
    @State private var fruits = [ "Apple", "Banana", "Papaya", "Mango"]
    
    @State private var pastedText: String = ""
    
    /// configuration of the first button: background color
    @State private var color: Color = Color.clear
    /// configuration of the first button: border color
    @State private var colorBorder: Color = Color.accentColor
    /// configuration of the first button: border width
    @State private var borderWidth: Double = 1
    /// configuration of the first button: custom font
    @State private var font: UIFont = UIFont.preferredFont(forTextStyle: .body)

    
    // MARK: - Body
    
    
    var body: some View {
        
           PageContainer(content:
                
                ScrollView {
                    
                VStack {
                    
                    DocumentationLinkView(link: "https://developer.apple.com/documentation/swiftui/button")

                    
                    // MARK: - basics of buttons
                    Group {
                        
                        // Contextual information: a short intro to the elements we are showcasing
                        Group {
                            Text("Rounded Button")
                                .fontWeight(.heavy)
                            Text("One of the most usual designs for buttons is to include rounded corners. You can see how to achieve that here, using a custon view modifier")
                                .fontWeight(.light)

                            Button(action: {},
                                   label: {
                                    Text("Click")
                                        .modifier(ButtonFontModifier(font: Font(font)))
                                        .modifier(ButtonRoundedModifier(radius: 10,
                                                                        lineWidth: CGFloat(borderWidth),
                                                                        color: colorBorder))
                                   })
                                .background(color)
                            
                            ColorPicker("Background color:",
                                        selection: $color,
                                        supportsOpacity: false)

                            ColorPicker("Border color:",
                                        selection: $colorBorder,
                                        supportsOpacity: false)

                            HStack {
                                Text("Border width:")
                                    .fontWeight(.light)

                                Slider(
                                    value: $borderWidth,
                                    in: 0...10,
                                    step: 1,
                                    onEditingChanged: {_ in }
                                )

                            }
                        }
                        .padding()

                        Group {
                            Text("Specific Rounded borders with custom shape")
                                .fontWeight(.heavy)
                            Text("Sometimes we want to give the borders of a button a rounded style, but not to all of them. This can be achieved with a custom shape as an overlay for the standard Button View")
                                .fontWeight(.light)

                            Button(action: {},
                                   label: {
                                    Text("Click")
                                        .modifier(ButtonFontModifier())
                                        .overlay(
                                            RoundedCorners(tl: 10,
                                                           tr: 0,
                                                           bl: 0,
                                                           br: 10)
                                                .stroke(Color.accentColor, lineWidth: 5)
                                        )
                                   })
                        }
                        .padding()

                        Group {
                            Text("Stroked borders")
                                .fontWeight(.heavy)
                            Text("Borders can also be drawn with a certain stroke pattern by using an overlay and a specific StrokeStyle")
                                .fontWeight(.light)
                            Button(action: {}) {
                                Text("Click")
                                    .modifier(ButtonFontModifier())
                                    .overlay(
                                        Capsule(style: .continuous)
                                            .stroke(Color.accentColor,
                                                    style: StrokeStyle(lineWidth: 5, dash: [10]))
                                    )
                            }
                        }
                        .padding()
                    
                        Group {
                            Text("Button with plan background")
                                .fontWeight(.heavy)
                            Button(action: {}, label: {
                                Text("Click")
                                    .padding()
                                    .modifier(ButtonFontModifier())
                            })
                            .background(Color.accentColor)
                        }
                        .padding()

                        Group {
                            Text("Button with image")
                                .fontWeight(.heavy)
                            Button(action: {}, label: {
                                Image(systemName: "person")
                                    .padding()
                            })
                            .border(Color.accentColor, width: 5)
                        }
                        .padding()

                        Group {
                            Text("Button with icon & label")
                                .fontWeight(.heavy)
                            Button(action: {}, label: {
                                Label {
                                    Text("Add person")
                                        .modifier(ButtonFontModifier())
                                } icon: {
                                    Image(systemName: "person")
                                        .padding()
                                }
                            })
                            .modifier(ButtonBorderModifier())
                        }
                        .padding()

                        Group {
                            Text("Button with label")
                                .fontWeight(.heavy)
                            Button(action: {}, label: {
                                Text("Add ")
                                    .modifier(ButtonFontModifier())
                            })
                            .modifier(ButtonBorderModifier())
                        }
                        .padding()

                        // MARK: - styling
                        Group {
                            Text("BorderlessButtonStyle")
                                .fontWeight(.heavy)
                            Button("Style me: borderless", action: {})
                                .buttonStyle(BorderlessButtonStyle())
                            
                            
                            Text("PlainButtonStyle")
                                .fontWeight(.heavy)
                            Button("Style me: plain", action: {})
                                .buttonStyle(PlainButtonStyle())
                        }
                        .padding()
                        // end of group

                    }
                    // end of main group
              
                    ContributedByView(name: "Barbara Martina",
                                      link: "https://github.com/barbaramartina")
                        .padding(.top, 80)
                }
            })
        // end of scrollview list

        
    }
}

// MARK: - previews

struct ButtonsComponentsView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonsComponentsView()
            .previewLayout(.sizeThatFits)
    }
}

// MARK: - custom borders shape
//. thanks to https://stackoverflow.com/questions/56760335/round-specific-corners-swiftui

struct RoundedCorners: Shape {
    var tl: CGFloat = 0.0
    var tr: CGFloat = 0.0
    var bl: CGFloat = 0.0
    var br: CGFloat = 0.0

    func path(in rect: CGRect) -> Path {
        var path = Path()

        let w = rect.size.width
        let h = rect.size.height

        // Make sure we do not exceed the size of the rectangle
        let tr = min(min(self.tr, h/2), w/2)
        let tl = min(min(self.tl, h/2), w/2)
        let bl = min(min(self.bl, h/2), w/2)
        let br = min(min(self.br, h/2), w/2)

        path.move(to: CGPoint(x: tl, y: 0))
        path.addLine(to: CGPoint(x: w - tr, y: 0))
        path.addArc(center: CGPoint(x: w - tr, y: tr), radius: tr,
                    startAngle: Angle(degrees: -90), endAngle: Angle(degrees: 0), clockwise: false)

        path.addLine(to: CGPoint(x: w, y: h - br))
        path.addArc(center: CGPoint(x: w - br, y: h - br), radius: br,
                    startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 90), clockwise: false)

        path.addLine(to: CGPoint(x: bl, y: h))
        path.addArc(center: CGPoint(x: bl, y: h - bl), radius: bl,
                    startAngle: Angle(degrees: 90), endAngle: Angle(degrees: 180), clockwise: false)

        path.addLine(to: CGPoint(x: 0, y: tl))
        path.addArc(center: CGPoint(x: tl, y: tl), radius: tl,
                    startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 270), clockwise: false)

        return path
    }
}

// MARK: - HASHABLE

extension ButtonsComponentsView {
    
    static func == (lhs: ButtonsComponentsView, rhs: ButtonsComponentsView) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }


}


