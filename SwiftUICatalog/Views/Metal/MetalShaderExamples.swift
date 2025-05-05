//
//  MetalShaderExamples.swift
//  Catalog
//
//  Created by Barbara Personal on 2025-05-05.
//

import SwiftUI
import Metal
import MetalKit

struct MetalShaderExamples: View {
    /// this date will be used in the timeline view
    /// to calculate the elapsed time for some of the shaders
    private let startDate = Date()
    /// we need the touch, to exemplify the zoom shader
    @State private var touch: CGPoint = .zero
    
    var body: some View {
        ScrollView {
            TimelineView(.animation) { context in
                let time = context.date.timeIntervalSince(startDate)
                VStack {
                    zoomView
                    distortion1View
                    shineView
                    colorInvertView
                    gradientView
                    animatedGradient(time: time)
                    alphaInvertView
                }
            }
        }
    }
    
    private var image: some View {
        Image("stmarylake_feature")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(height: 250)
            .cornerRadius(16.0)
    }
    
    private var zoomView: some View {
        image
            .visualEffect({ content, proxy in
                content
                    .layerEffect(ShaderLibrary.zoom(
                        .float2(proxy.size),
                        .float2(touch)
                    ), maxSampleOffset: .zero,
                                 isEnabled: touch != .zero)
            })
            .gesture(
                DragGesture(minimumDistance: 0.0)
                    .onChanged({ value in
                        touch = value.location
                    })
            )
    }
    
    private var shineView: some View {
        systemImage
            .visualEffect { content, proxy in
                content
                    .colorEffect(ShaderLibrary.shineEffect(.float2(proxy.size), .float(startDate.timeIntervalSinceNow)))
            }
    }
    
    private var distortion1View: some View {
        systemImage
            .visualEffect({ content, proxy in
                content
                    .distortionEffect(ShaderLibrary.wave(.float(startDate.timeIntervalSinceNow), .float(5.0), .float2(proxy.size)), maxSampleOffset: .zero)
            })
    }
    
    private var colorInvertView: some View {
        systemImage
            .colorEffect(ShaderLibrary.colorInvertEffect())
    }
    
    private var systemImage: some View {
        Image(systemName: "character.square.fill.hi")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(height: 250)
            .foregroundStyle(.pink)
            .padding()
    }
    
    private var alphaInvertView: some View {
        systemImage
            .colorEffect(ShaderLibrary.alphaInvertEffect())
    }
    
    private var gradientView: some View {
        systemImage
            .colorEffect(ShaderLibrary.gradient())
    }
    
    private func animatedGradient(time: CGFloat) -> some View {
        systemImage
            .colorEffect(ShaderLibrary.animatedGradient(.float(time)))
    }
}

#Preview {
    MetalShaderExamples()
}
