//
//  JSONLoader.swift
//  RandomUsers
//
//  Created by Marc Garcia Teodoro on 10/5/25.
//

import Foundation


import Foundation

protocol JSONLoader {}

extension JSONLoader {
    func load<T>(url: URL, type: T.Type) throws -> T where T: Codable {
        let data = try Data(contentsOf: url)
        return try JSONDecoder().decode(type, from: data)
    }
}
