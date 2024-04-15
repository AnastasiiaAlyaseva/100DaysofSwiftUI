

import SwiftUI

struct AmountStyle : ViewModifier {
    var amount: Double
    
    func body(content: Content) -> some View {
        var foregroundColor = Color.black
        if amount < 10 {
            foregroundColor = Color.green
        } else if amount == 10 || amount < 100 {
            foregroundColor = Color.blue
        } else {
            foregroundColor = Color.purple
        }
        return content
            .foregroundColor(foregroundColor)
    }
}
    
    extension View {
        func amountStyle(_ amount: Double) -> some View {
            modifier(AmountStyle(amount: amount))
        }
    }
    

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
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
    
    var body: some View {
        NavigationStack {
            List {
                Section{
                    ForEach(expenses.items.filter{ $0.type == "Personal"}) { item in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .font(.headline)
                                Text(item.type)
                            }
                            Spacer()
                            Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                                .amountStyle(item.amount)
                                
                        }
                    }
                    .onDelete(perform: removeItems)
                }
                
                Section{
                    ForEach(expenses.items.filter{ $0.type == "Business"}) { item in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .font(.headline)
                                Text(item.type)
                            }
                            Spacer()
                            Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                                .amountStyle(item.amount)
                                
                        }
                    }
                    .onDelete(perform: removeItems)
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
    
    func removeItems(at offsets: IndexSet){
        expenses.items.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}
