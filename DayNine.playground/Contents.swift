import Foundation

// How to create and use closures
let sayHello = {
    print("Hi there!")
}
sayHello()
//
let greeting = {(name: String) -> String in
    "Hello, \(name)"
}
greeting("Anastasiia")
//

func greetUser() {
    print("Welcome!")
}
var greetCopy: () -> Void = greetUser

//
func getUserData(for id: Int) -> String {
    if id == 1994 {
        return "Anastasiia"
    } else {
       return "Anonymous"
    }
}

let data: (Int) -> String = getUserData
let user = data(1994)
print(user)

//

let team = ["Tom", "Ron", "Anna", "Alice"]
let sortedTeam = team.sorted()
print(sortedTeam)

func capitanFirstSorted(name1: String, name2: String) -> Bool {
    if name1 == "Ron" {
        return true
    } else if name2 == "Ron" {
        return false
    }
    return name1 < name2
}

//let capitanFirstTeam = team.sorted(by: capitanFirstSorted)
//print(capitanFirstTeam)

let capitanFirstTeam = team.sorted(by: { (name1: String, name2: String) -> Bool in
    if name1 == "Ron" {
        return true
    } else if name2 == "Ron" {
        return false
    }
    return name1 < name2
})
print(capitanFirstTeam)


//
func pay(user: String, amount: Int){
//    code
}

let payment = {(user: String, amount: Int) in
//    code
}

let payment2 = {() -> Bool in
    print("Paying an anonymous person…")
    return true
}


var difficultyRating = { (trick: String) -> Int in
    if trick == "ollie" {
        return 1
    } else if trick == "Yoyo Plant" {
        return 3
    } else if trick == "900" {
        return 5
    } else {
        return 0
    }
}
print(difficultyRating("ollie"))


// How to use trailing closures and shorthand syntax

let reverseTeam = team.sorted {$0 < $1}
print(reverseTeam)

let newTeam = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]
let tOnly = newTeam.filter {$0.hasPrefix("T")}
print(tOnly)

let uppercaseTeam = newTeam.map {$0.uppercased()}
print(uppercaseTeam)

func animate(duration: Double, animations: () -> Void) {
    print("Starting a \(duration) second animation…")
    animations()
}

//becomes this:
animate(duration: 5) {
    print("Rade out the image")
}

// How to accept functions as parameters
func makeArray(size: Int, using generator: () -> Int) -> [Int] {
    var numbers = [Int]()
    for _ in 0..<size {
        let newNumber = generator()
        numbers.append(newNumber)
    }
    return numbers
}

let rolls = makeArray(size: 50) {
    Int.random(in: 1...20)
}
print(rolls)

func generateNumber() -> Int {
    Int.random(in: 1...20)
}

let newRolles = makeArray(size: 50, using: generateNumber)
print(newRolles)

func doImportantWork(first: () -> Void, second: () -> Void, third: () -> Void) {
    print("About to start first work")
    first()
    print("About to start second work")
    second()
    print("About to start third work")
    third()
}

doImportantWork {
    print("This is the first work")
} second: {
    print("This is the second work")
} third: {
    print("This is the third work")
}


let helicopterTravel = {
    print("Get to the chopper!")
}
func travel(by travelMeans: () -> Void) {
    print("Let's go on vacation...")
    travelMeans()
}
travel(by: helicopterTravel)

var learnWithUnwrap = {
    print("Hey, this is fun!")
}
func learnSwift(using approach: () -> Void) {
    print("I'm learning Swift")
    approach()
}
learnSwift(using: learnWithUnwrap)

func tendGarden(activities: () -> Void) {
    print("I love gardening")
    activities()
}
tendGarden {
    print("Let's grow some roses!")
}

func goCamping(then action: () -> Void) {
    print("We're going camping!")
    action()
}
goCamping {
    print("Sing songs")
    print("Put up tent")
    print("Attempt to sleep")
}

func goOnVacation(to destination: String, _ activities: () -> Void) {
    print("Packing bags...")
    print("Getting on plane to \(destination)...")
    activities()
    print("Time to go home!")
}
goOnVacation(to: "Mexico") {
    print("Go sightseeing")
    print("Relax in sun")
    print("Go hiking")
}

// Chechpoint 5

//Your job is to:
//Filter out any numbers that are even
//Sort the array in ascending order
//Map them to strings in the format “7 is a lucky number”
//Print the resulting array, one item per line
//So, your output should be as follows:

let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]

let noEvenNumbers = luckyNumbers.filter {!$0.isMultiple(of: 2)}
print(noEvenNumbers)

let sortedNumbers = noEvenNumbers.sorted()
print(sortedNumbers)

let luckyMessage = sortedNumbers.map {"\($0) is a lucky number"}
print(luckyMessage)

luckyMessage.forEach { print($0)}
