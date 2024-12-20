import Foundation

// 1. Optional Chaining Temel Kullanımı
class Person {
    var name: String
    var residence: Residence?
    
    init(name: String, residence: Residence?) {
        self.name = name
        self.residence = residence
    }
}

class Residence {
    var numberOfRooms: Int
    
    init(numberOfRooms: Int) {
        self.numberOfRooms = numberOfRooms
    }
    
    func printRoomCount() {
        print("This residence has \(numberOfRooms) rooms.")
    }
}

let residence1 = Residence(numberOfRooms: 3)
let person1 = Person(name: "Alice", residence: residence1)

// Optional chaining ile 'residence' özelliğine ve 'printRoomCount()' metoduna güvenli erişim
person1.residence?.printRoomCount()  // Output: This residence has 3 rooms.

// 2. Optional Chaining ile Değere Erişim
class Apartment {
    var address: String?
    
    init(address: String?) {
        self.address = address
    }
}

let apartment1: Apartment? = Apartment(address: "123 Main St.")
let address = apartment1?.address  // Optional Chaining ile 'address' özelliğine güvenli erişim
print(address ?? "No address available.")  // Output: 123 Main St.

// 3. Optional Chaining ile Optional Değer Döndürme
class Building {
    var apartment: Apartment?
    
    init(apartment: Apartment?) {
        self.apartment = apartment
    }
}

let building1 = Building(apartment: apartment1)
let buildingAddress = building1.apartment?.address  // Optional Chaining ile nested optional'a erişim
print(buildingAddress ?? "No apartment address available.")  // Output: 123 Main St.

// 4. Optional Chaining ile Nil Coalescing Operatörü
let buildingAddress2 = building1.apartment?.address ?? "No apartment found"  // Nil coalescing kullanımı
print(buildingAddress2)  // Output: 123 Main St.

let building2 = Building(apartment: nil)
let buildingAddress3 = building2.apartment?.address ?? "No apartment found"
print(buildingAddress3)  // Output: No apartment found

// 5. Optional Chaining ile Fonksiyon Döndürme
class Car {
    var model: String
    var engine: Engine?
    
    init(model: String, engine: Engine?) {
        self.model = model
        self.engine = engine
    }
}

class Engine {
    func start() {
        print("Engine started!")
    }
}

let engine = Engine()
let car1 = Car(model: "Tesla", engine: engine)

// Optional chaining ile 'engine' objesinin metoduna erişim
car1.engine?.start()  // Output: Engine started!

// 6. Optional Chaining ile Nil Sonucu
let car2 = Car(model: "BMW", engine: nil)
car2.engine?.start()  // No output: engine is nil, nothing happens

// 7. Optional Chaining ile Dizilerde Güvenli Erişim
class User {
    var name: String
    var favoriteMovies: [String]?
    
    init(name: String, favoriteMovies: [String]?) {
        self.name = name
        self.favoriteMovies = favoriteMovies
    }
}

let user = User(name: "John", favoriteMovies: ["Inception", "Interstellar"])

if let firstMovie = user.favoriteMovies?.first {
    print("The first movie is \(firstMovie).")  // Output: The first movie is Inception.
} else {
    print("No favorite movies found.")
}

let userWithoutMovies = User(name: "Jane", favoriteMovies: nil)
if let firstMovie = userWithoutMovies.favoriteMovies?.first {
    print("The first movie is \(firstMovie).")
} else {
    print("No favorite movies found.")  // Output: No favorite movies found.
}
