//
//  ForecastWeather.swift
//  Models
//
//  Created by 黄永乐 on 2019/8/11.
//  Copyright © 2019 黄永乐. All rights reserved.
//

import Foundation

public struct City: Decodable {
    public let coord: Coordinate
    public let country: String
    public let id: Int
    public let name: String
    public let population: Int
    public let timezone: Int
}

public struct Temp: Decodable {
    public let day: Double
    public let eve: Double
    public let max: Double
    public let min: Double
    public let morn: Double
    public let night: Double
}

public struct DailyWeather: Decodable {
    public let clouds: Int
    public let deg: Int
    public let humidity: Int
    public let temp: Temp
    public let weather: [Weather]
    public let dt: Double
}



public struct ForecastWeather: Decodable {
    public let city: City
    public let cnt: Int
    public let list: [DailyWeather]
    public let cod: String
}
