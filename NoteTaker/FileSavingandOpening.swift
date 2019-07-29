//
//  FileSavingandOpening.swift
//  NoteTaker
//
//  Created by mark on 7/22/19.
//  Copyright © 2019 Swift Dev Journal. All rights reserved.
//

import Foundation

extension SplitViewController {
    
    @objc func saveNotes() {
        let wrapper = buildFileWrapper()
        // Get the URL to save the file wrapper
        // Inside the user's Application Support folder
        if let saveLocation = noteFileLocation() {
            // Write the file wrapper to the URL
            do {
                try wrapper.write(to: saveLocation, options: .atomic, originalContentsURL: saveLocation)
            } catch {
                print(error)
            }
        }
        
    }
    
    func buildFileWrapper() -> FileWrapper {
        let mainDirectory = FileWrapper(directoryWithFileWrappers: [:])
        let notesDirectory = FileWrapper(directoryWithFileWrappers: [:])
        notesDirectory.preferredFilename = "Notes"
        
        var index = 0
        for note in notes {
            if let noteData = note.write() {
                let wrapper = FileWrapper(regularFileWithContents: noteData)
                let filename = buildFilename(note: note, position: index)
                wrapper.preferredFilename = filename
                notesDirectory.addFileWrapper(wrapper)
            }
            index += 1
        }
        
        mainDirectory.addFileWrapper(notesDirectory)
        return mainDirectory
    }
    
    func buildFilename(note: Note, position: Int) -> String {
        var filename: String = ""
        filename += note.title
        filename += "-00"
        filename += String(position)
        return filename
    }
    
    func loadNotes() {
        // Find the file wrapper
        guard let noteLocation = noteFileLocation()  else {
            return
        }
        
        do {
            let mainDirectory = try FileWrapper(url: noteLocation, options: .immediate)
            if let notesDirectory = mainDirectory.fileWrappers?["Notes"],
                let noteFiles = notesDirectory.fileWrappers {
                
                for note in noteFiles {
                    readNote(noteFile: note.value)
                }
            }
        } catch {
            print(error)
        }
    }
    
    func readNote(noteFile: FileWrapper) {
        if let filename = noteFile.filename {
            let fileComponents = filename.components(separatedBy: "-00")
            var newNote = Note(title: "Note", contents: NSMutableAttributedString(string: ""))
            newNote.title = fileComponents.first ?? "Note"
            // Load an empty string if there's no data to read.
            let emptyString = ""
            newNote.read(data: noteFile.regularFileContents ?? emptyString.data(using: .utf8))
            notes.append(newNote)
        }
        
    }
    
    func noteFileLocation() -> URL? {
        let fileManager = FileManager.default
        
        do {
            // Could use .localDomainMask if I want to use the machine's Application Support folder.
            let userApplicationSupportFolder = try fileManager.url(
                for: .applicationSupportDirectory,
                in: .userDomainMask, appropriateFor: nil, create: true)
            let noteFileLocation = userApplicationSupportFolder.appendingPathComponent("NoteTaker")
            do {
                // Create a directory to place the notes the first time the app launches.
                try fileManager.createDirectory(at: noteFileLocation, withIntermediateDirectories: true, attributes: nil)
            } catch {
                print("Failed")
            }
            return noteFileLocation
        } catch {
            print("Failed")
        }
        return nil
    }
}
