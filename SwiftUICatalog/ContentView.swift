//
//  ContentView.swift
//  SwiftUICatalog
//
//  Created by Barbara Rodeker on 12.07.21.
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

protocol Comparable: Hashable & Equatable & Identifiable {}

struct ContentView: View {

    private let sectionColor = "Dark"

    private let gradient = MeshGradient(
        width: 3,
        height: 3,
        points: [
            .init(0.0, 0.0), .init(0.5, 0.0), .init(1.0, 0.0),
            .init(0.0, 0.5), .init(0.5, 0.5), .init(1.0, 0.5),
            .init(0.0, 1.0), .init(0.5, 1.0), .init(1.0, 1.0),
        ],
        colors: [
            .pink.opacity(0.3), .indigo, .lightYellow,
            .indigo, .orange.opacity(0.4), .white,
            .gray.opacity(0.4), .white, .lightYellow,
        ],
        background: .indigo
    )

    init() {
        // change the background of all the tables
        UITableView.appearance().backgroundColor = .clear
    }

    // MARK: - Body

    var body: some View {

        NavigationStack {
            ZStack {
                gradient
                    .ignoresSafeArea()

                List {

                    topHeaderRow
                        .accessibilityHeading(.h1)
                    ForEach(sectionContainer.readySections) { section in
                        section.view
                            .accessibilityHeading(.h2)
                    }

                }
                .scrollContentBackground(.hidden)
                .navigationTitle("SwiftUI Catalog")
            }

        }
        // end of navigationview
    }

    // MARK: - Header sections

    private var topHeaderRow: some View {
        Group {
            Text(
                "A catalog of components, controls, effects, styles and accessibility elements you can use to develop SwiftUI Interfaces in iOS and iPadOS."
            )
            .font(.footnote)
            .fontWeight(.light)
            .font(.title2)
            .padding(.top, 24)
            .padding(.bottom, 16)
            .foregroundColor(.white)

            HStack(alignment: .center, spacing: 2) {
                Spacer()
                Button(
                    action: {
                        UIApplication.shared.open(
                            URL(
                                string:
                                    "https://github.com/barbaramartina/swiftuicatalog/"
                            )!
                        )
                    },
                    label: {
                        Image("github")
                            .resizable()
                            .frame(width: 50, height: 50)
                    }
                )

                Spacer()
            }

        }
        .listRowBackground(Color(sectionColor))
        // end of section

    }

    var controls: some View {
        Section(
            header: Text("Controls")
                .font(.title)
                // see more information here https://developer.apple.com/documentation/swiftui/textvariantpreference?changes=_4
                .textVariant(.sizeDependent)
                .modifier(ListSectionFontModifier())
        ) {
            Group {
                Link(
                    destination: ButtonsComponentsView(),
                    label: "Buttons"
                )
                Link(
                    destination: ImagesComponentView(),
                    label: "Images"
                )
                Link(
                    destination: TextsComponentsView(),
                    label: "Texts"
                )
                Link(
                    destination: LabelsView(),
                    label: "Labels"
                )
                Link(
                    destination: MenusComponentView(),
                    label: "Menus"
                )
            }
            Group {
                Link(
                    destination: TogglesView(),
                    label: "Toggles"
                )
                Link(
                    destination: SlidersView(),
                    label: "Sliders"
                )
                Link(
                    destination: SteppersView(),
                    label: "Steppers"
                )
                Link(
                    destination: PickersView(),
                    label: "Pickers"
                )
                Link(
                    destination: DatePickersView(),
                    label: "Date Pickers"
                )
                Link(
                    destination: ColorPickersView(),
                    label: "Color pickers"
                )
                Link(
                    destination: ProgressViews(),
                    label: "Progress View"
                )
            }
        }
        .listRowBackground(Color(sectionColor))
    }

    var storeKit: some View {
        Section(
            header: Text("Store Kit Views")
                .font(.title)
                .modifier(ListSectionFontModifier())
        ) {
            Group {
                Link(
                    destination: ExampleProductView(
                        productId: "product.consumable.example.1",
                        productImageName: "giftcard.fill"
                    ),
                    label: "Consumable Product View"
                )
            }
        }
        .listRowBackground(Color(sectionColor))

    }

    var layouts: some View {
        Section(
            header: Text("Layouts")
                .font(.title)
                .modifier(ListSectionFontModifier())
        ) {
            Link(
                destination: ListsComponentView(),
                label: "Lists"
            )
            Link(
                destination: StacksView(),
                label: "Stacks"
            )
            Link(
                destination: GridsView(),
                label: "Grids"
            )
            Link(
                destination: ContainersView(),
                label: "Containers"
            )
            Link(
                destination: ScrollViewsView(),
                label: "Scrollviews"
            )
            Link(
                destination: TableViews(),
                label: "Table Views"
            )
        }
        .listRowBackground(Color(sectionColor))
    }

