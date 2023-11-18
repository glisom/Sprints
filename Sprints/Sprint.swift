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
    var color: String
    var iterations: Int
    var completedIterations: Int = 0

    init(title: String, color: String, iterations: Int) {
        self.title = title
        self.color = color
        self.iterations = iterations
    }
}
