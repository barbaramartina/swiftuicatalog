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

struct ContentView: View {
    
    // MARK: - Body
    
    var body: some View {
        
        NavigationView {
            
            List {
                Text("A catalog of components, controls, effects, styles and accessibility elements you can use to develop SwiftUI Interfaces in iOS and iPadOS.")
                    .font(.footnote)
                    .fontWeight(.light)
                    .padding(.bottom, 30)
                
                HStack {
                    Spacer()
                    VStack {
                        Image("corgie-love")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 200, height: 200)
                            .overlay(Color.gray.opacity(0.2))
                            .clipShape(Circle())
                        Text("Robbi, the corgie, is happy with your contributions to the SwiftUI Catalog")
                            .font(.footnote)
                            .fontWeight(.ultraLight)
                    }
                    Spacer()
                }
                .padding(.top, 16)
                .padding(.bottom, 16)
                // end of Hstack
                
                Group {
                    // MARK: - CONTROLS
                    
                    Section(header: Text("Controls")
                                .font(.title)
                                .fontWeight(.black)
                                .foregroundColor(.accentColor)
                                .padding(.top, 16)
                                .padding(.bottom, 16)) {
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
                            Link(destination: TogglesView(),
                                 label: "Toggles")
                            Link(destination: SlidersView(),
                                 label: "Sliders")
                            
                        }
                        Group {
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
                    
                    
                    // MARK: - LAYOUTS
                    
                    Section(header: Text("Layouts")
                                .font(.title)
                                .fontWeight(.black)
                                .foregroundColor(.accentColor)
                                .padding(.top, 16)
                                .padding(.bottom, 16)) {
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
                        Link(destination: TablesView(),
                             label: "Tables")
                    }
                    // end of Group View Layouts
                    
                    // MARK: - navigation
                    
                    Section(header: Text("Hierachical Views")
                                .font(.title)
                                .fontWeight(.black)
                                .foregroundColor(.accentColor)
                                .padding(.top, 16)
                                .padding(.bottom, 16)) {
                        Link(destination: NavigationBarsComponentView(),
                             label: "Navigation")
                        Link(destination: OutlinesGroupsView(),
                             label: "Outlines")
                        Link(destination: DisclosureGroupsView(),
                             label: "Disclosures")
                        Link(destination: TabsView(),
                             label: "Tabs")
                    }
                    // end of Group Navigation View
                    
                    // MARK: - DRAWING AND ANIMATIONS
                    
                    Section(header: Text("Drawing and animations")
                                .font(.title)
                                .fontWeight(.black)
                                .foregroundColor(.accentColor)
                                .padding(.top, 16)
                                .padding(.bottom, 16)) {
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
                    
                    // MARK: - GESTURES
                    
                    Section(header: Text("Gestures")
                                .font(.title)
                                .fontWeight(.black)
                                .foregroundColor(.accentColor)
                                .padding(.top, 16)
                                .padding(.bottom, 16)) {
                        Link(destination: GesturesView(),
                             label: "Gestures")
                        Link(destination: ComposingGesturesView(),
                             label: "Composing Gestures")
                        
                    }
                    
                }
                
                // MARK: - VIEW MODIFIERS
                
                Section(header: Text("View modifiers")
                            .font(.title)
                            .fontWeight(.black)
                            .foregroundColor(.accentColor)
                            .padding(.top, 16)
                            .padding(.bottom, 16)) {
                    Link(destination: CustomModifiersView(),
                         label: "Custom view modifiers")
                    Link(destination: TextModifiersView(),
                         label: "Text modifiers")
                    Link(destination: EffectsModifiersView(),
                         label: "Effect modifiers")
                    Link(destination: LayoutModifiersView(),
                         label: "Layout modifiers")
                    
                }
                // end of Group view modifiers
                
                // MARK: - ACCESSIBILITY
                
                Section(header: Text("Accesibility")
                            .font(.title)
                            .fontWeight(.black)
                            .foregroundColor(.accentColor)
                            .padding(.top, 16)
                            .padding(.bottom, 16)) {
                    
                    Link(destination: AccesibilityView(),
                         label: "Accesibility")
                    
                }
                // end of group accesibility
                
                // MARK: - status and tool bars
                
                Section(header: Text("Status and tool bars")
                            .font(.title)
                            .fontWeight(.black)
                            .foregroundColor(.accentColor)
                            .padding(.top, 16)
                            .padding(.bottom, 16)) {
                    Link(destination: StatusBarsComponentView(),
                         label: "Status Bars")
                    Link(destination: ToolbarsComponentView(),
                         label: "Tool Bars")
                    
                }
                // end of group Bars
                
                // MARK: - STYLES ON VIEWS
                
                Section(header: Text("Styling")
                            .font(.title)
                            .fontWeight(.black)
                            .foregroundColor(.accentColor)
                            .padding(.top, 16)
                            .padding(.bottom, 16)) {
                    
                    Link(destination: StylesView(),
                         label: "Styles")
                }
                // end of Group Styles
                
                // MARK: - ADDITIONAL VIEWS
                
                Section(header: Text("Popovers, alerts and sheets")
                            .font(.title)
                            .fontWeight(.black)
                            .foregroundColor(.accentColor)
                            .padding(.top, 16)
                            .padding(.bottom, 16)) {
                    
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
                // end of Group ADDITIONAL VIEWS
                
                
                
            }
            .navigationTitle("Components Catalog")
            .padding(.top, 24)
            // end of LIST
        }
        // end of navigationview
    }
}


// MARK: - preview

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
        
    }
}
