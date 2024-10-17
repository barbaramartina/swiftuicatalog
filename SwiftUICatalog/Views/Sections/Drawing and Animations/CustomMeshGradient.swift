//
//  CustomMeshGradient.swift
//  Catalog
//
//  Created by Barbara Personal on 2024-08-31.
//

import SwiftUI

struct CustomMeshGradient: View {
    
    @State private var xColor: Float = 0.3
    @State private var yColor: Float = 0.3
    
    @State private var color1: Color = .cyan
    @State private var color2: Color = .indigo
    @State private var color3: Color = .purple
    
    private let rows: [GridItem] =
    Array(repeating: .init(.adaptive(minimum: 20,
                                     maximum: 60)), count: 1)
    
    
    var body: some View {
        PageContainer(content: ScrollView {
            Group {
                VStack {
                    HStack {
                        Text("Color position x: \(xColor)")
                            .font(.body)
                        Slider(value: $xColor)
                    }
                    HStack {
                        Text("Color position y: \(yColor)")
                            .font(.body)
                        Slider(value: $yColor)
                    }
                }
                HStack(spacing: 40) {
                    ColorPicker("Color 1",
                                selection: $color1,
                                supportsOpacity: false)
                    ColorPicker("Color 2",
                                selection: $color2,
                                supportsOpacity: false)
                    ColorPicker("Color 3",
                                selection: $color3,
                                supportsOpacity: false)
                    
                }
                MeshGradient(
                    width: 3,
                    height: 3,
                    points: [
                        .init(0.0, 0.0), .init(0.5, 0.0), .init(1.0, 0.0),
                        .init(0.0, 0.5), .init(xColor, yColor), .init(1.0, 0.5),
                        .init(0.0, 1.0), .init(0.5, 1.0), .init(1.0, 1.0),
                    ],
                    colors: [
                        color1, color1, color1,
                        color2, color2, color2,
                        color3, color3, color3
                    ],
                    background: .indigo
                )
                .frame(height: 500)
            }
        })
    }
    
}

#Preview {
    CustomMeshGradient()
}
