//: [Previous](@previous)

import Foundation
import UIKit
import SwiftUI


// MARK: - Introduce existential any

protocol Vehicle
{
    func travel(to destination: String)
}

struct Car: Vehicle
{
    func travel(to destination: String)
    {
        print("I'm driving to \(destination)")
    }
}

let vehicle = Car()
//vehicle.travel(to: "London")


func travel<T: Vehicle>(to destinations: [String], using vehicle: T)
{
    for destination in destinations {
        vehicle.travel(to: destination)
    }
}

//travel(to: ["Ahmedabad", "Vadodara"], using: vehicle)


let vehicle2: Vehicle = Car()
//vehicle2.travel(to: "Glasgow")

func travel2(to destinations: [String], using vehicle: Vehicle)
{
    for destination in destinations
    {
        vehicle.travel(to: destination)
    }
}


let vehicle3: any Vehicle = Car()
//vehicle3.travel(to: "Glasgow")

func travel3(to destinations: [String], using vehicle: any Vehicle)
{
    for destination in destinations
    {
        vehicle.travel(to: destination)
    }
}









// MARK: - Type placeholders

//let score1 = 5
//let score2: Int = 5
//let score3: _ = 5


//var results1 = [
//    "Cynthia": [],
//    "Jenny": [],
//    "Trixie": [],
//]
//
//
//var results2: [String: [Int]] = [
//    "Cynthia": [],
//    "Jenny": [],
//    "Trixie": [],
//]
//
//
//var results3: [_: [Int]] = [
//    "Cynthia": [],
//    "Jenny": [],
//    "Trixie": [],
//]
//
//
//
// 
//struct Player<T: Numeric>
//{
//    var name: String
//    var score: T
//}

//func createPlayer() -> _
//{
//    Player(name: "Anonymous", score: 0)
//}









// MARK: - Allow coding of non String/Int keyed Dictionary into a KeyedContainer

enum OldSettings: String, Codable
{
    case name
    case twitter
}

let oldDict: [OldSettings: String] = [.name: "Paul", .twitter: "@twostraws"]
let oldData = try JSONEncoder().encode(oldDict)
//debugPrint(String(decoding: oldData, as: UTF8.self))
//print(String(decoding: oldData, as: UTF8.self))


enum NewSettings: String, Codable, CodingKeyRepresentable
{
    case name
    case twitter
}

let newDict: [NewSettings: String] = [.name: "Paul", .twitter: "@twostraws"]
let newData = try! JSONEncoder().encode(newDict)

//print(String(decoding: newData, as: UTF8.self))










// MARK: - Unavailability condition

if #available(iOS 15, *) { } else {
    // Code to make iOS 14 and earlier work correctly
}

if #unavailable(iOS 15) {
    // Code to make iOS 14 and earlier work correctly
}










// MARK: - More concurrency changes

@MainActor class Settings: ObservableObject { }
    
struct OldContentView: View
{
    @StateObject private var settings = Settings()
    
    var body: some View
    {
        Text("Hello, world!")
    }
}



struct NewContentView: View
{
    @StateObject private var settings: Settings
    
    init()
    {
        _settings = StateObject(wrappedValue: Settings())
    }
    
    var body: some View
    {
        Text("Hello, world!")
    }
}



















//: [Next](@next)
