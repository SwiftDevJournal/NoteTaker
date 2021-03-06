//
//  ValidateNoteDeletion.swift
//  NoteTaker
//
//  Created by mark on 8/9/19.
//  Copyright © 2019 Swift Dev Journal. All rights reserved.
//

import Cocoa

// Validate the Delete Note menu item and toolbar button so they are disabled if the notes array is empty.

extension SplitViewController {
    
    override func validateUserInterfaceItem(_ item: NSValidatedUserInterfaceItem) -> Bool {
        switch item.action {
        case #selector(deleteNote(_:))?:
            return !(notes.isEmpty)
        // Add any other items you want to validate, such as additional menu items.
        default:
            return true
        }
    }
}
