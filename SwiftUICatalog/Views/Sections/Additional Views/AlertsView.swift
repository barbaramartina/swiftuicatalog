//
//  AlertsComponentView.swift
//  SwiftUICatalog
//
// MIT License
//
// Copyright (c) 2021 { Shayan B }
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

struct AlertsComponentView: View, Comparable {
    
    let id: String = "AlertsComponentView"
    @State private var showSimpleAlert = false
    @State private var showAlertWithMessage = false
    
    @State private var showAlertWithTwoActions = false
    @State private var showAlertWithMoreThanTwoActions = false
    @State private var showAlertWithActionRoles = false
    
    @State private var showAlertWithErrorMessage = false
    @State private var showAlertWithItem = false
    
    @State private var error: CustomError?
    @State private var stepperValue: Int = 0
    
    var body: some View {
        
        PageContainer(content:
                        VStack {
            
            DocumentationLinkView(link: "https://developer.apple.com/documentation/swiftui/view/alert", name: "ALERT")
            simpleAlert
                .modifier(Divided())
            customActionsAlert
                .modifier(Divided())
            alertFromError
                .modifier(Divided())
            
            
            .alert("Simple Alert", isPresented: $showSimpleAlert, actions: {})
            .alert("Alert with message", isPresented: $showAlertWithMessage, actions: {}, message: {Text("Alert message")})
            
            
            .alert(isPresented: $showAlertWithErrorMessage, error: error, actions: { _ in }, message: { error in
                Text(error.errorDetailDescription ?? "")
            })
            
            .alert("Value reached to maximum", isPresented: $showAlertWithItem, presenting: $stepperValue, actions: { _ in
                Button("Ok") {
                    stepperValue = 0
                }
            }, message: { value in
                Text("stepper value has become \(value.wrappedValue)")
            })
            
            .alert("Alert with custom Actions", isPresented: $showAlertWithTwoActions, actions: {
                
                Button("Save") {}
                Button("Delete") {}
            })
            .alert("Alert with custom Actions", isPresented: $showAlertWithMoreThanTwoActions, actions: {
                
                Button("Option 1") {}
                Button("Option 2") {}
                Button("Option 3") {}
            })
            .alert("Alert with custom Actions", isPresented: $showAlertWithActionRoles, actions: {
                
                Button("Save") {}
                Button("Delete", role: .destructive) {}
                Button("Cancel", role: .cancel) {}
            })
            
            ContributedByView(name: "Shayan B",
                              link: "https://github.com/shaysugg")
            .padding(.top, 80)
            
        }
        )
        // end of page container
        
    }
    
    private var simpleAlert: some View {
        GroupBox {
            VStack(alignment: .leading) {
                Text("Simple alerts")
                    .fontWeight(.heavy)
                    .font(.title)
                Text("TODO")
                    .fontWeight(.light)
                    .font(.title2)
                
                Button(action: {
                    showSimpleAlert = true
                },
                       label: {
                    Text("Show simple alert")
                })
                .modifier(Divided())
                    
                Text("TODO")
                    .fontWeight(.light)
                    .font(.title2)
                
                Button(action: {
                    showAlertWithMessage = true
                },
                       label: {
                    Text("Show alert with custom message")
                })
                
            }
        }
    }
    
    private var alertFromError: some View {
        GroupBox {
            VStack(alignment: .leading) {
                Text("Alert with Items")
                    .fontWeight(.heavy)
                    .font(.title)
                
                Text("Todo")
                    .fontWeight(.light)
                    .font(.title2)
                
                Button(action: {
                    error = CustomError(errorDescription: "Custom Error", errorDetailDescription: "Something went wrong.")
                    showAlertWithErrorMessage = true
                },
                       label: {
                    Text("Show alert with error message")
                })
                .modifier(Divided())
                
                Text("TODO")
                    .fontWeight(.light)
                    .font(.title2)
                
                Stepper("\(stepperValue)", value: $stepperValue, onEditingChanged: {_ in
                    if stepperValue == 5 {
                        showAlertWithItem = true
                    }
                })
                
            }
        }
    }
    
    private var customActionsAlert: some View {
        GroupBox {
            VStack(alignment: .leading) {
                Text("Alert with custom actions")
                    .fontWeight(.heavy)
                    .font(.title)
                Text("TODO")
                    .fontWeight(.light)
                    .font(.title2)
                
                Button(action: {
                    showAlertWithTwoActions = true
                },
                       label: {
                    Text("Show alert with two buttons side by side")
                })
                
                Button(action: {
                    showAlertWithMoreThanTwoActions = true
                },
                       label: {
                    Text("Show alert with more than two buttons")
                })
                
                Button(action: {
                    showAlertWithActionRoles = true
                },
                       label: {
                    Text("Show alert with different button roles")
                })
            }
        }
    }
    
    private struct CustomError: LocalizedError {
        let errorDescription: String?
        let errorDetailDescription: String?
    }
}

#Preview {
    
        AlertsComponentView()
    
}

// MARK: - HASHABLE

extension AlertsComponentView {
    
    static func == (lhs: AlertsComponentView, rhs: AlertsComponentView) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    
}


