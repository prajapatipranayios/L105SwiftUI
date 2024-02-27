//: [Previous](@previous)

import Foundation
import UIKit
import SwiftUI


// MARK: if and switch expressions

let score = 800
let simpleResult = if score > 500 { "Pass" } else { "Fail" }
//print(simpleResult)


let complexResult = switch score {
    case 0...300: "Fail"
    case 301...500: "Pass"
    case 501...800: "Merit"
    default: "Distinction"
}
    
//print(complexResult)


func rating(for score: Int) -> String
{
    switch score {
    case 0...300: "Fail"
    case 301...500: "Pass"
    case 501...800: "Merit"
    default: "Distinction"
    }
}

//print(rating(for: score))



let ternaryResult = score > 500 ? "Pass" : "Fail"
//print(ternaryResult)

let customerRating = 4
let bonusMultiplier1 = customerRating > 3 ? 1.5 : 1
let bonusMultiplier2 = if customerRating > 3 { 1.5 } else { 1.0 }










// MARK: Value and Type Parameter Packs

struct FrontEndDev
{
    var name: String
}

struct BackEndDev
{
    var name: String
}

struct FullStackDev
{
    var name: String
}


let johnny = FrontEndDev(name: "Johnny Appleseed")
let jess = FrontEndDev(name: "Jessica Appleseed")
let kate = BackEndDev(name: "Kate Bell")
let kevin = BackEndDev(name: "Kevin Bell")

let derek = FullStackDev(name: "Derek Derekson")


func pairUp1<T, U>(firstPeople: T..., secondPeople: U...) -> ([(T, U)])
{
    assert(firstPeople.count == secondPeople.count, "You must provide equal numbers of people to pair.")
    print("Condition true...")
    
    var result = [(T, U)]()
    
    for i in 0 ..< firstPeople.count
    {
        result.append((firstPeople[i], secondPeople[i]))
    }
    
    return result
}

//let result1 = pairUp1(firstPeople: kate, kevin, secondPeople: johnny, jess)

//for data in result1
//{ print("\(data.0) --- \(data.1)") }

//func pairUp2<each T, each U>(firstPeople: repeat each T, secondPeople: repeat each U) -> (repeat (first: each T, second: each U))
//{
//    return (repeat (each firstPeople, each secondPeople))
//}
//
//let result2 = pairUp2(firstPeople: johnny, derek, secondPeople: kate, kevin)
//
//let result3 = pairUp2(firstPeople: johnny, derek, secondPeople: kate, 556)
//
//
//
//protocol WritesFrontEndCode { }
//protocol WritesBackEndCode { }
//
//
//func pairUp3<each T: WritesFrontEndCode, each U: WritesBackEndCode>(firstPeople: repeat each T, secondPeople: repeat each U) -> (repeat (first: each T, second: each U))
//{
//    return (repeat (each firstPeople, each secondPeople))
//}









// MARK: Macros

// Need to work on it......

//import SwiftCompilerPlugin
//import SwiftSyntaxMacros
//
//public struct BuildDateMacro: ExpressionMacro
//{
//    public static func expansion(
//        of node: FreestandingMacroExpansionSyntax,
//        in context: some MacroExpansionContext
//    ) -> ExprSyntax
//    {
//        let date = ISO8601DateFormatter().string(from: .now)
//        return "\"\(raw: date)\""
//    }
//}
//
//
//@main
//struct MyMacrosPlugin: CompilerPlugin {
//    let providingMacros: [Macro.Type] = [
//        BuildDateMacro.self
//    ]
//}










// MARK: Noncopyable structs and enums

//struct User: ~Copyable
//{
//    var name: String
//}


//func createUser()
//{
//    let newUser = User(name: "Anonymous")
//    
//    var userCopy = newUser
//    print(userCopy.name)
//}
//
//createUser()



//func createAndGreetUser()
//{
//    let newUser = User(name: "Anonymous")
//    greet(newUser)
//    print("Goodbye, \(newUser.name)")
//}
//
//func greet(_ user: borrowing User)
//{
//    print("Hello, \(user.name)!")
//}
//
//createAndGreetUser()


//class Movie
//{
//    var name: String
//    
//    init(name: String)
//    {
//        self.name = name
//    }
//    
//    deinit
//    {
//        print("\(name) is no longer available")
//    }
//}
//
//func watchMovie() {
//    let movie = Movie(name: "The Hunt for Red October")
//    print("Watching \(movie.name)")
//}
//
//watchMovie()


//struct MissionImpossibleMessage: ~Copyable
//{
//    private var message: String
//    
//    init(message: String)
//    {
//        self.message = message
//    }
//    
//    consuming func read()
//    {
//        print(message)
//    }
//}
//
//func createMessage()
//{
//    let message = MissionImpossibleMessage(message: "You need to abseil down a skyscraper for some reason.")
//    message.read()
//}
//    
//createMessage()


