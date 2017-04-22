//
//  Event.swift
//  EventManagement
//
//  Created by Cntt15 on 4/22/17.
//  Copyright © 2017 Cntt15. All rights reserved.
//

import Foundation

public enum EventStatus {
    case Uncompleted
    case Completed
}

class Event {
    var title: String
    var content: String
    
    init(title: String, content: String) {
        self.title = title
        self.content = content
    }
}
