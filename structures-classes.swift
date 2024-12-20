import Foundation

// 1. Yapı (Struct) Tanımlama
struct Person {
    var name: String
    var age: Int

    // Yapıya ait bir metot
    func greet() {
        print("Hello, my name is \(name) and I am \(age) years old.")
    }

    // Yapıya ait bir computed property
    var ageInMonths: Int {
        return age * 12
    }
}

// Yapı ile bir nesne oluşturma
var person1 = Person(name: "Alice", age: 30)
person1.greet()
print("Age in months: \(person1.ageInMonths)")

// 2. Sınıf (Class) Tanımlama
class Car {
    var make: String
    var model: String
    var year: Int

    // Başlatıcı (Initializer)
    init(make: String, model: String, year: Int) {
        self.make = make
        self.model = model
        self.year = year
    }

    // Sınıf içerisinde bir metot
    func description() -> String {
        return "\(year) \(make) \(model)"
    }
}

// Sınıf ile bir nesne oluşturma
let car1 = Car(make: "Toyota", model: "Corolla", year: 2020)
print(car1.description())

// 3. Yapılar ve Sınıflar Arasındaki Fark
let person2 = person1 // Yapılar değer tipi olduğu için kopyalanır
person2.age = 25
print("Person 1 Age: \(person1.age)") // 30
print("Person 2 Age: \(person2.age)") // 25

let car2 = car1 // Sınıflar referans tipi olduğu için kopyalanmaz, aynı nesneyi işaret eder
car2.year = 2022
print("Car 1 Year: \(car1.year)") // 2022
print("Car 2 Year: \(car2.year)") // 2022

// 4. Miras Alma (Inheritance) - Sınıflar için
class ElectricCar: Car {
    var batteryCapacity: Int

    init(make: String, model: String, year: Int, batteryCapacity: Int) {
        self.batteryCapacity = batteryCapacity
        super.init(make: make, model: model, year: year)
    }

    override func description() -> String {
        return "\(super.description()) with a battery capacity of \(batteryCapacity) kWh"
    }
}

// ElectricCar sınıfından bir nesne oluşturma
let tesla = ElectricCar(make: "Tesla", model: "Model S", year: 2022, batteryCapacity: 100)
print(tesla.description())

// 5. Değer ve Referans Tipi Farklılıkları
struct Rectangle {
    var width: Double
    var height: Double

    mutating func resize(newWidth: Double, newHeight: Double) {
        width = newWidth
        height = newHeight
    }
}

var rectangle1 = Rectangle(width: 10, height: 5)
var rectangle2 = rectangle1 // Yapı olduğu için rectangle2 bir kopyadır
rectangle2.resize(newWidth: 15, newHeight: 8)

print("Rectangle 1: \(rectangle1.width) x \(rectangle1.height)") // 10 x 5
print("Rectangle 2: \(rectangle2.width) x \(rectangle2.height)") // 15 x 8

class Square {
    var side: Double

    init(side: Double) {
        self.side = side
    }

    func resize(newSide: Double) {
        side = newSide
    }
}

let square1 = Square(side: 5)
let square2 = square1 // Sınıf olduğu için square2, square1 nesnesine referans verir
square2.resize(newSide: 10)

print("Square 1 Side: \(square1.side)") // 10
print("Square 2 Side: \(square2.side)") // 10
