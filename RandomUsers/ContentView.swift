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
        NavigationStack {
            List(users) { user in
                UserCell(user: user)
            }
        }.navigationTitle("Random Users")
    }
}

#Preview {
    ContentView()
}
