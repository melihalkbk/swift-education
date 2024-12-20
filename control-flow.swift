import Foundation

// 1. For Döngüsü
let numbers = [1, 2, 3, 4, 5]
for number in numbers {
    print("Number: \(number)")
}

// Range kullanımı
for i in 1...5 {
    print("Range: \(i)")
}

for i in 1..<5 {
    print("Half-open range: \(i)")
}

// 2. While Döngüsü
var count = 5
while count > 0 {
    print("Count: \(count)")
    count -= 1
}

// Repeat-While Döngüsü
repeat {
    print("Repeat count: \(count)")
    count += 1
} while count < 3

// 3. If-Else
let score = 85
if score >= 90 {
    print("Excellent")
} else if score >= 75 {
    print("Good")
} else {
    print("Needs Improvement")
}

// 4. Switch
let character = "a"
switch character {
case "a", "e", "i", "o", "u":
    print("\(character) is a vowel")
case "b"..."z":
    print("\(character) is a consonant")
default:
    print("\(character) is not a letter")
}

// 5. Switch ile Aralıklar
let age = 25
switch age {
case 0...12:
    print("Child")
case 13...19:
    print("Teenager")
case 20...64:
    print("Adult")
default:
    print("Senior")
}

// 6. Switch ile Tuple Kullanımı
let point = (1, 1)
switch point {
case (0, 0):
    print("Origin")
case (_, 0):
    print("On the x-axis")
case (0, _):
    print("On the y-axis")
case (-2...2, -2...2):
    print("Inside the box")
default:
    print("Outside the box")
}

// 7. Guard Statement
func validateAge(_ age: Int) {
    guard age >= 18 else {
        print("You must be at least 18 years old")
        return
    }
    print("You are eligible")
}
validateAge(16)
validateAge(21)

// 8. Break ve Continue
for i in 1...10 {
    if i == 5 {
        continue // 5'i atla
    }
    if i == 8 {
        break // Döngüyü bitir
    }
    print("Current number: \(i)")
}

// 9. Goto Benzeri Label Kullanımı
outerLoop: for i in 1...3 {
    for j in 1...3 {
        if i == 2 && j == 2 {
            print("Breaking outer loop")
            break outerLoop
        }
        print("i: \(i), j: \(j)")
    }
}

// 10. Early Exit ile Guard
func divide(_ a: Int, by b: Int) {
    guard b != 0 else {
        print("Division by zero is not allowed")
        return
    }
    print("Result: \(a / b)")
}
divide(10, by: 0)
divide(10, by: 2)

// 11. Optional Binding ile If ve Guard
let optionalString: String? = "Hello"
if let unwrappedString = optionalString {
    print("Unwrapped String: \(unwrappedString)")
}

func greet(name: String?) {
    guard let name = name else {
        print("Name is missing")
        return
    }
    print("Hello, \(name)!")
}
greet(name: "Alice")
greet(name: nil)
