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
    
    @State private var showAlertWithCustomAction = false
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
            
            DocumentationLinkView(link: "https://developer.apple.com/documentation/swiftui/view/alert(_:ispresented:actions:)", name: "ALERT")
            
            simpleAlert
                .modifier(Divided())
            customActionsAlert
                .modifier(Divided())
            advanceAlerts
                .modifier(Divided())
            
            
            .alert("Simple alert", isPresented: $showSimpleAlert, actions: {})
            .alert("Alert with message", isPresented: $showAlertWithMessage, actions: {}, message: {Text("Alert's message.")})
            
            
            .alert(isPresented: $showAlertWithErrorMessage, error: error, actions: { _ in }, message: { error in
                Text(error.failureReason ?? "")
            })
            
            .alert("Value reached to maximum!", isPresented: $showAlertWithItem, presenting: $stepperValue, actions: { _ in
                Button("OK") {
                    stepperValue = 0
                }
            }, message: { value in
                Text("Stepper value has become \(value.wrappedValue).")
            })
            
            .alert("Alert with two actions", isPresented: $showAlertWithTwoActions, actions: {
                
                Button("Save") {}
                Button("Delete") {}
            })
            .alert("Alert with multiple actions", isPresented: $showAlertWithMoreThanTwoActions, actions: {
                
                Button("Option 1") {}
                Button("Option 2") {}
                Button("Option 3") {}
            })
            .alert("Alert with different roles actions", isPresented: $showAlertWithActionRoles, actions: {
                
                Button("Default") {}
                Button("Destructive", role: .destructive) {}
                Button("Cancel", role: .cancel) {}
            })
            .alert("Alert with custom actions", isPresented: $showAlertWithCustomAction, actions: {
                
                Button("Custom text") {}
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
                Text("""
Alerts are used when you want the user to act in response to the state of the app or system. They can have a title, a message, and multiple actions.
For presenting the most simple alert, the only required parameter is a title. The message can be empty, and SwiftUI will automatically add an OK action button for you if you don't specify any actions.
""")
                    .fontWeight(.light)
                    .font(.title2)
                
                Button(action: {
                    showSimpleAlert = true
                },
                       label: {
                    Text("Show simple alert")
                })
                .modifier(Divided())
                    
                Text("It's possible to attach a custom message to the alert, and it will be rendered under the title. The message can only be a SwiftUI Text, and any text styling will be ignored.")
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
    
    private var advanceAlerts: some View {
        GroupBox {
            VStack(alignment: .leading) {
                Text("Alerts from errors")
                    .fontWeight(.heavy)
                    .font(.title)
                
                Text("""
                Localizable errors can be used to create alerts. The alert title will be the error's errorDescription, and the error can also be used to create the alert's message and actions.
                Consider this localizable error;
                """)
                    .fontWeight(.light)
                    .font(.title2)
                
                Text("""
                    CustomError
                    errorDescription: "Custom Error"
                    failureReason: "Something went wrong."
                    """
)
                    .padding(5)
                
                Button(action: {
                    error = CustomError(errorDescription: "Custom Error", failureReason: "Something went wrong.")
                    showAlertWithErrorMessage = true
                },
                       label: {
                    Text("Show alert from this error")
                })
                .modifier(Divided())
                
                Text("Alerts with associated values")
                    .fontWeight(.heavy)
                    .font(.title)
                
                Text("""
Alerts can be presented with a given data.
Here, for example, if we reach to 5 with the stepper an alert will be presented. The value of the stepper can be used in configuring the alert's message and actions.
""")
                    .fontWeight(.light)
                    .font(.title2)
                
                Stepper("\(stepperValue) / 5", value: $stepperValue, onEditingChanged: {_ in
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
                Text("Alerts with custom actions")
                    .fontWeight(.heavy)
                    .font(.title)
                Text("We can replace the alert's default OK action with different custom buttons.")
                    .fontWeight(.light)
                    .font(.title2)
                
                Button(action: {
                    showAlertWithCustomAction = true
                },
                       label: {
                    Text("Show alert with custom action")
                })
                
                Text("If two actions are provided, they will be rendered horizontally side by side.")
                    .fontWeight(.light)
                    .font(.title2)
                
                Button(action: {
                    showAlertWithTwoActions = true
                },
                       label: {
                    Text("Show alert with two buttons side by side")
                })
                
                Text("If more than two actions are provided, they will be rendered vertically.")
                    .fontWeight(.light)
                    .font(.title2)
                
                Button(action: {
                    showAlertWithMoreThanTwoActions = true
                },
                       label: {
                    Text("Show alert with more than two buttons")
                })
                
                Text("Actions can also have different roles. In addition to the default role, we can assign them to be destructive or cancel.")
                    .fontWeight(.light)
                    .font(.title2)
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
        let failureReason: String?
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


