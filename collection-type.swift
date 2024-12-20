import Foundation

// 1. Array (Dizi) Tanımlama ve Kullanımı
var fruits: [String] = ["Apple", "Banana", "Cherry"]
print("Fruits: \(fruits)")

// 2. Eleman Ekleme
fruits.append("Orange")
fruits += ["Grapes", "Pineapple"]
print("Updated Fruits: \(fruits)")

// 3. Eleman Silme
fruits.remove(at: 2) // Cherry silinir
print("After Removal: \(fruits)")

// 4. Eleman Güncelleme
fruits[1] = "Mango" // Banana yerine Mango
print("After Update: \(fruits)")

// 5. Array'de Döngü
for fruit in fruits {
    print("Fruit: \(fruit)")
}

// 6. Array Boş Kontrolü
if fruits.isEmpty {
    print("Array is empty.")
} else {
    print("Array is not empty.")
}

// 7. Set Tanımlama ve Kullanımı
var uniqueNumbers: Set<Int> = [1, 2, 3, 3, 4, 5] // Tekrar eden değerler tek bir kez eklenir
print("Unique Numbers: \(uniqueNumbers)")

// 8. Set'e Eleman Ekleme
uniqueNumbers.insert(6)
print("After Insert: \(uniqueNumbers)")

// 9. Set'ten Eleman Silme
if let removedNumber = uniqueNumbers.remove(3) {
    print("\(removedNumber) silindi.")
} else {
    print("Eleman bulunamadı.")
}
print("After Removal: \(uniqueNumbers)")

// 10. Set Operasyonları
let setA: Set = [1, 2, 3, 4]
let setB: Set = [3, 4, 5, 6]

print("Birleşim: \(setA.union(setB))")
print("Kesişim: \(setA.intersection(setB))")
print("Fark: \(setA.subtracting(setB))")

// 11. Dictionary Tanımlama ve Kullanımı
var studentGrades: [String: Int] = ["John": 85, "Jane": 92, "Alice": 78]
print("Grades: \(studentGrades)")

// 12. Eleman Ekleme/Güncelleme
studentGrades["Bob"] = 90
studentGrades["Alice"] = 80 // Alice'in notu güncellendi
print("Updated Grades: \(studentGrades)")

// 13. Eleman Silme
studentGrades.removeValue(forKey: "John")
print("After Removal: \(studentGrades)")

// 14. Dictionary'de Döngü
for (student, grade) in studentGrades {
    print("\(student): \(grade)")
}

// 15. Dictionary Boş Kontrolü
if studentGrades.isEmpty {
    print("Dictionary is empty.")
} else {
    print("Dictionary is not empty.")
}

// 16. Varsayılan Değer Kullanımı
let grade = studentGrades["Emma", default: 0]
print("Emma's Grade: \(grade)")

// 17. Koleksiyon Türleri ile Karışık Kullanım
let mixCollection: [Any] = [1, "Hello", [2, 3, 4], ["key": "value"]]
for item in mixCollection {
    print("Item: \(item)")
}

// 18. Array, Set ve Dictionary Karşılaştırması
// Array sıralı, elemanlar tekrar edebilir
let arrayExample = [1, 2, 2, 3]

// Set sırasız ve benzersiz elemanlar içerir
let setExample: Set = [1, 2, 2, 3]

// Dictionary anahtar-değer çiftlerinden oluşur
let dictionaryExample = ["key1": "value1", "key2": "value2"]

print("Array: \(arrayExample)")
print("Set: \(setExample)")
print("Dictionary: \(dictionaryExample)")
