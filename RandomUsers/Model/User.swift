//
//  Model.swift
//  RandomUsers
//
//  Created by Marc Garcia Teodoro on 23/4/25.
//

import Foundation

struct User: Codable, Identifiable {
    let id: Int
    let email: String
    let firstName: String
    let lastName: String
    let avatar: URL
}

extension User: Hashable {
    static let test = User(
        id: 1,
        email: "george.bluth@reqres.in",
        firstName: "George",
        lastName: "Bluth",
        avatar: URL(string: "https://reqres.in/img/faces/1-image.jpg")!
    )

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
