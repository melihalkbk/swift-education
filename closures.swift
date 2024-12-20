import Foundation

// 1. Closure Tanımlama ve Kullanma
let greetClosure = {
    print("Hello, Swift!")
}
greetClosure()

// 2. Closure ile Parametreler ve Dönüş Değeri
let addClosure: (Int, Int) -> Int = { (a: Int, b: Int) -> Int in
    return a + b
}
let sum = addClosure(3, 5)
print("Sum: \(sum)")

// 3. Closure'da Tip Çıkarımı
let multiplyClosure = { (a: Int, b: Int) in
    a * b
}
let product = multiplyClosure(4, 6)
print("Product: \(product)")

// 4. Closure Kısayolları (Shorthand Argument Names)
let subtractClosure: (Int, Int) -> Int = { $0 - $1 }
let difference = subtractClosure(10, 3)
print("Difference: \(difference)")

// 5. Closure Bir Parametre Olarak Fonksiyona Geçirme
func performOperation(_ a: Int, _ b: Int, using closure: (Int, Int) -> Int) -> Int {
    return closure(a, b)
}
let result = performOperation(6, 2, using: { $0 / $1 })
print("Result: \(result)")

// 6. Trailing Closure Syntax (Son Closure Kullanımı)
let result2 = performOperation(8, 3) { $0 % $1 }
print("Modulo: \(result2)")

// 7. Closure'ın Kapsama Alanındaki Değişkenlere Erişimi
func makeIncrementer(by amount: Int) -> () -> Int {
    var total = 0
    let incrementer = {
        total += amount
        return total
    }
    return incrementer
}
let incrementByTwo = makeIncrementer(by: 2)
print(incrementByTwo()) // 2
print(incrementByTwo()) // 4

// 8. Escaping Closures (Kaçan Closure)
var completionHandlers: [() -> Void] = []

func addCompletionHandler(_ handler: @escaping () -> Void) {
    completionHandlers.append(handler)
}

addCompletionHandler {
    print("Handler 1 executed!")
}
addCompletionHandler {
    print("Handler 2 executed!")
}

// Tüm handler'ları çalıştır
for handler in completionHandlers {
    handler()
}

// 9. Capturing Values (Değerlerin Kapsanması)
func makeCounter() -> () -> Int {
    var count = 0
    return {
        count += 1
        return count
    }
}
let counter = makeCounter()
print(counter()) // 1
print(counter()) // 2

// 10. AutoClosure
func evaluate(_ condition: @autoclosure () -> Bool) {
    if condition() {
        print("Condition is true")
    } else {
        print("Condition is false")
    }
}
evaluate(5 > 3) // AutoClosure sayesinde normal bir ifade olarak yazılabilir

// 11. Higher-Order Functions (Closure ile Map, Filter, Reduce)
let numbers = [1, 2, 3, 4, 5]

let doubledNumbers = numbers.map { $0 * 2 }
print("Doubled Numbers: \(doubledNumbers)")

let evenNumbers = numbers.filter { $0 % 2 == 0 }
print("Even Numbers: \(evenNumbers)")

let sumOfNumbers = numbers.reduce(0) { $0 + $1 }
print("Sum of Numbers: \(sumOfNumbers)")

// 12. Sorting ile Closure
let sortedNumbers = numbers.sorted { $0 > $1 }
print("Sorted Numbers (Descending): \(sortedNumbers)")
