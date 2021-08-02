//
//  RobbieWithPulse.swift
//  SwiftUICatalog
//
//  Created by Barbara Rodeker on 01.08.21.
//

import SwiftUI

struct RobbieWithPulseView: View {
    
    @State private var pulsing: Bool = false
    
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 220, height: 220)
                .foregroundColor(.yellow)
                .scaleEffect(pulsing ? 1.2 : 1.0)
                .opacity(pulsing ? 0.1 : 1.0)
                .animation(.easeInOut(duration: 1)
                .repeatForever(autoreverses: true).speed(0.5))
                .onAppear() {
                    self.pulsing.toggle()
                }
            
            Image("corgie-love")
                .resizable()
                .scaledToFill()
            .frame(width: 200, height: 200)
            .clipShape(Circle())
          
        }
        .padding(24)
    }
}

struct RobbieWithPulse_Previews: PreviewProvider {
    static var previews: some View {
        RobbieWithPulseView()
    }
}
