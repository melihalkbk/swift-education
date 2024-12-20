import Foundation

// 1. String Tanımlama
var greeting = "Hello, Swift!"
print(greeting)

// 2. Çok Satırlı String
let multilineString = """
Bu bir
çok satırlı
string örneğidir.
"""
print(multilineString)

// 3. Karakter Dizisi Üzerinde Döngü
for character in greeting {
    print(character)
}

// 4. String'e Karakter Ekleme
var mutableString = "Merhaba"
mutableString.append(" Dünya!")
print(mutableString)

// 5. String'in Uzunluğu
print("String uzunluğu: \(mutableString.count)")

// 6. String Boş Kontrolü
if mutableString.isEmpty {
    print("String boş!")
} else {
    print("String boş değil!")
}

// 7. String Karşılaştırma
let string1 = "Swift"
let string2 = "swift"

if string1 == string2 {
    print("Stringler aynı!")
} else {
    print("Stringler farklı!")
}

// Büyük/küçük harf duyarlılığını kaldırarak karşılaştırma
if string1.caseInsensitiveCompare(string2) == .orderedSame {
    print("Stringler eşit (büyük/küçük harf duyarsız karşılaştırma).")
}

// 8. String'in Alt Dizilerini Kontrol Etme
if greeting.contains("Swift") {
    print("String 'Swift' kelimesini içeriyor.")
}

// 9. String Parçalama
let fullName = "John Doe"
let nameParts = fullName.split(separator: " ")
print("Ad: \(nameParts[0]), Soyad: \(nameParts[1])")

// 10. String Birleştirme
let firstName = "John"
let lastName = "Doe"
let fullNameConcatenated = firstName + " " + lastName
print("Birleştirilmiş İsim: \(fullNameConcatenated)")

// 11. String Biçimlendirme
let age = 25
let formattedString = "Merhaba, ben \(firstName) \(lastName) ve \(age) yaşındayım."
print(formattedString)

// 12. Karakter Tanımlama
let character: Character = "A"
print("Karakter: \(character)")

// 13. String'den Karakter Alma
let index = greeting.index(greeting.startIndex, offsetBy: 7)
print("7. indeksindeki karakter: \(greeting[index])")

// 14. String İçinde Arama
if let range = greeting.range(of: "Swift") {
    print("Swift kelimesi \(greeting.distance(from: greeting.startIndex, to: range.lowerBound)). pozisyonda başlıyor.")
}

// 15. String'in Tersini Alma
let reversedString = String(greeting.reversed())
print("Ters Çevrilmiş String: \(reversedString)")

// 16. Unicode Karakterlerini Görüntüleme
for scalar in "😀❤️🌍".unicodeScalars {
    print("\(scalar) değeri \(scalar.value)")
}
