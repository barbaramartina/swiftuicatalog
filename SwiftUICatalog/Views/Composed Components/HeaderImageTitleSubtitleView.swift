//
//  HeaderImageTitleSubtitle.swift
//  SwiftUICatalog
//
//  Created by Barbara Rodeker on 06.02.22.
//

import SwiftUI

struct HeaderImageTitleSubtitle: View, Identifiable {
    
    let id: String = "HeaderImageTitleSubtitle"
    
    struct Configuration {
        let title: String
        let titleFont: Font
        let titleWeight: Font.Weight
        let subtitle: String
        let subtitleFont: Font
        let subtitleWeight: Font.Weight
        let header: String
        let paddingTop: CGFloat
        let paddingLeading: CGFloat
        let paddingTrailing: CGFloat
        let paddingBottom: CGFloat
    }
    @State var configuration: Configuration
    
    var body: some View {
        
        VStack {
            
            Image(configuration.header)
                .resizable()
                .scaledToFit()

            Text(configuration.title)
                .font(configuration.titleFont)
                .fontWeight(configuration.titleWeight)
                .padding(.top, 16)

            Text(configuration.subtitle)
                .font(configuration.subtitleFont)
                .fontWeight(configuration.subtitleWeight)
                .padding(.top, 16)
            
            Rectangle()
                .fill(Color.gray)
                .frame(width: nil,
                       height: 1,
                       alignment: .center)
                .padding(.top, 12)
                

        }
        .padding(.top, configuration.paddingTop)
        .padding(.bottom, configuration.paddingBottom)
        .padding(.leading, configuration.paddingLeading)
        .padding(.trailing, configuration.paddingTrailing)
        
    }
}

struct HeaderImageTitleSubtitle_Previews: PreviewProvider {
    static var previews: some View {
        HeaderImageTitleSubtitle(configuration: HeaderImageTitleSubtitle.Configuration(title: "English Cocker Spaniel"
                                                                                       , titleFont: .largeTitle,
                                                                                       titleWeight: .bold,
                                                                                       subtitle: "The English Cocker Spaniel is a breed of gun dog. It is noteworthy for producing one of the most varied numbers of pups in a litter among all dog breeds. The English Cocker Spaniel is an active, good-natured, sporting dog[1] standing well up at the withers and compactly built"
                                                                                       , subtitleFont: .body,
                                                                                       subtitleWeight: .regular,
                                                                                       header: "cocker"
                                                                                       ,
                                                                                      paddingTop: 16,
                                                                                      paddingLeading: 16,
                                                                                      paddingTrailing: 16,
                                                                                      paddingBottom: 16))
    }
}
