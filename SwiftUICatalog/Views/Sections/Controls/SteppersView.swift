//
//  SteppersView.swift
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
/// Examples on how to use STEPPERs in SwiftUI
/// OFFICIAL DOCUMENTATION https://developer.apple.com/documentation/swiftui/stepper
///
struct SteppersView: View, Comparable {
    
    //MARK: - Variables
    
    let id: String = "SteppersView"
    
    @State private var firstStepperValue = 0
    @State private var SecondStepperValue = 0

    private let colors: [Color] = [.orange, .red, .gray, .blue,
                                   .green, .purple, .pink]
    // Step Size
    private let step = 5
    // Total range
    private let range = 1...50
    
    //MARK: - Functions
    
    /// Increment 1 Step
    private func incrementStep() {
        firstStepperValue += 1
        if firstStepperValue >= colors.count { firstStepperValue = 0 }
    }
    
    /// Decrement 1 step
    private func decrementStep() {
        firstStepperValue -= 1
        if firstStepperValue < 0 { firstStepperValue = colors.count - 1 }
    }
    
    var body: some View {
        
        PageContainer(content:

        ScrollView {

            DocumentationLinkView(link: "https://developer.apple.com/documentation/swiftui/stepper", name: "STEPPER")
            plainStepper
            Divider()
            customStepper
            Divider()

            ContributedByView(name: "Ali Ghayeni H",
                              link: "https://github.com/alighayeni")
                .padding(.top, 80)

        })
        .padding(.vertical, Style.VerticalPadding.medium.rawValue)
        .padding(.horizontal, Style.HorizontalPadding.medium.rawValue)
        // end of page container
        
    }

    private var customStepper: some View {
        VStack(alignment: .leading) {
            Text("Stepper View + custom step")
                .fontWeight(.heavy)
            Text("The following example shows a stepper that displays the effect of incrementing or decrementing a value with the step size of step with the bounds defined by range:")
                .fontWeight(.light)
            Stepper(value: $SecondStepperValue,
                    in: range,
                    step: step) {
                Text("Current: \(SecondStepperValue) in \(range.description) " +
                     "stepping by \(step)")
            }
                    .padding(10)
        }

    }

    private var plainStepper: some View {
        VStack(alignment: .leading) {
            Text("Stepper View")
                .fontWeight(.heavy)
            Text("Use a stepper control when you want the user to have granular control while incrementing or decrementing a value. ")
                .fontWeight(.light)
            Stepper("Position: \(firstStepperValue) \nColor: \(colors[firstStepperValue].description)"
                    , onIncrement: {
                incrementStep()
            }, onDecrement: {
                decrementStep()
            })
        }

    }
}

struct SteppersView_Previews: PreviewProvider {
    static var previews: some View {
        SteppersView()
    }
}

// MARK: - HASHABLE

extension SteppersView {
    
    static func == (lhs: SteppersView, rhs: SteppersView) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }


}


