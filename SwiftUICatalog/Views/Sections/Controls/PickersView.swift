//
//  PickersView.swift
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
//

import SwiftUI

///
/// Examples on how to use PICKERS in SwiftUI
/// OFFICIAL DOCUMENTATION https://developer.apple.com/documentation/swiftui/picker
///
struct PickersView: View {
    
    @State private var selectedFlavor = Flavor.strawberry
    @State private var selectedTopping = Topping.nuts
    @State var suggestedTopping: Topping = .cookies
    
    var body: some View {
        ScrollView{
            Group {
                VStack{
                    Text("Pickers in SwiftUI").fontWeight(.heavy)
                    Text("You create a picker by providing a selection binding, a label, and the content for the picker to display. Set the selection parameter to a bound property that provides the value to display as the current selection. Set the label to a view that visually describes the purpose of selecting content in the picker, and then provide the content for the picker to display.")
                        .fontWeight(.light)
                        .padding()
                    Spacer()
                    Text("Selected flavor: \(selectedFlavor.rawValue)")
                    Picker("Flavor", selection: $selectedFlavor) {
                        Text("Chocolate").tag(Flavor.chocolate)
                        Text("Vanilla").tag(Flavor.vanilla)
                        Text("Strawberry").tag(Flavor.strawberry)
                        Label("Star Falavor",
                              systemImage: "staroflife.fill")
                            .font(.subheadline)
                            .tag(Flavor.star)
                    }
                    .background(Color.yellow)
                }
            }
            Group {
                VStack{
                    Text("Iterating Over a Picker’s Options").fontWeight(.heavy)
                    Text("Choose your flavor and check the suggested topping options.")
                        .fontWeight(.light)
                        .padding()
                    Text("suggestedTopping: \(suggestedTopping.rawValue)")
                    /**
                     To provide selection values for the Picker without explicitly listing each option, you can create the picker with a ForEach construct, like this:
                     
                     Picker("Flavor", selection: $selectedFlavor) {
                         ForEach(Flavor.allCases) { flavor in
                             Text(flavor.rawValue.capitalized)
                         }
                     }
                     
                     In this case, ForEach automatically assigns a tag to the selection views, using each option’s id, which it can do because Flavor conforms to the Identifiable protocol.

                     On the other hand, if the selection type doesn’t match the input to the ForEach, you need to provide an explicit tag. The following example shows a picker that’s bound to a Topping type, even though the options are all Flavor instances. Each option uses tag(_:) to associate a topping with the flavor it displays.
                     */
                    Picker("Suggest a topping for:", selection: $suggestedTopping) {
                        ForEach(Flavor.allCases) { flavor in
                            Text(flavor.rawValue.capitalized)
                                .tag(flavor.suggestedTopping)
                        }
                    }
                    .background(Color.green)
                }
            }
            Group {
                VStack{
                    Text("Styling Pickers").fontWeight(.heavy)
                    Text("You can customize the appearance and interaction of pickers by creating styles that conform to the PickerStyle protocol. You create your own style or use one of the styles provided by SwiftUI, like segmented or menu.")
                        .fontWeight(.light)
                        .padding()
                    VStack {
                        Text("Selected flavor: \(selectedFlavor.rawValue)")
                        Text("Selected topping: \(selectedTopping.rawValue)")
                        Picker(selection: $selectedFlavor, label: Text("Flavor")) {
                            ForEach(Flavor.allCases, id: \.self) {
                                Text($0.rawValue.capitalized)
                            }
                        }
                        Picker(selection: $selectedTopping, label: Text("Topping")) {
                            ForEach(Topping.allCases, id: \.self) {
                                Text($0.rawValue.capitalized)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        Spacer()
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
            }
        }
    }
}

enum Flavor: String, CaseIterable, Identifiable {
    case chocolate
    case vanilla
    case strawberry
    case star
    var id: String { self.rawValue }
}

enum Topping: String, CaseIterable, Identifiable {
    case nuts
    case cookies
    case blueberries
    case other
    var id: String { self.rawValue }
}

extension Flavor {
    var suggestedTopping: Topping {
        switch self {
        case .chocolate: return .nuts
        case .vanilla: return .cookies
        case .strawberry: return .blueberries
        case .star: return .other
        }
    }
}

struct PickersView_Previews: PreviewProvider {
    static var previews: some View {
        PickersView()
    }
}
