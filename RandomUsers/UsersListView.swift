//
//  UsersListView.swift
//  RandomUsers
//
//  Created by Marc Garcia Teodoro on 4/5/25.
//

import SwiftUI

struct UsersListView: View {
    @Environment(UsersVM.self) var vm

    @State private var selectedUser: User? = nil

    var body: some View {
        @Bindable var vm = vm
        NavigationSplitView(
            sidebar: {
                List(vm.usersFiltered, selection: $selectedUser) { user in
                    NavigationLink(value: user) {
                        UserCell(user: user)
                    }
                }
                .navigationTitle("Random Users")
                .commonToolbar
                .listStyle(.plain)
            },
            detail: {
                if selectedUser != nil {
                    UserDetailView(user: $selectedUser)

                } else {
                    ContentUnavailableView(
                        "Select a user",
                        systemImage: "person.circle"
                    )
                }
            }
        )
        .searchable(text: $vm.searchText, prompt: "Search for a user")
    }
}

#Preview {
    UsersListView()
        .environment(UsersVM())
}
