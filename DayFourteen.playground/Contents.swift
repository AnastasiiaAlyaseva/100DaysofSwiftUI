import Foundation

// How to handle missing data with optionals

let opposites = ["Mario": "Wario", "Batman": "Man"]
let peachOpposite = opposites["Peach"]
if let marioOpposite = opposites["Mario"] {
    print("Mario's opposite is \(marioOpposite)")
}

var userName: String? = nil

if let unwrappedName = userName {
    print("We got a user: \(unwrappedName)")
} else {
    print("The optional was empty")
}

var num1 = 100000
var num2 = 0
var num3: Int? = nil

var str1 = "Hello"
var str2 = ""
var str3: String? = nil

var arr1 = [0]
var arr2 = [Int]()
var arr3: [Int]? = nil


func square(number: Int) -> Int {
    number * number
}
var number: Int? = nil

if let number = number {
    print(square(number: number))
}

func getUserName() -> String? {
    "Anastasiia"
}

if let name = getUserName(){
    print("Username is \(name)")
} else {
    print("No username")
}

let album = "Red"
let albums = ["Reputation", "Red", "1989"]
if let possition = albums.firstIndex(of: album) {
    print("Found \(album) at position \(possition)")
}

// How to unwrap optionals with guard

func printSquare(of number: Int?) {
    guard let number = number else {
        print("Missing input")
        return
    }
    print("\(number) X \(number) is \(number * number)")
}
printSquare(of: number)

/*
var myVar: Int? = 3
if let unwrapped = myVar {
    print("Run if myVar has a value inside")
}

guard let unwrapped = myVar else {
    print("Run if myVar doesn't have a value inside")
}
*/

func getMeaningOfLife() -> Int? {
    30
}

func printMeaningOfLife() {
    if let name = getMeaningOfLife(){
        print(name)
    }
}

func printMeaningOfLife2() {
    guard let name = getMeaningOfLife() else {
        return
    }
    print(name)
}

func double(number: Int?) -> Int? {
    guard let number = number else {
        return nil
    }
    return number * 2
}
let input = 5
if let doubled = double(number: input) {
    print("\(input) doubled is \(doubled).")
}

func uppercase(string: String?) -> String? {
    guard let string = string else {
        return nil
    }
    return string.uppercased()
}
if let result = uppercase(string: "Hello") {
    print(result)
}

// How to unwrap optionals with nil coalescing

let captains = [
    "Enterprise": "Picard",
    "Voyager": "Janeway",
    "Defiant": "Sisko"
]
let new = captains["Serenty"] ?? "N/A"
print(new)
let newCaptain = captains["Serenty", default: "N/A"]
print(newCaptain)

let fruits = ["Melon", "Banana", "Apple"]
let favorite = fruits.randomElement() ?? "None"
print(favorite)

struct Book {
    let name: String
    let autor: String?
}

let book = Book(name: "Textbook", autor: nil)
let autor = book.autor ?? "Anonymous"
print(autor)

let scores = ["Picard": 800, "Data": 7000, "Troi": 900]
let crusherScore = scores["Crusher", default: 0]
print(crusherScore)

let distanceRan: Double? = 0.5
let distance: Double = distanceRan ?? 0
print(distance)

var userOptedIn: Bool? = nil
var optedIn = userOptedIn ?? false
print(optedIn)

// How to handle multiple optionals using optional chaining

let friends = ["Tom", "Ron", "Bob", "Bran"]
let chosen = friends.randomElement()?.uppercased() ?? "No one"
print(chosen)

struct Movie {
    let title: String
    let director: String?
}
var movie: Movie = Movie(title: "Comedy", director: "Alex Smight")
// let director = movie?.director?.first?.uppercased() ?? "A"
let director = movie.director?.uppercased() ?? "A"
print(director)


let arts = ["Vincent": "van Gogh", "Pablo": "Picasso", "Claude": "Monet"]
let surnameLetter = arts["Vincent"]?.first?.uppercased() ?? "?"
print(surnameLetter)

// How to handle function failure with optionals

enum UserError: Error {
    case badID, networkFailed
}

func getUser(id: Int) throws -> String {
    throw UserError.networkFailed
}
if let user = try? getUser(id: 29) {
    print("User: \(user)")
}
let user = (try? getUser(id: 25)) ?? "Anonymous"
print(user)

// Checkpoint 9

/*
 Write a function that accepts an optional array of integers, and returns one randomly. If the array is missing or empty, return a random number in the range 1 through 100.
  I want you to write your function in a single line of code.
 */



func randomInt(array : [Int]?) -> Int {
    array?.randomElement() ?? Int.random(in: 1...100)
}
let array : [Int]? = nil
print(randomInt(array: array))

let array2 : [Int]? = []
print(randomInt(array: array2))

let array3 : [Int] = [1,2,3,4,5]
print(randomInt(array: array3))
