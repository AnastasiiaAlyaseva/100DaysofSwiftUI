
import SwiftUI

struct ContentView: View {
    @StateObject var habits = Habits()
    @State private var showingAddHabit = false
    
    var body: some View {
        GeometryReader { geo in
            NavigationView {
                List {
                    ForEach(habits.items) { habit in
                        NavigationLink(destination: HabitDetailView(habit: habit, habits: habits)) {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(habit.name)
                                        .font(.headline)
                                    Text(habit.description)
                                        .font(.subheadline)
                                }
                                .padding([.leading])
                                Spacer()
                                Text("\(habit.completionCount)")
                                    .bold()
                                    .padding([.trailing])
                            }
                        }
                    }
                    .onDelete(perform: removeItems)
                }
                .navigationTitle("Habits Tracker")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            showingAddHabit = true
                        }) {
                            Image(systemName: "plus")
                        }
                    }
                }
                .sheet(isPresented: $showingAddHabit) {
                    AddHabitView(habits: habits)
                }
            }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        habits.items.remove(atOffsets: offsets)
    }
}

    

#Preview {
    ContentView()
}
