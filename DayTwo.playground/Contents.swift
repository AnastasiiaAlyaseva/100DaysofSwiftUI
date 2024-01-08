import Foundation

// How to store truth with Booleans
let filename = "paris.jpg"
print(filename.hasSuffix(".jpg"))
let number = 120
print(number.isMultiple(of: 5))

var isAuthenticated = false
isAuthenticated = !isAuthenticated
print(isAuthenticated)
isAuthenticated = !isAuthenticated
print(isAuthenticated)

var gameOver = false
print(gameOver)

gameOver.toggle()
print(gameOver)

// How to join strings together
let people = "Haters"
let action = "hate"
let lyric = people + "gonna" + action
print(lyric)

let name = "Anastasiia"
let age = 29
let message = "Hello, my name is \(name) and I'm \(age) years old."
print(message)

print("5 * 5 is \(5 * 5)")


// Checkpoint 1
// Goal:
// Creates a constant holding any temperature in Celsius.
//Converts it to Fahrenheit by multiplying by 9, dividing by 5, then adding 32.
//Prints the result for the user, showing both the Celsius and Fahrenheit values.

let celsiusTemperature : Double = 15.0
let fahrenheitTemperature = celsiusTemperature * 9.0 / 5.0 + 32.0
let resultMessage = "Air temperature in Celsius is \(celsiusTemperature)°C and in Fahrenheit is \(fahrenheitTemperature)°F!"
print(resultMessage)
