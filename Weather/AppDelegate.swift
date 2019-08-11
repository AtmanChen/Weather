//
//  AppDelegate.swift
//  Weather
//
//  Created by 黄永乐 on 8/10/19.
//  Copyright © 2019 黄永乐. All rights reserved.
//

import Cocoa
import WeatherAPI
import Models
import LocationService

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {


    let statusBarItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
    
    fileprivate var currentWeather: CurrentWeather!
    fileprivate var forecastWeather: ForecastWeather!

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        
        statusBarItem.button?.title = "--°"
        statusBarItem.button?.action = #selector(AppDelegate.displayPopup(_:))
        statusBarItem.button?.isEnabled = false
        
        LocationService.shared.startService { result in
            switch result {
            case let .success(coord):
                WeatherService.shared.currentWeather(lat: coord.lat, lon: coord.lon) { result in
                    DispatchQueue.main.async {
                        switch result {
                        case let .success(weather):
                            self.currentWeather = weather
                            let degreeString = "\(Int(self.currentWeather.main.temp))°"
                            self.statusBarItem.button?.title = degreeString
                            self.statusBarItem.button?.isEnabled = true
                        default: break
                        }
                    }
                }
                WeatherService.shared.forecastWeather(lat: coord.lat, lon: coord.lon) { result in
                    switch result {
                    case let .success(forecast):
                        self.forecastWeather = forecast
                    default: break
                    }
                }
            default: break
            }
        }
        
        
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    @objc
    func displayPopup(_ sender: AnyObject) {
        let popUpView = NSPopover()
        let weatherController = NSStoryboard(name: "Main", bundle: .main).instantiateController(withIdentifier: "WeatherViewController") as! WeatherViewController
        popUpView.behavior = .transient
        popUpView.contentViewController = weatherController
        popUpView.show(relativeTo: statusBarItem.button!.bounds, of: statusBarItem.button!, preferredEdge: .maxY)
        weatherController.currentWeather = self.currentWeather
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "didReceivedForecastData"), object: self.forecastWeather)
        NSApp.activate(ignoringOtherApps: true)
    }
    
    func applicationWillResignActive(_ notification: Notification) {
        NSApp.abortModal()
    }

}

