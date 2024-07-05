
import SwiftUI

struct AddHabitView: View {
    @Environment(\.dismiss) var dismiss
    @State private var name = "Add new habit"
    @State private var description = ""
    @State private var completionCount = 0
    @ObservedObject var habits: Habits
    
    
    
    var body: some View {
        NavigationStack{
            Form{
                Section("Habit Description") {
                    TextField("Description", text: $description)
                }
            }
            .navigationTitle($name)
            .navigationBarBackButtonHidden()
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        let item = HabitItem(name: name, description: description, completionCount: completionCount)
                        habits.items.append(item)
                        dismiss()
                    }
                    .disabled(description.isEmpty)
                }
                
                ToolbarItem(placement: .cancellationAction){
                    Button("Cancel") {
                        dismiss()
                    }
                    .foregroundColor(.red)
                }
            }
        }
    }
}

#Preview {

    AddHabitView(habits: Habits())
}

