
import SwiftData
import SwiftUI


struct Response: Codable {
    var results: [User]
}

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query private var users: [User]
    
    var body: some View {
        NavigationStack {
            List(users) { user in
                NavigationLink(destination: UserDetailView(user: user)) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text(user.name)
                                .font(.headline)
                            Text(user.isActive ? "Active" : "Inactiv")
                        }
                        Spacer()
                        
                        Text(user.isActive ? "🟢" : "🔴")
                    }
                }
            }
            .navigationTitle("Users")
        }
        .task {
            await loadData()
        }
    }
    
    func loadData() async {
        guard users.isEmpty else { return }
       
        do {
            guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
                print("Invalid URL")
                return
            }
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            let downloadedUsers = try decoder.decode([User].self, from: data)
            let insertContext = ModelContext(modelContext.container)
            
            for user in downloadedUsers {
                insertContext.insert(user)
            }
            
            try insertContext.save()
            
        } catch {
            print("Invalid data")
        }
    }
}

#Preview {
    ContentView()
}
