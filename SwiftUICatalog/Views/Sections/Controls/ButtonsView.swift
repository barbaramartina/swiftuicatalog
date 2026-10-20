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

    @State private var fruits = ["Apple", "Banana", "Papaya", "Mango"]

    @State private var pastedText: String = ""

    // MARK: - Configuration State

    // General customizable button
    @State private var mainBtnColor: Color = .clear
    @State private var mainBtnBorderColor: Color = .accentColor
    @State private var mainBtnBorderWidth: Double = 1
    @State private var mainBtnFont: UIFont = UIFont.preferredFont(forTextStyle: .body)
    @State private var mainBtnWidth: CGFloat = 100
    @State private var mainBtnHeight: CGFloat = 44
    @State private var mainBtnRadius: CGFloat = 10.0
    @State private var mainBtnTextStyle: UIFont.TextStyle = .body

    // Rounded Buttons
    @State private var roundedBtnColor: Color = .clear
    @State private var roundedBtnBorderColor: Color = .accentColor
    @State private var roundedBtnBorderWidth: Double = 1
    @State private var roundedBtnRadius: CGFloat = 10

    // Custom Shape Buttons
    @State private var shapeTLRadius: CGFloat = 10
    @State private var shapeTRRadius: CGFloat = 0
    @State private var shapeBLRadius: CGFloat = 0
    @State private var shapeBRRadius: CGFloat = 10
    @State private var shapeBorderColor: Color = .accentColor
    @State private var shapeBorderWidth: Double = 5

    // Stroked Border Buttons
    @State private var strokeColor: Color = .accentColor
    @State private var strokeLineWidth: Double = 5
    @State private var strokeDash: Double = 10

    // Plain Background Buttons
    @State private var plainBgColor: Color = Color("Medium")

    // Image/Icon Buttons
    @State private var imagePadding: CGFloat = 12
    @State private var imageColor: Color = .accentColor
    @State private var iconBorderColor: Color = .accentColor
    @State private var iconBorderWidth: Double = 5


    // MARK: - Body

    var body: some View {
        PageContainer(
            content:
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 16) {
                        DocumentationLinkView(
                            link:
                                "https://developer.apple.com/documentation/swiftui/button",
                            name: nil
                        )

                        Text(
                            "Given an action and a label you can create a button. When a user clicks or taps the button, an action—a method or closure property—is triggered. The label is a view that can display text, an icon, or both to describe the operation of the button. Any type of view, such as a Text view for text-only labels, can be the label of a button."
                        )
                        .fontWeight(.light)
                        .font(.body)
                        .padding(.bottom)
                        // MARK: - Modern Button Showcase
                        VStack(spacing: 20) {
                            customizableButton
                            roundedButtons
                            customShapeButtons
                            strokedBorderButtons
                            plainBackgroundButtons
                            iconicButtons
                            labelStyledButton
                            styledButtons
                        }

                        ContributedByView(
                            name: "Barbara Martina",
                            link: "https://github.com/barbaramartina"
                        )
                        .padding(.top, 80)
                    }
                }
        )

    }

    private var iconicButtons: some View {
        ButtonControlCard(
            title: "Iconic Buttons",
            description: "From simple icons to complex labels, explore how to combine images and text to create intuitive and visually appealing call-to-actions.",
            content: HStack(spacing: 20) {
                VStack(spacing: 12) {
                    Button(action: {}) {
                        Image(systemName: "person.fill")
                            .font(.title2)
                            .padding(imagePadding)
                            .foregroundColor(imageColor)
                    }
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(iconBorderColor, lineWidth: iconBorderWidth)
                    )
                    Text("Icon Only").font(.caption2).foregroundColor(.secondary)
                }

                VStack(spacing: 12) {
                    Button(action: {}) {
                        Label {
                            Text("Add User")
                                .modifier(ButtonFontModifier())
                        } icon: {
                            Image(systemName: "person.badge.plus")
                                .padding(.trailing, imagePadding)
                                .foregroundColor(imageColor)
                        }
                    }
                    .modifier(ButtonBorderModifier())
                    Text("Icon & Label").font(.caption2).foregroundColor(.secondary)
                }

                VStack(spacing: 12) {
                    Button("Add User", action: {})
                        .modifier(ButtonFontModifier())
                        .modifier(ButtonBorderModifier())
                    Text("Text Only").font(.caption2).foregroundColor(.secondary)
                }
            },
            controls: VStack(spacing: 12) {
                ControlRow(label: "Icon Color", control: ColorPicker("", selection: $imageColor, supportsOpacity: false).labelsHidden())
                ControlRow(label: "Border Color", control: ColorPicker("", selection: $iconBorderColor, supportsOpacity: false).labelsHidden())
                ControlRow(label: "Border Width", control: Slider(value: $iconBorderWidth, in: 0...10, step: 1).frame(width: 100))
                ControlRow(label: "Icon Padding", control: Slider(value: $imagePadding, in: 4...32, step: 1).frame(width: 100))
            }
        )
    }

    private var styledButtons: some View {
        ButtonControlCard(
            title: "Predefined Button Styles",
            description: "SwiftUI provides several built-in styles like Borderless and Plain that change how buttons interact and appear across platforms.",
            content: HStack(spacing: 20) {
                Button("Borderless", action: {})
                    .buttonStyle(BorderlessButtonStyle())
                
                Button("Plain", action: {})
                    .buttonStyle(PlainButtonStyle())
            },
            controls: Text("These styles are system-defaults and have limited direct customization beyond the label content.")
                .font(.caption)
                .foregroundColor(.secondary)
        )
    }

    private var labelStyledButton: some View {
        ButtonControlCard(
            title: "Label Styles",
            description: "Control whether the button shows only the icon, only the title, or both, using the labelStyle modifier.",
            content: HStack(spacing: 20) {
                Button("Label Only", systemImage: "message.badge", action: {})
                    .labelStyle(.titleOnly)
                    .modifier(ButtonBorderModifier())
                
                Button("Icon Only", systemImage: "message.badge", action: {})
                    .labelStyle(.iconOnly)
                    .modifier(ButtonBorderModifier())
                
                Button("Both", systemImage: "message.badge", action: {})
                    .labelStyle(.titleAndIcon)
                    .modifier(ButtonBorderModifier())
            },
            controls: Text("Label styles are powerful for creating adaptive UIs that change based on available screen space.")
                .font(.caption)
                .foregroundColor(.secondary)
        )
    }

    private var customizableButton: some View {
        ButtonControlCard(
            title: "Customizable Button",
            description: "Adjust properties interactively to see how the button changes. Note how fixed sizes affect content across different font styles.",
            content: Button("Change Me", systemImage: "message.badge", action: {})
                .frame(width: mainBtnWidth, height: mainBtnHeight)
                .modifier(ButtonFontModifier(font: Font(UIFont.preferredFont(forTextStyle: mainBtnTextStyle))))
                .background(mainBtnColor)
                .modifier(RoundedBordersModifier(
                    radius: mainBtnRadius,
                    lineWidth: CGFloat(mainBtnBorderWidth),
                    color: mainBtnBorderColor
                )),
            controls: VStack(spacing: 12) {
                ControlRow(label: "Background", control: ColorPicker("", selection: $mainBtnColor, supportsOpacity: false).labelsHidden())
                ControlRow(label: "Border Color", control: ColorPicker("", selection: $mainBtnBorderColor, supportsOpacity: false).labelsHidden())
                ControlRow(label: "Border Width", control: Slider(value: $mainBtnBorderWidth, in: 0...10, step: 1).frame(width: 100))
                ControlRow(label: "Width", control: Slider(value: $mainBtnWidth, in: 50...300, step: 1).frame(width: 100))
                ControlRow(label: "Height", control: Slider(value: $mainBtnHeight, in: 35...100, step: 1).frame(width: 100))
                ControlRow(label: "Radius", control: Slider(value: $mainBtnRadius, in: 0...50, step: 1).frame(width: 100))
                ControlRow(label: "Font Style", control: UIFontTextStylePicker(selection: $mainBtnTextStyle))
            }
        )
    }

    // MARK: - views

    private var roundedButtons: some View {
        ButtonControlCard(
            title: "Rounded Button",
            description: "One of the most common designs for buttons is incorporating rounded corners for a modern, friendly feel.",
            content: Button("Click Me", action: {})
                .modifier(ButtonFontModifier())
                .modifier(RoundedBordersModifier(
                    radius: roundedBtnRadius,
                    lineWidth: CGFloat(roundedBtnBorderWidth),
                    color: roundedBtnBorderColor
                ))
                .background(roundedBtnColor),
            controls: VStack(spacing: 12) {
                ControlRow(label: "Background", control: ColorPicker("", selection: $roundedBtnColor, supportsOpacity: false).labelsHidden())
                ControlRow(label: "Border Color", control: ColorPicker("", selection: $roundedBtnBorderColor, supportsOpacity: false).labelsHidden())
                ControlRow(label: "Border Width", control: Slider(value: $roundedBtnBorderWidth, in: 0...10, step: 1).frame(width: 100))
                ControlRow(label: "Corner Radius", control: Slider(value: $roundedBtnRadius, in: 0...50, step: 1).frame(width: 100))
            }
        )
    }

    private var customShapeButtons: some View {
        ButtonControlCard(
            title: "Custom Shape Button",
            description: "Precision control over each corner's radius. This is useful for creating tabs or specific UI elements that don't follow standard rounded rectangles.",
            content: HStack(spacing: 20) {
                Button("Shape 1", action: {})
                    .modifier(ButtonFontModifier())
                    .overlay(
                        RoundedCorners(
                            tl: shapeTLRadius,
                            tr: shapeTRRadius,
                            bl: shapeBLRadius,
                            br: shapeBRRadius
                        )
                        .stroke(shapeBorderColor, lineWidth: shapeBorderWidth)
                    )
                
                Button("Shape 2", action: {})
                    .modifier(ButtonFontModifier())
                    .clipShape(
                        UnevenRoundedRectangle(
                            topLeadingRadius: shapeTLRadius,
                            bottomLeadingRadius: shapeBLRadius,
                            bottomTrailingRadius: shapeBRRadius,
                            topTrailingRadius: shapeTRRadius
                        )
                    )
                    .overlay(
                        UnevenRoundedRectangle(
                            topLeadingRadius: shapeTLRadius,
                            bottomLeadingRadius: shapeBLRadius,
                            bottomTrailingRadius: shapeBRRadius,
                            topTrailingRadius: shapeTRRadius
                        )
                        .stroke(shapeBorderColor, lineWidth: shapeBorderWidth)
                    )
            },
            controls: VStack(spacing: 12) {
                ControlRow(label: "Border Color", control: ColorPicker("", selection: $shapeBorderColor, supportsOpacity: false).labelsHidden())
                ControlRow(label: "Border Width", control: Slider(value: $shapeBorderWidth, in: 0...20, step: 1).frame(width: 100))
                Divider()
                ControlRow(label: "Top Left", control: Slider(value: $shapeTLRadius, in: 0...50, step: 1).frame(width: 100))
                ControlRow(label: "Top Right", control: Slider(value: $shapeTRRadius, in: 0...50, step: 1).frame(width: 100))
                ControlRow(label: "Bottom Left", control: Slider(value: $shapeBLRadius, in: 0...50, step: 1).frame(width: 100))
                ControlRow(label: "Bottom Right", control: Slider(value: $shapeBRRadius, in: 0...50, step: 1).frame(width: 100))
            }
        )
    }

    private var strokedBorderButtons: some View {
        ButtonControlCard(
            title: "Stroked Border Button",
            description: "Use custom stroke styles to create dashed or dotted borders, adding a distinct visual rhythm to your UI elements.",
            content: Button("Dashed Button", action: {})
                .modifier(ButtonFontModifier())
                .overlay(
                    Capsule(style: .continuous)
                        .stroke(
                            strokeColor,
                            style: StrokeStyle(lineWidth: strokeLineWidth, dash: [strokeDash])
                        )
                ),
            controls: VStack(spacing: 12) {
                ControlRow(label: "Stroke Color", control: ColorPicker("", selection: $strokeColor, supportsOpacity: false).labelsHidden())
                ControlRow(label: "Line Width", control: Slider(value: $strokeLineWidth, in: 1...20, step: 1).frame(width: 100))
                ControlRow(label: "Dash Length", control: Slider(value: $strokeDash, in: 0...30, step: 1).frame(width: 100))
            }
        )
    }

    private var plainBackgroundButtons: some View {
        ButtonControlCard(
            title: "Plain Background Button",
            description: "Simple, high-contrast buttons that use a solid fill color. Ideal for primary actions or strong brand presence.",
            content: Button("Filled Button", action: {})
                .padding()
                .modifier(ButtonFontModifier())
                .background(plainBgColor)
                .cornerRadius(12),
            controls: VStack(spacing: 12) {
                ControlRow(label: "Fill Color", control: ColorPicker("", selection: $plainBgColor, supportsOpacity: false).labelsHidden())
            }
        )
    }
}

