// MARK: - MCP Metadata
// @symbol: AdvancedGraphicsView
// @category: metal
// @tags: effects, metal, shaders
// ---

//
//  AnimationsView.swift
//  SwiftUICatalog
//
// MIT License
//
// Created by Barbara Rodeker
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

// ─── 2. The SwiftUI View ──────
struct AdvancedGraphicsView: View {
    let noiseImage: Image = Image(.noiseTexture)

    @State private var startDate = Date.now

    var body: some View {

        TimelineView(.animation) { timeline in
            // elapsed time since the view appeared – drives the shader animation
            let elapsed = timeline.date.timeIntervalSince(startDate)

            GeometryReader { proxy in
                Image(.landmark1)
                    .layerEffect(
                                // 👇 Three “pipeline parameters” passed to the Metal shader:
                                //   1️⃣ size (proxy.size)
                                //   2️⃣ noise texture (.image(...))
                                //   3️⃣ time (.float(elapsed))
                                ShaderLibrary.backgroundWarp(
                                    .float2(proxy.size),
                                    .image(noiseImage),
                                    .float(elapsed)
                                ),
                                maxSampleOffset: .zero
                            )
                    .ignoresSafeArea()
            }
            // ─── 3. Floating timestamp using an alignment guide ──────
            .overlay(alignment: .bottomLeading) {
                Text("00:30")
                    .alignmentGuide(.bottom) { $0[.top] }   // ← semantic override
                    .foregroundColor(.red)
                    .font(.caption2)
            }
        }
        .onAppear { startDate = Date.now }   // reset timer on re‑appearance
    }
}

// ─── 4. Preview ──────
#Preview {
    AdvancedGraphicsView()
}
