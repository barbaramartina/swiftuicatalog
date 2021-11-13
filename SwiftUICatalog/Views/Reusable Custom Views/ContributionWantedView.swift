//
//  ContributionWantedView.swift
//  SwiftUICatalog
//
//  Created by Barbara Rodeker on 13.11.21.
//

import SwiftUI

struct ContributionWantedView: View {
    var body: some View {

        VStack {
            Text("This section is open to contributions. If you'd like to code it, you can find the project here:")
                .padding()

            Button(action: {
                UIApplication.shared.open(URL(string: "https://github.com/barbaramartina/swiftuicatalog/")!)

            },
                   label: {

                HStack {
                    Image("github")
                        .resizable()
                        .frame(width: 48, height: 48)

                    Text("SwiftUI Catalog ")
                       
                }
                .modifier(ButtonFontModifier())
                .overlay(
                        RoundedCorners(tl: 10,
                                       tr: 10,
                                       bl: 10,
                                       br: 10)
                            .stroke(Color.accentColor, lineWidth: 5)
                    )

                }
                
            )
        }.padding()
    }
}

struct ContributionWantedView_Previews: PreviewProvider {
    static var previews: some View {
        ContributionWantedView()
    }
}
