import Foundation

// 1. Basit Fonksiyon Tanımlama
func greet() {
    print("Hello, Swift!")
}
greet()

// 2. Parametre Alan Fonksiyon
func greet(name: String) {
    print("Hello, \(name)!")
}
greet(name: "Alice")

// 3. Dönüş Değeri Olan Fonksiyon
func add(a: Int, b: Int) -> Int {
    return a + b
}
let sum = add(a: 5, b: 3)
print("Sum: \(sum)")

// 4. Parametre İsimlendirme (External ve Internal Names)
func multiply(_ a: Int, by b: Int) -> Int {
    return a * b
}
let result = multiply(4, by: 3)
print("Result: \(result)")

// 5. Varsayılan Parametreler
func greetUser(name: String = "Guest") {
    print("Welcome, \(name)!")
}
greetUser()       // Varsayılan değer kullanılır
greetUser(name: "Bob")

// 6. Variadic Parameters (Değişken Sayıda Parametre)
func average(of numbers: Double...) -> Double {
    let total = numbers.reduce(0, +)
    return total / Double(numbers.count)
}
print("Average: \(average(of: 3.0, 4.0, 5.0))")

// 7. In-Out Parametreler
func increment(value: inout Int) {
    value += 1
}
var number = 10
increment(value: &number)
print("Incremented Value: \(number)")

// 8. Multiple Return Values (Tuple)
func minMax(numbers: [Int]) -> (min: Int, max: Int)? {
    guard let min = numbers.min(), let max = numbers.max() else {
        return nil
    }
    return (min, max)
}
if let result = minMax(numbers: [2, 8, 5, 1, 7]) {
    print("Min: \(result.min), Max: \(result.max)")
}

// 9. Opsiyonel Dönüş Değeri
func findIndex(of number: Int, in array: [Int]) -> Int? {
    return array.firstIndex(of: number)
}
if let index = findIndex(of: 5, in: [1, 2, 3, 4, 5]) {
    print("Index of 5: \(index)")
} else {
    print("Number not found")
}

// 10. Fonksiyon Tipi Kullanımı
let operation: (Int, Int) -> Int = add
print("Operation Result: \(operation(6, 7))")

// 11. Fonksiyon Parametresi Olarak Fonksiyon
func performOperation(_ a: Int, _ b: Int, using operation: (Int, Int) -> Int) -> Int {
    return operation(a, b)
}
let difference = performOperation(10, 4, using: { $0 - $1 })
print("Difference: \(difference)")

// 12. Closure (Kapanışlar)
let numbers = [3, 1, 4, 2]
let sortedNumbers = numbers.sorted { $0 < $1 }
print("Sorted Numbers: \(sortedNumbers)")

// 13. Recursive Function (Özyinelemeli Fonksiyon)
func factorial(_ n: Int) -> Int {
    return n == 0 ? 1 : n * factorial(n - 1)
}
print("Factorial of 5: \(factorial(5))")

// 14. Higher-Order Functions (Map, Filter, Reduce)
let doubledNumbers = numbers.map { $0 * 2 }
print("Doubled Numbers: \(doubledNumbers)")

let evenNumbers = numbers.filter { $0 % 2 == 0 }
print("Even Numbers: \(evenNumbers)")

let sumOfNumbers = numbers.reduce(0, +)
print("Sum of Numbers: \(sumOfNumbers)")
