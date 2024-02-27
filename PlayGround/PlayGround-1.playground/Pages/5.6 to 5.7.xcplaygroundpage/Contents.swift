//: [Previous](@previous)

import Foundation
import UIKit
import SwiftUI
import RegexBuilder

// MARK: if let shorthand for unwrapping optionals

var name: String? = "Linda"
    
if let name
{
    //print("Hello, \(name)!")
}



if let name = name
{
    //print("Hello, \(name)!")
}
    
if let unwrappedName = name
{
    //print("Hello, \(unwrappedName)!")
}



struct User
{
    var name: String
}
    
let user: User? = User(name: "Linda")
    
//if let user.name
//{
//    print("Welcome, \(user?.name ?? "")!")
//}









// MARK: Multi-statement closure type inference

let scores = [100, 80, 85]

let results = scores.map { score in
    if score >= 85
    {
        return "\(score)%: Pass"
    }
    else
    {
        return "\(score)%: Fail"
    }
}

//print(results)


let oldResults = scores.map { score -> String in
    if score >= 85
    {
        return "\(score)%: Pass"
    }
    else
    {
        return "\(score)%: Fail"
    }
}

//print(oldResults)










// MARK: Clock, Instant, and Duration

//try await Task.sleep(until: .now +  .seconds(1), clock: .continuous)

//try await Task.sleep(until: .now + .seconds(1), tolerance: .seconds(0.5), clock: .continuous)


let clock = ContinuousClock()

let time = clock.measure {
    // complex work here
}

//print("Took \(time.components.seconds) seconds")









// MARK: Regular expressions

let message = "the cat sat on the mat"

//print(message.ranges(of: "the"))
//print(message.replacing("cat", with: "dog"))
//print(message.trimmingPrefix("the "))

//print(message.ranges(of: /[a-z]at/))
//print(message.replacing(/[a-m]at/, with: "dog"))

do {
    let atSearch = try Regex("[a-z]at")
//    print(message.ranges(of: atSearch))
}
catch
{
//    print("Failed to create regex")
}


let search1 = /My name is (.+?) and I'm (\d+) years old./
let greeting1 = "My name is Taylor and I'm 26 years old."

//if let result = try? search1.wholeMatch(in: greeting1) {
//    print("Name: \(result.1)")
//    print("Age: \(result.2)")
//}



let search2 = /My name is (?<name>.+?) and I'm (?<age>\d+) years old./
let greeting2 = "My name is Taylor and I'm 26 years old."

//if let result = try? search2.wholeMatch(in: greeting2) {
//    print("Name: \(result.name)")
//    print("Age: \(result.age)")
//}



let search3 = Regex {
    "My name is "

    Capture {
        OneOrMore(.word)
    }
    
    " and I'm "

    Capture {
        OneOrMore(.digit)
    }
    
    " years old."
}


let search4 = Regex {
    "My name is "

    Capture {
        OneOrMore(.word)
    }

    " and I'm "

    TryCapture {
        OneOrMore(.digit)
    } transform: { match in
        Int(match)
    }

    " years old."
}


let nameRef = Reference(Substring.self)
let ageRef = Reference(Int.self)

let search5 = Regex {
    "My name is "

    Capture(as: nameRef) {
        OneOrMore(.word)
    }

    " and I'm "

    TryCapture(as: ageRef) {
        OneOrMore(.digit)
    } transform: { match in
        Int(match)
    }

    " years old."
}

//if let result = greeting1.firstMatch(of: search5) {
//    print("Name: \(result[nameRef])")
//    print("Age: \(result[ageRef])")
//}











// MARK: Type inference from default expressions

func drawLotto1<T: Sequence>(from options: T, count: Int = 7) -> [T.Element]
{
    Array(options.shuffled().prefix(count))
}

//print(drawLotto1(from: 1...49))
//print(drawLotto1(from: ["Jenny", "Trixie", "Cynthia"], count: 1))


func drawLotto2<T: Sequence>(from options: T = 1...49, count: Int = 7) -> [T.Element]
{
    Array(options.shuffled().prefix(count))
}

//print(drawLotto2(from: ["Jenny", "Trixie", "Cynthia"], count: 2))
//print(drawLotto2(from: 1...101, count: 20))











// MARK: Concurrency in top-level code

//let url = URL(string: "https://hws.dev/readings.json")!
//let (data, _) = try await URLSession.shared.data(from: url)
//let readings = try JSONDecoder().decode([Double].self, from: data)

//print("Found \(readings.count) temperature readings")









// MARK: Opaque parameter declarations

func isSorted(array: [some Comparable]) -> Bool
{
    array == array.sorted()
}

func isSortedOld<T: Comparable>(array: [T]) -> Bool
{
    array == array.sorted()
}

extension Array where Element: Comparable
{
    func isSorted() -> Bool
    {
        self == self.sorted()
    }
}

//print(isSorted(array: ["Jenny", "Trixie", "Cynthia"]))
//print(isSortedOld(array: ["Cynthia", "Jenny", "Trixie"]))
//print(isSortedOld(array: [1, 5, 10]))








