//
//  WeatherCell.swift
//  Weather
//
//  Created by 黄永乐 on 2019/8/10.
//  Copyright © 2019 黄永乐. All rights reserved.
//

import Cocoa

class WeatherCell: NSCollectionViewItem {

    @IBOutlet weak var highTemperatureLabel: NSTextField!
    @IBOutlet weak var lowTemperatureLabel: NSTextField!
    @IBOutlet weak var weatherImageView: NSImageView!
    @IBOutlet weak var weekDayLabel: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.wantsLayer = true
        view.layer?.backgroundColor = NSColor.textBackgroundColor.withAlphaComponent(0.1).cgColor
        view.layer?.cornerRadius = 5
    }
    
    override func viewWillAppear() {
        super.viewWillAppear()
        highTemperatureLabel.layer?.backgroundColor = .clear
        lowTemperatureLabel.layer?.backgroundColor = .clear
        weekDayLabel.layer?.backgroundColor = .clear
    }
    
}
