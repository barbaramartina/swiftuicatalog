//
//  Shaders.metal
//  Catalog
//
//  Created by Barbara Personal on 2025-05-05.
//

#include <metal_stdlib>
#include <SwiftUI/SwiftUI_Metal.h>
using namespace metal;

// ----------------------------------------------
// Use this shader by calling .colorEffect on your SwiftUI view
// for example:
//  Image(systemName: "circle")
//      .font(.system(size: 100))
//      .colorEffect(ShaderLibrary.squaredEffect(.float(10), .color(.blue)))
//
// Position and current color parameters will be added automatically by SwiftUI
// when adding this effect, so you only need to send the size and the new color parameters.
//
// To find the shader Swift will use dynamicMemberLookup, that's why you do not
// need to declare it inside the ShaderLibrary.
// ----------------------------------------------
[[ stitchable ]] half4 squaredEffect(float2 position, half4 currentColor, float size, half4 newColor) {
    uint2 posInChecks = uint2(position.x / size, position.y / size);
    bool isColor = (posInChecks.x ^ posInChecks.y) & 1;
    return isColor ? newColor * currentColor.a : half4(0.0, 0.0, 0.0, 0.0);
}

// ----------------------------------------------
// Use this shader in combination with the 'layerEffect' modifier
// for example:
//  Image(systemName: "figure.run.circle.fill")
//      .font(.system(size: 300))
//      .layerEffect(ShaderLibrary.pixellate(.float(10)), maxSampleOffset: .zero)
// Using 'layerEffect' allow Swift to access the view's layer and do stuffs like
// sampling a position to fetch a color from it.
// ----------------------------------------------
[[ stitchable ]] half4 pixellate(float2 position, SwiftUI::Layer layer, float strength) {
    float min_strength = max(strength, 0.0001);
    float coord_x = min_strength * round(position.x / min_strength);
    float coord_y = min_strength * round(position.y / min_strength);
    return layer.sample(float2(coord_x, coord_y));
}

// ----------------------------------------------
// This shader can be applied with the 'distortionEffect' modifier
// and it allows to move pixels from one position to another.
// It uses a 'time' parameter, which you can pass around by using a 'TimelineView'
// for example:
// struct ContentView: View {
//  let startDate = Date()
//
//  var body: some View {
//      TimelineView(.animation) { context in
//          Image(systemName: "circle")
//              .font(.system(size: 100))
//  .distortionEffect(ShaderLibrary.simpleWave(.float(startDate.timeIntervalSinceNow)), maxSampleOffset: .zero)
//    }
//  }
// }
// ----------------------------------------------
[[ stitchable ]] float2 wave(float2 position, float time, float strength, float2 size) {
    float2 distance = position / size;
    position.y += sin(time * strength + position.y / 20) * distance.x * strength;
    return position;
}

// Color invert
[[ stitchable ]] half4 colorInvertEffect(float2 position, half4 color) {
    return half4(1.0 - color.rgb, color.a);
}

// Gradient effect
[[ stitchable ]] half4 gradient(float2 position, half4 color) {
    return half4(
                 position.x / position.y,
                 0,
                 position.y / position.x,
                 color.a
                 );
}

// Gradient effect - animated over time
[[ stitchable ]] half4 animatedGradient(float2 position, half4 color, float time) {
    float angle = atan2(position.x, position.y) + time;
    return half4(
                 sin(angle),
                 sin(angle + 2),
                 sin(angle + 4),
                 color.a
                 );
}

// Alpha invert
[[ stitchable ]] half4 alphaInvertEffect(float2 position, half4 color) {
    return half4(1,0,0, 1.0 - color.a);
}

// Rainbow effect
[[ stitchable ]] half4 rainbowShift(float2 position, half4 color) {
    float r = color.r * sin(position.x * 0.01);
    float g = color.g * sin(position.y * 0.01);
    float b = color.b * sin((position.x + position.y) * 0.005);
    return half4(r, g, b, color.a);
}

// Color moving over time
[[ stitchable ]] half4 colorMoving(float2 position, half4 color, float time) {
    float r = color.r * sin(time);
    float g = color.g * sin(time);
    float b = color.b * sin(time);
    return half4(r, g, b, color.a);
}

