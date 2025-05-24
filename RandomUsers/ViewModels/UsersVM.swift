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
    
    var searchText = ""
    
    var usersFiltered: [User] {
        searchText.isEmpty
            ? users
            : users.filter { user in
                user.firstName.localizedCaseInsensitiveContains(searchText)
            }
    }

    init(repository: DataRepository = Repository()) {
        self.repository = repository
        do {
            self.users = try repository.getUsers()
        } catch {
            self.users = []
            print(error)
        }
    }
    
    func createUser(firstName: String, lastName: String, email: String){
        let newUser = User(email: email, firstName: firstName, lastName: lastName, avatar: nil)
        users.append(newUser)
    }
}
