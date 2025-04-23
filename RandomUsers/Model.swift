//
//  Model.swift
//  RandomUsers
//
//  Created by Marc Garcia Teodoro on 23/4/25.
//

import Foundation

struct UsersResponse: Codable {
    let data: [User]
}

struct User: Codable, Identifiable {
    let id: Int
    let email: String
    let firstName: String
    let lastName: String
    let avatar: URL

    enum CodingKeys: String, CodingKey {
        case id
        case email
        case firstName = "first_name"
        case lastName = "last_name"
        case avatar
    }
}

extension User {
    static let test = User(id: 1, email: "george.bluth@reqres.in", firstName: "George", lastName: "Bluth", avatar: URL(string: "https://reqres.in/img/faces/1-image.jpg")!)
}

func getUsers() -> [User] {
    guard let url = Bundle.main.url(forResource: "users", withExtension: "json") else {
        return []
    }
    
    do {
        let data = try Data(contentsOf: url)
        let response = try JSONDecoder().decode(UsersResponse.self, from: data)
        return response.data
    } catch {
        print(error)
        return []
    }
}
