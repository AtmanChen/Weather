//
//  Config.swift
//  WeatherAPI
//
//  Created by 黄永乐 on 2019/8/10.
//  Copyright © 2019 黄永乐. All rights reserved.
//

import Foundation

let API_KEY = "&APPID=0f62cb336dd0d4f91c2ba52fdf3829e2"

func currentWeatherUrl(lat: Double, lon: Double) -> String {
    return "http://api.openweathermap.org/data/2.5/weather?lat=\(lat)&lon=\(lon)\(API_KEY)"
}
