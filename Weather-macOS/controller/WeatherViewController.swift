//
//  WeatherViewController.swift
//  Weather
//
//  Created by 黄永乐 on 8/10/19.
//  Copyright © 2019 黄永乐. All rights reserved.
//

import Cocoa
import WeatherUtils
import WeatherNetwork
import WeatherModels

class WeatherViewController: NSViewController {

    @IBOutlet weak var weatherDescriptionLabel: NSTextField!
    @IBOutlet weak var weatherImageView: NSImageView!
    @IBOutlet weak var locationLabel: NSTextField!
    @IBOutlet weak var temperatureLabel: NSTextField!
    @IBOutlet weak var dateLabel: NSTextField!
    @IBOutlet weak var collectionView: NSCollectionView!
    
    var currentWeather: CurrentWeather! {
        didSet {
            DispatchQueue.main.async {
                self.locationLabel.stringValue = self.currentWeather.name.capitalized
                self.dateLabel.stringValue = "Today is, \(Date.todayString)"
                self.weatherDescriptionLabel.stringValue = self.currentWeather.weather.first!.main.capitalized
                self.temperatureLabel.stringValue = "\(Int(self.currentWeather.main.temp))°".capitalized
                self.weatherImageView.image = NSImage(imageLiteralResourceName: self.currentWeather.weather.first!.main)
            }
        }
    }
    
    var forecastWeather: ForecastWeather! {
        didSet {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(didReceivedForecastData(_:)), name: NSNotification.Name(rawValue: "didReceivedForecastData"), object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: "didReceivedForecastData"), object: nil)
    }
    
    @objc
    fileprivate func didReceivedForecastData(_ notification: Notification) {
        guard let forecast = notification.object as? ForecastWeather else { return }
        self.forecastWeather = forecast
    }
    
    override func mouseMoved(with event: NSEvent) {
        super.mouseMoved(with: event)
        let location = event.locationInWindow
        print(location)
    }
    
}

extension WeatherViewController: NSCollectionViewDataSource, NSCollectionViewDelegate, NSCollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: NSCollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return forecastWeather == nil ? 0 : forecastWeather.list.count
    }
    
    func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        let forcastItem = collectionView.makeItem(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "WeatherCell"), for: indexPath) as! WeatherCell
        forcastItem.dailyWeather = forecastWeather.list[indexPath.item]
        return forcastItem
    }
    
    func collectionView(_ collectionView: NSCollectionView, layout collectionViewLayout: NSCollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> NSSize {
        return NSSize(width: 125, height: 125)
    }
    
}
