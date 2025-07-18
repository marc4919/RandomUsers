//
//  RandomUsersApp.swift
//  RandomUsers
//
//  Created by Marc Garcia Teodoro on 23/4/25.
//

import SwiftUI

@main
struct RandomUsersApp: App {
    @State private var vm = UsersVM()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(vm)
        }
    }
}
