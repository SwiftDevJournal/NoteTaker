//
//  SplitViewController.swift
//  NoteTaker
//
//  Created by mark on 6/29/19.
//  Copyright © 2019 Swift Dev Journal. All rights reserved.
//

import Cocoa

class SplitViewController: NSSplitViewController {

    // I'm storing the notes in the split view controller because it's a simple app and the split view controller contains the list of notes. You could create a NoteController class to manage the array of notes to avoid polluting the view controller with code that doesn't manage the split view.
    var notes = [Note]()
    
    var tableViewController: TableViewController? {
        return children.first as? TableViewController
    }
    
    var textViewController: TextViewController? {
        return children[1] as? TextViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    @IBAction func addNote(_ sender: AnyObject) {
        let newNote = Note(title: "New Note", contents: NSMutableAttributedString(string: ""))
        notes.append(newNote)
        tableViewController?.tableView.reloadData()
    }
 
    @IBAction func deleteNote(_ sender: AnyObject) {
        if let removalPoint = tableViewController?.tableView.selectedRow {
            notes.remove(at: removalPoint)
            tableViewController?.tableView.reloadData()
        }
    }
}
