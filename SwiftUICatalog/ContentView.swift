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
// AUTHORS OR COPYRIGHTHOLDER BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//

import SwiftUI

protocol Comparable: Hashable & Equatable & Identifiable {}

struct ContentView: View {

    @State private var searchText = ""
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
                    
                    ForEach(filteredSections) { section in
                        Section(
                            header: Text(section.name)
                                .font(.title)
                                .modifier(ListSectionFontModifier())
                        ) {
                            ForEach(section.items) { item in
                                Link(destination: item.destination, label: item.label)
                            }
                        }
                        .listRowBackground(Color(sectionColor))
                        .accessibilityHeading(.h2)
                    }

                }
                .scrollContentBackground(.hidden)
                .navigationTitle("SwiftUI Catalog")
                .searchable(text: $searchText, prompt: "Search examples...")
            }

        }
    }

    private var filteredSections: [MenuSection] {
        sectionContainer.readySections.filter { section in
            if searchText.isEmpty { return true }
            
            let sectionMatches = section.name.localizedCaseInsensitiveContains(searchText)
            let itemMatches = section.items.contains { $0.label.localizedCaseInsensitiveContains(searchText) }
            
            return sectionMatches || itemMatches
        }.map { section in
            if searchText.isEmpty {
                return section
            } else {
                // Filter items within the section
                let filteredItems = section.items.filter { item in
                    item.label.localizedCaseInsensitiveContains(searchText) || section.name.localizedCaseInsensitiveContains(searchText)
                }
                return MenuSection(name: section.name, state: section.state, items: filteredItems)
            }
        }
    }

    // MARK: - Header sections

    private var topHeaderRow: some View {
        Group {
            Text(
                "A catalog of components, controls, effects, styles and accessibility elements you can use to develop SwiftUI Interfaces in iOS and iPadOS."
            )
            .font(.footnote)
            .fontWeight(.light)
            .font(.body)
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
    }

    // MARK: - Section Items

    var controlsItems: [CatalogItem] {
        [
            CatalogItem(label: "Buttons", destination: AnyView(ButtonsComponentsView())),
            CatalogItem(label: "Images", destination: AnyView(ImagesComponentView())),
            CatalogItem(label: "Texts", destination: AnyView(TextsComponentsView())),
            CatalogItem(label: "Labels", destination: AnyView(LabelsView())),
            CatalogItem(label: "Menus", destination: AnyView(MenusComponentView())),
            CatalogItem(label: "AsyncImage Caching", destination: AnyView(AsyncImageCachingView())),
            CatalogItem(label: "Export View", destination: AnyView(ExportView())),
            CatalogItem(label: "Toggles", destination: AnyView(TogglesView())),
            CatalogItem(label: "Sliders", destination: AnyView(SlidersView())),
            CatalogItem(label: "Steppers", destination: AnyView(SteppersView())),
            CatalogItem(label: "Pickers", destination: AnyView(PickersView())),
            CatalogItem(label: "Date Pickers", destination: AnyView(DatePickersView())),
            CatalogItem(label: "Color pickers", destination: AnyView(ColorPickersView())),
            CatalogItem(label: "Progress View", destination: AnyView(ProgressViews())),
        ]
    }

    var storeKitItems: [CatalogItem] {
        [
            CatalogItem(
                label: "Consumable Product View",
                destination: AnyView(ExampleProductView(
                    productId: "product.consumable.example.1",
                    productImageName: "giftcard.fill"
                ))
            )
        ]
    }

    var layoutsItems: [CatalogItem] {
        [
            CatalogItem(label: "Lists", destination: AnyView(ListsComponentView())),
            CatalogItem(label: "Stacks", destination: AnyView(StacksView())),
            CatalogItem(label: "Grids", destination: AnyView(GridsView())),
            CatalogItem(label: "Containers", destination: AnyView(ContainersView())),
            CatalogItem(label: "Scrollviews", destination: AnyView(ScrollViewsView())),
            CatalogItem(label: "Content Margins", destination: AnyView(ContentMarginsView())),
            CatalogItem(label: "Table Views", destination: AnyView(TableViews())),
            CatalogItem(label: "Custom gallery layout", destination: AnyView(ColumnsLayoutView())),
            CatalogItem(label: "Circles Layout", destination: AnyView(CircleLayoutView())),
            CatalogItem(label: "Tags Cloud", destination: AnyView(TagsCloudLayoutView())),
            CatalogItem(label: "Stacked Cards", destination: AnyView(StackedLayoutView())),
        ]
    }

    var hierachicalViewsItems: [CatalogItem] {
        [
            CatalogItem(label: "Navigation", destination: AnyView(NavigationBarsComponentView())),
            CatalogItem(label: "Outlines", destination: AnyView(OutlinesGroupsView())),
            CatalogItem(label: "Any transition", destination: AnyView(AnyNavigationTransitionView())),
            CatalogItem(label: "Disclosures", destination: AnyView(DisclosureGroupsView())),
            CatalogItem(label: "Tabs", destination: AnyView(TabsView())),
            CatalogItem(label: "Swipe Actions Container", destination: AnyView(SwipeActionsContainerDemo())),
        ]
    }

    var drawingsItems: [CatalogItem] {
        [
            CatalogItem(label: "Canvas", destination: AnyView(CanvasView())),
            CatalogItem(label: "Graphic Context", destination: AnyView(GraphicContextsView())),
            CatalogItem(label: "Mesh gradients", destination: AnyView(CustomMeshGradient())),
            CatalogItem(label: "Shapes", destination: AnyView(ShapesView())),
            CatalogItem(label: "Advance Graphics", destination: AnyView(AdvancedGraphicsView())),
            CatalogItem(label: "Animations", destination: AnyView(AnimationsView())),
            CatalogItem(label: "Shaders", destination: AnyView(MetalShaderExamples())),
            CatalogItem(label: "Geometries", destination: AnyView(GeometriesView())),
        ]
    }

    var chartsItems: [CatalogItem] {
        [
            CatalogItem(label: "Swift Charts", destination: AnyView(ChartsViews())),
        ]
    }

    var gesturesItems: [CatalogItem] {
        [
            CatalogItem(label: "Gestures", destination: AnyView(GesturesView())),
            CatalogItem(label: "Composing Gestures", destination: AnyView(ComposingGesturesView())),
            CatalogItem(label: "Sensory Feedback", destination: AnyView(SensoryFeedbackInViews())),
            CatalogItem(label: "Drag and drop", destination: AnyView(DragDropDemo())),
            CatalogItem(label: "Advance swipe", destination: AnyView(AdvancedSwipeDemo())),
        ]
    }

    var viewModifiersItems: [CatalogItem] {
        [
            CatalogItem(label: "Text modifiers", destination: AnyView(TextModifiersView())),
            CatalogItem(label: "Effect modifiers", destination: AnyView(EffectsModifiersView())),
            CatalogItem(label: "Layout modifiers", destination: AnyView(LayoutModifiersView())),
        ]
    }

    var accessibilityItems: [CatalogItem] {
        [
            CatalogItem(label: "Accesibility", destination: AnyView(AccesibilityView())),
        ]
    }

    var statusBarsItems: [CatalogItem] {
        [
            CatalogItem(label: "Tool Bars", destination: AnyView(ToolbarsComponentView())),
            CatalogItem(label: "Advanced Toolbars (iOS 27)", destination: AnyView(AdvancedToolbarView())),
        ]
    }

    var stylingSectionItems: [CatalogItem] {
        [
            CatalogItem(label: "Styles", destination: AnyView(StylesView())),
        ]
    }

    var popoversItems: [CatalogItem] {
        [
            CatalogItem(label: "Sheets", destination: AnyView(SheetsView())),
            CatalogItem(label: "Item-based Alerts", destination: AnyView(ItemBasedAlertsView())),
        ]
    }

    var composedComponentsItems: [CatalogItem] {
        [
            CatalogItem(label: "Commonly used views", destination: AnyView(CommonlyUsedViews())),
            CatalogItem(label: "Collections of components", destination: AnyView(CollectionsViews())),
            CatalogItem(label: "Stacked cards with dragging", destination: AnyView(StackedCardsView<CardView>(elementsCount: 22))),
        ]
    }

}

// MARK: - preview

#Preview {

    Group {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
