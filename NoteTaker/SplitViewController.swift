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
        loadNotes()
        tableViewController?.tableView.reloadData()
    }
    
    @IBAction func addNote(_ sender: AnyObject) {
        let newNote = Note(title: "New Note", contents: NSMutableAttributedString(string: ""))
        notes.append(newNote)
        saveNotes()
        tableViewController?.tableView.reloadData()
    }
 
    @IBAction func deleteNote(_ sender: AnyObject) {
        guard let row = tableViewController?.tableView.selectedRow else {
            return
        }
        notes.remove(at: row)
        tableViewController?.tableView.reloadData()
        
        // Select the note that was above the deleted note. Selecting the note that was below the deleted note won't work if the last note is deleted.
        let newSelectionIndex: Int
        if row > 0 {
            newSelectionIndex = row - 1
        }
        else {
            newSelectionIndex = row
        }
        tableViewController?.selectNote(newSelectionIndex)
        saveNotes()
    }

}
