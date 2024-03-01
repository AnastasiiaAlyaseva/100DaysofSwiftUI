import Foundation

// How to create your own classes

class Game {
//struct Game{
    var score = 0 {
        didSet {
            print("Score is \(score) now")
        }
    }
}

var newScore = Game()
newScore.score += 13

// How to make one class inherit from another

class Employee {
    let hours: Int
    
    init(hours: Int) {
        self.hours = hours
    }
    func summary() {
        print("I work \(hours) hours a day")
    }
    }
final class Developer: Employee {
    func work() {
        print("I'm writing code for \(hours) hours")
    }
}
final class Manager: Employee {
    func work(){
        print("I'm spend \(hours) hours at work")
    }
    override func summary() {
        print("I'm a person who will sometimes work \(hours) hours a day")
    }
}

let joe = Developer(hours: 7)
joe.work()
let philip = Manager(hours: 5)
philip.work()
philip.summary()

// How to add initializers for classes
class Vehicle {
    let isElectric: Bool
    
    init(isElectric: Bool){
        self.isElectric = isElectric
    }
}
class Car: Vehicle {
    let isConvertible: Bool
    
    init(isElectric: Bool, isConvertible: Bool){
        self.isConvertible = isConvertible
        super.init(isElectric: isElectric)
    }
}

let bmw = Car(isElectric: true, isConvertible: false)

/*
 class Car: Vehicle {
     let isConvertible = false
 }

 let mazda = Car(isElectric: false)
*/

class Instrument {
    var name: String
    init(name: String) {
        self.name = name
    }
}
class Piano: Instrument {
    var isElectric: Bool
    init(isElectric: Bool) {
        self.isElectric = isElectric
        super.init(name: "Piano")
    }
}


// How to copy classes

class User {
    var username = "Anonymous"
}

var user1 = User()
var user2 = user1
user2.username = "Alex"
print(user1.username)
print(user2.username)

class Person {
    var name = "Anonymous"
    
    func copy() -> Person {
        let person = Person()
        person.name = name
        return person
    }
}
var person = Person()
var newPerson = person.copy()
newPerson.name = "Piter"
print(person.name)
print(newPerson.name)

class Magazine {
    var pageCount = 132
}
var example = Magazine()
var wired = example
wired.pageCount = 164
var vogue = example
vogue.pageCount = 128
print(wired.pageCount)
print(vogue.pageCount)


class Hairdresser {
    var clients = [String]()
}
var tim = Hairdresser()
tim.clients.append("Jess")
var dave = tim
dave.clients.append("Sam")
print(tim.clients.count)
print(dave.clients.count)

// How to create a deinitializer for a class

class Worker{
    let id: Int
    
    init(id: Int) {
        self.id = id
        print("Worker \(id):I'm alive")
    }
    deinit{
        print("Worker \(id): I'm dead")
    }
}

for i in 1...3 {
    let worker = Worker(id: i)
    print("Worker \(worker.id): I'm in control!")
}

class Human {
    let id: Int
    
    init(id: Int) {
        self.id = id
        print("Human \(id):I'm alive")
    }
    deinit{
        print("Human \(id): I'm dead")
    }
}
var humans = [Human]()

for i in 1...3 {
    let human = Human(id: i)
    print("Human \(human.id):I'm in control!")
    humans.append(human)
    
}
print("Loop is finished")
humans.removeAll()
print("Array is clear")

// How to work with variables inside classes

class People {
    var name = "Paul"
}
var people = People()
people.name = "Tom"
print(people.name)
people = People()
print(people.name)

// Checkpoint 7

/*
 Make a class hierarchy for animals, starting with Animal at the top, then Dog and Cat as subclasses, then Corgi and Poodle as subclasses of Dog, and Persian and Lion as subclasses of Cat.
But there’s more:
- The Animal class should have a legs integer property that tracks how many legs the animal has.
- The Dog class should have a speak() method that prints a generic dog barking string, but each of the subclasses should print something slightly different.
- The Cat class should have a matching speak() method, again with each subclass printing something different.
- The Cat class should have an isTame Boolean property, provided using an initializer.

 */

class Animal {
    let legs: Int
    
    init(legs: Int) {
        self.legs = legs
    }
}

class Dog: Animal {
    func speak() {
        print("I'm barking")
    }
}

class Cat: Animal {
    let isTame: Bool
    
    init(legs: Int = 4, isTame: Bool) {
        self.isTame = isTame
        super.init(legs: legs)
    }
    
    func speak() {
        print("I'm meow")
    }
}

final class Corgi: Dog {
    override func speak() {
        print("I bark at people")
    }
}

final class Poodle: Dog {
    override func speak() {
        print("I bark at cat")
    }
}

final class Persan: Cat {
    override func speak() {
        print("Meow")
    }
}

final class Lion: Cat {
    override func speak() {
        print("I can scratch")
    }
}

let persan = Persan(legs: 4, isTame: true)
persan.speak()
let lion = Lion(isTame: false)
lion.speak()
print(lion.legs)
let lion2 = Lion(legs: 3, isTame: false)
lion2.speak()
print(lion2.legs)
let poodle = Poodle(legs: 4)
poodle.speak()
let corgi = Corgi(legs: 4)
corgi.speak()

let animals: [Animal] = [persan, lion, lion2, poodle, corgi]

for animal in animals {
    if let cat = animal as? Cat {
        cat.speak()
    }
}
