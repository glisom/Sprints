//
//  Item.swift
//  Sprints
//
//  Created by Grant Isom on 11/17/23.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
