//
//  ChecklistItem.swift
//  checkist
//
//  Created by jaswanth on 11/05/15.
//  Copyright (c) 2015 jaswanth. All rights reserved.
//

import Foundation
class ChecklistItem: NSObject , NSCoding {
    var text = ""
    var checked = false
    
    func toggleChecked() {
        checked = !checked
    }
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(text, forKey: "Text")
        aCoder.encodeBool(checked, forKey: "Checked")
    }
    required init(coder aDecoder: NSCoder) {
        text = aDecoder.decodeObjectForKey("Text") as! String
        checked = aDecoder.decodeBoolForKey("Checked")
        super.init()
    }
    override init() {
            super.init()
    }
}