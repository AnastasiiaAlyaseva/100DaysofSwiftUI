import Foundation

/*
 [1, 2, 3, 4, 5, 5, 6, 7, 8]   -> result 5
 [1, 2, 3, 4, 5, 6, 7, 8]  -> result nil
*/

func findDuplicateNumber(_ numbers: [Int]) -> Int? {
    var uniqueItems = Set<Int>()
    
    for number in numbers {
        if uniqueItems.contains(number){
            return number
        }
        uniqueItems.insert(number)
    }
    return nil
}

let numbers = [1, 2, 3, 4, 5, 5, 6, 7, 8]
if let duplicate = findDuplicateNumber(numbers) {
    print("Duplicate number is \(duplicate)")
} else {
    print("Duplicate not found")
}

/*
 [1, 2, 3, 4, 5, 5, 6, 7, 8]   -> result [5]
 [1, 2, 3, 4, 5, 6, 7, 8]  -> result []
 [1, 2, 5, 3, 4, 5, 6, 7, 8, 2]  -> result [5, 2]
 [1, 2, 5, 3, 4, 5, 6, 7, 8, 2, 5]  -> result [5, 2]
 */

func findDuplicateNumber2(_ numbers: [Int]) -> [Int] {
    var uniqueItems = Set<Int>()
    var duplicates = Set<Int>()
    
    for number in numbers {
        if uniqueItems.contains(number){
            duplicates.insert(number)
        } else {
            uniqueItems.insert(number)
        }
    }
    return  Array(duplicates)
}

let numbers2 = [1, 2, 2, 3, 4, 5, 6, 7, 8, 5, 5]
print(findDuplicateNumber2(numbers2))

//
func findDuplicateNumber3(_ numbers: [Int]) -> [Int] {
    var uniqueItems = [Int]()
    var duplicates = Set<Int>()
    
    for number in numbers {
        if uniqueItems.contains(number){
            duplicates.insert(number)
        } else {
            uniqueItems.append(number)
        }
    }
    print(uniqueItems)
    return Array(duplicates)
}

findDuplicateNumber3(numbers2)


