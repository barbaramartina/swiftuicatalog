//
//  MetalShaderExamples.swift
//  Catalog
//
//  Created by Barbara Personal on 2025-05-05.
//

import Metal
import MetalKit
import SwiftUI

struct MetalShaderExamples: View {
    /// this date will be used in the timeline view
    /// to calculate the elapsed time for some of the shaders
    private let startDate = Date()
    /// we need the touch, to exemplify the zoom shader
    @State private var touch: CGPoint = .zero
    /// the touch of the ripple shader, it is nil as long as the user did not touch the view
    @State private var rippleTouch: CGPoint?

    var body: some View {
        ScrollView(showsIndicators: false) {
            TimelineView(.animation) { context in
                let time = context.date.timeIntervalSince(startDate)
                VStack(spacing: 24) {
                    zoomView
                    distortion1View
                    shineView
                    colorInvertView
                    gradientView
                    animatedGradient(time: time)
                    alphaInvertView
                    chromaticAberrationView
                    rippleView(time: time)
                    vignetteView
                    plasmaView(time: time)
                    halftoneView
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
                    .layerEffect(
                        ShaderLibrary.zoom(
                            .float2(proxy.size),
                            .float2(touch)
                        ),
                        maxSampleOffset: .zero,
                        isEnabled: touch != .zero
                    )
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
                    .colorEffect(
                        ShaderLibrary.shineEffect(
                            .float2(proxy.size),
                            .float(startDate.timeIntervalSinceNow)
                        )
                    )
            }
    }

    private var distortion1View: some View {
        systemImage
            .visualEffect({ content, proxy in
                content
                    .distortionEffect(
                        ShaderLibrary.wave(
                            .float(startDate.timeIntervalSinceNow),
                            .float(5.0),
                            .float2(proxy.size)
                        ),
                        maxSampleOffset: .zero
                    )
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

    // MARK: - Chromatic aberration

    /// the red and the blue channel of the layer are sampled a bit apart from
    /// each other, which creates the colored fringes you know from real lenses
    private var chromaticAberrationView: some View {
        VStack(alignment: .leading, spacing: 8) {
            caption("Chromatic aberration: layerEffect")
            image
                .visualEffect { content, proxy in
                    content.layerEffect(
                        ShaderLibrary.chromaticAberration(
                            .float2(proxy.size),
                            .float(6.0)
                        ),
                        maxSampleOffset: CGSize(width: 6, height: 6)
                    )
                }
        }
    }

    // MARK: - Ripple

    /// expanding waves around the point the user is touching
    private func rippleView(time: CGFloat) -> some View {
        // the touch is read here and not inside the visual effect,
        // because that closure is sendable
        let currentTouch = rippleTouch
        return VStack(alignment: .leading, spacing: 8) {
            caption("Ripple: distortionEffect - touch the image")
            image
                .visualEffect { content, proxy in
                    // before the first touch the waves start in the middle of the view
                    let touch = currentTouch ?? CGPoint(
                        x: proxy.size.width / 2,
                        y: proxy.size.height / 2
                    )
                    return content.distortionEffect(
                        ShaderLibrary.ripple(
                            .float(time),
                            .float2(proxy.size),
                            .float2(touch)
                        ),
                        maxSampleOffset: CGSize(width: 12, height: 12)
                    )
                }
                .gesture(
                    DragGesture(minimumDistance: 0.0)
                        .onChanged({ value in
                            rippleTouch = value.location
                        })
                )
        }
    }

    // MARK: - Vignette

    /// darkens the edges of the layer, the way a camera lens does
    private var vignetteView: some View {
        VStack(alignment: .leading, spacing: 8) {
            caption("Vignette: layerEffect")
            image
                .visualEffect { content, proxy in
                    content.layerEffect(
                        ShaderLibrary.vignette(
                            .float2(proxy.size),
                            .float(0.9)
                        ),
                        maxSampleOffset: .zero
                    )
                }
        }
    }

    // MARK: - Plasma

    /// a procedural, animated color field
    private func plasmaView(time: CGFloat) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            caption("Plasma: colorEffect")
            systemImage
                .visualEffect { content, proxy in
                    content.colorEffect(
                        ShaderLibrary.plasma(
                            .float2(proxy.size),
                            .float(time)
                        )
                    )
                }
        }
    }

    // MARK: - Halftone

    /// turns the view into a grid of dots, the effect you know from printed photos
    private var halftoneView: some View {
        VStack(alignment: .leading, spacing: 8) {
            caption("Halftone: colorEffect")
            image
                .visualEffect { content, proxy in
                    content.colorEffect(
                        ShaderLibrary.halftone(
                            .float2(proxy.size),
                            .float(8.0)
                        )
                    )
                }
        }
    }

    // MARK: - Helpers

    /// a short description of the shader, shown above its example
    private func caption(_ text: String) -> some View {
        Text(text)
            .font(.footnote)
            .fontWeight(.light)
            .foregroundStyle(.secondary)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    MetalShaderExamples()
}
