//
//  ToolbarModifiers.swift
//  RandomUsers
//
//  Created by Marc Garcia Teodoro on 30/4/25.
//

import SwiftUI

struct ToolbarModifiers: ViewModifier {

    @State var showAddSheet: Bool = false

    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        print("Ordering...")
                    } label: {
                        Text("Order")
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showAddSheet.toggle()
                    } label: {
                        Text("Add")
                    }.sheet(isPresented: $showAddSheet) {
                        CreateUserView()
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
