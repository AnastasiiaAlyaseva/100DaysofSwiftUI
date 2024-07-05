
import SwiftUI


class Habits: ObservableObject {
   @Published var items = [HabitItem]() {
        didSet{
            if let encoder = try? JSONEncoder().encode(items) {
                UserDefaults.standard.setValue(encoder, forKey: "Habits")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Habits") {
            if let decodedItems = try? JSONDecoder().decode([HabitItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
        items = []
    }
}

