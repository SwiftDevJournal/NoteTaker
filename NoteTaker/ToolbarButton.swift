//
//  ToolbarButton.swift
//  NoteTaker
//
//  Created by mark on 8/9/19.
//  Copyright © 2019 Swift Dev Journal. All rights reserved.
//

import Cocoa

class ToolbarButton: NSToolbarItem {

    // This code is from the answer I found on Stack Overflow
    // NSToolbarItem validation in relevant controller
    // URL: https:// stackoverflow.com/questions/42470645/nstoolbaritem-validation-in-relevant-controller
    override func validate() {
        if let control = self.view as? NSControl,
            let action = self.action,
            let validator = NSApp.target(forAction: action, to: self.target, from: self) as AnyObject? {
        
            switch validator {
            case let validator as NSUserInterfaceValidations:
                control.isEnabled = validator.validateUserInterfaceItem(self)
            default:
                control.isEnabled = validator.validateToolbarItem(self)
            }
            
        } else {
            super.validate()
        }
    }
}
