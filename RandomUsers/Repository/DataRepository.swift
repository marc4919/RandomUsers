//
//  DataRepository.swift
//  RandomUsers
//
//  Created by Marc Garcia Teodoro on 10/5/25.
//

import Foundation

struct Repository: DataRepository {}

protocol DataRepository: JSONLoader, Sendable {
    var url: URL { get }

    func getUsers() throws -> [User]
}

extension DataRepository {
    var url: URL {
        Bundle.main.url(
            forResource: "users",
            withExtension: "json"
        )!
    }

    func getUsers() throws -> [User] {
        try load(url: url, type: RandomizerDTO.self).data.map(\.toUser)
    }
}
