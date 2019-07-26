//
//  AppDelegate.swift
//  NoteTaker
//
//  Created by mark on 6/26/19.
//  Copyright © 2019 Swift Dev Journal. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    var saveTimer = Timer()

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        startTimer()
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
        stopTimer()
    }
    
    func applicationDidBecomeActive(_ notification: Notification) {
        startTimer()
    }
    
    func applicationDidResignActive(_ notification: Notification) {
        stopTimer()
    }

    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return true
    }
    
    // MARK: Timer functions
    func startTimer() {
        // Autosave every 30 seconds.
        let app = NSApplication.shared
        if let splitViewController = app.windows.first?.contentViewController as? SplitViewController {
            
            saveTimer = Timer.scheduledTimer(timeInterval: 30.0, target: splitViewController, selector: #selector(SplitViewController.saveNotes), userInfo: nil, repeats: true)
        }
        
    }
    
    func stopTimer() {
        saveTimer.invalidate()
    }

}

