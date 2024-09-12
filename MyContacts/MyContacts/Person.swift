

import Foundation
import SwiftData

@Model
class Person {
    var name: String
    var number: String
    var notes: String
    @Attribute(.externalStorage) var photo: Data?
    
    init(name: String, number: String, notes: String, photo: Data? = nil) {
        self.name = name
        self.number = number
        self.notes = notes
        self.photo = photo
    }
}
