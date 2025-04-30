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
                NavigationLink(destination: UserDetailView(user: user)) {
                    UserCell(user: user)
                }
            }
            .navigationTitle("Random Users")
        } detail: {
            Text("Selecciona un usuario")
        }
    }
}

#Preview {
    ContentView()
}

