//
//  User.swift
//  Parsing-JSON-Lab
//
//  Created by Mariel Hoepelman on 8/27/19.
//  Copyright © 2019 Mariel Hoepelman. All rights reserved.
//

import Foundation

enum UserJSONError: Error {
    case decodingError(Error)
}


struct Users: Codable {
    let results: [Results]
    
    static func getUsers(from data: Data) throws -> [Users] {
        do {
            let allUsers = try
                JSONDecoder().decode([Users].self, from: data)
            return allUsers
        } catch {
            throw UserJSONError.decodingError(error)
        }
    }
}

struct Results: Codable {
    let name: Name
    let location: Location
    let email: Email
    let dob: DOB
    let phone: Phone
}

struct UserName: Codable {
    let first: String
    let last: String
}

struct Location: Codable {
    let street: String
    let city: String
    let state: String
    let postcode: Int
}

struct Email: Codable {
    let email: String
}

struct DOB: Codable {
    let date: String
}

struct Phone: Codable {
    let phone: String
}
