//
//  SheetsView.swift
//  SwiftUICatalog
//
//  Created by Barbara Rodeker on 12.07.21.
//

import SwiftUI

///
/// Examples on how to make use of sheets in SwiftUI
/// OFFICIAL DOCUMENTATION https://developer.apple.com/documentation/swiftui/view/sheet(ispresented:ondismiss:content:)
///
struct SheetView: View, Comparable {
    
    // MARK: - Properties
    
    
    let id: String = "SheetView"
    
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.dismiss) var dismiss
    
    // MARK: - Body
    
    
    var body: some View {
        
        PageContainer(content:
                        
                        Button("Press to dismiss") {
            presentationMode.wrappedValue.dismiss()
            // iOS15 dismiss
            // dismiss()
        }
            .font(.title)
            .padding()
            .foregroundColor(.white)
            .background(Color.black)
            .cornerRadius(6)
                      
        )
        // end of page container
        
    }
}

struct SheetsView: View {
    
    // MARK: - Properties
    
    @State private var showingSheet = false
    @State private var showingSheet2 = false
    
    // MARK: - Body
    
    
    var body: some View {
        
        Spacer()
        
        Button("Show single button Sheet") {
            showingSheet.toggle()
        }
        .sheet(isPresented: $showingSheet) {
            SheetView()
        }
        .padding(20)
        .font(.largeTitle)
        .presentationSizing(.form)
        
        Spacer()
        
        Button("Show multitext Sheet") {
            showingSheet2.toggle()
        }
        .sheet(isPresented: $showingSheet2,
               onDismiss: didDismiss) {
            VStack(alignment: .center) {
                Text("Robbi likes bones")
                    .font(.title)
                    .padding(50)
                Text("""
                            Specially in the evenings.
                            """)
                .padding(50)
                Button("Go feed Robbi",
                       action: {
                    showingSheet2.toggle()
                }
                )
                .font(.title)
                .padding()
                .background(Color.black)
                .cornerRadius(6)
            }
        }
               .padding(20)
               .font(.largeTitle)
        
        Spacer()
        
    }
    
    // MARK: - Functions
    
    private func didDismiss() {
        // Handle the dismissing action.
    }
}

struct SheetsView_Previews: PreviewProvider {
    static var previews: some View {
        SheetsView()
        
    }
}


// MARK: - HASHABLE

extension SheetView {
    
    static func == (lhs: SheetView, rhs: SheetView) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    
}


