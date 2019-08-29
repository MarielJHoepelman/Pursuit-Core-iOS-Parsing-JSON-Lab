//
//  Color.swift
//  Parsing-JSON-Lab
//
//  Created by Mariel Hoepelman on 8/27/19.
//  Copyright © 2019 Mariel Hoepelman. All rights reserved.
//

import Foundation

enum ColorJSONError: Error {
    case decodingError(Error)
}

struct ColorJSON: Codable {
    var color: [Color]
    
    static func getColors(from data: Data) throws -> ColorJSON {
        do {
            let allColors = try
                JSONDecoder().decode(ColorJSON.self, from: data)
            return allColors
        } catch {
            throw ColorJSONError.decodingError(error)
        }
    }
}

struct Color: Codable {
    var hex: Hexadecimal
    var rgb: RGB
    var name: Name
}

struct Hexadecimal: Codable {
    let value: String
    let clean: String
}

struct RGB: Codable {
    let fraction: Fraction
}

struct Fraction: Codable {
    var r: Double
    var g: Double
    var b: Double
    
}

struct Name: Codable {
    var value: String
}

