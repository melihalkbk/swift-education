// 1. Makro Tanımlama ve Kullanımı
@freestanding(declaration)
macro printDebugInfo(_ message: String) = """
    print("DEBUG: \(message)")
"""

@freestanding(declaration)
macro addLogging(_ functionName: String) = """
    print("Function \(functionName) called")
"""

// 2. Makro Kullanımıyla Basit Loglama
func someFunction() {
    #printDebugInfo("This is a debug message") // DEBUG: This is a debug message
}

func anotherFunction() {
    #addLogging("anotherFunction")
    print("Doing something important...")
}

someFunction()
anotherFunction()

// 3. Makrolar ile Başka Bir Örnek
@freestanding(declaration)
macro addTimestamp(_ functionName: String) = """
    let timestamp = Date()
    print("[\(timestamp)] Function \(functionName) executed.")
"""

func exampleFunction() {
    #addTimestamp("exampleFunction")
    print("Example function is running.")
}

exampleFunction()

// 4. Makrolar ile Hata Loglama
@freestanding(declaration)
macro logError(_ message: String) = """
    print("ERROR: \(message)")
"""

func processPayment(amount: Double) {
    if amount <= 0 {
        #logError("Amount must be greater than zero")
        return
    }
    print("Payment of \(amount) processed.")
}

processPayment(amount: -5)  // Output: ERROR: Amount must be greater than zero
processPayment(amount: 100) // Output: Payment of 100 processed.
