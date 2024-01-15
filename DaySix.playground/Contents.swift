import Foundation

// How to use a for loop to repeat work
let platforms = ["iOS", "macOS", "tvOS", "watchOS"]

for os in platforms {
    print("Swift works great on \(os)")
}

for i in 1...12 {
    print("5 * \(i) is \(5 * i)")
}

for i in 1...10{
    print("The \(i) time table")
    for a in 1...10 {
      print("     \(a) * \(i) is \(a * i)")
    }
}

for i in 1..<5 {
    print("Counting from 1 up to 5: \(i)")
}

let names = ["Sterling", "Cyril", "Lana", "Ray", "Pam"]
for _ in names {
    print("[CENSORED] is a secret agent!")
}

let peopleNames = ["Piper", "Alex", "Suzanne", "Gloria"]
print(peopleNames[1...])

// How to use a while loop to repeat work

var countdown = 10

while countdown > 0 {
    print("\(countdown)...")
    countdown -= 1
}
print("Blast off")

let id = Int.random(in: 1...1000)
print(id)
let amound = Double.random(in: 0...1)
print(amound)


var roll = 0
while roll != 20 {
    roll = Int.random(in: 1...20)
    print("I rilled a \(roll)")
}
print("Critical hit")


//How to skip loop items with break and continue

let filenames = ["me.jpg", "work.txt", "sophie.jpg", "logo.psd"]
for filename in filenames {
    if filename.hasSuffix(".jpg") == false {
        continue
    }
    print("Found picture: \(filename)")
}

let number1 = 4
let number2 = 14
var multiples = [Int]()

for i in 1...100_000{
    if i.isMultiple(of: number1) && i.isMultiple(of: number2) {
        multiples.append(i)
        
        if multiples.count == 10 {
            break
        }
    }
}
print(multiples)


let scores = [1, 4, 6, 0, 7, 3 ,8]
var count = 0

for score in scores {
    if score == 0 {
        break
    }
    count += 1
}
print("You had \(count) scores before you got 0.")


let options = ["up", "down", "left", "right"]
let secretCombination = ["up", "up", "right"]

outerLoop: for option1 in options {
    for option2 in options{
        for option3 in options{
            print("In loop")
            let attempt = [option1, option2, option3]
            
            if attempt == secretCombination{
                print("The combination is \(attempt)!")
                break outerLoop
            }
        }
    }
}

// Your goal is to loop from 1 through 100, and for each number:
//If it’s a multiple of 3, print “Fizz”
//If it’s a multiple of 5, print “Buzz”
//If it’s a multiple of 3 and 5, print “FizzBuzz”
//Otherwise, just print the number.

for i in 1...100 {
    if i.isMultiple(of: 3) && i.isMultiple(of: 5) {
        print("\(i) should print 'FizzBuzz'")
    } else if i.isMultiple(of: 3) {
        print("\(i) should print 'Fizz'")
    } else if i.isMultiple(of: 5) {
        print("\(i) should print 'Buzz'")
    } else {
        print("\(i) should print '\(i)'")
    }
}
