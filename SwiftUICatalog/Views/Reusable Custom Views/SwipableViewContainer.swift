//
//  SwipableView.swift
//  SwiftUICatalog
//
//  Created by Barbara Rodeker on 2022-06-27.
//

import SwiftUI

struct SwipableViewContainer: View {
    
    @State var swippableSubviews: [SwipableViewExample]

    @GestureState private var dragState = DragState.inactive
    @State private var lastViewIndex: Int = 1
    @State private var viewRemovalTransition = AnyTransition.trailingBottom
    private let dragAreaThreshold: CGFloat = 65.0

    
    // MARK: - MOVE THE CARD
    
    private func moveViews() {
        self.swippableSubviews.removeFirst()
        self.lastViewIndex += 1
    }
    
    // MARK: TOP VIEW
    
    private func isTopView(_ view: SwipableViewExample) -> Bool {
        guard let index = swippableSubviews.firstIndex(where: { $0.id == view.id }) else {
            return false
        }
        return index == 0
    }
    
    // MARK: - DRAG STATES
    
    enum DragState {
        case inactive
        case pressing
        case dragging(translation: CGSize)
        
        var translation: CGSize {
            switch self {
                case .inactive, .pressing:
                    return .zero
                case .dragging(let translation):
                    return translation
            }
        }
        
        var isDragging: Bool {
            switch self {
                case .dragging:
                    return true
                case .pressing, .inactive:
                    return false
            }
        }
        
        var isPressing: Bool {
            switch self {
                case .pressing, .dragging:
                    return true
                case .inactive:
                    return false
            }
        }
    }
    
    var body: some View {
        
        ZStack {
            ForEach(swippableSubviews) { subview in
                
                subview
                    .zIndex(self.isTopView(subview) ? 1 : 0)
                    .offset(x: self.isTopView(subview) ?  self.dragState.translation.width : 0, y: self.isTopView(subview) ?  self.dragState.translation.height : 0)
                    .scaleEffect(self.dragState.isDragging && self.isTopView(subview) ? 0.85 : 1.0)
                    .rotationEffect(Angle(degrees: self.isTopView(subview) ? Double(self.dragState.translation.width / 12) : 0))
                //              .withAnimation(Animation.interpolatingSpring(stiffness: 120, damping: 120)) {
                //              }
                
                    .gesture(LongPressGesture(minimumDuration: 0.01)
                        .sequenced(before: DragGesture())
                        .updating(self.$dragState, body: { (value, state, transaction) in
                            switch value {
                                case .first(true):
                                    state = .pressing
                                case .second(true, let drag):
                                    state = .dragging(translation: drag?.translation ?? .zero)
                                default:
                                    break
                            }
                        })
                             
                            .onChanged({ (value) in
                                guard case .second(true, let drag?) = value else {
                                    return
                                }
                                
                                if drag.translation.width < -self.dragAreaThreshold {
                                    self.viewRemovalTransition = .leadingBottom
                                }
                                
                                if drag.translation.width > self.dragAreaThreshold {
                                    self.viewRemovalTransition = .trailingBottom
                                }
                            })
                                .onEnded({ (value) in
                                    guard case .second(true, let drag?) = value else {
                                        return
                                    }
                                    
                                    if drag.translation.width < -self.dragAreaThreshold || drag.translation.width > self.dragAreaThreshold {
                                        self.moveViews()
                                    }
                                })
                    ).transition(self.viewRemovalTransition)
            }
        }
        .padding(.horizontal)
    }
}

struct SwipableView_Previews: PreviewProvider {
    static var previews: some View {
        let subview1 = SwipableViewExample(textContent: "View 1")
        let subview2 = SwipableViewExample(textContent: "View 2")
        let subview3 = SwipableViewExample(textContent: "View 3")
        let subview4 = SwipableViewExample(textContent: "View 4")
        let subview5 = SwipableViewExample(textContent: "View 5")
        let subviews = [subview1, subview2, subview3, subview4, subview5]
        
        SwipableViewContainer(swippableSubviews: subviews)
    }
}

// MARK: - AnyTransition

extension AnyTransition {
    static var trailingBottom: AnyTransition {
        AnyTransition.asymmetric(
            insertion: .identity,
            removal: AnyTransition.move(edge: .trailing).combined(with: .move(edge: .bottom)))
    }
    
    static var leadingBottom: AnyTransition {
        AnyTransition.asymmetric(
            insertion: .identity,
            removal: AnyTransition.move(edge: .leading).combined(with: .move(edge: .bottom)))
    }
    
}

// MARK: - SwipableView Example


struct SwipableViewExample: View, Identifiable {
    
    let id = UUID()
    let textContent: String
    
    var body: some View {
        
        VStack {
            Text(textContent)
            Image(systemName: "person")
                .frame(width: 200, height: 200, alignment: .center)
            Text(textContent)
            
        }
    }
    
}

