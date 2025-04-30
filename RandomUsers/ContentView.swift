//
//  ContentView.swift
//  RandomUsers
//
//  Created by Marc Garcia Teodoro on 23/4/25.
//

import SwiftUI

struct ContentView: View {
    let users = getUsers()
    
    @State private var searchText = ""
    
    var usersFiltered: [User] {
        searchText.isEmpty
            ? users
            : users.filter { user in
                user.firstName.localizedCaseInsensitiveContains(searchText)
            }
    }
    
    var body: some View {
        NavigationSplitView {
            List(usersFiltered) { user in
                NavigationLink {
                    UserDetailView(user: user)
                } label: {
                    UserCell(user: user)
                }
            }
            .navigationTitle("Random Users")
            .commonToolbar
            .listStyle(.plain)
        } detail: {
            ContentUnavailableView(
                "Select a user",
                systemImage: "person.circle"
            )
        }
        .searchable(text: $searchText, prompt: "Search for a user")
    }
}

#Preview {
    ContentView()
}
