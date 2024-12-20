import Foundation

// 1. Struct ve Extension ile Basit Kullanım
struct Person {
    var name: String
    var age: Int
}

extension Person {
    // Yeni bir computed property ekleme
    var isAdult: Bool {
        return age >= 18
    }
    
    // Yeni bir fonksiyon ekleme
    func greet() {
        print("Hello, my name is \(name) and I am \(age) years old.")
    }
}

let person1 = Person(name: "Alice", age: 30)
let person2 = Person(name: "Bob", age: 15)

person1.greet()  // Output: Hello, my name is Alice and I am 30 years old.
person2.greet()  // Output: Hello, my name is Bob and I am 15 years old.

print(person1.isAdult)  // Output: true
print(person2.isAdult)  // Output: false

// 2. Extension ile Class'a Fonksiyon Eklemek
class Car {
    var make: String
    var model: String
    
    init(make: String, model: String) {
        self.make = make
        self.model = model
    }
}

extension Car {
    // Yeni bir fonksiyon ekleme
    func carDescription() -> String {
        return "This is a \(make) \(model)."
    }
}

let myCar = Car(make: "Tesla", model: "Model S")
print(myCar.carDescription())  // Output: This is a Tesla Model S.

// 3. Protocol ve Extension Kullanımı
protocol Drivable {
    func drive()
}

extension Drivable {
    // Protocol'e bir default implementation ekleme
    func drive() {
        print("Driving...")
    }
}

struct Bicycle: Drivable {
    var brand: String
}

struct Airplane: Drivable {
    var model: String
    func drive() {
        print("Flying in the sky!")
    }
}

let bike = Bicycle(brand: "Giant")
let plane = Airplane(model: "Boeing 747")

bike.drive()  // Output: Driving...
plane.drive() // Output: Flying in the sky!

// 4. Extension ile Initializer Eklemek
extension String {
    init(repeatingCharacter character: Character, count: Int) {
        self = String(repeating: character, count: count)
    }
}

let starString = String(repeatingCharacter: "*", count: 5)
print(starString)  // Output: *****
