//
//  PageContainer.swift
//  SwiftUICatalog
//
//  Created by Barbara Rodeker on 2022-05-21.
//

import SwiftUI

struct PageContainer<Content>: View where Content: View {
    @Environment(\.colorScheme) private var colorScheme
    let content: Content
    private let toolbackColor: Color = {
        Color(uiColor: UIColor(patternImage: UIImage(named: "gradient2")!))
    }()

    var body: some View {
        ZStack {
            Color("PageContainerColor")
                .ignoresSafeArea()

            ScrollView(showsIndicators: false) {
                content
            }
            .contentMargins(.vertical, Style.VerticalPadding.medium.rawValue, for: .scrollContent)
            .padding(.horizontal, Style.HorizontalPadding.medium.rawValue)
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(toolbackColor, for: .navigationBar)
        .toolbarColorScheme(colorScheme, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
    }
}

#Preview {

    PageContainer(content: Text("Content"))
}
