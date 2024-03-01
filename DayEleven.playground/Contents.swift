import Foundation

// How to limit access to internal data using access control

struct BankAccount {
    private var funds = 0
//    private(set) var funds = 0
    
    mutating func deposit(amount: Int) {
        funds += amount
    }
    mutating func withdraw(amount: Int) -> Bool {
        if funds >= amount {
            funds -= amount
            return true
        } else {
            return false
        }
    }
}

var account = BankAccount()
account.deposit(amount: 500)
let success = account.withdraw(amount: 300)

if success {
    print("Withdrew money successfully")
} else {
    print("Failed to get the money")
}

/*
 private  -  “don’t let anything outside the struct use this.”
 fileprivate  -  “don’t let anything outside the current file use this.”
  public for  - “let anyone, anywhere use this
*/

struct App {
    var name: String
    private var sales = 0
    init(name: String) {
        self.name = name
    }
}
let spotify = App(name: "Spotify")

// Static properties and methods

struct School {
    static var studentCount = 0
    static func add(student: String) {
        print("\(student) joined the school")
        studentCount += 1
    }
}
School.add(student: "Anastasiia")
School.add(student: "Sergey")
print(School.studentCount)

struct AppData {
    static let version = "1.0.2"
    static let saveFilename = "settings.json"
    static let homeURL = "http://www.anastasiia.com"
}

struct Emploee {
    let username: String
    let password: String
    
    static let example = Emploee(username: "Anonymous", password: "qwertyu")
}

// Checkpoint 6

/*
  create a struct to store information about a car, including its model, number of seats, and current gear, then add a method to change gears up or down. Have a think about variables and access control: what data should be a variable rather than a constant, and what data should be exposed publicly? Should the gear-changing method validate its input somehow?
 */

struct Car {
    let model: String
    let numberOfSeats: Int
    private(set) var currentGear: Int = 1
    
    init(model: String, numberOfSeats: Int) {
        self.model = model
        self.numberOfSeats = numberOfSeats
    }
    mutating func changeGear(gear: Int) {
        let newGear = currentGear + gear
        if newGear > 1 && newGear <= 10 {
            currentGear = newGear
            print("The gear is \(currentGear) now")
        } else {
            print("Not changed.Gear remains at \(currentGear)")
        }
    }
    
    mutating func changeGearUp() {
        if currentGear < 10 {
            currentGear += 1
        } else {
            print("The highest gear")
        }
    }
    mutating func changeGearDown() {
        if currentGear > 1 {
            currentGear -= 1
        } else {
            print("The lowest gear")
        }
    }
}

var car = Car(model: "BMW", numberOfSeats: 4)
car.changeGear(gear: 3)
print(car.currentGear)
car.changeGearUp()
car.changeGearUp()
print(car.currentGear)
car.changeGearUp()
print(car.currentGear)



