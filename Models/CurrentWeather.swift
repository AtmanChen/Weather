//
//  CurrentWeather.swift
//  Models
//
//  Created by 黄永乐 on 2019/8/10.
//  Copyright © 2019 黄永乐. All rights reserved.
//

import Foundation

public struct Coordinate: Decodable {
    public let lat: Double
    public let lon: Double
    
    public init(lat: Double, lon: Double) {
        self.lat = lat
        self.lon = lon
    }
}

public struct Weather: Decodable {
    public let id: Int
    public let main: String
    public let description: String
    public let icon: String
}

public struct Wind: Decodable {
    public let speed: Double?
    public let deg: Double?
}

public struct Clouds: Decodable {
    public let all: Int
}

public struct LocationMessage: Decodable {
    public let country: String
    public let sunrise: Double
    public let sunset: Double
}

public struct MainDescription: Decodable {
    public let temp: Double
    public let pressure: Int
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
    public let cod: Int
    public let name: String
    public let id: Int
    public let sys: LocationMessage
    public let clouds: Clouds
    public let wind: Wind
    public let dt: Double
    public let main: MainDescription
    public let weather: [Weather]
    
    private enum CodingKeys: String, CodingKey {
        case coord
        case cod
        case name
        case id
        case sys
        case clouds
        case wind
        case dt
        case main
        case weather
    }
}
