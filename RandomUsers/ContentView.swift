//
//  ContentView.swift
//  RandomUsers
//
//  Created by Marc Garcia Teodoro on 23/4/25.
//

import SwiftUI

struct ContentView: View {
    let users = getUsers()
    var body: some View {
        NavigationSplitView {
            List(users) { user in
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
    }
}

#Preview {
    ContentView()
}
