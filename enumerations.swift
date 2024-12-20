import Foundation

// 1. Basit Enum Tanımı ve Kullanımı
enum CompassPoint {
    case north
    case south
    case east
    case west
}

var direction = CompassPoint.north
print("Direction: \(direction)")

// 2. Enum Değerini Güncelleme
direction = .west
print("Updated Direction: \(direction)")

// 3. Switch ile Enum Kullanımı
switch direction {
case .north:
    print("Heading North")
case .south:
    print("Heading South")
case .east:
    print("Heading East")
case .west:
    print("Heading West")
}

// 4. Raw Values (Ham Değerler)
enum Planet: Int {
    case mercury = 1
    case venus
    case earth
    case mars
}

let earth = Planet.earth
print("Earth's Raw Value: \(earth.rawValue)")

// Enum'dan Raw Value ile Oluşturma
if let planet = Planet(rawValue: 3) {
    print("The planet is \(planet)")
} else {
    print("No such planet exists")
}

// 5. Associated Values (Bağlantılı Değerler)
enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}

var productCode = Barcode.upc(8, 85909, 51226, 3)
switch productCode {
case .upc(let numberSystem, let manufacturer, let product, let check):
    print("UPC: \(numberSystem)-\(manufacturer)-\(product)-\(check)")
case .qrCode(let code):
    print("QR Code: \(code)")
}

productCode = .qrCode("https://example.com")
if case let .qrCode(code) = productCode {
    print("QR Code URL: \(code)")
}

// 6. Enum İçerisinde Metotlar
enum TrafficLight {
    case red, yellow, green

    func description() -> String {
        switch self {
        case .red:
            return "Stop"
        case .yellow:
            return "Get Ready"
        case .green:
            return "Go"
        }
    }
}

let light = TrafficLight.red
print("Traffic Light: \(light.description())")

// 7. Enum ile Recursive (Özyinelemeli) Yapılar
enum ArithmeticExpression {
    case number(Int)
    indirect case addition(ArithmeticExpression, ArithmeticExpression)
    indirect case multiplication(ArithmeticExpression, ArithmeticExpression)

    func evaluate() -> Int {
        switch self {
        case .number(let value):
            return value
        case .addition(let left, let right):
            return left.evaluate() + right.evaluate()
        case .multiplication(let left, let right):
            return left.evaluate() * right.evaluate()
        }
    }
}

let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)
let sum = ArithmeticExpression.addition(five, four)
let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))

print("Sum: \(sum.evaluate())")       // 5 + 4 = 9
print("Product: \(product.evaluate())") // (5 + 4) * 2 = 18

// 8. Enum ile İlişkili Değerlerin Pratik Kullanımı
enum NetworkResult {
    case success(String)
    case failure(Int)

    func handle() {
        switch self {
        case .success(let message):
            print("Success: \(message)")
        case .failure(let errorCode):
            print("Failure: Error Code \(errorCode)")
        }
    }
}

let result = NetworkResult.success("Data fetched successfully")
result.handle()

let error = NetworkResult.failure(404)
error.handle()
