
import SwiftUI
import SwiftData

//
//@Observable
//class Expenses {
//    var items = [ExpenseItem]() {
//        didSet{
//            if let encoder = try? JSONEncoder().encode(items) {
//                UserDefaults.standard.setValue(encoder, forKey: "Items")
//            }
//        }
//    }
//    init() {
//        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
//            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
//                items = decodedItems
//                return
//            }
//        }
//        items = []
//    }
//}

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query var expenses: [ExpenseItem]
    
    @State private var showingTypeOnly = false
    @State private var showingAddExpense = false
    @State private var sortOrder = [
        SortDescriptor(\ExpenseItem.name),
        SortDescriptor(\ExpenseItem.amount)
    ]
    
    //    var personalItems: [ExpenseItem] {
    //        expenses.items.filter { $0.type == "Personal" }
    //    }
    //    var businessItems: [ExpenseItem] {
    //        expenses.items.filter { $0.type == "Business" }
    //    }
    
    var body: some View {
        NavigationStack {
            UsersView(filter: showingTypeOnly ? "Personal" : "Business", sortOrder: sortOrder)
                .navigationTitle("iExpense")
                .toolbar {
                    
                    Button("Add Expense", systemImage: "plus"){
                        showingAddExpense.toggle()
                    }
                    
                    Button(showingTypeOnly ? "Show Personal" : "Show All") {
                        showingTypeOnly.toggle()
                    }
                    
                    Menu("Sort", systemImage: "arrow.up.arrow.down") {
                        Picker("Sort", selection: $sortOrder) {
                            Text("Sort by Name")
                                .tag([SortDescriptor(\ExpenseItem.name), SortDescriptor(\ExpenseItem.amount)])
                            
                            Text("Sort by Amount")
                                .tag([SortDescriptor(\ExpenseItem.amount), SortDescriptor(\ExpenseItem.name)])
                        }
                    }
                    
                    EditButton()
                }
                .sheet(isPresented: $showingAddExpense) {
                    AddView()
                }
        }
    }
}

//    func removeItems(at offsets: IndexSet, in inputArray: [ExpenseItem]) {
//        var objectToDelete = IndexSet()
//
//        for offset in offsets {
//            let item = inputArray[offset]
//            if let index = expenses.items.firstIndex(of: item){
//                objectToDelete.insert(index)
//            }
//        }
//        expenses.items.remove(atOffsets: objectToDelete)
//    }
//
//    func removePersonalItems(at offsets: IndexSet) {
//        removeItems(at: offsets, in: personalItems)
//    }
//
//    func removeBusinessItems(at offsets: IndexSet) {
//        removeItems(at: offsets, in: businessItems)
//    }
//}

#Preview {
    ContentView()
}
