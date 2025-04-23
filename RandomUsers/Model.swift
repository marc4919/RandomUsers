//
//  Model.swift
//  RandomUsers
//
//  Created by Marc Garcia Teodoro on 23/4/25.
//

import Foundation

struct UsersResponse: Codable {
    let results: [User]
}

struct User: Codable, Identifiable {
    let id = UUID()
    let name: Name
    let email: String
    let picture: Picture
    
    enum CodingKeys: String, CodingKey {
        case name, email, picture
    }
}

extension User {
    static let test = User(
        name: Name(title: "Miss", first: "Elsa", last: "White"),
        email: "elsa.white@example.com",
        picture: Picture(
            large: URL(string: "https://randomuser.me/api/portraits/women/46.jpg")!,
            medium: URL(string: "https://randomuser.me/api/portraits/med/women/46.jpg")!,
            thumbnail: URL(string: "https://randomuser.me/api/portraits/thumb/women/46.jpg")!
        )
    )
}

struct Name: Codable {
    let title: String
    let first: String
    let last: String
}

struct Picture: Codable {
    let large: URL
    let medium: URL
    let thumbnail: URL
}

func getUsers() -> [User] {
    guard let url = Bundle.main.url(forResource: "users", withExtension: "json") else {
        return []
    }
    
    do {
        let data = try Data(contentsOf: url)
        let response = try JSONDecoder().decode(UsersResponse.self, from: data)
        return response.results
    } catch {
        print(error)
        return []
    }
}
