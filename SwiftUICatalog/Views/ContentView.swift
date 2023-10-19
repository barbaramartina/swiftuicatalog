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

    private let gradient = EllipticalGradient(colors: [ .blue, .pink, .green, .gray],
                                              center: .topLeading,
                                              startRadiusFraction: 0.3,
endRadiusFraction: 3)

    init(){
        UITableView.appearance().backgroundColor = .clear
    }
    
    // MARK: - Body
    
    var body: some View {
        
        NavigationView {
            ZStack {
                gradient
                    .ignoresSafeArea()
                
                    List {
                        Group {
                            
                            Text("A catalog of components, controls, effects, styles and accessibility elements you can use to develop SwiftUI Interfaces in iOS and iPadOS.")
                                .font(.footnote)
                                .fontWeight(.light)
                                .padding(.top, 24)
                                .padding(.bottom, 16)
                                .foregroundColor(.white)

                            HStack(alignment: .center, spacing: 2) {
                                Spacer()
                                Button(action: {
                                    UIApplication.shared.open(URL(string: "https://github.com/barbaramartina/swiftuicatalog/")!)
                                },
                                       label: {
                                    Image("github")
                                        .resizable()
                                        .frame(width: 50, height: 50)
                                       })
                                
                                Spacer()
                            }
                            
                        }
                        .listRowBackground(Color(sectionColor))
                        // end of section
                        
                        Group {
                            Section(header: Text("Controls")
                                .modifier(ListSectionFontModifier())) {
                                    Group {
                                    Link(destination: ButtonsComponentsView(),
                                         label: "Buttons")
                                    Link(destination: ImagesComponentView(),
                                         label: "Images")
                                    Link(destination: TextsComponentsView(),
                                         label: "Texts")
                                    Link(destination: LabelsView(),
                                         label: "Labels")
                                    Link(destination: MenusComponentView(),
                                         label: "Menus")
                                    }
                                    Group {
                                    Link(destination: TogglesView(),
                                         label: "Toggles")
                                    Link(destination: SlidersView(),
                                         label: "Sliders")
                                    Link(destination: SteppersView(),
                                         label: "Steppers")
                                    Link(destination: PickersView(),
                                         label: "Pickers")
                                    Link(destination: DatePickersView(),
                                         label: "Date Pickers")
                                    Link(destination: ColorPickersView(),
                                         label: "Color pickers")
                                    Link(destination: ProgressViews(),
                                         label: "Progress View")
                                    }

                                }
                                .listRowBackground(Color(sectionColor))

                            Group {
                                Section(header: Text("Store Kit Views")
                                    .modifier(ListSectionFontModifier())) {
                                        Group {
                                            Link(destination: ExampleProductView(productId: "product.consumable.example.1", productImageName: "corgie-love"),
                                                 label: "Consumable Product View")
                                        }
                                    }
                            }
                            .listRowBackground(Color(sectionColor))

                            
                            // MARK: - LAYOUTS
                            
                            Section(header: Text("Layouts")
                                .modifier(ListSectionFontModifier())) {
                                Link(destination: ListsComponentView(),
                                     label: "Lists")
                                Link(destination: StacksView(),
                                     label: "Stacks")
                                Link(destination: GridsView(),
                                     label: "Grids")
                                Link(destination: ContainersView(),
                                     label: "Containers")
                                Link(destination: ScrollViewsView(),
                                     label: "Scrollviews")
                            }
                                .listRowBackground(Color(sectionColor))
                            // end of section View Layouts
                            
                            // MARK: - navigation
                            
                            Section(header: Text("Hierachical Views")   .modifier(ListSectionFontModifier())) {
                                Link(destination: NavigationBarsComponentView(),
                                     label: "Navigation")
                                Link(destination: OutlinesGroupsView(),
                                     label: "Outlines")
                                Link(destination: DisclosureGroupsView(),
                                     label: "Disclosures")
                                Link(destination: TabsView(),
                                     label: "Tabs")
                            }
                            .listRowBackground(Color(sectionColor))
                            // end of Group Navigation View
                            
                            // MARK: - DRAWING AND ANIMATIONS
                            
                            Section(header: Text("Drawing and animations")                                .modifier(ListSectionFontModifier())) {
                                Link(destination: CanvasView(),
                                     label: "Canvas")
                                Link(destination: GraphicContextsView(),
                                     label: "Graphic Context")
                                Link(destination: ShapesView(),
                                     label: "Shapes")
                                Link(destination: AnimationsView(),
                                     label: "Animations")
                                Link(destination: GeometriesView(),
                                     label: "Geometries")
                            }
                            .listRowBackground(Color(sectionColor))
                            // end of drawing

                            // MARK: - CHARTS

                            Section(header: Text("Charts")                                .modifier(ListSectionFontModifier())) {
                                Link(destination: ChartsViews(),
                                     label: "Swift Charts")
                            }
                            .listRowBackground(Color(sectionColor))

                            // MARK: - GESTURES

                            Section(header: Text("Gestures")                                .modifier(ListSectionFontModifier())) {
                                Link(destination: GesturesView(),
                                     label: "Gestures")
                                Link(destination: ComposingGesturesView(),
                                     label: "Composing Gestures")
                            }
                            .listRowBackground(Color(sectionColor))

                        }
                        
                        // MARK: - VIEW MODIFIERS
                        
                        Section(header: Text("View modifiers")                                .modifier(ListSectionFontModifier())) {
                            Link(destination: CustomModifiersView(),
                                 label: "Custom view modifiers")
                            Link(destination: TextModifiersView(),
                                 label: "Text modifiers")
                            Link(destination: EffectsModifiersView(),
                                 label: "Effect modifiers")
                            Link(destination: LayoutModifiersView(),
                                 label: "Layout modifiers")
                            
                        }
                        .listRowBackground(Color(sectionColor))
                        // end of Group view modifiers
                        
                        // MARK: - ACCESSIBILITY
                        
                        Section(header: Text("Accesibility")                                .modifier(ListSectionFontModifier())) {
                            
                            Link(destination: AccesibilityView(),
                                 label: "Accesibility")
                        }
                        .listRowBackground(Color(sectionColor))
                        // end of group accesibility
                        
                        // MARK: - status and tool bars
                        
                        Section(header: Text("Status and tool bars")                                .modifier(ListSectionFontModifier())) {
                            Link(destination: ToolbarsComponentView(),
                                 label: "Tool Bars")
                        }
                        .listRowBackground(Color(sectionColor))
                        // end of group Bars
                        
                        // MARK: - STYLES ON VIEWS
                        
                        Section(header: Text("Styling")                                .modifier(ListSectionFontModifier())) {
                            
                            Link(destination: StylesView(),
                                 label: "Styles")
                        }
                        .listRowBackground(Color(sectionColor))
                        // end of Group Styles
                        
                        // MARK: - ADDITIONAL VIEWS
                        
                        Section(header: Text("Popovers, alerts and sheets")                                .modifier(ListSectionFontModifier())) {
                            
                            Link(destination: PopoversComponentView(),
                                 label: "Popovers")
                            Link(destination: SheetView(),
                                 label: "Sheets")
                            Link(destination: AlertsComponentView(),
                                 label: "Alerts")
                            Link(destination: TimelineViews(),
                                 label: "Timelines")
                            Link(destination: SpacersDividersView(),
                                 label: "Spacer")
                        }
                        .listRowBackground(Color(sectionColor))
                        // end of Group ADDITIONAL VIEWS

                        // MARK: - Composed components
                        
                        Section(header: Text("Composed components to help speed up development")                                .modifier(ListSectionFontModifier())) {
                            
                            Link(destination: CommonlyUsedViews(),
                                 label: "Commonly used views")
                            Link(destination: CollectionsViews(),
                                 label: "Collections of components")
                        }
                        .listRowBackground(Color(sectionColor))
                        // end of Group composed VIEWS
                        
                    }
                    .scrollContentBackground(.hidden)
                    .navigationTitle("Components Catalog")
                    .foregroundColor(.white)
                    // end of LIST

                }
            
                
        }
        // end of navigationview
    }
}


// MARK: - preview

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .preferredColorScheme(.dark)
        }
        
    }
}


