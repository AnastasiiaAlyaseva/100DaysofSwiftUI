import Foundation

// How to create variables and constants
var name = "Ted"
name = "Rebecca"
name = "Keeley"

let character = "Daphne"

var playerName = "Roy"
print (playerName)

playerName = "Dani"
print(playerName)

playerName = "Sam"
print(playerName)

// How to create strings

let actor = "Denzel Washington"
let filename = "paris.jpg"
let result = "⭐️ You win! ⭐️"
let movie = """
A day in
the life of an
Apple engineer
"""

let nameLength = actor.count
print(nameLength)

print(result.uppercased())
print(movie.hasPrefix("A day"))
print(filename.hasSuffix(".jpg"))

// How to store whole numbers

let score = 10
let eallyBig = 100_000_000

let lowerScore = score - 2
let higherScore = score + 10
let doubledScore = score * 2
let squaredScore = score * score
let halvedScore = score / 2
print(score)

var counter = 10
// counter = counter + 5
counter += 5
print(counter)

counter *= 2
print(counter)
counter -= 10
print(counter)
counter /= 2
print(counter)

let number = 120
print(number.isMultiple(of: 3))
// print(120.isMultiple(of: 3))

// How to store decimal numbers
let a = 1
let b = 2.0
let c = a + Int(b)
let d = Double(a) + b

var rating = 5.0
rating += 2

