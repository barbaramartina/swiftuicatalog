//
//  ChartsViews.swift
//  SwiftUICatalog
//
//  Created by Barbara Rodeker on 2023-02-05.
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
import Charts

struct ChartsViews: View {

    private struct Fruits: Identifiable {
        var type: String
        var color: String
        var count: Double
        var id = UUID()
        var unitCost: Double
    }

    private var fruits: [Fruits] = [
        .init(type: "Grapes", color: "Pink", count: 4, unitCost: 10.67),
        .init(type: "Bananas", color: "Green", count: 5, unitCost: 2.87),
        .init(type: "Oranges", color: "Yellow", count: 49, unitCost: 8.67)
    ]

    var body: some View {
        ScrollView {

            DocumentationLinkView(link: "https://developer.apple.com/documentation/charts/creating-a-chart-using-swift-charts")

            if #available(iOS 16.0, *) {

                // BAR CHART
                Chart {
                    BarMark(
                        x: .value("Fruit", fruits[0].type),
                        y: .value("Total Count", fruits[0].count)
                    )
                    .foregroundStyle(by: .value("Color", fruits[0].color))
                    BarMark(
                        x: .value("Fruit", fruits[1].type),
                        y: .value("Total Count", fruits[1].count)
                    )
                    .foregroundStyle(by: .value("Color", fruits[1].color))
                    BarMark(
                        x: .value("Fruit", fruits[2].type),
                        y: .value("Total Count", fruits[2].count)
                    )
                    .foregroundStyle(by: .value("Color", fruits[2].color))
                }
                .chartForegroundStyleScale([
                    "Green": .green,
                    "Purple": .purple,
                    "Pink": .pink,
                    "Yellow": .yellow
                ])
                .padding()

                Chart(fruits) { fruit in
                    AreaMark(
                        x: .value("Count", fruit.type),
                        y: .value("Price", fruit.unitCost)
                    )
                }
                .padding()
            }

            ContributedByView(name: "Barbara Martina",
                              link: "https://github.com/barbaramartina")
            .padding(.top, 80)


        }
    }
}

struct ChartsViews_Previews: PreviewProvider {
    static var previews: some View {
        ChartsViews()
    }
}
