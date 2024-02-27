//: [Previous](@previous)

import Foundation
import UIKit
import SwiftUI


//MARK: - Multi-pattern catch clauses

//enum TemperatureError: Error {
//    case tooCold, tooHot
//}
//
//func getReactorTemperature() -> Int
//{
//    400
//}
//
//func checkReactorOperational() throws -> String
//{
//    let temp = getReactorTemperature()
//    
//    if temp < 10
//    {
//        throw TemperatureError.tooCold
//    }
//    else if temp > 90
//    {
//        throw TemperatureError.tooHot
//    }
//    else
//    {
//        return "ok"
//    }
//}
//
//
//
//do {
//    let result = try checkReactorOperational()
//    debugPrint("Result: \(result)")
//}
//catch TemperatureError.tooHot, TemperatureError.tooCold
//{
//    debugPrint("Shut down the reactor!")
//}
//catch
//{
//    print("An unknown error occurred.")
//}





//MARK: - Multiple trailing closures


//struct OldContentView: View {
//    @State private var showOptions = false
//    
//    var body: some View {
//        Button(action: {
//            self.showOptions.toggle()
//        }) {
//            // label
//            Image(systemName: "gear")
//        }
//    }
//}
//
//
//struct NewContentView: View {
//    var body: some View {
//        Button {
//            // Action
//            self.showOptions.toggle()
//        } label: {
//            Image(systemName: "gear")
//        }
//
//    }
//}
//
//
//struct BadContentView: View {
//    var body: some View {
//        Button {
//            // Action
//            self.showOptions.toggle()
//        }
//    
//        label: {
//            Image(systemName: "gear")
//        }
//
//    }
//}






//MARK: - Synthesized Comparable conformance for enums


//enum Size: Comparable{
//    case small
//    case medium
//    case large
//    case extraLarge
//}
//
//let shirtSize = Size.small
//let personSize = Size.large
//
//
//if shirtSize < personSize
//{
//    print("That shirt is too small")
//}



//enum WorldCupResult: Comparable {
//    case neverWon
//    case winner(stars: Int)
//}
//
//let americanMen = WorldCupResult.neverWon
//let americanWomen = WorldCupResult.winner(stars: 4)
//let japaneseMen = WorldCupResult.neverWon
//let japaneseWomen = WorldCupResult.winner(stars: 1)
//
//let teams = [americanMen, americanWomen, japaneseMen, japaneseWomen]
//let sortedByWins = teams.sorted()
//debugPrint(sortedByWins)





//MARK: - self is no longer required in many places

//struct OldContentView: View {
//    var body: some View {
//        List(1..<5) { number in
//            self.cell(for: number)
//        }
//    }
//    
//    func cell(for number: Int) -> some View {
//        Text("Cell \(number)")
//    }
//}


//struct NewContentView: View {
//    var body: some View {
//        List(1..<5) { number in
//            cell(for: number)
//        }
//    }
//    
//    func cell(for number: Int) -> some View {
//        Text("Cell \(number)")
//    }
//}




//MARK: - Type-based program entry points


//struct OldApp {
//    func run() {
//        debugPrint("Running!")
//    }
//}
//
//let app = OldApp()
//app.run()


//@main
//struct NewApp {
//    static func main() {
//        debugPrint("Running!")
//    }
//}
//
//let app1 = NewApp()


//MARK: - where clauses on contextually generic declarations

//struct Stack<Element>
//{
//    private var array = [Element]()
//    
//    mutating func push(_ obj: Element)
//    {
//        array.append(obj)
//    }
//    
//    mutating func pop(_ obj: Element) where Element: Comparable
//    {
//        for (key, value) in array.enumerated()
//        {
//            if obj == value
//            {
//                array.remove(at: key)
//                break
//            }
//        }
//    }
//    
//    mutating func pop()
//    {
//        array.popLast()
//    }
//}
//
//extension Stack
//{
//    func displayData()
//    {
//        array.forEach
//        { name in
//            debugPrint(name)
//        }
//    }
//    
//    func sorted() -> [Element] where Element: Comparable
//    {
//        array.sorted()
//    }
//}
//
//var abs = Stack<String>()
//// ["Aman", "Mahesh", "Naresh", "Ramesh L", "Jitesh", "Mitesh", "Lalesh", "Kuldeep"]
//
//abs.push("Aman")
//abs.push("Mahesh")
//abs.push("Naresh")
//abs.push("Ramesh L")
//abs.push("Jitesh")
//abs.push("Mitesh")
//abs.push("Lalesh")
//abs.push("Kuldeep")
//abs.pop()
//abs.pop("Ramesh L")
//
//let arr = abs.sorted()
//debugPrint(arr)
//
//abs.displayData()



//MARK: - Enum cases as protocol witnesses

//protocol Defaultable
//{
//    static var defaultValue: Self { get }
//}
//
//// make integers have a default value of 0
//extension Int: Defaultable
//{
//    static var defaultValue: Int { 0 }
//}
//
//// make arrays have a default of an empty array
//extension Array: Defaultable
//{
//    static var defaultValue: Array { [] }
//}
//
//// make dictionaries have a default of an empty dictionary
//extension Dictionary: Defaultable {
//    static var defaultValue: Dictionary { [:] }
//}
//
//enum Padding: Defaultable
//{
//    case pixels(Int)
//    case cm(Int)
//    case defaultValue
//}



//MARK: - Refined didSet semantics

//didSet {
//    _ = oldValue
//}






//MARK: - A new Float16 type

//let first: Float16 = 5
//let second: Float32 = 11
//let third: Float64 = 7
//let fourth: Float80 = 13
//
//debugPrint(fourth)








///








//: [Next](@next)
