import Foundation

// How to create and use protocols

protocol Transport {
    var name: String { get }
    var currentPassengers: Int { get set }
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
}

struct Car: Transport {
    let name = "BMW"
    var currentPassengers = 2
    
    func estimateTime(for distance: Int) -> Int {
        distance / 50
    }
    
    func travel(distance: Int) {
        print("I'm driving \(distance) km")
    }
    
    func openSunroof(){
        print("It's a nice day")
    }
}

struct Bicycle: Transport {
    let name = "Bicycle"
    var currentPassengers = 1
    
    func estimateTime(for distance: Int) -> Int {
        distance / 10
    }
    
    func travel(distance: Int) {
        print("I'm cycling \(distance) km")
    }
}

func commute(diatance: Int, using transport : Transport) {
    if transport.estimateTime(for: diatance) > 100 {
        print("That's too slow!")
    } else {
        transport.travel(distance: diatance)
    }
}

func getTravelEstimates(using transports: [Transport], distance: Int) {
    for transport in transports {
        let estimate = transport.estimateTime(for: distance)
        print("\(transport.name): \(estimate) hours to travel \(distance) km ")
    }
}

let car = Car()
commute(diatance: 150, using: car)
let bike = Bicycle()
commute(diatance: 50, using: bike)

getTravelEstimates(using: [car, bike], distance: 100)


protocol Purchaseable {
    var name: String { get set }
}

struct Book: Purchaseable {
    var name: String
    var autor: String
}
struct Movie: Purchaseable {
    var name: String
    var actors: [String]
}
struct Auto: Purchaseable {
    var name: String
    var age: Int
}
struct Coffee: Purchaseable {
    var name: String
    var strength: Int
}

func buy(_ item: Purchaseable) {
    print("I'm buying \(item.name)")
}

let auto = Auto(name: "BMV", age: 1998)
buy(auto)

// How to use opaque return types

func getRandomNumber() -> Int {
    Int.random(in: 1...6)
}

func getRandomBool() -> Bool {
    Bool.random()
}

func getRandomNumber() -> some Equatable {
    Int.random(in: 1...7)
}

func getRandomBool() -> some Equatable {
    Bool.random()
}

// How to create and use extensions
 var quote = "   The truth is rarely pure and never simple    "
let trimmed = quote.trimmingCharacters(in: .whitespacesAndNewlines)
print(trimmed)

extension String {
    func trimmed() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    var lines: [String] {
        self.components(separatedBy: .newlines)
    }
}
let trimmed2 = quote.trimmed()
print(trimmed2)

let lyrics = """
But I keep cruising
Can't stop, won't stop moving
It's like I got this music in my mind
Saying it's gonna be alright
"""
print(lyrics.lines.count)

struct Textbook {
    let title: String
    let pageCount: Int
    let readingHours: Int
}

extension Textbook {
    init(title: String, pageCount: Int) {
        self.title = title
        self.pageCount = pageCount
        self.readingHours = pageCount / 50
    }
}
let english = Textbook(title: "English", pageCount: 345, readingHours: 24)
let math = Textbook(title: "Math", pageCount: 250)
print(math.readingHours)

// How to create and use protocol extensions
extension Collection {
    var isNotEmpty: Bool {
        isEmpty == false
    }
}

let guests = ["Mario", "Mona", "Marvin"]
if guests.isNotEmpty {
    print("Guest count: \(guests.count)")
}


protocol Person {
    var name: String { get }
    func sayHello()
}
extension Person {
    func sayHello() {
        print("Hello, I'm \(name)")
    }
}

struct Employee: Person {
    let name: String
}

let anna = Employee(name: "Anna")
anna.sayHello()


let numbers = [4, 8, 15, 16]
let allEven = numbers.allSatisfy {$0.isMultiple(of: 2)}
print(allEven)

let otherNumbers = Set([4, 8, 15, 16])
let areAllEven = otherNumbers.allSatisfy{$0.isMultiple(of: 2)}
print(areAllEven)

let setOfNumbers = ["four": 4, "eight": 8, "fifteen": 15, "sixteen": 16]
let areEven = setOfNumbers.allSatisfy{ $0.value.isMultiple(of: 2)}
print(areEven)


// Checkpoint 8

/*
 Make a protocol that describes a building, adding various properties and methods, then create two structs, House and Office, that conform to it. Your protocol should require the following:

 A property storing how many rooms it has.
 A property storing the cost as an integer (e.g. 500,000 for a building costing $500,000.)
 A property storing the name of the estate agent responsible for selling the building.
 A method for printing the sales summary of the building, describing what it is along with its other properties
 */
protocol Building {
    var rooms: Int { get }
    var cost: Int { get  }
    var agentName: String { get }
    func salesSummary()
}

struct House: Building {
    var rooms: Int
    var cost: Int
    var agentName: String
    func salesSummary() {
        print("House: \(rooms) rooms, Cost: $\(cost), Estate Agent: \(agentName)")
    }
}

struct Office: Building {
    var rooms: Int
    var cost: Int
    var agentName: String
    func salesSummary() {
        print("Office: \(rooms) rooms, Cost: $\(cost), Estate Agent: \(agentName)")
    }
}

let buyHouse = House(rooms: 3, cost: 500000, agentName: "Anna")
buyHouse.salesSummary()
let buyOffice = Office(rooms: 7, cost: 1000000, agentName: "Tom")
buyOffice.salesSummary()
