//
//  MenusComponentView.swift
//  SwiftUICatalog
//
// MIT License
//
// Copyright (c) 2021 Ali Ghayeni H
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
/// Samples on how to create menus in SwiftUI
/// OFFICIAL DOCUMENTATION https://developer.apple.com/documentation/swiftui/menu
///
struct MenusComponentView: View {
    
    //Custom Menu item Style
    private let redBorderMenuStyle: RedBorderMenuStyle = RedBorderMenuStyle.init()
    
    var body: some View {
        ScrollView{
            Group {
                HeaderView(title: "Menus")
                Text("A control for presenting a menu of actions.")
                    .fontWeight(.regular)
                HStack {
                    Text("Menu + Sub-Menu").fontWeight(.light)
                    Spacer()
                    Menu("Menu") {
                        Button("Duplicate", action: duplicate)
                        Button("Rename", action: rename)
                        Button("Delete…", action: delete)
                        Menu("+ Copy") {
                            Button("Copy", action: copy)
                            Button("Copy Formatted", action: copyFormatted)
                            Button("Copy Library Path", action: copyPath)
                        }
                    }
                }
                
            }
            .padding()
            
            Spacer()
            Group {
                HStack{
                    Text("Menu + image").fontWeight(.light)
                    Spacer()
                    Menu {
                        Button("Open in Preview", action: action)
                        Button("Save as PDF", action: action)
                    } label: {
                        Label("PDF", systemImage: "doc.fill")
                    }
                }
            }
            .padding()
            
            Spacer()
            /*
             Styling Menus
             Use the menuStyle(_:) modifier to change the style of all menus in a view.
             */
            Group {
                HStack {
                    Text("Styling Menus + action").fontWeight(.light)
                    Spacer()
                    Menu("Editing") {
                        Button("Set In Point", action: setInPoint)
                        Button("Set Out Point", action: setOutPoint)
                    }
                    .menuStyle(redBorderMenuStyle)
                }
                
            }
            .padding()
            
            Spacer()
            Text("** in case you are running the code on iOS 15 or above, please uncomment the codes and take a look at Primary Action Menus")
                .fontWeight(.medium)
                .padding()
            
            /* available only on iOS version 15 or above */
            /*
                 Group {
                    VStack{
                        HeaderView(title: "Primary Action")
                        Text("Menus can be created with a custom primary action. The primary action will be performed when the user taps or clicks on the body of the control, and the menu presentation will happen on a secondary gesture, such as on long press or on click of the menu indicator. The following example creates a menu that adds bookmarks, with advanced options that are presented in a menu.").fontWeight(.light)
                        HStack {
                            Text("Menu + primary action").fontWeight(.light)
                            Spacer()
                            Menu {
                                Button(action: addCurrentTabToReadingList) {
                                    Label("Add to Reading List", systemImage: "eyeglasses")
                                }
                                Button(action: bookmarkAll) {
                                    Label("Add Bookmarks for All Tabs", systemImage: "book")
                                }
                                Button(action: show) {
                                    Label("Show All Bookmarks", systemImage: "books.vertical")
                                }
                            } label: {
                                Label("Add Bookmark", systemImage: "book")
                            } primaryAction: {
                                primaryAction()
                            }
                        }
                    }
                }
                .padding()
            */
            
        }
    }
    
    func duplicate() { action() }
    func rename() { action() }
    func delete() { action() }
    func copy() { action() }
    func copyFormatted() { action() }
    func copyPath() { action() }
    func setInPoint() { action() }
    func setOutPoint() { action() }
    func addCurrentTabToReadingList() { action() }
    func bookmarkAll() { action() }
    func show() { action() }
    func addBookmark() { action() }

    func action() {
        #if DEBUG
        print("The Action function called")
        #endif
    }

    func primaryAction() {
        #if DEBUG
        print("The primary action function called")
        #endif
    }
}

/*
 https://developer.apple.com/documentation/swiftui/menustyleconfiguration
 Overview
 Use the init(_:) initializer of Menu to create an instance using the current menu style, which you can modify to create a custom style.
 For example, the following code creates a new, custom style that adds a red border to the current menu style:
 */
struct RedBorderMenuStyle: MenuStyle {
    func makeBody(configuration: Configuration) -> some View {
        Menu(configuration)
            .border(Color.red)
    }
}

struct MenusComponentView_Previews: PreviewProvider {
    static var previews: some View {
        MenusComponentView()
    }
}
