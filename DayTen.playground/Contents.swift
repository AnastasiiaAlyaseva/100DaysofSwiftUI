import Foundation

// How to create your own structs

struct Album {
    let title: String
    let artist: String
    let year: Int
    
    func printSummaty() {
        print("\(title) \(year) by \(artist)")
    }
}

let red = Album(title: "Red", artist: "Taylor Swift", year: 2012)
let wings = Album(title: "Wings", artist: "BTS", year: 2016)
red.printSummaty()
wings.printSummaty()
//

struct Employee {
    let name: String
    var vacationRemaining: Int = 14
   
    mutating func takeVacation(days: Int) {
        if vacationRemaining > days {
            vacationRemaining -= days
            print("I'm going on vacation!")
            print("Days remaining: \(vacationRemaining)")
        } else {
            print("Oops! There aren't enough days remaining.")
        }
    }
}

var anastasiia = Employee(name: "Anastasiia", vacationRemaining: 15)
anastasiia.takeVacation(days: 7)
print(anastasiia.vacationRemaining)

var sergay = Employee(name: "Sergay")
sergay.takeVacation(days: 5)
print(sergay.vacationRemaining)

//

// How to compute property values dynamically

struct Worker {
    let name: String
    var vacationAllocated = 14
    var vacationTaken = 0
    
    var vacationRemaining: Int {
        get {
        vacationAllocated - vacationTaken
        }
        set {
            vacationAllocated = vacationTaken + newValue
        }
    }
}

var anna = Worker(name: "Anna", vacationAllocated: 14)
anna.vacationTaken += 5
print(anna.vacationRemaining)
anna.vacationTaken += 5
print(anna.vacationRemaining)

var nataly = Worker(name: "Nataly")
nataly.vacationTaken += 2
nataly.vacationRemaining = 5
print(nataly.vacationAllocated)


struct Wine {
    var age: Int
    var isVintage: Bool
    var price: Int {
        if isVintage {
            return age + 20
        } else {
            return age + 5
        }
    }
}
let malbec = Wine(age: 2, isVintage: true)
print(malbec.price)


struct Toy {
    var color: String
    var isForGirls: Bool {
        if color == "Pink" {
            return true
        } else {
            return true
        }
    }
}
let toy = Toy(color: "Pink")
toy.isForGirls
print(toy.isForGirls)

// How to take action when a property changes

struct Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}

var game = Game()
game.score += 10
game.score += 7
game.score += 4

struct App {
    var contacts = [String]() {
        willSet {
            print("Current value is : \(contacts)")
            print("New value will be: \(newValue)")
        }
        didSet {
            print("There are now \(contacts.count) contacts")
            print("Old value was: \(oldValue)")
        }
    }
}

var app = App()
app.contacts.append("Anna")
app.contacts.append("Alex")
app.contacts.append("Dina")

// How to create custom initializers
struct Player {
    let name: String
    let number: Int
    
    init(name: String) {
        self.name = name
        number = Int.random(in: 1...99)
    }
}

let player = Player(name: "Jon")
print(player.number)

struct Stuff {
    var name: String
    var yearsActive = 0
}
    
    extension Stuff {
        init() {
            self.name = "Anonymous"
            print("Creating an anonymous employee…")
        }
    }

let sergio = Stuff(name: "Sergey")
print(sergio)
let anon = Stuff()
print(anon)



struct Message {
    var from: String
    var to: String
    var content: String
    init() {
        from = "Unknown"
        to = "Unknown"
        content = "Yo"
    }
}
let message = Message()
print(message)