// MARK: Structural opaque result types

func showUserDetails() -> (some Equatable, some Equatable)
{
    (Text("Username"), Text("@twostraws"))
}

func createUser() -> [some View]
{
    let usernames = ["@frankefoster", "@mikaela__caron", "@museumshuffle"]
    return usernames.map(Text.init)
}

//func createDiceRoll() -> () -> some View
//{
//    return {
//        let diceRoll = Int.random(in: 1...6)
//        return Text(String(diceRoll))
//    }
//}









// MARK: Unlock existentials for all protocols

let firstName: any Equatable = "Paul"
let lastName: any Equatable = "Hudson"

let tvShow: [any Equatable] = ["Patan", 99, 77, "Ahmedabad"]

for item in tvShow {
//    if let item = item as? String
//    {
//        print("Found string: \(item)")
//    }
//    else if let item = item as? Int
//    {
//        print("Found integer: \(item)")
//    }
}

if let firstName = firstName as? String, let lastName = lastName as? String
{
//    print(firstName == lastName)
}

func canBeIdentified(_ input: any Sequence) -> Bool
{
    input.allSatisfy { $0 is any Identifiable }
}













// MARK: Lightweight same-type requirements for primary associated types

protocol Cache<Content>
{
    associatedtype Content
    
    var items: [Content] { get set }
    
    init(items: [Content])
    mutating func add(item: Content)
}


struct File
{
    let name: String
}
    
struct LocalFileCache: Cache
{
    var items = [File]()
    
    mutating func add(item: File)
    {
        items.append(item)
    }
}


func loadDefaultCache() -> LocalFileCache
{
    LocalFileCache(items: [])
}


func loadDefaultCacheOld() -> some Cache
{
    LocalFileCache(items: [])
}


func loadDefaultCacheNew() -> some Cache<File>
{
    LocalFileCache(items: [])
}


extension Cache<File>
{
    func clean()
    {
        print("Deleting all cached files…")
    }
}


func merge<C: Cache<File>>(_ lhs: C, _ rhs: C) -> C
{
    print("Copying all files into a new location…")
    // now send back a new cache with items from both other caches
    return C(items: lhs.items + rhs.items)
}










// MARK: Distributed actor isolation

// use Apple's ClusterSystem transport
//typealias DefaultDistributedActorSystem = ClusterSystem
    
//distributed actor CardCollector {
//    var deck: Set<String>
//    
//    init(deck: Set<String>) {
//        self.deck = deck
//    }
//    
//    distributed func send(card selected: String, to person: CardCollector) async -> Bool {
//        guard deck.contains(selected) else { return false }
//    
//        do {
//            try await person.transfer(card: selected)
//            deck.remove(selected)
//            return true
//        } catch {
//            return false
//        }
//    }
//    
//    distributed func transfer(card: String) {
//        deck.insert(card)
//    }
//}













// MARK: buildPartialBlock for result builders

@resultBuilder
struct SimpleViewBuilderOld
{
    static func buildBlock<C0, C1>(_ c0: C0, _ c1: C1) -> TupleView<(C0, C1)> where C0 : View, C1 : View
    {
        TupleView((c0, c1))
    }
    
    static func buildBlock<C0, C1, C2>(_ c0: C0, _ c1: C1, _ c2: C2) -> TupleView<(C0, C1, C2)> where C0: View, C1: View, C2: View
    {
        TupleView((c0, c1, c2))
    }
}

//@SimpleViewBuilderOld func createTextOld() -> some View
//{
//    Text("1")
//    Text("2")
//    Text("3")
//}

//@resultBuilder
//struct SimpleViewBuilderNew
//{
//    static func buildPartialBlock<Content>(first content: Content) -> Content where Content: View
//    {
//        content
//    }
//    
//    static func buildPartialBlock<C0, C1>(accumulated: C0, next: C1) -> TupleView<(C0, C1)> where C0: View, C1: View
//    {
//        TupleView((accumulated, next))
//    }
//}
//
//@SimpleViewBuilderNew func createTextNew() -> some View
//{
//    Text("1")
//    Text("2")
//    Text("3")
//}












// MARK: Implicitly opened existentials

func double<T: Numeric>(_ number: T) -> T
{
    number * 2
}

let first = 1
let second = 2.0
let third: Float = 3

let numbers: [any Numeric] = [first, second, third]
    
for number in numbers
{
//    print(double(number))
}


func areEqual<T: Numeric>(_ a: T, _ b: T) -> Bool
{
    a == b
}
    
//print(areEqual(numbers[0], numbers[1]))
//print(areEqual(<#T##a: Numeric##Numeric#>, <#T##b: Numeric##Numeric#>))










// MARK: Unavailable from async attribute

@available(*, noasync)
func doRiskyWork()
{   }

func synchronousCaller()
{
    doRiskyWork()
}

func asynchronousCaller() async
{
    doRiskyWork()
}

func sneakyCaller() async
{
    synchronousCaller()
}





//: [Next](@next)
