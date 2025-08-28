//
//  PageContainer.swift
//  SwiftUICatalog
//
//  Created by Barbara Rodeker on 2022-05-21.
//

import SwiftUI

struct PageContainer<Content>: View where Content: View {
    let content: Content
    private let toolbackColor: Color = {
        Color(uiColor: UIColor(patternImage: UIImage(named: "gradient")!))
    }()

    var body: some View {
        ZStack {
            Color("PageContainerColor")
                .ignoresSafeArea()

            ScrollView {
                content
            }
            .padding(.vertical, Style.VerticalPadding.medium.rawValue)
            .padding(.horizontal, Style.HorizontalPadding.medium.rawValue)
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbarColorScheme(.dark, for: .navigationBar)
        .toolbarBackground(toolbackColor, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
    }
}

#Preview {

    PageContainer(content: Text("Content"))
}
