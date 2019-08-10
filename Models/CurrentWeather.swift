//
//  CurrentWeather.swift
//  Models
//
//  Created by 黄永乐 on 2019/8/10.
//  Copyright © 2019 黄永乐. All rights reserved.
//

import Foundation

public struct Coordinate: Codable {
    public let lat: Double
    public let lon: Double
}

public struct Weather: Decodable {
    public let id: Int
    public let main: String
    public let description: String
    public let icon: String
}

public struct Wind: Decodable {
    public let speed: Double
    public let deg: Int
}

public struct Clouds: Decodable {
    public let all: Int
}

public struct LocationMessage: Decodable {
    public let message: Double
    public let country: String
    public let sunrise: Int
    public let sunset: Int
}

public struct MainDescription: Decodable {
    public let temp: Double
    public let pressure: Double
    public let humidity: Int
    public let minTemp: Double
    public let maxTemp: Double
    
    private enum CodingKeys: String, CodingKey {
        case minTemp = "temp_min"
        case maxTemp = "temp_max"
        case temp
        case pressure
        case humidity
    }
}

public struct CurrentWeather: Decodable {
    public let coord: Coordinate
    public let code: Int
    public let name: String
    public let id: Int
    public let locationMessage: LocationMessage
    public let clouds: Clouds
    public let wind: Wind
    public let date: Int
    public let main: MainDescription
    
    private enum CodingKeys: String, CodingKey {
        case coord
        case code
        case name
        case id
        case locationMessage = "sys"
        case clouds
        case wind
        case date
        case main
    }
}
