import Foundation

// How to reuse code with functions

func showWelcome() {
    print("Welcome to my app!")
}
showWelcome()

func printTimesTables(number: Int, end: Int) {
    for i in 1...end {
        print("\(i) * \(number) is \(i * number)")
    }
}
printTimesTables(number: 4, end: 15)

func square(numbers: [Int]) {
    for number in numbers {
        let squared = number * number
        print("\(number) squared is \(squared).")
    }
}
square(numbers: [2, 3, 4])

//How to return values from functions

func rollDice() -> Int {
    return Int.random(in: 1...6)
}
let result = rollDice()
print(result)

func areLettersIdentical(str1: String, str2: String) -> Bool {
//    let first = str1.sorted()
//    let second = str2.sorted()
//    return first == second
    return str1.sorted() == str2.sorted()
}

func pythagoras(a: Double, b: Double) -> Double {
    let input = a * a + b * b
    let root = sqrt(input)
    return root
}
let c = pythagoras(a: 3, b: 4)
print(c)

func pythagoras2(a: Double, b: Double) -> Double {
  sqrt(a * a + b * b)
}
let b =  pythagoras2(a: 3, b: 4)
print(b)

func greet(name: String) -> String {
    name == "Anastasiia" ? "Oh wow!" : "Hello, \(name)"
}
let person = greet(name: "Anastasiia")
print(person)

func read(books: [String]) -> Bool {
    for book in books {
        print("I'm reading \(book)")
    }
    return true
}
read(books: ["Pride and Prejudice", "Robinson Crusoe", "The Lord of the Rings"])

// How to return multiple values from functions
func isUppercase(string: String) -> Bool {
    string == string.uppercased()
}
let result1 = isUppercase(string: "HELLO")
print(result1)

//Dictionary:
//func getUser() -> [String: String] {
//    ["firstName": "Anastasiia",
//     "lastName": "Smirnova"
//    ]
//}
//let user = getUser()
//print("Name: \(user["firstName", default: "Anonymous"]) \(user["lastName", default: "Anonymous "])")


//Tuples
func getUser() -> (firstName: String, lastName: String) {
    (firstName: "Anastasiia", lastName: "Smirnova")
}
let user = getUser()
print("Name: \(user.firstName) \(user.lastName)")


func newPerson() -> (firstName:String , lastName: String) {
    (firstName: "Sergey", lastName: "Alyasev")
}
let (firstName, _) = newPerson()
print("Name: \(firstName)")

//How to customize parameter labels

func showTimeTable(for number: Int){
    for i in 1...12{
        print("\(i) is \(i * number)")
    }
}
showTimeTable(for: 4)

func wordIsUppercase(_ phrases: String ) -> Bool{
    phrases == phrases.uppercased()
}
let outcome = wordIsUppercase("HELLO,WORLD!")
print(outcome)


