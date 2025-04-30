//
//  ToolbarModifiers.swift
//  RandomUsers
//
//  Created by Marc Garcia Teodoro on 30/4/25.
//

import SwiftUI

struct ToolbarModifiers: ViewModifier {
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
            }
    }
}

extension View {
    var commonToolbar: some View {
        self.modifier(ToolbarModifiers())
    }
}
