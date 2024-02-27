//: [Previous](@previous)

import Foundation
import UIKit
import SwiftUI

//func fetchWeatherHistory(completion: @escaping ([Double]) -> Void)
//{
//    // Complex networking code here; we'll just send back 100,000 random temperatures
//    DispatchQueue.global().async(execute: {
//        let results = (1...100_000).map { _ in Double.random(in: -10...30) }
//        completion(results)
//    })
//}
//
//func calculateAverageTemperature(for records: [Double], completion: @escaping (Double) -> Void)
//{
//    // Sum our array then divide by the array size
//    DispatchQueue.global().async {
//        let total = records.reduce(0, +)
//        let average = total / Double(records.count)
//        completion(average)
//    }
//}
//
//func upload(result: Double, completion: @escaping (String) -> Void) {
//    // More complex networking code; we'll just send back "OK"
//    DispatchQueue.global().async {
//        completion("OK")
//    }
//}
//
//fetchWeatherHistory { records in
//    calculateAverageTemperature(for: records) { average in
//        upload(result: average) { response in
//            print("Server response: \(response)")
//        }
//    }
//}


//func fetchWeatherHistory() async -> [Double]
//{
//    (1...100_000).map { _ in Double.random(in: -10...30) }
//}
//
//func calculateAverageTemperature(for records: [Double]) async -> Double
//{
//    let total = records.reduce(0, +)
//    let average = total / Double(records.count)
//    return average
//}
//
//func upload(result: Double) async -> String
//{
//    "ok"
//}
//
//func processWeather() async
//{
//    debugPrint("fetchWeatherHistory call")
//    let records = await fetchWeatherHistory()
//    
//    debugPrint("calculateAverageTemperature call")
//    let average = await calculateAverageTemperature(for: records)
//    
//    debugPrint("upload call")
//    let response = await upload(result: average)
//    
//    debugPrint("Server response: \(response)")
//}
//
//Task
//{
//    _ = await processWeather()
//}


//enum UserError: Error
//{
//    case invalidCount, dataTooLong
//}
//
//func fetchUsers(count: Int) async throws -> [String]
//{
//    if count > 3
//    {
//        // Don't attempt to fetch too many users
//        throws UserError.invalidCount
//    }
//    
//    // Complex networking code here; we'll just send back up to `count` users
//    return Array(["Antoni", "Karamo", "Tan"].prefix(count))
//}
//
//func save(users: [String]) async throws -> String
//{
//    let savedUsers = users.joined(separator: ",")
//    
//    if savedUsers.count > 32
//    {
//        throw UserError.dataTooLong
//    }
//    else
//    {
//        return "Saved \(savedUsers)!"
//    }
//}
//
//func updateUsers() async
//{
//    do {
//        let users = try await fetchUsers(count: 3)
//        let result = try await save(users: users)
//        print(result)
//    }
//    catch
//    {
//        print("Oops!")
//    }
//}
//
//_ = await updateUsers()






//MARK: - Async sequences

//struct DoubleGenerator: AsyncSequence
//{
//    typealias Element = Int
//    
//    struct AsyncIterator: AsyncIteratorProtocol {
//        var current = 1
//        
//        mutating func next() async -> Int?
//        {
//            defer {
//                current &*= 2
//            }
//            
//            if current < 0
//            {
//                return nil
//            }
//            else
//            {
//                return current
//            }
//        }
//    }
//    
//    func makeAsyncIterator() -> AsyncIterator
//    {
//        AsyncIterator()
//    }
//}
//
//func printAllDoubles() async
//{
//    for await number in DoubleGenerator()
//    {
//        debugPrint(number)
//    }
//}

//Task
//{
//    await printAllDoubles()
//}
//
//func containsExactNumber() async
//{
//    let doubles = DoubleGenerator()
//    //let match = await doubles.contains(16_777_216)
//    let match = await doubles.contains(1024)
//    debugPrint(match)
//}
//
//Task
//{
//    await containsExactNumber()
//}










//MARK: - Effectful read-only properties

//enum FileError: Error
//{
//    case missing
//    case unreadable
//}
//
//struct BundleFile
//{
//    let filename: String
//    
//    var contents: String
//    {
//        get async throws
//        {
//            guard let url = Bundle.main.url(forResource: filename, withExtension: nil) else {
//                throw FileError.missing
//            }
//            
//            do {
//                return try String(contentsOf: url)
//            }
//            catch
//            {
//                throw FileError.unreadable
//            }
//        }
//    }
//}
//
//func printHighScores() async throws
//{
//    let file = BundleFile(filename: "highscores")
//    try await debugPrint(file.contents)
//}
//
//Task
//{
//   _ = try? await printHighScores()
//}









//MARK: - Structured concurrency

enum LocationError: Error {
    case unknown
}

func getWeatherReadings(for location: String) async throws -> [Double]
{
    switch location {
        
    case "London":
        return (1...100).map { _ in Double.random(in: 6...26) }
    case "Rome":
        return (1...100).map { _ in Double.random(in: 10...32) }
    case "San Francisco":
        return (1...100).map { _ in Double.random(in: 12...20) }
    default:
        throw LocationError.unknown
    }
}

