//
//  UsersVM.swift
//  RandomUsers
//
//  Created by Marc Garcia Teodoro on 10/5/25.
//

import Foundation
import Observation

@Observable
final class UsersVM {
    private let repository: DataRepository

    var users: [User] = []

    init(repository: DataRepository = Repository()) {
        self.repository = repository
        do {
            self.users = try repository.getUsers()
        } catch {
            self.users = []
            print(error)
        }
    }
}
