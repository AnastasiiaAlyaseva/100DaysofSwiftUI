
import Foundation

struct Card: Codable {
    var prompt: String
    var answer: String
    
    static let example = Card(prompt: "What is the capital city of Scotland?", answer: "Edinburgh")
}
