//
//  MyCustomAnimationView.swift
//  Catalog
//
//  Created by Barbara Personal on 2024-05-28.
//

import SwiftUI

struct MyCustomAnimationView: View {
    @State private var isActive = false

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(
                "This will play a custom animation. If you are sensitive to movements and light please be aware that this is a psychodelic random animation."
            )
            .fontWeight(.light)
            .font(.body)
            Button(
                action: {
                    withAnimation(.customAnimation) {
                        isActive.toggle()
                    }
                },
                label: {
                    Text("Animate")
                        .modifier(ButtonFontModifier())
                }
            )
            .frame(maxWidth: .infinity)
            .modifier(
                RoundedBordersModifier(
                    radius: 10,
                    lineWidth: 2
                )
            )
            Circle()
                .frame(width: isActive ? 300.0 : 10.0)
                .foregroundColor(.accentColor)
            Spacer()
        }
        .padding()
    }
}
#Preview {
    MyCustomAnimationView()
}