//struct HighScore: ~Copyable
//{
//    var value = 0
//    
//    consuming func finalize()
//    {
//        print("Saving score to disk…")
//        discard self
//    }
//    
//    deinit
//    {
//        print("Deinit is saving score to disk…")
//    }
//}
//    
//func createHighScore()
//{
//    var highScore = HighScore()
//    highScore.value = 20
//    highScore.finalize()
//}
//    
//createHighScore()










// MARK: consume operator to end the lifetime of a variable binding

struct User
{
    var name: String
}
    
//func createUser()
//{
//    let newUser = User(name: "Anonymous")
//    let userCopy = consume newUser
//    print(userCopy.name)
//}
//    
//createUser()


//func consumeUser()
//{
//    let newUser = User(name: "Anonymous")
//    _ = consume newUser
//}
//
//func createAndProcessUser() {
//    let newUser = User(name: "Anonymous")
//    process(user: consume newUser)
//}
//    
//func process(user: User) {
//    print("Processing \(name)…")
//}
//    
//createAndProcessUser()



//func greetRandomly() {
//    let user = User(name: "Taylor Swift")
//    
//    if Bool.random() {
//        let userCopy = consume user
//        print("Hello, \(userCopy.name)")
//    } else {
//        print("Greetings, \(user.name)")
//    }
//}
//    
//greetRandomly()


//func createThenRecreate() {
//    var user = User(name: "Roy Kent")
//    _ = consume user
//    
//    user = User(name: "Jamie Tartt")
//    print(user.name)
//}
//    
//createThenRecreate()













// MARK: Convenience Async[Throwing]Stream.makeStream methods

//var _continuation: AsyncStream<String>.Continuation!
//let stream = AsyncStream<String> { continuation = $0 }
//let continuation = _continuation!


//struct OldNumberGenerator {
//    private var continuation: AsyncStream<Int>.Continuation!
//    var stream: AsyncStream<Int>!
//    
//    init() {
//        stream = AsyncStream(Int.self) { continuation in
//            self.continuation = continuation
//        }
//    }
//    
//    func queueWork() {
//        Task {
//            for i in 1...10 {
//                try await Task.sleep(for: .seconds(1))
//                continuation.yield(i)
//            }
//    
//            continuation.finish()
//        }
//    }
//}
//
//
//struct NewNumberGenerator {
//    let (stream, continuation) = AsyncStream.makeStream(of: Int.self)
//    
//    func queueWork() {
//        Task {
//            for i in 1...10 {
//                try await Task.sleep(for: .seconds(1))
//                continuation.yield(i)
//            }
//    
//            continuation.finish()
//        }
//    }
//}












// MARK: Add sleep(for:) to Clock

//class DataController: ObservableObject
//{
//    var clock: any Clock<Duration>
//    
//    init(clock: any Clock<Duration>)
//    {
//        self.clock = clock
//    }
//    
//    func delayedSave() async throws
//    {
//        try await clock.sleep(for: .seconds(1))
//        print("Saving…")
//    }
//}
//
//
//try await Task.sleep(until: .now + .seconds(1), tolerance: .seconds(0.5))
//
//
//try await Task.sleep(for: .seconds(1), tolerance: .seconds(0.5))













// MARK: Discarding task groups

//struct FileWatcher
//{
//    // The URL we're watching for file changes.
//    let url: URL
//    
//    // The set of URLs we've already returned.
//    private var handled = Set<URL>()
//    
//    init(url: URL)
//    {
//        self.url = url
//    }
//    
//    mutating func next() async throws -> URL?
//    {
//        while true {
//            // Read the latest contents of our directory, or exit if a problem occurred.
//            guard let contents = try? FileManager.default.contentsOfDirectory(at: url, includingPropertiesForKeys: nil) else {
//                return nil
//            }
//    
//            // Figure out which URLs we haven't already handled.
//            let unhandled = handled.symmetricDifference(contents)
//    
//            if let newURL = unhandled.first
//            {
//                // If we already handled this URL then it must be deleted.
//                if handled.contains(newURL)
//                {
//                    handled.remove(newURL)
//                }
//                else
//                {
//                    // Otherwise this URL is new, so mark it as handled.
//                    handled.insert(newURL)
//                    return newURL
//                }
//            }
//            else
//            {
//                // No file difference; sleep for a few seconds then try again.
//                try await Task.sleep(for: .microseconds(1000))
//            }
//        }
//    }
//}


//struct FileProcessor
//{
//    static func main() async throws {
//        var watcher = FileWatcher(url: URL(filePath: "/Users/twostraws"))
//    
//        try await withThrowingTaskGroup(of: Void.self) { group in
//            while let newURL = try await watcher.next()
//            {
//                group.addTask {
//                    process(newURL)
//                }
//            }
//        }
//    }
//    
//    static func process(_ url: URL)
//    {
//        print("Processing \(url.path())")
//    }
//}











print()
print("----------------------")
print("Execution complete...")

//: [Next](@next)
