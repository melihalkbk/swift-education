import Foundation

// 1. Hata Türü Tanımlama
enum PaymentError: Error {
    case insufficientFunds(amountRequired: Double)
    case invalidCard
    case networkError
}

// 2. Hata Fırlatma (Throwing Errors)
func processPayment(amount: Double, cardValid: Bool, hasFunds: Bool) throws {
    if !cardValid {
        throw PaymentError.invalidCard
    }
    
    if !hasFunds {
        throw PaymentError.insufficientFunds(amountRequired: amount)
    }
    
    // Simulate a network error
    if amount > 1000 {
        throw PaymentError.networkError
    }
    
    print("Payment of \(amount) processed successfully.")
}

// 3. Hata Yönetimi (Do-Catch Blokları)
func makePayment(amount: Double, cardValid: Bool, hasFunds: Bool) {
    do {
        try processPayment(amount: amount, cardValid: cardValid, hasFunds: hasFunds)
    } catch PaymentError.invalidCard {
        print("Error: Invalid card.")
    } catch PaymentError.insufficientFunds(let amountRequired) {
        print("Error: Insufficient funds. You need \(amountRequired) more.")
    } catch PaymentError.networkError {
        print("Error: Network error. Please try again later.")
    } catch {
        print("An unknown error occurred.")
    }
}

// 4. Örnek Kullanım
makePayment(amount: 500, cardValid: true, hasFunds: true) 
// Output: Payment of 500 processed successfully.

makePayment(amount: 500, cardValid: false, hasFunds: true)  
// Output: Error: Invalid card.

makePayment(amount: 500, cardValid: true, hasFunds: false)  
// Output: Error: Insufficient funds. You need 500.0 more.

makePayment(amount: 1500, cardValid: true, hasFunds: true)  
// Output: Error: Network error. Please try again later.

// 5. Hataları Döndürme (Throwing Errors from a Function)
func retrieveUserData(userId: Int) throws -> String {
    if userId == 0 {
        throw PaymentError.networkError
    }
    return "User data for user \(userId)"
}

// 6. Failable Error Handling with Do-Catch
func fetchData(userId: Int) {
    do {
        let data = try retrieveUserData(userId: userId)
        print("Fetched data: \(data)")
    } catch {
        print("Failed to fetch data due to an error: \(error)")
    }
}

fetchData(userId: 123)  // Output: Fetched data: User data for user 123
fetchData(userId: 0)    // Output: Failed to fetch data due to an error: networkError
