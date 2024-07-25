
import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query var books: [Book]
    
    @State private var showingAddAcreen = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(books) { book in
                    NavigationLink(value: book) {
                        VStack(alignment: .leading) {
                            Text(book.title)
                                .font(.title)
                            Text(book.author)
                                .foregroundStyle(.secondary)
                        }
                    }
                }
            }
            .navigationTitle("Bookworm")
            .navigationDestination(for: Book.self) { book in
                DetailView(book: book)
            }
            .toolbar {
                ToolbarItem(placement:.topBarTrailing) {
                    Button("Add Book", systemImage: "plus") {
                        showingAddAcreen = true
                    }
                }
            }
            .sheet(isPresented: $showingAddAcreen) {
                AddBookView()
            }
        }
    }
}

#Preview {
    ContentView()
}
