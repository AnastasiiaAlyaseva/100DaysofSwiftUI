

import SwiftUI

struct HabitDetailView: View {
    var habit: HabitItem
    @ObservedObject var habits: Habits
    
    var body: some View {
        GeometryReader{ geo in
            VStack {
                Form{
                    Group{
                        Section("Habite name"){
                            Text(habit.name)
                        }
                        
                        Section("Habite desctiption") {
                            Text(habit.description)
                        }
                        
                        Section("Habit Progress") {
                            Stepper("Completion Count: \(habit.completionCount)") {
                                increaseCompletionCount()
                            } onDecrement: {
                                decreaseCompletionCount()
                            }
                        }
                    }
                }
            }
            .navigationTitle(habit.name)
            .navigationBarTitleDisplayMode(.inline)
            
        }
    }
    
    func increaseCompletionCount() {
        if let index = habits.items.firstIndex(of: habit) {
            habits.items[index].completionCount += 1
        }
    }
    func decreaseCompletionCount() {
        if let index = habits.items.firstIndex(of: habit) {
            habits.items[index].completionCount -= 1
        }
    }
}


#Preview {
    HabitDetailView(habit: HabitItem(name: "", description: "", completionCount: 3), habits: Habits())
}
