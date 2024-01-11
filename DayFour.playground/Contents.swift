import Foundation

// How to use type annotations

var books: Set<String> = Set(["The Bluest Eye", "Foundation", "Girl, Woman, Other"])
var soda : [String] = ["Coke", "Pepsi", "Irn-Bry"]

enum UIStyle {
    case light, dark, system
}
var style: UIStyle = UIStyle.light
style = .dark

let username: String
// lots of complex logic
username = "Anastasiia"
// lots more complex logic
print(username)


// Checkpoint 2
// Create an array of strings, then write some code that prints the number of items in the array and also the number of unique items in the array.

let fruits: [String] = ["Apple", "Melon", "Orange", "Mango", "Banana", "Orange", "Melon"]
print("There are \(fruits.count) elements in this array")
let setFruit: Set = Set(fruits)
print("There are \(setFruit.count) unique elements in this set")

var reapetFruit: [String: Int] = [:]
for fruit in fruits {
    if let reapet = reapetFruit[fruit] {
        reapetFruit[fruit] = reapet + 1
    } else {
        reapetFruit[fruit] = 1
    }
}
print(reapetFruit)

let text = "Create an array of strings"
func countLetters(text: String) -> [String: Int] {
    var reapetLetters = [String: Int]()
    for character in text {
        let element = String(character)
        if let reapet = reapetLetters[element] {
            reapetLetters[element] = reapet + 1
        } else {
            reapetLetters[element] = 1
        }
    }
    return reapetLetters
}

func countLetters2(text: String) -> [Character: Int] {
    var reapetLetters = [Character: Int]()
    for character in text {
        if let reapet = reapetLetters[character] {
            reapetLetters[character] = reapet + 1
        } else {
            reapetLetters[character] = 1
        }
    }
    return reapetLetters
}

let result = countLetters(text: text)
print(result)

let result2 = countLetters2(text: text)
print(result2)


let vegatables: Set<String> = Set(["Carrots", "Cucambers", "Onion", "Potatoes", "Cucambers","Onion"])
print("There are \(vegatables.count) unique elements in this set")

