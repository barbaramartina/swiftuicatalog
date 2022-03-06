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
struct ListsComponentView: View {
    
    // MARK: - Properties
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
        
        List(selection: $singleSelection){
             
            DocumentationLinkView(link: "https://developer.apple.com/documentation/swiftui/list")

            // contextual information
            Group {
                Text("An example of a list with sections")
                    .fontWeight(.heavy)
                Text("Here we show an example of how a list can be configured based of the data coming from a double entry structure (countries and dog's breeds)")
                    .fontWeight(.light)
            }
            .padding()
            
            ForEach(countries) { c in
                Section(header: Text("\(c.name)")
                            .font(.title)
                            .fontWeight(.thin)
                            .foregroundColor(.white)
                ) {
                    ForEach(c.dogs) { d in
                        ZStack {
                            Color.white
                            VStack(alignment: .center) {
                                Text(d.name)
                                    .font(.subheadline)
                                    .fontWeight(.black)
                                    .foregroundColor(.accentColor)
                                Image(d.image)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 200, height: 200)
                                    .clipped()
                                    .clipShape(Circle())
                                    .padding(5)
                            }
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
            
            ContributedByView(name: "Barbara Martina",
                              link: "https://github.com/barbaramartina")
                .padding(.top, 80)

        }
        .listStyle(PlainListStyle())
        .navigationTitle("Dogs 🐶 & countries")
        .toolbar { EditButton() }
        // end of list
        
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
