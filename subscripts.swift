import Foundation

// 1. Subscripts (Alt Dizinler) Temel Kullanım
struct BookShelf {
    var books: [String]
    
    // Subscript tanımlaması: BookShelf nesnesi üzerinden kitap erişimi
    subscript(index: Int) -> String {
        get {
            return books[index]
        }
        set(newBook) {
            books[index] = newBook
        }
    }
}

var shelf = BookShelf(books: ["Swift Programming", "iOS Development", "Design Patterns"])
print("First book: \(shelf[0])")  // Swift Programming

// Kitap ekleme veya değiştirme
shelf[0] = "Advanced Swift"
print("Updated first book: \(shelf[0])")  // Advanced Swift

// 2. Read-Only Subscripts (Sadece Okunabilir Alt Dizinler)
struct Matrix {
    let rows: Int
    let columns: Int
    var grid: [[Int]]
    
    // Read-only subscript: Grid üzerinden erişim sağlanır
    subscript(row: Int, column: Int) -> Int {
        return grid[row][column]
    }
}

var matrix = Matrix(rows: 3, columns: 3, grid: [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
])

print("Element at (1, 1): \(matrix[1, 1])")  // 5

// 3. Subscripts with Multiple Parameters (Birden Fazla Parametre ile Alt Dizinler)
struct MultiDimensionalArray {
    var grid: [[Int]]
    
    subscript(row: Int, column: Int) -> Int {
        get {
            return grid[row][column]
        }
        set(newValue) {
            grid[row][column] = newValue
        }
    }
}

var multiDimArray = MultiDimensionalArray(grid: [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
])

print("Element at (2, 0): \(multiDimArray[2, 0])")  // 7
multiDimArray[2, 0] = 10  // Değeri değiştirme
print("Updated element at (2, 0): \(multiDimArray[2, 0])")  // 10

// 4. Subscripts with Optional Return Type (Opsiyonel Dönüş Türü ile Alt Dizinler)
struct Dictionary {
    var items: [String: String]
    
    subscript(key: String) -> String? {
        return items[key]
    }
}

var myDictionary = Dictionary(items: ["name": "John", "age": "30"])
if let name = myDictionary["name"] {
    print("Name: \(name)")  // John
}
if let age = myDictionary["age"] {
    print("Age: \(age)")  // 30
}
if let address = myDictionary["address"] {
    print("Address: \(address)")  // Nil, çünkü 'address' yok
} else {
    print("Address not found")  // Address not found
}

// 5. Subscripts for Ranges (Aralıklar ile Alt Dizinler)
struct RangeExample {
    var numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    
    // Subscript aralıklarla işlem yaparak çoklu değer döndürüyor
    subscript(range: Range<Int>) -> [Int] {
        return Array(numbers[range])
    }
}

var rangeExample = RangeExample()
print("Numbers from 2 to 5: \(rangeExample[2..<5])")  // [3, 4, 5]

// 6. Subscripts in Classes (Sınıflarda Alt Dizinler)
class StudentList {
    var students: [String]
    
    init(students: [String]) {
        self.students = students
    }
    
    subscript(index: Int) -> String {
        return students[index]
    }
}

let studentList = StudentList(students: ["Alice", "Bob", "Charlie"])
print("First student: \(studentList[0])")  // Alice
