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
        if let splitViewController = parent as? SplitViewController {
            let selectedNote = splitViewController.notes[selectedRow]
            // Fill text view with the selected note contents
            textView.textStorage?.setAttributedString(selectedNote.contents)
            currentNoteLocation = selectedRow
        }
    }
    
    func saveTextViewContents() {
        if let splitViewController = parent as? SplitViewController {
            // The note will have the text view's contents.
        splitViewController.notes[currentNoteLocation].contents.setAttributedString(textView.attributedString())
        }
    }
    
    func textDidChange(_ notification: Notification) {
        saveTextViewContents()
    }
}
