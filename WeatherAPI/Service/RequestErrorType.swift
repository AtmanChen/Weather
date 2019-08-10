//
//  RequestErrorType.swift
//  WeatherAPI
//
//  Created by 黄永乐 on 2019/8/10.
//  Copyright © 2019 黄永乐. All rights reserved.
//

import Foundation

public enum WeatherError: Error {
    case requestFailed(message: String)
    case responseEmpty
    case jsonParseFaield
}
