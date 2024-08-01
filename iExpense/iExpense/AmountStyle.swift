
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
