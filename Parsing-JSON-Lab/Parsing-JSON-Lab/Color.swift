//
//  Color.swift
//  Parsing-JSON-Lab
//
//  Created by Mariel Hoepelman on 8/27/19.
//  Copyright © 2019 Mariel Hoepelman. All rights reserved.
//

import Foundation

enum JSONError: Error {
    case decodingError(Error)
}

struct colorJSON: Codable {
    var color: [Color]
    
    //do static function here 
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

