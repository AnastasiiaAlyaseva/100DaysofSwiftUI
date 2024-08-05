

import SwiftUI

struct UserDetailView: View {
    let user: User
    let allUsers: [User]
    
    
    var body: some View {
        VStack {
            Image(systemName: "person.crop.circle")
                .foregroundColor(user.isActive ? .green : .gray)
                .font(.system(size: 120))
            
            
            List {
                Section("Basic info"){
                    Text("Registered: \(user.registered.formatted(.dateTime.month().year()))")
                    Text("Age: \(user.age)")
                    Text("Email: \(user.email)")
                    Text("Address: \(user.address)")
                    Text("Work for: \(user.company)")
                }
                
                Section("About") {
                    Text(user.about)
                }
                
                Section("Friends"){
                    ForEach(user.friends) { friend in
                        if let friendUser = getUserById(friend.id) {
                            NavigationLink(destination: UserDetailView(user: friendUser, allUsers: allUsers)) {
                                HStack {
                                    Image(systemName: "text.bubble")
                                        .foregroundColor(.blue)
                                        .font(.system(size: 15))
                                    
                                    Text(friend.name)
                                        .frame(alignment: .center)
                                }
                            }
                        }
                    }
                }
            }
        }
        .navigationTitle(user.name)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func getUserById(_ id: UUID) -> User? {
        return allUsers.first { $0.id == id }
    }
    
}

//#Preview {
//    UserDetailView()
//}
