//
//  CommonlyUsedViews.swift
//  SwiftUICatalog
//
//  Created by Barbara Rodeker on 06.02.22.
//

import SwiftUI

struct CommonlyUsedViews: View, Comparable {
    
    let id: String = "CommonlyUsedViews"
    
    var body: some View {
        
        ScrollView {
            
            // Big header - title - description view
            Group {
                
                Text("A view with an image as header, a title and a longer text below")
                    .fontWeight(.heavy)
                    .padding(.top, 12)
                Text("You can combine a set of those in an array and iterate to create a collection layout. Padding, fonts and content are configurable.")
                    .fontWeight(.light)

                
                HeaderImageTitleSubtitle(configuration: HeaderImageTitleSubtitle.Configuration(title: "English Cocker Spaniel"
                                                                                               , titleFont: .title,
                                                                                               titleWeight: .bold,
                                                                                               subtitle: "The English Cocker Spaniel is a breed of gun dog. It is noteworthy for producing one of the most varied numbers of pups in a litter among all dog breeds."
                                                                                               , subtitleFont: .body,
                                                                                               subtitleWeight: .regular,
                                                                                               header: "cocker"
                                                                                               ,
                                                                                              paddingTop: 16,
                                                                                              paddingLeading: 16,
                                                                                              paddingTrailing: 16,
                                                                                              paddingBottom: 16))

            }
            .padding()
            // END OF Big header - title - description view
            
            // Card with icons - title - description
            Group {
                Text("A view with an icon, a title and a longer text below")
                    .fontWeight(.heavy)
                    .padding(.top, 12)
                Text("The size of the icon and the horizontal and vertical alignment can be configured.")
                    .fontWeight(.light)
                
                let configurationIcon1 =  TitleSubtitleIconView.Configuration(
                    backgroundColor: Color.pink,
                    title: "English Cocker Spaniel"
                                                                             , titleFont: .title,
                                                                             titleWeight: .bold,
                                                                             subtitle: "The English Cocker Spaniel is a breed of gun dog. It is noteworthy for producing one of the most varied numbers of pups in a litter among all dog breeds. "
                                                                             , subtitleFont: .body,
                                                                             subtitleWeight: .regular,
                                                                       icon: "cocker", iconSize: CGSize(width: 60, height: 60),
                                                                       iconVerticalAlignment: .top, iconHorizontalAlignment: .center
                                                                             ,
                                                                            paddingTop: 16,
                                                                            paddingLeading: 16,
                                                                            paddingTrailing: 16,
                                                                            paddingBottom: 16)
                TitleSubtitleIconView(configuration: configurationIcon1)

                let configurationIcon2 =  TitleSubtitleIconView.Configuration(backgroundColor: Color.gray,
                                                                              title: "English Cocker Spaniel"
                                                                             , titleFont: .title,
                                                                             titleWeight: .bold,
                                                                             subtitle: "The English Cocker Spaniel is a breed of gun dog. It is noteworthy for producing one of the most varied numbers of pups in a litter among all dog breeds. "
                                                                             , subtitleFont: .body,
                                                                             subtitleWeight: .regular,
                                                                       icon: "cocker", iconSize: CGSize(width: 60, height: 60),
                                                                       iconVerticalAlignment: .top, iconHorizontalAlignment: .trailing
                                                                             ,
                                                                            paddingTop: 16,
                                                                            paddingLeading: 16,
                                                                            paddingTrailing: 16,
                                                                            paddingBottom: 16)
                TitleSubtitleIconView(configuration: configurationIcon2)

                let configurationIcon3 =  TitleSubtitleIconView.Configuration(backgroundColor: Color.green,
                                                                              title: "English Cocker Spaniel"
                                                                             , titleFont: .title,
                                                                             titleWeight: .bold,
                                                                             subtitle: "The English Cocker Spaniel is a breed of gun dog. It is noteworthy for producing one of the most varied numbers of pups in a litter among all dog breeds. "
                                                                             , subtitleFont: .body,
                                                                             subtitleWeight: .regular,
                                                                       icon: "cocker", iconSize: CGSize(width: 60, height: 60),
                                                                       iconVerticalAlignment: .top, iconHorizontalAlignment: .leading
                                                                             ,
                                                                            paddingTop: 16,
                                                                            paddingLeading: 16,
                                                                            paddingTrailing: 16,
                                                                            paddingBottom: 16)
                TitleSubtitleIconView(configuration: configurationIcon3)

            }
            .padding()
            // END OF Card with icons - title - description

            // swipable view
            Group {
                
                let configurationIcon1 =  TitleSubtitleIconView.Configuration(backgroundColor: Color.pink,
                                                                              title: "Husky"
                                                                             , titleFont: .title,
                                                                             titleWeight: .bold,
                                                                             subtitle: "The Siberian Husky is a medium-sized working sled dog breed. The breed belongs to the Spitz genetic family. It is recognizable by its thickly furred double coat, erect triangular ears, and distinctive markings, and is smaller than the similar-looking Alaskan "
                                                                             , subtitleFont: .body,
                                                                             subtitleWeight: .regular,
                                                                       icon: "husky", iconSize: CGSize(width: 60, height: 60),
                                                                       iconVerticalAlignment: .top, iconHorizontalAlignment: .leading
                                                                             ,
                                                                            paddingTop: 16,
                                                                            paddingLeading: 16,
                                                                            paddingTrailing: 16,
                                                                            paddingBottom: 16)
            
            
                let configurationIcon2 =  TitleSubtitleIconView.Configuration(backgroundColor: Color.blue, title: "English Cocker Spaniel"
                                                                         , titleFont: .title,
                                                                         titleWeight: .bold,
                                                                         subtitle: "The English Cocker Spaniel is a breed of gun dog. It is noteworthy for producing one of the most varied numbers of pups in a litter among all dog breeds. "
                                                                         , subtitleFont: .body,
                                                                         subtitleWeight: .regular,
                                                                   icon: "cocker", iconSize: CGSize(width: 60, height: 60),
                                                                   iconVerticalAlignment: .top, iconHorizontalAlignment: .trailing
                                                                         ,
                                                                        paddingTop: 16,
                                                                        paddingLeading: 16,
                                                                        paddingTrailing: 16,
                                                                        paddingBottom: 16)
            
                
                SwipableViewContainer(subviews: [TitleSubtitleIconView(configuration: configurationIcon2),
                                                 TitleSubtitleIconView(configuration: configurationIcon1)])
            }
            // end of swipable view

        }
        

    }
}

struct CommonlyUsedViews_Previews: PreviewProvider {
    static var previews: some View {
        CommonlyUsedViews()
    }
}
