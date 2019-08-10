//
//  Extensions.swift
//  Utils
//
//  Created by 黄永乐 on 8/10/19.
//  Copyright © 2019 黄永乐. All rights reserved.
//

import Foundation


public extension Date {
    static var todayString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = .current
        dateFormatter.dateStyle = .medium
        return dateFormatter.string(from: Date())
    }
}
