import Foundation

// 1. Temel Sınıf ve Alt Sınıf Tanımlama
class Animal {
    var name: String
    init(name: String) {
        self.name = name
    }
    func speak() {
        print("\(name) makes a sound.")
    }
}

class Dog: Animal {
    func bark() {
        print("\(name) barks!")
    }
}

class Cat: Animal {
    func meow() {
        print("\(name) meows!")
    }
}

// 2. Tür Dönüştürme (Type Casting) Kullanımı
let dog: Animal = Dog(name: "Buddy")
let cat: Animal = Cat(name: "Whiskers")

// 3. Downcasting (Alt Tür Dönüştürme)
if let dogInstance = dog as? Dog {
    dogInstance.bark()  // Output: Buddy barks!
} else {
    print("This is not a dog.")
}

if let catInstance = cat as? Cat {
    catInstance.meow()  // Output: Whiskers meows!
} else {
    print("This is not a cat.")
}

// 4. Upcasting (Yukarı Tür Dönüştürme)
let dog2: Dog = Dog(name: "Charlie")
let animal2: Animal = dog2  // Dog türü, Animal türüne dönüştürülebilir (upcasting)

animal2.speak()  // Output: Charlie makes a sound.

// 5. Type Casting ve Optional Binding
let unknownAnimal: Animal = Dog(name: "Max")

if let dog = unknownAnimal as? Dog {
    print("\(dog.name) is a dog.")  // Output: Max is a dog.
} else if let cat = unknownAnimal as? Cat {
    print("\(cat.name) is a cat.")
} else {
    print("Unknown animal type.")
}

// 6. Fail-Through (Başarısız Dönüşüm)
let someAnimal: Animal = Cat(name: "Luna")

if let dog = someAnimal as? Dog {
    print("\(dog.name) is a dog.")
} else {
    print("Not a dog.")  // Output: Not a dog.
}

// 7. Class Type Kontrolü
let anotherUnknownAnimal: Animal = Cat(name: "Milo")

if anotherUnknownAnimal is Dog {
    print("It's a dog!")
} else {
    print("It's not a dog.")  // Output: It's not a dog.
}

// 8. Base Class (Temel Sınıf) ile Type Checking
func identifyAnimal(animal: Animal) {
    if let dog = animal as? Dog {
        print("\(dog.name) is a dog!")
    } else if let cat = animal as? Cat {
        print("\(cat.name) is a cat!")
    } else {
        print("Unknown animal type.")
    }
}

let someDog: Animal = Dog(name: "Rocky")
let someCat: Animal = Cat(name: "Bella")

identifyAnimal(animal: someDog)  // Output: Rocky is a dog!
identifyAnimal(animal: someCat)  // Output: Bella is a cat!