    var hierachicalViews: some View {
        Section(
            header: Text("Hierachical Views").font(.title)
                .modifier(ListSectionFontModifier())
        ) {
            Link(
                destination: NavigationBarsComponentView(),
                label: "Navigation"
            )
            Link(
                destination: OutlinesGroupsView(),
                label: "Outlines"
            )
            Link(
                destination: DisclosureGroupsView(),
                label: "Disclosures"
            )
            Link(
                destination: TabsView(),
                label: "Tabs"
            )
        }
        .listRowBackground(Color(sectionColor))

    }

    var drawings: some View {
        Section(
            header: Text("Drawing and animations")
                .font(.title)
                .modifier(ListSectionFontModifier())
        ) {
            Link(
                destination: CanvasView(),
                label: "Canvas"
            )
            Link(
                destination: GraphicContextsView(),
                label: "Graphic Context"
            )
            Link(
                destination: CustomMeshGradient(),
                label: "Mesh gradients"
            )
            Link(
                destination: ShapesView(),
                label: "Shapes"
            )
            Link(
                destination: AnimationsView(),
                label: "Animations"
            )
            Link(
                destination: GeometriesView(),
                label: "Geometries"
            )
        }
        .listRowBackground(Color(sectionColor))

    }

    var charts: some View {
        Section(
            header: Text("Charts")
                .font(.title)
                .modifier(ListSectionFontModifier())
        ) {
            Link(
                destination: ChartsViews(),
                label: "Swift Charts"
            )
        }
        .listRowBackground(Color(sectionColor))

    }

    var gestures: some View {
        Section(
            header: Text("Gestures")
                .font(.title)
                .modifier(ListSectionFontModifier())
        ) {
            Link(
                destination: GesturesView(),
                label: "Gestures"
            )
            Link(
                destination: ComposingGesturesView(),
                label: "Composing Gestures"
            )
            Link(
                destination: SensoryFeedbackInViews(),
                label: "Sensory Feedback"
            )
        }
        .listRowBackground(Color(sectionColor))

    }

    var viewModifiers: some View {
        Section(
            header: Text("View modifiers")
                .font(.title)
                .modifier(ListSectionFontModifier())
        ) {
            Link(
                destination: TextModifiersView(),
                label: "Text modifiers"
            )
            Link(
                destination: EffectsModifiersView(),
                label: "Effect modifiers"
            )
            Link(
                destination: LayoutModifiersView(),
                label: "Layout modifiers"
            )

        }
        .listRowBackground(Color(sectionColor))

    }

    var accessibility: some View {
        Section(
            header: Text("Accesibility")
                .font(.title)
                .modifier(ListSectionFontModifier())
        ) {

            Link(
                destination: AccesibilityView(),
                label: "Accesibility"
            )
        }
        .listRowBackground(Color(sectionColor))

    }

    var statusBars: some View {
        Section(
            header: Text("Status and tool bars")
                .font(.title)
                .modifier(ListSectionFontModifier())
        ) {
            Link(
                destination: ToolbarsComponentView(),
                label: "Tool Bars"
            )
        }
        .listRowBackground(Color(sectionColor))

    }

    var stylingSection: some View {
        Section(
            header: Text("Styling")
                .font(.title)
                .modifier(ListSectionFontModifier())
        ) {

            Link(
                destination: StylesView(),
                label: "Styles"
            )
        }
        .listRowBackground(Color(sectionColor))

    }

    var popovers: some View {
        Section(
            header: Text("Popovers, alerts and sheets")
                .font(.title)
                .modifier(ListSectionFontModifier())
        ) {

            //                Link(destination: PopoversComponentView(),
            //                     label: "Popovers")
            Link(
                destination: SheetsView(),
                label: "Sheets"
            )
            //                Link(destination: AlertsComponentView(),
            //                     label: "Alerts")
            //                Link(destination: TimelineViews(),
            //                     label: "Timelines")
            //                Link(destination: SpacersDividersView(),
            //                     label: "Spacer")
        }
        .listRowBackground(Color(sectionColor))

    }

    var composedComponents: some View {
        Section(
            header: Text("Composed components to help speed up development")
                .font(.title)
                .modifier(ListSectionFontModifier())
        ) {
            Link(
                destination: CommonlyUsedViews(),
                label: "Commonly used views"
            )
            Link(
                destination: CollectionsViews(),
                label: "Collections of components"
            )
            Link(
                destination: StackedCardsView<CardView>(elementsCount: 22),
                label: "Stacked cards with dragging"
            )
        }
        .listRowBackground(Color(sectionColor))
        // end of composed VIEWS

    }

}

// MARK: - preview

#Preview {

    Group {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
