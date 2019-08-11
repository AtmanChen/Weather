//
//  WeatherCell.swift
//  Weather
//
//  Created by 黄永乐 on 2019/8/10.
//  Copyright © 2019 黄永乐. All rights reserved.
//

import Cocoa
import Models

class WeatherCell: NSCollectionViewItem {

    @IBOutlet weak var highTemperatureLabel: NSTextField!
    @IBOutlet weak var lowTemperatureLabel: NSTextField!
    @IBOutlet weak var weatherImageView: NSImageView!
    @IBOutlet weak var weekDayLabel: NSTextField!
    
    var dailyWeather: DailyWeather! {
        didSet {
            highTemperatureLabel.stringValue = "\(Int(dailyWeather.temp.max))°"
            lowTemperatureLabel.stringValue = "\(Int(dailyWeather.temp.min))°"
            weatherImageView.image = NSImage(imageLiteralResourceName: dailyWeather.weather.first!.main)
            weekDayLabel.stringValue = dailyWeather.dt.weekDay
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override class func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func viewWillAppear() {
        super.viewWillAppear()
        view.wantsLayer = true
        view.layer?.backgroundColor = NSColor.textBackgroundColor.withAlphaComponent(0.1).cgColor
        view.layer?.cornerRadius = 5
        highTemperatureLabel.layer?.backgroundColor = .clear
        lowTemperatureLabel.layer?.backgroundColor = .clear
        weekDayLabel.layer?.backgroundColor = .clear
    }
    
}