// MARK: - previews

#Preview {

    ButtonsComponentsView()

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
        let tr = min(min(self.tr, h / 2), w / 2)
        let tl = min(min(self.tl, h / 2), w / 2)
        let bl = min(min(self.bl, h / 2), w / 2)
        let br = min(min(self.br, h / 2), w / 2)

        path.move(to: CGPoint(x: tl, y: 0))
        path.addLine(to: CGPoint(x: w - tr, y: 0))
        path.addArc(
            center: CGPoint(x: w - tr, y: tr),
            radius: tr,
            startAngle: Angle(degrees: -90),
            endAngle: Angle(degrees: 0),
            clockwise: false
        )

        path.addLine(to: CGPoint(x: w, y: h - br))
        path.addArc(
            center: CGPoint(x: w - br, y: h - br),
            radius: br,
            startAngle: Angle(degrees: 0),
            endAngle: Angle(degrees: 90),
            clockwise: false
        )

        path.addLine(to: CGPoint(x: bl, y: h))
        path.addArc(
            center: CGPoint(x: bl, y: h - bl),
            radius: bl,
            startAngle: Angle(degrees: 90),
            endAngle: Angle(degrees: 180),
            clockwise: false
        )

        path.addLine(to: CGPoint(x: 0, y: tl))
        path.addArc(
            center: CGPoint(x: tl, y: tl),
            radius: tl,
            startAngle: Angle(degrees: 180),
            endAngle: Angle(degrees: 270),
            clockwise: false
        )

        return path
    }

}

