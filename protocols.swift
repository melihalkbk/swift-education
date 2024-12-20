import Foundation

// 1. Basit bir Protocol Tanımlama
protocol Drivable {
    var speed: Double { get set }
    func drive()
}

class Car: Drivable {
    var speed: Double
    var make: String
    
    init(make: String, speed: Double) {
        self.make = make
        self.speed = speed
    }
    
    func drive() {
        print("\(make) is driving at \(speed) km/h.")
    }
}

class Bicycle: Drivable {
    var speed: Double
    var brand: String
    
    init(brand: String, speed: Double) {
        self.brand = brand
        self.speed = speed
    }
    
    func drive() {
        print("\(brand) bicycle is riding at \(speed) km/h.")
    }
}

let myCar = Car(make: "Toyota", speed: 120)
myCar.drive()  // Output: Toyota is driving at 120 km/h.

let myBike = Bicycle(brand: "Giant", speed: 25)
myBike.drive()  // Output: Giant bicycle is riding at 25 km/h.

// 2. Protocol'a Default Implementation Eklemek
protocol Flyable {
    func fly()
}

extension Flyable {
    func fly() {
        print("Flying...")
    }
}

class Airplane: Flyable {
    var model: String
    init(model: String) {
        self.model = model
    }
    
    // Flyable protocol'ünü implement ederken varsayılan fly() fonksiyonu kullanılabilir
}

let myPlane = Airplane(model: "Boeing 747")
myPlane.fly()  // Output: Flying...

// 3. Protocol ile Optional Yöntemler (Sadece Protocol'lerde)
@objc protocol Speaker {
    @objc optional func speak()
}

class Person: Speaker {
    func speak() {
        print("Hello!")
    }
}

let person = Person()
person.speak()  // Output: Hello!

// 4. Protocol Birleştirme (Protocol Composition)
protocol HasWheels {
    var wheelCount: Int { get }
}

protocol HasEngine {
    var engineType: String { get }
}

class Motorcycle: HasWheels, HasEngine {
    var wheelCount: Int = 2
    var engineType: String = "V-twin"
    
    func description() {
        print("Motorcycle with \(wheelCount) wheels and \(engineType) engine.")
    }
}

let myMotorcycle = Motorcycle()
myMotorcycle.description()  // Output: Motorcycle with 2 wheels and V-twin engine.

// 5. Protocol'ün Kullanımı (Polymorphism)
func testDrivable(vehicle: Drivable) {
    vehicle.drive()
}

testDrivable(vehicle: myCar)  // Output: Toyota is driving at 120 km/h.
testDrivable(vehicle: myBike)  // Output: Giant bicycle is riding at 25 km/h.
