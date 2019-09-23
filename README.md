# NoteTaker

A simple Mac note-taking app that is the project for the book [Swift Dev Journal Introduction to Cocoa](https://www.swiftdevjournal.com/swift-dev-journal-intro-to-cocoa/).

I wrote the code in Xcode 10 using Swift 5. The code should also work in Xcode 11.

## Branches

The `master` and `develop` branches contain the final app.

### Chapter Branches

The various chapter branches show milestones along the way so you can see the steps I took from the start of the project to the final app.

The `chapter04` branch shows the app after building the user interface for the notes window.

The `chapter05` branch adds a toolbar to the window.

The `chapter06` branch adds a Note menu to the menu bar with items to add and remove notes.

The `chapter12` branch adds the ability to add notes, change a note's title, and show the currently selected note in the text view. I screwed up a merge from a feature branch so I wasn't to break this branch down into finer steps. This branch is the final result of working through Chapters 7-12 and 14.

The `chapter13` branch adds note deletion.

The `chapter15` branch adds note saving and loading.

The `chapter16` branch adds autosaving using timers.

The `chapter17` branch adds undo for deleting notes.

### Demonstration Branches

The `plain-text` branch has a plain text version of the NoteTaker app.

The `note-sorting` branch sorts the notes in the table view alphabetically by their title.

The `toolbar-button-validation` branch shows how to validate toolbar button so they're enabled and disabled properly.
