//
//  ContentView.swift
//  RandomUsers
//
//  Created by Marc Garcia Teodoro on 23/4/25.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            Tab("Randomizer", systemImage: "person.fill.questionmark") {
                RandomizerView()
            }
            
            
            Tab("Users", systemImage: "person.3.fill") {
                UsersListView()
            }
        }

    }
}

#Preview {
    ContentView()
        .environment(UsersVM())
}
