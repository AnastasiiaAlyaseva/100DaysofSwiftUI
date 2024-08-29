

import SwiftUI
import SwiftData

@main
struct MyContactsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Person.self)
        }
    }
}
