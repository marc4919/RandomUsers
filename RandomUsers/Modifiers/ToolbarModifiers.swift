//
//  ToolbarModifiers.swift
//  RandomUsers
//
//  Created by Marc Garcia Teodoro on 30/4/25.
//

import SwiftUI

struct ToolbarModifiers: ViewModifier {
    @Environment(UsersVM.self) var vm

    @State private var shouldRotate = false
    @State private var showCreateSheet = false

    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Menu {
                        Button {
                            vm.orderByName()
                            shouldRotate.toggle()
                        } label: {
                            Text("Order by name")
                            Text("Asc / Desc")
                        }
                    } label: {
                        Image(systemName: "arrow.up.arrow.down")
                            .symbolEffect(.rotate, value: shouldRotate)
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showCreateSheet.toggle()
                    } label: {
                        Text("Add")
                    }.sheet(isPresented: $showCreateSheet) {
                        CreateUserView(isThisViewShown: $showCreateSheet)
                            .presentationDetents([.medium])
                            .presentationDragIndicator(.visible)
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