//Task
//{
//    let temp = try? await getWeatherReadings(for: "Rome")
//    debugPrint(temp)
//}



func fibonacci(of number: Int) -> Int
{
    var first = 0
    var second = 1
    
    for _ in 0..<number
    {
        let previous  = first
        first = second
        second = previous + first
    }
    
    return first
}

//let number = fibonacci(of: 5)
//debugPrint(number)


//@main
struct Main {
    static func main() async throws {
        let readings = try await getWeatherReadings(for: "London")
        print("Readings are: \(readings)")
    }
}

//Task
//{
//    try? await Main.main()
//}

func printFibonacciSequence() async {
    let task1 = Task { () -> [Int] in
        var numbers = [Int]()
        
        for i in 0..<50
        {
            let  result = fibonacci(of: i)
            numbers.append(result)
        }
        return numbers
    }
    let result1 = await task1.value
    print("The first 50 numbers in the Fibonacci sequence are: \(result1)")
}

//let task1 = Task {
//    //(0..<50).map(fibonacci)
//    debugPrint((0..<50).map(fibonacci))
//}

//Task
//{
//    debugPrint(await task1.value)
//}


func runMultipleCalculations() async throws
{
    let task1 = Task
    {
        (0..<50).map(fibonacci)
    }
    
    let task2 = Task
    {
        try await getWeatherReadings(for: "Rome")
    }
    
    let result1 = await task1.value
    let result2 = try await task2.value
    print("The first 50 numbers in the Fibonacci sequence are: \(result1)")
    print("Rome weather readings are: \(result2)")
}

//Task
//{
//    _ = try await runMultipleCalculations()
//}


func cancelSleepingTask() async
{
    let task = Task
    {
        debugPrint("Starting")
        try await Task.sleep(nanoseconds: 1_000_000_000)
        try Task.checkCancellation()
        return "Done"
    }
    
    // The task has started, but we'll cancel it while it sleeps
    task.cancel()
    
    do {
        let result = try await task.value
        debugPrint("Result: \(result)")
    }
    catch
    {
        print("Task was cancelled.")
    }
}

//Task
//{
//    await cancelSleepingTask()
//}



func printMessage() async
{
    let string = await withTaskGroup(of: String.self) { group -> String in
        group.addTask { "Hello" }
        group.addTask { "From" }
        group.addTask { "A" }
        group.addTask { "Task" }
        group.addTask { "Group" }
        
        var collected = [String]()
        
        for await value in group
        {
            collected.append(value)
        }
        
        return collected.joined(separator: " ")
    }
    
    debugPrint(string)
}

//Task
//{
//    await printMessage()
//}


func printAllWeatherReadings() async
{
    do {
        print("Calculating average weather…")
        
        let result = try await withThrowingTaskGroup(of: [Double].self) { group -> String in
            group.addTask
            {
                try await getWeatherReadings(for: "London")
            }
            
            group.addTask
            {
                try await getWeatherReadings(for: "Rome")
            }
            
            group.addTask
            {
                try await getWeatherReadings(for: "San Francisco")
            }
            
            // Convert our array of arrays into a single array of doubles
            let allValues = try await group.reduce([], +)
            
            // Calculate the mean average of all our doubles
            let average = allValues.reduce(0, +) / Double(allValues.count)
            return "Overall average temperature is \(Float(average))"
        }
        print("Done! \(result)")
    }
    catch
    {
        print("Error calculating data.")
    }
}

//Task
//{
//    await printAllWeatherReadings()
//}









//MARK: - async let bindings

struct UserData
{
    let name: String
    let friends: [String]
    let highScores: [Int]
}

func getUser() async -> String
{
    "Taylor Swift"
}

func getHighScores() async -> [Int]
{
    [42, 23, 16, 15, 8, 4]
}

func getFriends() async -> [String]
{
    ["Eric", "Maeve", "Otis"]
}

func printUserDetails() async
{
    async let username = getUser()
    async let scores = getHighScores()
    async let friends = getFriends()
    
    let user = await UserData(name: username, friends: friends, highScores: scores)
    print("Hello, my name is \(user.name), and I have \(user.friends.count) friends!")
}

//await printUserDetails()



enum NumberError: Error
{
    case outOfRange
}

func fibonacci(of number: Int) async throws -> Int
{
    if number < 0 || number > 22
    {
        throw NumberError.outOfRange
    }
    
    if number < 2 { return number }
    async let first = fibonacci(of: number - 2)
    async let second = fibonacci(of: number - 1)
    return try await first + second
}

//Task
//{
//    do {
//        //let result = try await fibonacci(of: 3)
//        //debugPrint(result)
//        
//        var numbers = [Int]()
//        
//        for i in 0..<24
//        {
//            let  result = try await fibonacci(of: i)
//            numbers.append(result)
//        }
//        
//        debugPrint(numbers)
//    }
//    catch
//    {
//        debugPrint("Get Error...")
//    }
//}









