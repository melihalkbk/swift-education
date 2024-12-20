import Foundation

// 1. Base Class (Temel Sınıf)
class Animal {
    var name: String
    var species: String
    
    init(name: String, species: String) {
        self.name = name
        self.species = species
    }
    
    // Method in base class
    func speak() {
        print("\(name) makes a sound")
    }
}

// 2. Subclass (Alt Sınıf)
class Dog: Animal {
    var breed: String
    
    // Subclass initializer
    init(name: String, breed: String) {
        self.breed = breed
        // Call to the superclass initializer
        super.init(name: name, species: "Dog")
    }
    
    // Method overriding: Base class'ın methodunu geçersiz kılma
    override func speak() {
        print("\(name), the \(breed), barks!")
    }
    
    // Additional method in subclass
    func fetch() {
        print("\(name) is fetching the ball!")
    }
}

// 3. Another Subclass (Diğer Alt Sınıf)
class Cat: Animal {
    var color: String
    
    // Subclass initializer
    init(name: String, color: String) {
        self.color = color
        // Call to the superclass initializer
        super.init(name: name, species: "Cat")
    }
    
    // Method overriding: Base class'ın methodunu geçersiz kılma
    override func speak() {
        print("\(name), the \(color) cat, meows!")
    }
}

// 4. Creating Instances of Subclasses
let dog = Dog(name: "Buddy", breed: "Golden Retriever")
let cat = Cat(name: "Whiskers", color: "Black")

// Calling methods
dog.speak()  // Output: Buddy, the Golden Retriever, barks!
cat.speak()  // Output: Whiskers, the Black cat, meows!

// 5. Accessing properties from base class
print("Dog's species: \(dog.species)")  // Output: Dog's species: Dog
print("Cat's species: \(cat.species)")  // Output: Cat's species: Cat

// 6. Calling subclass-specific methods
dog.fetch()  // Output: Buddy is fetching the ball!

// 7. Overriding Properties
class Bird: Animal {
    override var name: String {
        didSet {
            print("Bird's name was changed to \(name)")
        }
    }
    
    override init(name: String, species: String) {
        super.init(name: name, species: species)
    }
}

var bird = Bird(name: "Sparrow", species: "Bird")
bird.name = "Eagle"  // Output: Bird's name was changed to Eagle

// 8. Final Keyword (Final Anahtar Kelimesi)
class Fish: Animal {
    // 'final' keyword prevents overriding of this method
    final func swim() {
        print("\(name) is swimming!")
    }
}

let fish = Fish(name: "Goldfish", species: "Fish")
fish.swim()  // Output: Goldfish is swimming!

// Attempting to override a 'final' method (will cause an error)
// class Shark: Fish {
//     override func swim() {  // Error: Cannot override a final method
//         print("Shark is swimming!")
//     }
// }
