

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query(sort: [SortDescriptor(\Person.name)]) var persons: [Person]
    
    @State private var showingAddScreen = false
    
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(persons) { person in
                    NavigationLink(value: person) {
                        Image(systemName: "person.fill")
                        
                        VStack(alignment: .leading) {
                            Text(person.name)
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            Text(person.number)
                            
                        }
                    }
                }
                .onDelete(perform: deleteContacts)
            }
            .navigationTitle("My Contacts")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button("New contact", systemImage: "plus") {
                        showingAddScreen = true
                    }
                }
            }
            .sheet(isPresented: $showingAddScreen) {
                AddContactView()
            }
        }
    }
    
    func deleteContacts(at offsets: IndexSet) {
        for offset in offsets {
            let person = persons[offset]
            modelContext.delete(person)
        }
    }
}

#Preview {
    ContentView()
}
