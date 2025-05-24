//
//  Model.swift
//  RandomUsers
//
//  Created by Marc Garcia Teodoro on 23/4/25.
//

import Foundation

struct User: Codable, Identifiable {
    let id = UUID()
    let email: String
    let firstName: String
    let lastName: String
    let avatar: URL?
    
    init(email: String, firstName: String, lastName: String, avatar: URL? = nil) {
        self.email = email
        self.firstName = firstName
        self.lastName = lastName
        self.avatar = avatar
    }
    
    enum CodingKeys: String, CodingKey {
        case email
        case firstName = "first_name"
        case lastName = "last_name"
        case avatar
    }
}

extension User: Hashable {
    static let test = User(
        email: "george.bluth@reqres.in",
        firstName: "George",
        lastName: "Bluth",
        avatar: URL(string: "https://reqres.in/img/faces/1-image.jpg")!
    )

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
