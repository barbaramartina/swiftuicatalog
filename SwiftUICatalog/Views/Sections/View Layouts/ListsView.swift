//
//  ListsComponentView.swift
//  SwiftUICatalog
//
//  Created by Barbara Rodeker on 12.07.21.
//

import SwiftUI

///
/// A view showing different usages
/// of the SwiftUI View Layout Component LIST
/// OFFICIAL DOCUMENTATION https://developer.apple.com/documentation/swiftui/list
///
/// With examples of usage of SECTION (A container view that you can use to add hierarchy to some collection views)
/// OFFICIAL DOCUMENTATION https://developer.apple.com/documentation/swiftui/section
///
/// And FOREACH, to compute views on iterations
/// OFFICIAL DOCUMENTATION https://developer.apple.com/documentation/swiftui/foreach
///
struct ListsComponentView: View, Comparable {
    
    // MARK: - Properties
    
    let id: String = "ListsComponentView"
    
    @State private var multiSelection = Set<UUID>()
    
    private let countries: [Country]  = [
        Country(name: "Germany",
                dogs: [Dog(name: "Shepherd",
                           image: "shepherd"),
                       Dog(name: "Schnautzer",
                           image: "schnautzer")]),
        Country(name: "Spain",
                dogs: [Dog(name: "Cocker",
                           image: "cocker")]),
        Country(name: "UK",
                dogs: [Dog(name: "Labrador",
                           image: "labrador")]),
        Country(name: "Russia",
                dogs: [Dog(name: "Husky",
                           image: "husky")])
    ]
    @State private var singleSelection : UUID?
    
    var body: some View {
        
        ScrollView {
            documentationView
            
            Text("A list is a container with data rows organized in a single column and an optional selection field for one or more members. \nThe first example shows a list with sections, each section font weight and color have been customized. The style of this list is 'PlainListStyle'.")
                .fontWeight(.light)
            
            list1
                .modifier(Divided())
            list2
                .modifier(Divided())
            list3
                .modifier(Divided())
            list4
            
            ContributedByView(name: "Barbara Martina",
                              link: "https://github.com/barbaramartina")
            .padding(.top, 80)
        }
        .alignmentGuide(.leading, computeValue: { dimension in
            0
        })
        .padding(.horizontal, Style.HorizontalPadding.medium.rawValue)
        
    }
    
    private var list1: some View {
        GroupBox {
            List(selection: $singleSelection){
                ForEach(countries) { c in
                    Section(header: Text("\(c.name)")
                        .fontWeight(.thin)
                        .foregroundColor(.black)
                    ) {
                        ForEach(c.dogs) { d in
                            HStack(alignment: .center) {
                                Image(d.image)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 50, height: 50)
                                    .clipped()
                                    .clipShape(Circle())
                                Text(d.name)
                                    .font(.subheadline)
                                    .fontWeight(.heavy)
                                    .foregroundColor(.accentColor)
                            }
                        }
                        .onDelete(perform: { indexSet in
                            // action
                        })
                        .onMove(perform: { indices, newOffset in
                            // action
                        })
                        // end of for each
                    }
                }
                
                
            }
            .frame(height: 300)
            .listStyle(PlainListStyle())
        .toolbar { EditButton() }
        }
        // end of list 1
        
    }
    
    private var list2: some View {
        GroupBox {
            VStack(alignment: .leading) {
                Text("This second example is using the style 'GroupedListStyle'.")
                    .fontWeight(.light)
                
                List(selection: $singleSelection){
                    ForEach(countries) { c in
                        Section(header: Text("\(c.name)")
                            .fontWeight(.thin)
                            .foregroundColor(.black)
                        ) {
                            ForEach(c.dogs) { d in
                                HStack(alignment: .center) {
                                    Image(d.image)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 50, height: 50)
                                        .clipped()
                                        .clipShape(Circle())
                                    Text(d.name)
                                        .font(.subheadline)
                                        .fontWeight(.heavy)
                                        .foregroundColor(.accentColor)
                                }
                            }
                            .onDelete(perform: { indexSet in
                                // action
                            })
                            .onMove(perform: { indices, newOffset in
                                // action
                            })
                            // end of for each
                        }
                    }
                    
                    
                }
                .frame(height: 300)
                .listStyle(GroupedListStyle())
                // end of list 2
                
            }
        }
    }
    
    private var list3: some View {
        GroupBox {
            VStack(alignment: .leading) {
                Text("This next example is using the style 'InsetListStyle'.")
                    .fontWeight(.light)
                
                List(selection: $singleSelection){
                    ForEach(countries) { c in
                        Section(header: Text("\(c.name)")
                            .fontWeight(.thin)
                            .foregroundColor(.black)
                        ) {
                            ForEach(c.dogs) { d in
                                HStack(alignment: .center) {
                                    Image(d.image)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 50, height: 50)
                                        .clipped()
                                        .clipShape(Circle())
                                    Text(d.name)
                                        .font(.subheadline)
                                        .fontWeight(.heavy)
                                        .foregroundColor(.accentColor)
                                }
                            }
                            .onDelete(perform: { indexSet in
                                // action
                            })
                            .onMove(perform: { indices, newOffset in
                                // action
                            })
                            // end of for each
                        }
                    }
                    
                    
                }
                .frame(height: 300)
                .listStyle(InsetListStyle())
                // end of list 3
                
            }
        }
    }
    
    private var list4: some View {
        GroupBox {
            VStack(alignment: .leading) {
                Text("This next example is using the style 'InsetGroupedListStyle'.")
                    .fontWeight(.light)
                
                List(selection: $singleSelection){
                    ForEach(countries) { c in
                        Section(header: Text("\(c.name)")
                            .fontWeight(.thin)
                            .foregroundColor(.black)
                        ) {
                            ForEach(c.dogs) { d in
                                HStack(alignment: .center) {
                                    Image(d.image)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 50, height: 50)
                                        .clipped()
                                        .clipShape(Circle())
                                    Text(d.name)
                                        .font(.subheadline)
                                        .fontWeight(.heavy)
                                        .foregroundColor(.accentColor)
                                }
                            }
                            .onDelete(perform: { indexSet in
                                // action
                            })
                            .onMove(perform: { indices, newOffset in
                                // action
                            })
                            // end of for each
                        }
                    }
                    
                    
                }
                .frame(height: 300)
                .listStyle(InsetGroupedListStyle())
                // end of list 3
                
            }
        }
    }
    
    private var documentationView: some View {
        DocumentationLinkView(link: "https://developer.apple.com/documentation/swiftui/list", name: "LISTS")
    }
    
}

struct ListsComponentView_Previews: PreviewProvider {
    static var previews: some View {
        ListsComponentView()
    }
}

struct DogQuality: Hashable, Identifiable {
    let name: String
    let id = UUID()
}
struct Country: Identifiable {
    let id = UUID()
    let name: String
    let dogs: [Dog]
}

struct Dog: Identifiable {
    let name: String
    let image: String
    let id = UUID()
}

// MARK: - HASHABLE

extension ListsComponentView {
    
    static func == (lhs: ListsComponentView, rhs: ListsComponentView) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    
}


