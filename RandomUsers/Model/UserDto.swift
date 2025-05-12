//
//  UserDTO.swift
//  RandomUsers
//
//  Created by Marc Garcia Teodoro on 10/5/25.
//

import Foundation

struct RandomizerDTO: Codable {
    let data: [UserDTO]
}

struct UserDTO: Codable {
    let id: Int
    let email: String
    let first_name: String
    let last_name: String
    let avatar: URL

    var toUser: User {
        User(
            id: id,
            email: email,
            firstName: first_name,
            lastName: last_name,
            avatar: avatar
        )
    }
}
