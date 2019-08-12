//
//  Extensions.swift
//  Utils
//
//  Created by 黄永乐 on 8/10/19.
//  Copyright © 2019 黄永乐. All rights reserved.
//

import Foundation

private let kKalvinDegree = 273

public extension Date {
    static var todayString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = .current
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        return dateFormatter.string(from: Date())
    }
}

public extension Int {
    var cellDegree: Int {
        return self - kKalvinDegree
    }
}

public extension Double {
    var weekDay: String {
        let date = Date(timeIntervalSince1970: self)
        let weekDay = Calendar.current.dateComponents([.weekday], from: date)
        guard let w = weekDay.weekday else {
            return ""
        }
        let dateFormatter = DateFormatter()
        dateFormatter.locale = .current
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        return dateFormatter.weekdaySymbols![w - 1]
    }
}
