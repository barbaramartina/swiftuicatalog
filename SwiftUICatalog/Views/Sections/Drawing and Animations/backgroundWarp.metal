//
//  backgroundWarp.metal
//  SwiftUICatalog
//
//  Created by Barbara Rodeker on 15/08/2026.
//

#include <metal_stdlib>
using namespace metal;
#include <SwiftUI/SwiftUI_Metal.h>

// BackgroundWarp.metal
[[stitchable]] half4 backgroundWarp(
    float2 position, SwiftUI::Layer layer,
    float2 size, texture2d<half> noiseTex,
    float time
) {
    constexpr sampler s(address::repeat, filter::linear);
    float2 uv = position / size;

    // Sample noise twice (domain‑warping)
    half4 n = noiseTex.sample(s, uv);
    float2 q = float2(n.r, n.g);
    n = noiseTex.sample(s, uv + q);

    // Map noise to an offset in the range [-200,200]
    float2 offset = (float2(n.r, n.g) - 0.5) * 200.0;

    // Animate with time
    return layer.sample(position + offset + float2(time * 10, time * 10));
}
