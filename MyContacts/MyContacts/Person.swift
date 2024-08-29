

import Foundation
import SwiftData

@Model
class Person {
    var name: String
    var number: String
    var notes: String
    
    init(name: String, number: String, notes: String) {
        self.name = name
        self.number = number
        self.notes = notes
    }
}
