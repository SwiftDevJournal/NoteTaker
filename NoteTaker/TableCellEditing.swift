//
//  TableCellEditing.swift
//  NoteTaker
//
//  Created by mark on 6/29/19.
//  Copyright © 2019 Swift Dev Journal. All rights reserved.
//

import Cocoa

extension TableViewController: NSControlTextEditingDelegate {
    
    // I have to implement NSControlTextEditingDelegate's textShouldEndEditing method to change the note title by editing its name in the table view.
    func control(_ control: NSControl, textShouldEndEditing fieldEditor: NSText) -> Bool {
        let selectedRow = tableView.selectedRow
        if let splitViewController = parent as? SplitViewController {
            splitViewController.notes[selectedRow].title = fieldEditor.string
            return true
        }
        
        return false
    }
}
