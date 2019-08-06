//
//  TextViewController.swift
//  NoteTaker
//
//  Created by mark on 6/28/19.
//  Copyright © 2019 Swift Dev Journal. All rights reserved.
//

import Cocoa

class TextViewController: NSViewController, NSTextDelegate {

    @IBOutlet var textView: NSTextView!
    
    var currentNoteLocation = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        registerForNotifications()
    }
    
    func registerForNotifications() {
        let center = NotificationCenter.default
        center.addObserver(self, selector: #selector(TextViewController.textDidChange(_:)),
                           name: NSText.didChangeNotification,
                           object: textView)
    }
    
    func changeTextViewContents(selectedRow: Int) {
        // Using an if-let statement instead of having a computed property for the split view controller that the table view controller has. Using the computed property forced me to do force unwrapping to fill the text view with the selected note's contents. I prefer the if-let statement to force unwrapping.
        if let splitViewController = parent as? SplitViewController {
            let selectedNote = splitViewController.notes[selectedRow]
            // Fill text view with the selected note contents
            textView.string = selectedNote.contents
            currentNoteLocation = selectedRow
        }
    }
    
    func saveTextViewContents() {
        if let splitViewController = parent as? SplitViewController {
            // The note will have the text view's contents.
            splitViewController.notes[currentNoteLocation].contents = textView.string
        }
    }
    
    func textDidChange(_ notification: Notification) {
        saveTextViewContents()
    }
}
