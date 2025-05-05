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
