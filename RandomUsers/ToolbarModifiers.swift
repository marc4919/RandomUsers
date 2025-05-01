//
//  ToolbarModifiers.swift
//  RandomUsers
//
//  Created by Marc Garcia Teodoro on 30/4/25.
//

import SwiftUI

struct ToolbarModifiers: ViewModifier {
    
    @State var showScreenCover: Bool = false
    
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        print("Hi")
                    } label: {
                        Text("Order")
                    }
                    
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showScreenCover = true
                    } label: {
                        Text("Randomized")
                    }.fullScreenCover(isPresented: $showScreenCover, content: {
                        RandomizerView()
                    })
                    
                }
            }
    }
}

extension View {
    var commonToolbar: some View {
        self.modifier(ToolbarModifiers())
    }
}
