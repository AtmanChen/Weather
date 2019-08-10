//
//  AppDelegate.swift
//  Weather
//
//  Created by 黄永乐 on 8/10/19.
//  Copyright © 2019 黄永乐. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {


    let statusBarItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        
        statusBarItem.button?.title = "--°"
        statusBarItem.button?.action = #selector(AppDelegate.displayPopup(_:))
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
    }


}

