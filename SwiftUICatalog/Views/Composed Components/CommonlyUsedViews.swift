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

            example1
            example2
            example3

        }


    }

    // MARK: - Example Views

    // Big header - title - description view
    private var example1: some View {

        Group {

            Text("A view with an image as header, a title and a longer text below")
                .fontWeight(.heavy)
                .padding(.top, 12)
            Text("You can combine a set of those in an array and iterate to create a collection layout. Padding, fonts and content are configurable.")
                .fontWeight(.light)


            HeaderImageTitleSubtitle(configuration: HeaderImageTitleSubtitle.Configuration(title: "English Cocker Spaniel",
                                                                                           titleFont: .title,
                                                                                           titleWeight: .bold,
                                                                                           subtitle: "The English Cocker Spaniel is a breed of gun dog. It is noteworthy for producing one of the most varied numbers of pups in a litter among all dog breeds.",
                                                                                           subtitleFont: .body,
                                                                                           subtitleWeight: .regular,
                                                                                           header: "cocker",
                                                                                           paddingTop: 16,
                                                                                           paddingLeading: 16,
                                                                                           paddingTrailing: 16,
                                                                                           paddingBottom: 16))

        }
        .padding()

    }

    // Card with icons - title - description
    private var example2: some View {
        Group {
            Text("A view with an icon, a title and a longer text below")
                .fontWeight(.heavy)
                .padding(.top, 12)
            Text("The size of the icon and the horizontal and vertical alignment can be configured.")
                .fontWeight(.light)

            let configurationIcon1 = iconConfiguration(with: Color.pink,
                                                       title: cockerTitle,
                                                       subtitle: cockerDescription,
                                                       iconName: cockerIcon)

            TitleSubtitleIconView(configuration: configurationIcon1)

            let configurationIcon2 = iconConfiguration(with: Color.gray,
                                                       title: cockerTitle,
                                                       subtitle: cockerDescription,
                                                       iconName: cockerIcon)

            TitleSubtitleIconView(configuration: configurationIcon2)

            let configurationIcon3 = iconConfiguration(with: Color.green,
                                                       title: cockerTitle,
                                                       subtitle: cockerDescription,
                                                       iconName: cockerIcon)

            TitleSubtitleIconView(configuration: configurationIcon3)

        }
        .padding()
    }

    private func iconConfiguration(with color: Color, title: String, subtitle: String, iconName: String) -> TitleSubtitleIconView.Configuration {
        TitleSubtitleIconView.Configuration(backgroundColor: color,
                                            title: title,
                                            titleFont: .title,
                                            titleWeight: .bold,
                                            subtitle: subtitle,
                                            subtitleFont: .body,
                                            subtitleWeight: .regular,
                                            icon: iconName,
                                            iconSize: CGSize(width: 60, height: 60),
                                            iconVerticalAlignment: .top,
                                            iconHorizontalAlignment: .center,
                                            paddingTop: 16,
                                            paddingLeading: 16,
                                            paddingTrailing: 16,
                                            paddingBottom: 16)
    }

    // swipable view
    private var example3: some View {
        Group {

            let configurationIcon1 = iconConfiguration(with: Color.pink,
                                                       title: huskyTitle,
                                                       subtitle: huskyDescription,
                                                       iconName: huskyIcon)

            let configurationIcon2 = iconConfiguration(with: Color.blue,
                                                       title: cockerTitle,
                                                       subtitle: cockerDescription,
                                                       iconName: cockerIcon)


            SwipableViewContainer(subviews: [TitleSubtitleIconView(configuration: configurationIcon2),
                                             TitleSubtitleIconView(configuration: configurationIcon1)])
        }
    }

    // MARK: - Auxiliar variables for titles and descriptions of dogs.
    // In a real production application these vars will fit better in a view model
    // but this catalog is only focused on showing UI in SwiftUI, not in architecture or data organization

    private var huskyIcon: String {
        "husky"
    }

    private var huskyTitle: String {
        "Husky"
    }

    private var huskyDescription: String {
        "The Siberian Husky is a medium-sized working sled dog breed. The breed belongs to the Spitz genetic family. It is recognizable by its thickly furred double coat, erect triangular ears, and distinctive markings, and is smaller than the similar-looking Alaskan "
    }

    private var cockerIcon: String {
        "cocker"
    }

    private var cockerTitle: String {
        "English Cocker Spaniel"
    }

    private var cockerDescription: String {
        "The English Cocker Spaniel is a breed of gun dog. It is noteworthy for producing one of the most varied numbers of pups in a litter among all dog breeds. "
    }

}

struct CommonlyUsedViews_Previews: PreviewProvider {
    static var previews: some View {
        CommonlyUsedViews()
    }
}