//MARK: - Continuations for interfacing async tasks with synchronous code

func fetchLatestNews(completion: @escaping ([String]) -> Void) {
    DispatchQueue.main.async {
        completion(["Swift 5.5 release", "Apple acquires Apollo"])
    }
}

func fetchLatestNews() async -> [String]
{
    await withCheckedContinuation { continuation in
        fetchLatestNews { items in
            continuation.resume(returning: items)
        }
    }
}

func printNews() async
{
    let items = await fetchLatestNews()
    
    for item in items {
        debugPrint(item)
    }
}

//await printNews()








//MARK: - Actors

class RiskyCollector
{
    var deck: Set<String>
    
    init(deck: Set<String>)
    {
        self.deck = deck
    }
    
    func send(card selected: String, to person: RiskyCollector) -> Bool
    {
        guard deck.contains(selected) else { return false }
        
        deck.remove(selected)
        person.transfer(card: selected)
        return true
    }
    
    func transfer(card: String)
    {
        deck.insert(card)
    }
}

actor SafeCollector
{
    var deck: Set<String>
    
    init(deck: Set<String>) {
        self.deck = deck
    }
    
    func send(card selected: String, to person: SafeCollector) async -> Bool {
        guard deck.contains(selected) else { return false }
    
        deck.remove(selected)
        await person.transfer(card: selected)
        return true
    }
    
    func transfer(card: String) {
        deck.insert(card)
    }
}









//MARK: - Global actors

class OldDataController {
    func save() -> Bool {
        guard Thread.isMainThread else {
            return false
        }
    
        print("Saving data…")
        return true
    }
}

class NewDataController {
    @MainActor func save() {
        print("Saving data…")
    }
}








//MARK: - Sendable and @Sendable closures

func printScore() async
{
    let score = 1
    
    Task { print(score) }
    Task { print(score) }
}

func runLater(_ function: @escaping @Sendable () -> Void) -> Void {
    DispatchQueue.global().asyncAfter(deadline: .now() + 3, execute: function)
}










//MARK: - if for postfix member expressions

Text("Welcome")
#if os(iOS)
    .font(.largeTitle)
#else
    .font(.headline)
#endif


Text("Welcome")
#if os(iOS)
    .font(.largeTitle)
    #if DEBUG
        .foregroundColor(.red)
    #endif
#else
    .font(.headline)
#endif


let result = [1, 2, 3]
#if os(iOS)
    .count
#else
    .reduce(0, +)
#endif

//print(result)










//MARK: - Interchangeable use of CGFloat and Double types

let first: CGFloat = 42
let second: Double = 19
let result1 = first + second
//print(result1)










//MARK: - Codable synthesis for enums with associated values

enum Weather: Codable
{
    case sun
    case wind(speed: Int)
    case rain(amount: Int, chance: Int)
}

let forecast: [Weather] = [
    .sun,
    .wind(speed: 10),
    .sun,
    .rain(amount: 5, chance: 50)
]

//do {
//    let result = try JSONEncoder().encode(forecast)
//    let jsonString = String(decoding: result, as: UTF8.self)
//    print(jsonString)
//}
//catch
//{
//    print("Encoding error: \(error.localizedDescription)")
//}








//MARK: - lazy now works in local contexts

func printGreeting(to: String) -> String
{
    print("In printGreeting()")
    return "Hello, \(to)"
}

func lazyTest()
{
    print("Before lazy")
    lazy var greeting = printGreeting(to: "Paul")
    print("After lazy")
    print(greeting)
}

//lazyTest()








//MARK: - Extending property wrappers to function and closure parameters

func setScore1(to score: Int)
{
    print("Setting score to \(score)")
}

//setScore1(to: 50)
//setScore1(to: -50)
//setScore1(to: 500)


@propertyWrapper
struct Clamped<T: Comparable>
{
    let wrappedValue: T
    
    init(wrappedValue: T, range: ClosedRange<T>)
    {
        self.wrappedValue = min(max(wrappedValue, range.lowerBound), range.upperBound)
    }
}

func setScore2(@Clamped(range: 0...100) to score: Int)
{
    print("Setting score to \(score)")
}

//setScore2(to: 50)
//setScore2(to: -50)
//setScore2(to: 500)







//MARK: - Extending static member lookup in generic contexts

Toggle("Example", isOn: .constant(true))
    .toggleStyle(SwitchToggleStyle())

Toggle("Example", isOn: .constant(true))
    .toggleStyle(.switch)






protocol Theam { }
struct LightTheam: Theam { }
struct DarkTheam: Theam { }
struct RainbowTheam: Theam { }


protocol Screen { }

extension Screen
{
    func theam<T: Theam>(_ style: T) -> Screen
    {
        debugPrint("Activating new theme!")
        return self
    }
}

struct HomeScreen: Screen { }

//let lightScreen = HomeScreen().theam(LightTheam())

extension Theam where Self == LightTheam
{
    static var light: LightTheam { .init() }
}

//let lightTheam = HomeScreen().theam(.light)
















//: [Next](@next)
