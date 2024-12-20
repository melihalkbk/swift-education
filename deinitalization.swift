import Foundation

// 1. Deinitializer (Başlatıcı Sonrası İşlem) Temel Kullanım
class Person {
    var name: String
    
    init(name: String) {
        self.name = name
        print("\(name) is initialized.")
    }
    
    // Deinitializer: Nesne serbest bırakıldığında çalışır
    deinit {
        print("\(name) is deinitialized.")
    }
}

var person1: Person? = Person(name: "John")
// Output: John is initialized.
person1 = nil  // Output: John is deinitialized.

// 2. Deinitialization in Reference Types (Referans Türlerinde Başlatıcı Sonrası İşlem)
class Car {
    var model: String
    
    init(model: String) {
        self.model = model
        print("\(model) car is created.")
    }
    
    deinit {
        print("\(model) car is deinitialized.")
    }
}

var car1: Car? = Car(model: "Tesla Model S")
// Output: Tesla Model S car is created.
car1 = nil  // Output: Tesla Model S car is deinitialized.

// 3. Deinitialization in Complex Objects (Karmaşık Nesnelerde Başlatıcı Sonrası İşlem)
class Owner {
    var name: String
    var car: Car?
    
    init(name: String, car: Car?) {
        self.name = name
        self.car = car
        print("\(name) is the owner of the car.")
    }
    
    deinit {
        print("\(name) is deinitialized and the car is released.")
    }
}

var owner1: Owner? = Owner(name: "Alice", car: car1)
// Output: Alice is the owner of the car.
owner1 = nil  // Output: Alice is deinitialized and the car is released.

// 4. Multiple References (Birden Fazla Referans)
class House {
    var address: String
    
    init(address: String) {
        self.address = address
        print("House at \(address) is created.")
    }
    
    deinit {
        print("House at \(address) is deinitialized.")
    }
}

var house1: House? = House(address: "123 Maple St.")
var house2 = house1  // house2 refers to the same object as house1
house1 = nil  // Output: House at 123 Maple St. is created.
house2 = nil  // Output: House at 123 Maple St. is deinitialized.

// 5. Strong, Weak, and Unowned References (Güçlü, Zayıf ve Sahipsiz Referanslar)
class Apartment {
    var address: String
    var landlord: Landlord?
    
    init(address: String) {
        self.address = address
        print("Apartment at \(address) is created.")
    }
    
    deinit {
        print("Apartment at \(address) is deinitialized.")
    }
}

class Landlord {
    var name: String
    var apartment: Apartment?
    
    init(name: String) {
        self.name = name
        print("\(name) is the landlord.")
    }
    
    // Deinitialize the object when no longer needed
    deinit {
        print("\(name) is deinitialized.")
    }
}

var landlord1: Landlord? = Landlord(name: "Bob")
var apartment1: Apartment? = Apartment(address: "456 Oak Ave")

landlord1?.apartment = apartment1
apartment1?.landlord = landlord1

landlord1 = nil  // Output: Bob is deinitialized.
apartment1 = nil  // Output: Apartment at 456 Oak Ave is deinitialized.
