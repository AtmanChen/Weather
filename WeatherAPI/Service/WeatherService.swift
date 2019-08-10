//
//  WeatherService.swift
//  WeatherAPI
//
//  Created by 黄永乐 on 2019/8/10.
//  Copyright © 2019 黄永乐. All rights reserved.
//

import Foundation
import Models


public class WeatherService {
    
    public static let shared = WeatherService()
    private init() {}
    
    public func currentWeather(lat: Double,
                               lon: Double,
                               completion: @escaping (Result<CurrentWeather, WeatherError>) -> Void) {
        let url = currentWeatherUrl(lat: lat, lon: lon)
        URLSession.shared.dataTask(with: URL(string: url)!) { data, resp, error in
            guard error == nil else {
                completion(.failure(.requestFailed(message: error!.localizedDescription)))
                return
            }
            guard let data = data else {
                completion(.failure(.responseEmpty))
                return
            }
            
            do {
                let weather = try JSONDecoder().decode(CurrentWeather.self, from: data)
                completion(.success(weather))
            } catch {
                completion(.failure(.responseEmpty))
            }
        }.resume()
    }
}