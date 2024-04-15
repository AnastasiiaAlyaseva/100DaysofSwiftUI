

import SwiftUI

struct AmountStyle : ViewModifier {
    let expenseItem: ExpenseItem
    
    func body(content: Content) -> some View {
        switch expenseItem.amount {
        case 0..<10:
            content
                .foregroundColor(.green)
        case 10..<100:
            content
                .foregroundColor(.blue)
        default:
            content
                .foregroundColor(.purple)
        }
        
    }
}
    
    extension View {
        func amountStyle(_ expenseItem: ExpenseItem) -> some View {
            modifier(AmountStyle(expenseItem: expenseItem))
        }
    }


@Observable
class Expenses {
    var items = [ExpenseItem]() {
        didSet{
            if let encoder = try? JSONEncoder().encode(items) {
                UserDefaults.standard.setValue(encoder, forKey: "Items")
            }
        }
    }
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
        items = []
    }
}

struct ContentView: View {
    @State private var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var personalItems: [ExpenseItem] {
        expenses.items.filter { $0.type == "Personal" }
    }
    var businessItems: [ExpenseItem] {
        expenses.items.filter { $0.type == "Business" }
        }
    
    var body: some View {
        NavigationStack {
            List {
                Section{
                    ForEach(personalItems) { item in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .font(.headline)
                                Text(item.type)
                            }
                            Spacer()
                            Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                                .amountStyle(item)
                                
                        }
                    }
                    .onDelete(perform: removePersonalItems)
                }
                
                Section{
                    ForEach(businessItems) { item in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .font(.headline)
                                Text(item.type)
                            }
                            Spacer()
                            Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                                .amountStyle(item)
                                
                        }
                    }
                    .onDelete(perform: removeBusinessItems)
                }
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button("Add Expense", systemImage: "plus") {
                    showingAddExpense = true
                }
            }
            .sheet(isPresented: $showingAddExpense){
                AddView(expenses: expenses)
            }
        }
    }
    
    func removeItems(at offsets: IndexSet, in inputArray: [ExpenseItem]) {
        var objectToDelete = IndexSet()
        
        for offset in offsets {
            let item = inputArray[offset]
            if let index = expenses.items.firstIndex(of: item){
                objectToDelete.insert(index)
            }
        }
        expenses.items.remove(atOffsets: objectToDelete)
    }
    
    func removePersonalItems(at offsets: IndexSet) {
        removeItems(at: offsets, in: personalItems)
    }
    
    func removeBusinessItems(at offsets: IndexSet) {
        removeItems(at: offsets, in: businessItems)
    }
}

#Preview {
    ContentView()
}
