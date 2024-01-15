import Foundation

// How to check a condition is true or false

let speed = 88
let percentage = 85
let age = 18

if speed >= 88 {
    print("Where we're going we don't need roads.")
}
if percentage < 85 {
    print ("Sorry, you failed the test")
}
if age >= 18 {
    print("You're eligible to vote")
}

let ourName = "Anastasiia"
let friendName = "Sergey"

if ourName < friendName {
    print("It's \(ourName) vs \(friendName)")
}
if ourName > friendName {
    print("It's \(friendName) vs \(ourName)")
}

var numbers = [1, 2, 3]
numbers.append(4)
if numbers.count > 3 {
    numbers.remove(at: 0)
}
print(numbers)

let name = "Anastasiia"
if name != "Anonymous" {
    print("Welcome, \(name)")
}

var userName = "Anna12345"
if userName.isEmpty{
    userName = "Anonymous"
}
print("Welcome, \(userName)")

enum Sizes: Comparable{
    case small
    case medium
    case large
}

let first = Sizes.small
let second = Sizes.large
print(first < second)

//How to check multiple conditions
let temp = 25
if temp > 20 && temp < 30 {
    print("It's a nice day")
}

let userAge = 14
let hasParentalConsent = true
if age >= 18 || hasParentalConsent {
    print("You can buy the game!")
}

enum TransportOption{
    case airplane, helicopter, bicycle, car, escooter
}
let transport = TransportOption.helicopter
if transport == .airplane || transport == .helicopter {
    print("Let's fly!")
} else if transport == .bicycle {
    print("I hope there's a bike path")
} else if transport == .car {
    print("Time to get stuck in traffic")
} else {
    print("I'm going to hire a scooter now")
}

let isOwner = true
let isAdmin = true
let isEditingEnabled  = true
if isOwner || isAdmin {
    print("You can delete this post")
}

if isOwner && isEditingEnabled || isAdmin {
    print("You can delete this post")
}
if (isOwner && isEditingEnabled) || isAdmin {
    print("You can delete this post")
}

//How to use switch statements to check multiple conditions

enum Weather {
    case sun, rain, wind, snow, unknow
}
let forecast = Weather.sun

switch forecast {
case .sun:
    print("It should be a nice day.")
case .rain:
    print("Pack an umbrella")
case .wind:
    print("Wear something warm")
case .snow:
    print("School is cancelled.")
case .unknow:
    print("Our forecast generator is broken!")
}

let place = "Metropolis"

switch place {
case "Gotham":
    print("You're Batman!")
case "Mega-City One":
    print("You're Judge Dredd!")
case "Wakanda":
    print("You're Black Panther")
default:
    print("Who are you?")
}

let day = 5
print("My true love gave to me…")

switch day {
case 5:
    print("5 golden rings")
    fallthrough
case 4:
    print("4 calling birds")
    fallthrough
case 3:
    print("3 French hens")
    fallthrough
case 2:
    print("2 turtle doves")
    fallthrough
default:
    print("A partridge in a pear tree")
}


// How to use the ternary conditional operator for quick tests
let yourAge = 18
let canVote = yourAge >= 18 ? "Yes" : "No"
print(canVote)
//mnemonic: WTF. It stands for “what?, true, false”

let hour = 23
print(hour < 12 ? "It's before noon" : "It's after noon")

let names = ["Tom", "Ron", "Anna"]
let crewCount = names.isEmpty ? "No one" : "\(names.count) people"
print(crewCount)


enum Theme {
    case light, dark
}
let theme = Theme.dark
let backgroung = theme == .dark ? "black" : "white"
print(backgroung)


