//
//  TableViewController.swift
//  NoteTaker
//
//  Created by mark on 6/28/19.
//  Copyright © 2019 Swift Dev Journal. All rights reserved.
//

import Cocoa

class TableViewController: NSViewController {

    @IBOutlet var tableView: NSTableView!
    
    var splitViewController: SplitViewController? {
        return parent as? SplitViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
 
    func tableViewSelectionDidChange(_ aNotification: Notification) {
        // Get the selected note and change the text view's contents to the selected note.
        if let textViewController = splitViewController?.textViewController {
            textViewController.changeTextViewContents(selectedRow: tableView.selectedRow)
        }
    }
    
    func selectNote(_ position: Int) {
        let indexSet = IndexSet(integer: position)
        tableView?.selectRowIndexes(indexSet, byExtendingSelection: false)
    }
}
