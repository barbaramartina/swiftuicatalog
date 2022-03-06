//
//  DatePickersView.swift
//  SwiftUICatalog
//
// MIT License
//
// Copyright (c) 2021 Barbara Martina Rodeker
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
/// Examples on how to use DATE PICKERS in SwiftUI
/// OFFICIAL DOCUMENTATION https://developer.apple.com/documentation/swiftui/datepicker
///
struct DatePickersView: View {
    
    // MARK: - properties
    
    @State private var date1 = Date()
    @State private var date2 = Date()
    @State private var date3 = Date()
    @State private var date4 = Date()
    @State private var date5 = Date()

    let dateRange: ClosedRange<Date> = {
        let calendar = Calendar.current
        let startComponents = DateComponents(year: 2021, month: 1, day: 1)
        let endComponents = DateComponents(year: 2021, month: 12, day: 31, hour: 23, minute: 59, second: 59)
        return calendar.date(from:startComponents)!
            ...
            calendar.date(from:endComponents)!
    }()

    // MARK: - body

    var body: some View {
        
        ScrollView {
            
            HStack {
                Spacer()
                DocumentationLinkView(link: "https://developer.apple.com/documentation/swiftui/datepicker")
            }
            .padding(.trailing)
            
            // MARK: - date picker no range limit
            Group {
                
                Group {
                    Text( "No range limit")
                        .fontWeight(.heavy)
                    Text("By default date pickers do not have a limitation in the minimum or maximum day you can pick")
                        .fontWeight(.light)
                }
                .padding()
                
                DatePicker(
                    "Start Date 1",
                    selection: $date1,
                    displayedComponents: [.date]
                )
                .padding()
                .onChange(of: "Value", perform: { value in
                    print("value selected \(value)")
                })
            }
            
            // MARK: - date picker with range limit
            
            Group {
                Group {
                    Text("Range limit")
                        .fontWeight(.heavy)
                    Text("Ranges can be configured using the in: parameter")
                        .fontWeight(.light)
                }
                .padding()
                
                DatePicker(
                    "Start Date 2",
                     selection: $date2,
                     in: dateRange,
                     displayedComponents: [.date, .hourAndMinute]
                )
                .padding()
            }
            
            // MARK: - date pickers wheels
            
            Group {
                Group {
                    Text( "Style wheels")
                        .fontWeight(.heavy)
                    Text("The date picker can adopt different style, here we show the WHEELS style")
                        .fontWeight(.light)
                }
                .padding()
                
                DatePicker(
                    "Start Date 3",
                    selection: $date3,
                    displayedComponents: [.date]
                )
                .datePickerStyle(WheelDatePickerStyle())
                .padding()
            }
            
            // MARK: - date pickers compact
            Group {
                Group {
                    Text("Style compact")
                        .fontWeight(.heavy)
                    Text("Compact styles make the date picker appear in one line, from which it is expanded")
                        .fontWeight(.light)
                }
                .padding()
                
                DatePicker(
                    "Start Date 4",
                    selection: $date4,
                    displayedComponents: [.date]
                )
                .datePickerStyle(CompactDatePickerStyle())
                .padding()
            }
            
            // MARK: - date pickers graphical
            
            Group {
                
                Group {
                    Text("Style graphical")
                        .fontWeight(.heavy)
                    Text("The graphical style renders a calendar component inline. Watch out for the minimum recommended height.")
                        .fontWeight(.light)
                }
                .padding()
                
                DatePicker(
                    "Start Date 4",
                    selection: $date4,
                    displayedComponents: [.date]
                )
                .datePickerStyle(GraphicalDatePickerStyle())
                .padding()
            }
            
            ContributedByView(name: "Barbara Martina",
                              link: "https://github.com/barbaramartina")
                .padding(.top, 80)


        }
        .padding(.leading, 16)
        .padding(.trailing, 16)

    }
}

// MARK: - preview

struct DatePickersView_Previews: PreviewProvider {
    static var previews: some View {
        DatePickersView()
    }
}