// make a view shine over time
[[stitchable]] half4 shineEffect(float2 position, half4 color, float2 size, float time) {
    // Normalize coordinates (0-1)
    float2 uv = position / size;
    
    // Create a moving diagonal band
    float shine = smoothstep(0.0, 0.1, sin(10.0 * (uv.x + uv.y - time)));
    
    // Mix shine color with original color
    float3 shineColor = float3(color.r, color.g, color.b) + shine * 0.5;
    
    return half4(half3(shineColor), color.a);
}

// zoom layer effect (use it only with the layerEffect modifier of your view)
[[ stitchable ]] half4 zoom(float2 position, SwiftUI::Layer layer, float2 size, float2 touch) {
    
    float maxDistance = 0.02;
    // calculate the normalized position according to the total view size
    float2 uv = position / size;
    
    // calculate the normalized center of the touch
    float2 touchCenter = touch / size;
    
    // now we want to know how far each pixel is from the center of the touch
    float2 delta = uv - touchCenter;
    
    // we also want to know the aspect ratio of the view
    float aspectRatio = size.x / size.y;
    
    // now let's apply pythagoras theorem to calculate the hipotenuse
    // we need the distance regarding the center of the touch
    float distance = (delta.x * delta.x) + (delta.y * delta.y) / aspectRatio;
    
    // now we calculate the new position based on the total zoom to apply
    // the close to the center, the smaller the zoom value = the more stretched the pixel will be
    float totalZoom = 1;
    if (distance < maxDistance) {
        totalZoom /= 2;
    }
    
    float2 newPosition = delta * totalZoom + touchCenter;
    return layer.sample(newPosition * size);
}

// ----------------------------------------------
// A small, deterministic random number generator.
// It takes a 2D position and always returns the same
// value for the same position.
// ----------------------------------------------
float hash21(float2 p) {
    p = fract(p * float2(123.34, 456.21));
    p += dot(p, p + 45.32);
    return fract(p.x * p.y);
}

// ----------------------------------------------
// Chromatic aberration.
// The red and the blue channel of the layer are sampled
// a little bit apart from each other, which reproduces the
// colored fringes you can see on real lenses.
// Use it with the 'layerEffect' modifier.
// for example:
//  Image("photo")
//      .layerEffect(ShaderLibrary.chromaticAberration(.float2(proxy.size), .float(6.0)),
//                   maxSampleOffset: CGSize(width: 6, height: 6))
// ----------------------------------------------
[[ stitchable ]] half4 chromaticAberration(float2 position, SwiftUI::Layer layer, float2 size, float amount) {
    float2 safeSize = max(size, float2(1.0));
    float2 uv = position / safeSize;

    // the offset radiates from the center of the view
    float2 direction = uv - 0.5;
    float distance = length(direction);
    direction = distance > 0.0001 ? direction / distance : float2(0.0);
    float2 offset = direction * amount;

    half4 red = layer.sample(position + offset);
    half4 green = layer.sample(position);
    half4 blue = layer.sample(position - offset);

    // the layer is sampled premultiplied, so un-premultiply the channels before mixing them
    float3 rgb = float3(
        red.r / max(float(red.a), 0.0001),
        green.g / max(float(green.a), 0.0001),
        blue.b / max(float(blue.a), 0.0001)
    );
    float alpha = float(green.a);
    return half4(float4(rgb * alpha, alpha));
}

// ----------------------------------------------
// Ripple.
// Expanding waves around the point the user is touching.
// Use it with the 'distortionEffect' modifier and pass the
// touch location together with the size of the view.
// for example:
//  Image("photo")
//      .distortionEffect(ShaderLibrary.ripple(.float(time), .float2(proxy.size), .float2(touch)),
//                        maxSampleOffset: CGSize(width: 12, height: 12))
// ----------------------------------------------
[[ stitchable ]] float2 ripple(float2 position, float time, float2 size, float2 touch) {
    float2 safeSize = max(size, float2(1.0));

    // work with normalized coordinates, so the effect looks the same on every view size
    float2 uv = position / safeSize;
    float2 touchUV = touch / safeSize;
    float2 delta = uv - touchUV;
    float distance = length(delta);

    // the direction from the touch point towards the current pixel
    float2 direction = distance > 0.0001 ? delta / distance : float2(0.0);

    // the waves fade out the further they are away from the touch point
    float falloff = 1.0 / (1.0 + distance * 8.0);
    float wave = sin(distance * 60.0 - time * 5.0);

    // the displacement is given in points, so it stays the same on every screen
    float displacement = wave * falloff * 12.0;
    return position + direction * displacement;
}

