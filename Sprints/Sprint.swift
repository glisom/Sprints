//
//  Item.swift
//  Sprints
//
//  Created by Grant Isom on 11/17/23.
//

import Foundation
import SwiftData
import SwiftUI

@Model
final class Sprint {
    var title: String
    var desc: String?
    var color: UInt

    var iterations: Int
    var completedIterations: Int = 0

    init(title: String, desc: String, color: Color, iterations: Int) {
        self.title = title
        self.desc = desc
        self.color = color.hex
        self.iterations = iterations
    }
}
