//
//  Weather.swift
//  Parsing-JSON-Lab
//
//  Created by Mariel Hoepelman on 8/27/19.
//  Copyright © 2019 Mariel Hoepelman. All rights reserved.
//

import Foundation

enum weatherJSONError: Error {
    case decodingError(Error)
}

struct WeatherJSON: Codable {
    let list: [List]
    
    static func getWeather(from data: Data) throws -> WeatherJSON {
        do {
            let weather = try
                JSONDecoder().decode(WeatherJSON.self, from: data)
            print(data)
            return weather
        } catch {
            throw weatherJSONError.decodingError(error)
        }
    }
}

struct List: Codable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Codable {
    let temp: Double
}


struct Weather: Codable {
    let main: String
    let description: String
}
