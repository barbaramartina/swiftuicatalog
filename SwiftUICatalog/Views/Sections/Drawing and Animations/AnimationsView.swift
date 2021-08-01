//
//  AnimationsView.swift
//  SwiftUICatalog
//
// MIT License
//
// Copyright (c) 2021 Barbara Rodeker
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//
//

import SwiftUI

///
/// Examples on how to use  ANIMATIONS  in SwiftUI
/// OFFICIAL DOCUMENTATION:
/// https://developer.apple.com/documentation/swiftui/animation
/// https://developer.apple.com/documentation/swiftui/withanimation(_:_:)
/// https://developer.apple.com/documentation/swiftui/animatablepair
/// https://developer.apple.com/documentation/swiftui/emptyanimatabledata
/// https://developer.apple.com/documentation/swiftui/anytransition
/// 
///

struct AnimationsView: View {
    
    // MARK: - Properties
    
    @State private var animate1 = false
    @State private var animate2 = false
    @State private var animate3 = false
    
    
    // MARK: - Body
    
    
    var body: some View {
        
        NavigationView {
            
            List {
                Link(destination:                         RobbieWithPulseView(),
                     label: "Pulse animation")
                Link(destination: PropertiesAnimationsView(),
                     label: "Properties animations")
                Link(destination: TransitionsAnimationsView(),
                     label: "Transitions animations")
                Link(destination: MotionAnimationView(),
                     label: "Moving circles animations")
            }

        }
        .navigationTitle("Animations")
        .padding(.top, 24)
        .background(Color.white)

    }
}

// MARK: - previews

struct AnimationsView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationsView()
            .previewLayout(.sizeThatFits)
    }
}

// MARK: - extensions of animations


extension Animation {
    static func ripple(index: Int) -> Animation {
        Animation.spring(dampingFraction: 0.5)
            .speed(2)
            .delay(0.03 * Double(index))
    }
}

// MARK: - Properties animations

struct PropertiesAnimationsView: View {
    
    // MARK: - Properties
    
    @State private var animate1 = false
    @State private var animate2 = false
    @State private var animate3 = false
    @State private var animate4 = false

    
    // MARK: - Body
    

    var body: some View {
        
        VStack(alignment: .center) {
            List {
                Text( "*Touch on the images")
                    .font(.footnote)
                
                // MARK: - animating local properties
                
                Group {
                    HeaderView(title: "Animating a toggle on a boolean")
                    Button(action: {
                        withAnimation(.easeInOut(duration: 3)) {
                            self.animate3.toggle()
                        }
                    }) {
                        HStack {
                            Spacer()
                            Image("corgie-love")
                                .resizable()
                                .rotationEffect(.degrees(animate3 ? 90 : 0))
                                .scaleEffect(animate3 ? 1.2 : 1)
                                .frame(width: 200, height: 200)
                            Spacer()
                        }
                        .padding()
                        // end of h stack
                    }
                    // end of h stack
                }
                // end of group
                
                
                // MARK: - rotation animated
                Group {
                    HeaderView(title: "Rotation animated easeIn Out")
                    Button(action: {
                        self.animate1.toggle()
                    }) {
                        HStack {
                            Spacer()
                            Image("corgie-love")
                                .resizable()
                                .rotationEffect(.degrees(animate1 ? 90 : 0))
                                .scaleEffect(animate1 ? 1.2 : 1)
                                .frame(width: 200, height: 200)
                                .animation(.easeInOut.repeatCount(3))
                            Spacer()
                        }
                        .padding()
                        // end of h stack
                    }
                }
                // end of group
                
                // MARK: - Spring rotation
                Group {
                    HeaderView(title: "Rotation animation with Spring")
                    Button(action: {
                        self.animate2.toggle()
                    }) {
                        HStack {
                            Spacer()
                            Image("corgie-love")
                                .resizable()
                                .rotationEffect(.degrees(animate2 ? 90 : 0))
                                .scaleEffect(animate2 ? 1.2 : 1)
                                .frame(width: 200, height: 200)
                                .animation(.spring().repeatCount(3))
                            Spacer()
                        }
                        .padding()
                        // end of h stack
                    }
                    // end of h stack
                }
                // end of group
                
                // MARK: - ripple
                Group {
                    HeaderView(title: "Ripple animation")
                    Button(action: {
                        self.animate4.toggle()
                    }) {
                        HStack {
                            Spacer()
                            Image("corgie-love")
                                .resizable()
                                .rotationEffect(.degrees(animate4 ? 90 : 0))
                                .scaleEffect(animate4 ? 1.2 : 1)
                                .frame(width: 200, height: 200)
                                .animation(.ripple(index: 2))
                            Spacer()
                        }
                        .padding()
                        // end of h stack
                    }
                    // end of h stack
                }
                // end of group

            }
            // end of list
        }
        // end of v stack

    }
    
}

// MARK: - transitions

struct TransitionsAnimationsView: View {
    
    // MARK: - Properties
    
    @State private var animate1 = false
    @State private var animate2 = false
    @State private var animate3 = false

    
    // MARK: - Body
    

    var body: some View {
        
        if self.animate2 == false && self.animate3 == false {
            Button(action: {
                withAnimation {
                    self.animate1.toggle()
                }
            }, label: {
                Text("Slide in & out")
                    .modifier(ButtonFontModifier())

            })
            .padding()
            .modifier(ButtonRoundedModifier(radius: 10,
                                            lineWidth: 5))

        }

        if self.animate1 == false && self.animate3 == false {
            Button(action: {
                withAnimation {
                    self.animate2.toggle()
                }
            }, label: {
                Text("Transition with opacity")
                    .modifier(ButtonFontModifier())

            })
            .padding()
            .modifier(ButtonRoundedModifier(radius: 10,
                                            lineWidth: 5))

        }

        if self.animate1 == false && self.animate2 == false {
            Button(action: {
                withAnimation {
                    self.animate3.toggle()
                }
            }, label: {
                Text("Transition moving and fading")
                    .modifier(ButtonFontModifier())

            })
            .padding()
            .modifier(ButtonRoundedModifier(radius: 10,
                                            lineWidth: 5))

        }

        if animate1 {
            Image("corgie-love")
                .resizable()
                .frame(width: 200, height: 200)
                .transition(.slide)
        }

        if animate2 {
            Image("corgie-love")
                .resizable()
                .frame(width: 200, height: 200)
                .transition(.opacity)
        }
        
        if animate3 {
            Image("corgie-love")
                .resizable()
                .frame(width: 200, height: 200)
                .transition(.moveAndFade)
        }

    }

}

// MARK: - custom transitions
        

extension AnyTransition {
    static var moveAndFade: AnyTransition {
        let insertion = AnyTransition.move(edge: .leading)
            .combined(with: .opacity)
        let removal = AnyTransition.scale
            .combined(with: .opacity)
        return .asymmetric(insertion: insertion, removal: removal)
    }
}
