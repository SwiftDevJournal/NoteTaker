//
//  Note.swift
//  NoteTaker
//
//  Created by mark on 6/28/19.
//  Copyright © 2019 Swift Dev Journal. All rights reserved.
//

import Foundation

struct Note {
    var title: String = ""
    var contents: NSMutableAttributedString = NSMutableAttributedString(string: "")
    
    func write() -> Data? {
        let range = NSRange(location: 0, length: contents.length)
        return contents.rtf(from: range)
    }
    
    mutating func read(data: Data) {
        if let fileContents = NSAttributedString(rtf: data, documentAttributes: nil) {
            contents = NSMutableAttributedString(attributedString: fileContents)
        }
    }
}
