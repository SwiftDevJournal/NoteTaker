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
    var contents: String = ""
    
    func write() -> Data? {
        return contents.data(using: .utf8)
    }
    
    mutating func read(data: Data?) {
        guard data != nil else {
            return
        }
        // The guard ensures the data is not nil so I can force unwrap.
        if let stringData = String(data: data!, encoding: .utf8) {
            contents = stringData
        }
    }
}
