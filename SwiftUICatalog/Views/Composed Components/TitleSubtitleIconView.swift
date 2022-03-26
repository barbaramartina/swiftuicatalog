//
//  TitleSubtitleIconView.swift
//  SwiftUICatalog
//
//  Created by Barbara Rodeker on 06.02.22.
//

import SwiftUI

///
/// A view commonly used includes a title, a longer description and an icon.
/// This view allows to create this combination of items easily.
///
///  TITLE                                              (ICON)
///  LONGER DESCRIPTION
///
///  The ICON vertical and horizontal alignments can be configured.
///  As well as the font, weight and paddings of the view.
///
struct TitleSubtitleIconView: View {
    
    struct Configuration {
        let title: String
        let titleFont: Font
        let titleWeight: Font.Weight
        let subtitle: String
        let subtitleFont: Font
        let subtitleWeight: Font.Weight
        let icon: String
        let iconSize: CGSize
        let iconVerticalAlignment: VerticalAlignment
        let iconHorizontalAlignment: HorizontalAlignment
        let paddingTop: CGFloat
        let paddingLeading: CGFloat
        let paddingTrailing: CGFloat
        let paddingBottom: CGFloat
    }
    @State var configuration: Configuration
    
    var body: some View {

        VStack(alignment: .center) {
            HStack(alignment: configuration.iconVerticalAlignment) {
                
                if configuration.iconHorizontalAlignment == .leading {
                    Image(configuration.icon)
                        .resizable()
                        .scaledToFit()
                        .frame(width: configuration.iconSize.width, height: configuration.iconSize.height)

                }
                
                VStack(alignment: configuration.iconHorizontalAlignment == .center ? .center : .leading) {

                    if configuration.iconHorizontalAlignment == .center {
                        Image(configuration.icon)
                            .resizable()
                            .scaledToFit()
                            .frame(width: configuration.iconSize.width, height: configuration.iconSize.height,
                                   alignment: .center)

                    }

                    Text(configuration.title)
                        .font(configuration.titleFont)
                        .fontWeight(configuration.titleWeight)
                        .padding(.top, 16)

                    Text(configuration.subtitle)
                        .font(configuration.subtitleFont)
                        .fontWeight(configuration.subtitleWeight)
                        .padding(.top, 16)
                }

                if configuration.iconHorizontalAlignment == .trailing {
                    Image(configuration.icon)
                        .resizable()
                        .scaledToFit()
                        .frame(width: configuration.iconSize.width, height: configuration.iconSize.height)

                }
                
            }
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

struct TitleSubtitleIconView_Previews: PreviewProvider {
    static var previews: some View {
        TitleSubtitleIconView(configuration: TitleSubtitleIconView.Configuration(title: "English Cocker Spaniel"
                                                                                       , titleFont: .title,
                                                                                       titleWeight: .bold,
                                                                                       subtitle: "The English Cocker Spaniel is a breed of gun dog. It is noteworthy for producing one of the most varied numbers of pups in a litter among all dog breeds. The English Cocker Spaniel is an active, good-natured, sporting dog[1] standing well up at the withers and compactly built"
                                                                                       , subtitleFont: .body,
                                                                                       subtitleWeight: .regular,
                                                                                 icon: "cocker", iconSize: CGSize(width: 60, height: 60),
                                                                                 iconVerticalAlignment: .top, iconHorizontalAlignment: .trailing
                                                                                       ,
                                                                                      paddingTop: 16,
                                                                                      paddingLeading: 16,
                                                                                      paddingTrailing: 16,
                                                                                      paddingBottom: 16))
    }
}
