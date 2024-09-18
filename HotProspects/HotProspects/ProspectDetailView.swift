

import SwiftUI
import SwiftData

struct ProspectDetailView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    @State var prospect: Prospect
    
    var body: some View {
        NavigationStack{
            Form {
                TextField("Name", text: $prospect.name)
                TextField("Email Address", text: $prospect.emailAddress)
            }
            .navigationTitle("Edit Prospect")
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        try? modelContext.save()
                        dismiss()
                    }
                }
            }
        }
    }
}