// MARK: - Helper Views

struct ButtonControlCard<Content: View, Controls: View>: View {
    let title: String
    let description: String
    let content: Content
    let controls: Controls

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(title)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.primary)

            Text(description)
                .font(.subheadline)
                .fontWeight(.medium)
                .foregroundColor(.secondary)
                .fixedSize(horizontal: false, vertical: true)

            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color(UIColor.secondarySystemBackground))
                    .frame(maxWidth: .infinity, minHeight: 120)
                
                content
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .padding(.vertical)

            DisclosureGroup("Customization") {
                controls
                    .padding(.top, 8)
            }
            .padding(.bottom, 8)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 24)
                .fill(Color(UIColor.tertiarySystemBackground))
                .shadow(color: Color.black.opacity(0.05), radius: 10, x: 0, y: 5)
        )
        .padding(.horizontal)
    }
}

struct ControlRow<V: View>: View {
    let label: String
    let control: V

    var body: some View {
        HStack {
            Text(label)
                .font(.footnote)
                .foregroundColor(.secondary)
            Spacer()
            control
        }
        .padding(.vertical, 4)
    }
}

// MARK: - HASHABLE

extension ButtonsComponentsView {

    static func == (lhs: ButtonsComponentsView, rhs: ButtonsComponentsView)
        -> Bool
    {
        return lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

}
