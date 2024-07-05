
import SwiftUI

struct HabitItem: Identifiable, Codable, Equatable {
    var id = UUID()
    let name: String
    let description: String
    var completionCount: Int 
}

