//
//  TransitionsAnimationsView.swift
//  Catalog
//
//  Created by Barbara Personal on 2024-05-26.
//

import SwiftUI

struct TransitionsAnimationsView: View, Comparable {
    
    // MARK: - Properties
    
    let id: String = "TransitionsAnimationsView"
    
    @State private var animate1 = false
    @State private var animate2 = false
    @State private var animate3 = false
    @State private var animate4 = false
    @State private var animate5 = false
    @State private var animate6 = false
    @State private var animate7 = false
    @State private var animate8 = false
    @State private var animate9 = false
    
    // MARK: - Body
    
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Tap each button to see how the animation mentioned would look like, and then tap it again to see how the animation reverses.")
                    .fontWeight(.light)
                Spacer()
            }
            
            HStack {
                button1
                button2
                button3
                button4
            }
            HStack {
                button5
                button6
            }
            HStack {
                button7
                button8
            }
            HStack {
                button9
            }
            
            if animate1 {
                Image("corgie-love")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .transition(.slide)
                    .padding(100)
            }
            
            if animate2 {
                Image("corgie-love")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .transition(.opacity)
                    .padding(100)
            }
            
            if animate3 {
                Image("corgie-love")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .transition(.moveAndFade)
                    .padding(100)
            }
            
            if animate4 {
                Image("corgie-love")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .transition(.scale)
                    .padding(100)
            }
            if animate5 {
                Image("corgie-love")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .transition(.move(edge: .bottom))
                    .padding(.vertical, 100)
            }
            if animate6 {
                Image("corgie-love")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .transition(.leadingBottom)
                    .padding(100)
            }
            if animate7 {
                Image("corgie-love")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .transition(.trailingBottom)
                    .padding(100)
            }
            if animate8 {
                Image("corgie-love")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .transition(.push(from: .bottom))
                    .padding(100)
            }
            if animate9 {
                Image("corgie-love")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .transition(.blurReplace)
                    .padding(100)
            }
        }
        .padding(.vertical, Style.VerticalPadding.medium.rawValue)
        .padding(.horizontal, Style.HorizontalPadding.medium.rawValue)
        Spacer()
        
    }
    
    private var button1: some View {
        Button(action: {
            withAnimation {
                self.animate1.toggle()
            }
        }, label: {
            Text("Slide")
            
        })
        .buttonStyle(BorderedButtonStyle())
        
    }
    
    private var button2: some View {
        Button(action: {
            withAnimation {
                self.animate2.toggle()
            }
        }, label: {
            Text("Opacity")
        })
        .buttonStyle(BorderedButtonStyle())
        
    }
    
    private var button3: some View {
        Button(action: {
            withAnimation {
                self.animate3.toggle()
            }
        }, label: {
            Text("Fading")
        })
        .buttonStyle(BorderedButtonStyle())
        
    }
    
    private var button4: some View {
        Button(action: {
            withAnimation {
                self.animate4.toggle()
            }
        }, label: {
            Text("Scale")
        })
        .buttonStyle(BorderedButtonStyle())
    }
    
    private var button5: some View {
        Button(action: {
            withAnimation {
                self.animate5.toggle()
            }
        }, label: {
            Text("Move edge")
        })
        .buttonStyle(BorderedButtonStyle())
    }
    
    private var button6: some View {
        Button(action: {
            withAnimation {
                self.animate6.toggle()
            }
        }, label: {
            Text("Leading Bottom")
        })
        .buttonStyle(BorderedButtonStyle())
    }
    
    private var button7: some View {
        Button(action: {
            withAnimation {
                self.animate7.toggle()
            }
        }, label: {
            Text("Trailing Bottom")
        })
        .buttonStyle(BorderedButtonStyle())
    }
    
    private var button8: some View {
        Button(action: {
            withAnimation {
                self.animate8.toggle()
            }
        }, label: {
            Text("Push from Bottom")
        })
        .buttonStyle(BorderedButtonStyle())
    }
    
    private var button9: some View {
        Button(action: {
            withAnimation {
                self.animate9.toggle()
            }
        }, label: {
            Text("Blur replace")
        })
        .buttonStyle(BorderedButtonStyle())
    }
}


#Preview {
    TransitionsAnimationsView()
}
