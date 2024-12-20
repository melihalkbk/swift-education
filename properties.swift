import Foundation

// 1. Stored Properties (Depolanan Özellikler)
struct Rectangle {
    var width: Double
    var height: Double
}

var rect = Rectangle(width: 10, height: 5)
print("Rectangle: \(rect.width) x \(rect.height)")

// 2. Computed Properties (Hesaplanan Özellikler)
struct Circle {
    var radius: Double
    
    // Hesaplanan özellik
    var area: Double {
        return Double.pi * radius * radius
    }
    
    var circumference: Double {
        return 2 * Double.pi * radius
    }
}

let circle = Circle(radius: 5)
print("Circle Area: \(circle.area)")
print("Circle Circumference: \(circle.circumference)")

// 3. Property Observers (Özellik Gözlemcileri)
class Car {
    var make: String
    var year: Int {
        didSet {
            if year < 2000 {
                print("This car is quite old!")
            } else {
                print("This is a newer car.")
            }
        }
    }

    init(make: String, year: Int) {
        self.make = make
        self.year = year
    }
}

let car = Car(make: "Toyota", year: 2015)
car.year = 1995  // DidSet tetiklenecek

// 4. Lazy Properties (Tembel Özellikler)
class DatabaseManager {
    // Lazy property, yalnızca ihtiyaç duyulduğunda oluşturulur
    lazy var databaseConnection: String = {
        print("Establishing connection to the database...")
        return "Database Connection Established"
    }()
    
    func connect() -> String {
        return databaseConnection
    }
}

let dbManager = DatabaseManager()
print("Connection Status: \(dbManager.connect())")  // Lazy özelliği ilk kez burada tetiklenir

// 5. Read-Only Computed Property (Sadece Okunabilir Hesaplanan Özellik)
struct Temperature {
    var celsius: Double
    
    // Sadece okunabilir özellik
    var fahrenheit: Double {
        return (celsius * 9 / 5) + 32
    }
}

let temp = Temperature(celsius: 25)
print("Temperature in Fahrenheit: \(temp.fahrenheit)")

// 6. Property Wrapper (Özellik Sarmalayıcılar)
@propertyWrapper
struct Clamped<T: Comparable> {
    var value: T
    let range: ClosedRange<T>
    
    init(wrappedValue: T, range: ClosedRange<T>) {
        self.value = wrappedValue
        self.range = range
    }
    
    var wrappedValue: T {
        get { return value }
        set { value = min(max(newValue, range.lowerBound), range.upperBound) }
    }
}

struct User {
    @Clamped(range: 18...100) var age: Int
}

var user = User(age: 25)
print("User age: \(user.age)") // 25
user.age = 15  // Sarmalayıcı, değeri 18'e sınırlar
print("Updated user age: \(user.age)") // 18

// 7. Private Properties (Özel Özellikler)
class Account {
    private var balance: Double
    
    init(balance: Double) {
        self.balance = balance
    }
    
    func deposit(amount: Double) {
        balance += amount
        print("Deposited \(amount), new balance is \(balance)")
    }
    
    func withdraw(amount: Double) {
        if amount <= balance {
            balance -= amount
            print("Withdrew \(amount), new balance is \(balance)")
        } else {
            print("Insufficient funds!")
        }
    }
}

let account = Account(balance: 1000)
account.deposit(amount: 500)
account.withdraw(amount: 200)
