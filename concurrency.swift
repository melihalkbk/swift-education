import Foundation

// 1. Eşzamanlı Fonksiyonlar (Async/Await)
func fetchDataFromNetwork() async -> String {
    // Simulating a network request with a delay
    try? await Task.sleep(nanoseconds: 2 * 1_000_000_000)  // 2 second delay
    return "Data fetched from network"
}

func fetchDataFromDatabase() async -> String {
    // Simulating database query with a delay
    try? await Task.sleep(nanoseconds: 1 * 1_000_000_000)  // 1 second delay
    return "Data fetched from database"
}

// 2. Eşzamanlı İşlemler (Concurrent Tasks)
func fetchData() async {
    async let networkData = fetchDataFromNetwork()
    async let databaseData = fetchDataFromDatabase()
    
    // Await both tasks concurrently
    let data = await (networkData, databaseData)
    
    print("Network Data: \(data.0)")
    print("Database Data: \(data.1)")
}

// 3. Async/Await ile Birden Fazla İşlem
func performMultipleTasks() async {
    async let task1 = fetchDataFromNetwork()
    async let task2 = fetchDataFromDatabase()
    
    let results = await (task1, task2)
    print("First Task Result: \(results.0)")
    print("Second Task Result: \(results.1)")
}

// 4. Task ile Eşzamanlı Çalıştırma
func runConcurrentTasks() {
    Task {
        await fetchData()
    }
    
    Task {
        await performMultipleTasks()
    }
}

// 5. Task.sleep() ve Hata Yönetimi ile Async İşlemler
func fetchDataWithErrorHandling() async throws -> String {
    try await Task.sleep(nanoseconds: 1 * 1_000_000_000)  // Simulate delay
    throw NSError(domain: "DataError", code: 1, userInfo: [NSLocalizedDescriptionKey: "Data fetch error"])
}

func fetchDataAndHandleError() async {
    do {
        let result = try await fetchDataWithErrorHandling()
        print(result)
    } catch {
        print("Error occurred: \(error.localizedDescription)")
    }
}

// 6. Main Thread ile UI Güncellemesi
func updateUI() {
    Task { @MainActor in
        print("Updating UI on the main thread")
        // Perform UI-related updates here
    }
}

// 7. Örnek Kullanım
runConcurrentTasks() // Running tasks concurrently

Task {
    await fetchDataAndHandleError() // Handling errors with async/await
}

Task {
    await updateUI()  // Updating UI on the main thread
}

// 8. Eşzamanlı İşlem Çıktıları
// Output (Ekran Çıktısı):
// Network Data: Data fetched from network
// Database Data: Data fetched from database
// First Task Result: Data fetched from network
// Second Task Result: Data fetched from database
// Error occurred: Data fetch error
// Updating UI on the main thread
