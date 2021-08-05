//
//  TogglesView.swift
//  SwiftUICatalog
//
// MIT License
//
// Copyright (c) 2021 { YOUR NAME HERE 🏆 }
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
/// Examples on how to use TOGGLES in SwiftUI
/// OFFICIAL DOCUMENTATION https://developer.apple.com/documentation/swiftui/toggle
///
struct TogglesView: View {
    @State var isBasicToggleOn: Bool = true
    @State var isSwitchToggleOn: Bool = true
    @State var isCustomToggleOn: Bool = true

    var body: some View {
        VStack(spacing: 20) {
            Toggle(
                isOn: $isBasicToggleOn,
                label: {
                    Text("Default Toggle Style")
                }
            )
            .toggleStyle(DefaultToggleStyle())

            Toggle(
                isOn: $isSwitchToggleOn,
                label: {
                    Text("Switch Toggle Style")
                }
            )
            .toggleStyle(SwitchToggleStyle(tint: Color.purple))

            Toggle(
                isOn: $isCustomToggleOn,
                label: {
                    Text("Custom Toggle Style")
                }
            )
            .toggleStyle(CustomToggleStyle())

        }
        .padding()
    }
}

struct CustomToggleStyle: ToggleStyle {
    func makeBody(configuration: ToggleStyle.Configuration) -> some View {
        HStack {
            configuration.label
            Spacer()
            Button(
                action: {
                    configuration.isOn = !configuration.isOn
                },
                label: {
                    Rectangle()
                        .fill(configuration.isOn ? Color.purple : .blue.opacity(0.5))
                        .frame(
                            width: 50,
                            height: 30
                        )
                        .overlay(
                            Ellipse()
                                .frame(
                                    width: 20,
                                    height: configuration.isOn ? 20 : 5
                                )
                                .foregroundColor(.white)
                                .offset(
                                    x: configuration.isOn ? 11 : -11,
                                    y: 0
                                )
                                .animation(Animation.linear(duration: 0.1))
                        )
                        .cornerRadius(20)

                }
            )
            .buttonStyle(PlainButtonStyle())
        }
    }
}

struct TogglesView_Previews: PreviewProvider {
    static var previews: some View {
        TogglesView()
    }
}
