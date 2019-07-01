//
//  TableViewDataSource.swift
//  NoteTaker
//
//  Created by mark on 6/29/19.
//  Copyright © 2019 Swift Dev Journal. All rights reserved.
//

import Cocoa

extension TableViewController: NSTableViewDelegate, NSTableViewDataSource {
    
    func numberOfRows(in aTableView: NSTableView) -> Int {
        if let splitViewController = parent as? SplitViewController {
            return splitViewController.notes.count
        }
        return 0
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        
        if let cellView = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "TitleColumn"), owner: self) as? NSTableCellView {
            
            if let splitViewController = parent as? SplitViewController {
                cellView.textField?.stringValue = splitViewController.notes[row].title
            }
            
            return cellView
        }
        
        return nil
    }
}
