import Foundation

// How to provide default values for parameters

func printTimesTables(for number: Int, end: Int = 12){
    for i in 1...end{
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(for: 4, end: 15)
printTimesTables(for: 7)

var characters = ["Anna", "Alex", "Dina"]
print(characters.count)
// removes the items while also keeping the previous capacity !!!!
characters.removeAll(keepingCapacity: true)
print(characters.count)


func findDirections(from: String, to: String, route: String = "fastest", avoidHighways: Bool = false) {
    // code here
}

findDirections(from: "London", to: "Glasgow")
findDirections(from: "London", to: "Glasgow", route: "scenic")
findDirections(from: "London", to: "Glasgow", route: "scenic", avoidHighways: true)

// How to handle errors in functions

enum PasswordError: Error {
    case toShort
    case obvious
}

func checkPassword(_ password: String) throws -> String {
    if password.count < 5 {
        throw PasswordError.toShort
    }
    if password == "12345" {
        throw PasswordError.obvious
    }
    
    if password.count < 8 {
        return "Ok"
    } else if  password.count < 10 {
        return "Good"
    } else {
        return "Exelent"
    }
}
let key = "12345"

do {
    let result = try checkPassword(key)
    print("Password rating: \(result)")
} catch PasswordError.toShort {
    print("Please use a longer password.")
} catch PasswordError.obvious {
    print("I have the same combination on my luggage!")
} catch {
    print("There was an error.")
}


do {
  let data = "hello, world".data(using: .utf8)!
  let decoder = JSONDecoder()
  let string1 = try decoder.decode(String.self, from: data)
} catch is DecodingError {
  print("something went wrong while decoding!")
} catch {
  print("something went wrong!")
  print(error)
}


//do {
//    try throwingFunction1()
//    nonThrowingFunction1()
//    try throwingFunction2()
//    nonThrowingFunction2()
//    try throwingFunction3()
//} catch {
//    // handle errors
//}



//The challenge is this: write a function that accepts an integer from 1 through 10,000, and returns the integer square root of that number. That sounds easy, but there are some catches:
//
//You can’t use Swift’s built-in sqrt() function or similar – you need to find the square root yourself.
//If the number is less than 1 or greater than 10,000 you should throw an “out of bounds” error.
//You should only consider integer square roots – don’t worry about the square root of 3 being 1.732, for example.
//If you can’t find the square root, throw a “no root” error.



enum ShowError : Error {
    case outOfBounds
    case noRoot
}

func squareRoot(number: Int) throws -> Int {
    guard number >= 1 && number <= 10000 else {
        throw ShowError.outOfBounds
    }
    var root = 0
    for i in 1...100 {
        if number == i * i {
            root = i
            break
        }
    }
    if root == 0 {
        throw ShowError.noRoot
    }
    return root
}

do{
    let result = try squareRoot(number: 400)
    print("The integer square root is : \(result)" )
} catch ShowError.outOfBounds{
    print("Please provide number between 1 and 10.000")
} catch ShowError.noRoot {
    print("No integer square root found")
} catch {
    print("Unknown error")
}

//Write a function that takes a string as input and returns its length. If the string is empty, the function should generate an error.

enum ErrorTipe : Error {
    case empty
}

func checkLine(word: String) throws -> Int {
    if word.count == 0 {
        throw ErrorTipe.empty
    }
    return word.count
}

do {
    let result2 = try checkLine(word: "")
    print("Length of the string is \(result2)")
} catch ErrorTipe.empty{
    print("The string is empty")
} catch {
    print("Unknown error")
}

//Write a function that takes two numbers as input and returns their sum. The function should generate an error if one of the numbers is negative.

enum PossibleError : Error {
    case negativeNumber
}

func sumOfNumbers(a: Int, b: Int) throws -> Int {
    if a <= 0 || b <= 0 {
        throw PossibleError.negativeNumber
    }
    return a + b
}
