
import MapKit
import Foundation


struct Location: Codable, Equatable, Identifiable {
    var id: UUID
    var name: String
    var description: String
    var latitude: Double
    var longitude: Double
    
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    static func ==(lhs: Location, rhs: Location ) -> Bool {
        lhs.id == rhs.id
    }
    
    #if DEBUG
    static let example = Location(id: UUID(), name: "Berlin", description: "It's a very cosmopolitan city", latitude: 52.517037, longitude: 13.38886)
    #endif
}
