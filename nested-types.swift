import Foundation

// 1. Nested Struct (İç İçe Yapı)
struct Car {
    var make: String
    var model: String
    var year: Int
    
    // Nested struct: Engine (Motor)
    struct Engine {
        var type: String
        var horsepower: Int
        
        func start() {
            print("The engine of \(horsepower) HP is starting.")
        }
    }
    
    // Nested enum: CarType (Araç Tipi)
    enum CarType {
        case sedan, coupe, convertible
    }
    
    func startCar() {
        let engine = Engine(type: "V8", horsepower: 500)
        engine.start()
        print("\(make) \(model) of year \(year) started.")
    }
}

// 2. Kullanım Örneği: Nested Struct ve Nested Enum
let myCar = Car(make: "Ford", model: "Mustang", year: 2023)
myCar.startCar()

let carType: Car.CarType = .coupe
switch carType {
case .sedan:
    print("The car is a sedan.")
case .coupe:
    print("The car is a coupe.")
case .convertible:
    print("The car is a convertible.")
}

// 3. Nested Class (İç İçe Sınıf)
class Library {
    var name: String
    var books: [Book]
    
    init(name: String, books: [Book]) {
        self.name = name
        self.books = books
    }
    
    // Nested class: Book (Kitap)
    class Book {
        var title: String
        var author: String
        
        init(title: String, author: String) {
            self.title = title
            self.author = author
        }
        
        func description() -> String {
            return "\(title) by \(author)"
        }
    }
    
    func displayBooks() {
        for book in books {
            print(book.description())
        }
    }
}

// 4. Kullanım Örneği: Nested Class
let book1 = Library.Book(title: "1984", author: "George Orwell")
let book2 = Library.Book(title: "Brave New World", author: "Aldous Huxley")
let library = Library(name: "City Library", books: [book1, book2])
library.displayBooks()

// 5. Nested Enum (İç İçe Enum)
enum Shape {
    case circle(radius: Double)
    case rectangle(width: Double, height: Double)
    
    // Nested enum for color
    enum Color {
        case red, green, blue
    }
    
    func description() -> String {
        switch self {
        case .circle(let radius):
            return "Circle with radius \(radius)"
        case .rectangle(let width, let height):
            return "Rectangle with width \(width) and height \(height)"
        }
    }
}

// 6. Kullanım Örneği: Nested Enum
let myShape: Shape = .circle(radius: 10.0)
let myColor: Shape.Color = .red

print(myShape.description())  // Output: Circle with radius 10.0
print(myColor)  // Output: red
