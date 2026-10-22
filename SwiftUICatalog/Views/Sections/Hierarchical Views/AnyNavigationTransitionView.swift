// MARK: - MCP Metadata
// @symbol: AnyNavigationTransitionView
// @category: swiftui
// @tags: containers, controls, layouts, user-input
// ---

//
//  NavigationBarsComponentView.swift
//  SwiftUICatalog
//
// MIT License
//
// Copyright (c) 2021 Barbara Martina
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

@Observable
final class Model {
    var useCrossDissolve: Bool
    
    init(useCrossDissolve: Bool) {
        self.useCrossDissolve = useCrossDissolve
    }
}

struct AnyNavigationTransitionView: View {
    @State private var showSheet = false
    @State private var model = Model(useCrossDissolve: false)

    var body: some View {
        VStack(spacing: 16) {
            Spacer()
            AsyncImage(request: URLRequest(url: URL(string: "https://cdn.pixabay.com/photo/2023/10/03/19/31/ai-generated-8292333_1280.png")!,
                                           cachePolicy: .reloadIgnoringLocalCacheData)) { image in
                image
                    .resizable()
                    .frame(width: 200, height: 200)
                    .scaledToFit()
            } placeholder: {
                ProgressView()
            }
            Text("Current cross disolve value: \n \(model.useCrossDissolve ? "TRUE" : "FALSE")")
                .font(.headline)
            Button("Toggle Cross Disolve") {
                model.useCrossDissolve.toggle()
            }
            .buttonStyle(.borderedProminent)
            Text("When toggling cross disolve, the transition to the presented sheet will change dynamically")
                .fixedSize(horizontal: false, vertical: true)
                .font(.caption)
            Divider()
            Button("Show Sheet") {
                showSheet = true
            }
            .buttonStyle(.borderedProminent)
            .sheet(isPresented: $showSheet) {
                let transition =
                    model.useCrossDissolve
                    ? AnyNavigationTransition(.crossFade)
                    : AnyNavigationTransition(.automatic)
                VStack {
                    Text("Sheet Content")
                    AsyncImage(request: URLRequest(url: URL(string: "https://cdn.pixabay.com/photo/2023/10/03/19/31/ai-generated-8292333_1280.png")!,
                                                   cachePolicy: .reloadIgnoringLocalCacheData)) { image in
                        image
                            .resizable()
                            .frame(width: 200, height: 200)
                            .scaledToFit()
                            .clipShape(Circle())
                            .clipped()
                    } placeholder: {
                        ProgressView()
                    }
                }
                .presentationDetents([.fraction(0.6)])
                    .navigationTransition(transition)
            }
            Spacer()
        }
        .padding(.horizontal, 16)
    }
}