// ----------------------------------------------
// Vignette.
// Darkens the edges of the layer, the way a camera lens does.
// Use it with the 'layerEffect' modifier.
// for example:
//  Image("photo")
//      .layerEffect(ShaderLibrary.vignette(.float2(proxy.size), .float(0.9)),
//                   maxSampleOffset: .zero)
// ----------------------------------------------
[[ stitchable ]] half4 vignette(float2 position, SwiftUI::Layer layer, float2 size, float intensity) {
    float2 safeSize = max(size, float2(1.0));
    float2 uv = position / safeSize;

    float2 centered = (uv - 0.5) * 2.0;
    // keep the vignette round, even when the view is not square
    centered.x *= safeSize.x / safeSize.y;

    // the distance is normalized, so 1 is reached in the corners of the view
    float maxDistance = length(float2(safeSize.x / safeSize.y, 1.0));
    float distance = length(centered) / maxDistance;

    // 1 in the middle of the view, fading out towards the corners
    float shade = 1.0 - intensity * smoothstep(0.5, 1.0, distance);

    half4 color = layer.sample(position);
    // the layer is premultiplied, so scaling the rgb keeps the alpha untouched
    float3 rgb = float3(color.rgb) * shade;
    return half4(float4(rgb, float(color.a)));
}

// ----------------------------------------------
// Plasma.
// A procedural, animated color field, built out of a few sine waves.
// Use it with the 'colorEffect' modifier.
// for example:
//  Image(systemName: "circle")
//      .colorEffect(ShaderLibrary.plasma(.float2(proxy.size), .float(time)))
// ----------------------------------------------
[[ stitchable ]] half4 plasma(float2 position, half4 color, float2 size, float time) {
    float2 safeSize = max(size, float2(1.0));
    float2 uv = position / safeSize;

    // the sum of a few sine waves creates the plasma pattern
    float value = sin(uv.x * 9.0 + time)
                + sin(uv.y * 9.0 - time * 0.8)
                + sin((uv.x + uv.y) * 9.0 + time * 0.5);
    value = value / 3.0;

    // shifting the color of every wave results in the rainbow
    float3 tint = float3(
        0.5 + 0.5 * sin(6.28318 * (value + time * 0.15)),
        0.5 + 0.5 * sin(6.28318 * (value + 0.33 + time * 0.15)),
        0.5 + 0.5 * sin(6.28318 * (value + 0.66 + time * 0.15))
    );

    // keep the alpha of the original pixel, so the shape of the view is preserved
    float alpha = float(color.a);
    return half4(float4(tint * alpha, alpha));
}

// ----------------------------------------------
// Halftone.
// Turns the view into a grid of dots, the bigger the darker the pixel
// underneath is. This is the effect you know from printed photos.
// Use it with the 'colorEffect' modifier.
// for example:
//  Image("photo")
//      .colorEffect(ShaderLibrary.halftone(.float2(proxy.size), .float(8.0)))
// ----------------------------------------------
[[ stitchable ]] half4 halftone(float2 position, half4 color, float2 size, float spacing) {
    float2 safeSize = max(size, float2(1.0));
    float2 centered = position - safeSize * 0.5;

    // rotate the grid by 45 degrees to get the classic print look
    float2 rotated = float2(centered.x + centered.y, centered.x - centered.y);
    float2 cell = floor(rotated / spacing);
    float2 local = fract(rotated / spacing) - 0.5;

    // a small offset per cell keeps the pattern from looking too regular
    local -= (float2(hash21(cell), hash21(cell + 17.0)) - 0.5) * 0.3;

    float distanceToDot = length(local);
    float brightness = dot(float3(color.rgb), float3(0.2126, 0.7152, 0.0722));

    // the darker the pixel, the bigger the dot
    float radius = sqrt(clamp(1.0 - brightness, 0.0, 1.0)) * 0.7;
    float dotMask = 1.0 - smoothstep(radius - 0.08, radius + 0.08, distanceToDot);

    // the paper is white and the dots keep a darker version of the original color
    float3 paper = float3(0.95);
    float3 ink = float3(color.rgb) * 0.35;
    float3 result = mix(paper, ink, dotMask);

    float alpha = float(color.a);
    return half4(float4(result * alpha, alpha));
}
