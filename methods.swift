import Foundation

// 1. Instance Methods (Örnek Metodları)
struct Rectangle {
    var width: Double
    var height: Double
    
    // Instance method: Rectangle örneği için alan hesaplama
    func area() -> Double {
        return width * height
    }
    
    // Instance method: Rectangle örneği için çevre hesaplama
    func perimeter() -> Double {
        return 2 * (width + height)
    }
}

var rect = Rectangle(width: 10, height: 5)
print("Area: \(rect.area())")  // 10 * 5 = 50
print("Perimeter: \(rect.perimeter())")  // 2 * (10 + 5) = 30

// 2. Type Methods (Tip Metodları)
class Car {
    var make: String
    var model: String
    var year: Int

    init(make: String, model: String, year: Int) {
        self.make = make
        self.model = model
        self.year = year
    }

    // Type method: class düzeyinde çalışan bir metot
    class func generalInfo() -> String {
        return "Cars are a common mode of transportation."
    }

    // Instance method: Car örneği için metot
    func description() -> String {
        return "\(year) \(make) \(model)"
    }
}

print(Car.generalInfo())  // Type method çağrısı
let myCar = Car(make: "Toyota", model: "Corolla", year: 2020)
print(myCar.description())  // Instance method çağrısı

// 3. Mutating Methods (Değiştirici Metodlar)
struct Counter {
    var count = 0

    // Mutating method: Yapının özelliğini değiştirmek için kullanılır
    mutating func increment() {
        count += 1
    }

    mutating func decrement() {
        count -= 1
    }
}

var counter = Counter()
counter.increment()  // count 1 arttı
print("Counter after increment: \(counter.count)")  // 1
counter.decrement()  // count 1 azaldı
print("Counter after decrement: \(counter.count)")  // 0

// 4. Method Overloading (Metod Aşırı Yüklemesi)
class MathOperations {
    // Aşırı yüklenmiş toplama metodları
    func add(_ a: Int, _ b: Int) -> Int {
        return a + b
    }
    
    func add(_ a: Double, _ b: Double) -> Double {
        return a + b
    }
    
    func add(_ a: String, _ b: String) -> String {
        return a + b
    }
}

let math = MathOperations()
print("Int Add: \(math.add(3, 4))")  // 7
print("Double Add: \(math.add(3.5, 4.5))")  // 8.0
print("String Add: \(math.add("Hello, ", "World!"))")  // Hello, World!

// 5. Method as a Parameter (Metod Parametre Olarak Geçirme)
func performOperation(on a: Int, and b: Int, using operation: (Int, Int) -> Int) -> Int {
    return operation(a, b)
}

let result = performOperation(on: 5, and: 3, using: math.add)
print("Performing operation (addition): \(result)")

// 6. Self Kullanımı
struct Person {
    var name: String
    var age: Int
    
    // self anahtar kelimesiyle örnek nesneye erişim
    func introduce() {
        print("Hi, my name is \(self.name) and I am \(self.age) years old.")
    }
}

let person = Person(name: "John", age: 30)
person.introduce()

// 7. Method with Default Parameters (Varsayılan Parametreler)
func greet(name: String = "Guest") {
    print("Hello, \(name)!")
}

greet()  // Default "Guest" kullanılır
greet(name: "Alice")  // Verilen "Alice" kullanılır
