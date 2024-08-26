
import SwiftUI
import SwiftData


struct UsersView: View {
    @Environment(\.modelContext) var modelContext
    @Query var expenses: [ExpenseItem]
    
    var body: some View {
        List {
            ForEach(expenses) { item in
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
                .accessibilityElement()
                .accessibilityLabel("\(item.name), \(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD")) ")
                .accessibilityHint("Type: \(item.type) expense")
            }
            .onDelete(perform: removeItems)
        }
    }
    
    init(filter: String, sortOrder: [SortDescriptor<ExpenseItem>]) {
            _expenses = Query(filter: #Predicate<ExpenseItem> { expense in
                expense.type >= filter
            }, sort: sortOrder)
        }
    
    func removeItems(at offsets: IndexSet) {
        for offset in offsets {
            let expense = expenses[offset]
            modelContext.delete(expense)
        }
    }
}

#Preview {
    UsersView(filter: "Personal", sortOrder: [SortDescriptor(\ExpenseItem.name)])
        .modelContainer(for: ExpenseItem.self)
}
