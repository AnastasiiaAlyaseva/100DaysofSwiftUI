import Foundation

// How to store ordered data in arrays

var beatles = ["John", "Paul", "George", "Ringo"]
print(beatles[1])
print(beatles[2])

beatles.append("Ron")
beatles.append("Tom")
beatles.append("Sam")
print(beatles)

var scores = [Int]()
//var scores = Array<Int>()
scores.append(100)
scores.append(80)
scores.append(85)
print(scores[1])

var albums = ["Folklore"]
albums.append("Fearless")
albums.append("Red")

var characters = ["Lana", "Pam", "Ray", "Sterling"]
print(characters.count)
characters.remove(at: 2)
print(characters.count)
characters.removeAll()
print(characters.count)

let presidents = ["Bush", "Obama", "Trump", "Biden"]
let reversedPresidents = presidents.reversed()
for president in presidents {
    print(president)
}
for president in reversedPresidents {
    print(president)
}

//How to store and find data in dictionaries

let employee: [String: String] = ["name": "Taylor Swift", "job": "Singer", "location": "Nashville"]
print(employee["name", default: "Unknown"])
print(employee["job", default: "Unknown"])
print(employee["location", default: "Unknown"])

let hasGradueted: [String: Bool] = ["Anna": false, "Mary" : true, "Alice": false]

let olympics = [2012: "London",2016: "Rio de Janeiro",2021: "Tokyo"]
print(olympics[2012, default: "Unknown"])

let results: [String: Int]  = ["english": 100,"french": 85,"geography": 75]
let historyResult = results["history", default: 0]
print(historyResult)

var archEnemies = [String: String]()
archEnemies["Batman"] = "The Joker"
archEnemies["Superman"] = "Lex Luthor"
archEnemies["Batman"] = "Pinguin"
print(archEnemies)


let capitals = ["England": "London", "Wales": "Cardiff", "Scotland": nil]
let scotlandCapital = capitals["Scotlad"]

let books = ["Austen": "Pride and Prejudice"]
let dickens = books["Dickens", default: "Unknown"]


// How to use sets for fast data lookup

var people = Set<String>()
people.insert("Denzel")
people.insert("Tom")
people.insert("Nicolas")
people.insert("Samuel")
print(people.count)
print(people.contains("Tom"))
let mixedPeople = people.sorted()
print(mixedPeople)

// How to create and use enums

enum Weekday {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
//    case monday, tuesday, wednesday, thursday,friday
}
var day = Weekday.monday
day = .thursday
day = .wednesday
