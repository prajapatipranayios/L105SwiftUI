//: [Previous](@previous)

import Foundation
import UIKit
import SwiftUI


//MARK: - Key path expressions as functions

//struct User
//{
//    let name: String
//    let age: Int
//    let bestFriend: String?
//    
//    var canVote: Bool {
//        age >= 18
//    }
//}
//
//let henil = User(name: "Henil Patel", age: 17, bestFriend: "Karan Patel")
//let pavan = User(name: "Pavan Thakkar", age: 31, bestFriend: "Chirag Patel")
//let bhavin = User(name: "Bhavin Shah", age: 18, bestFriend: "Pranay Prajapati")
//let users = [henil, pavan, bhavin]
//
//let userNames = users.map(\.name)
//debugPrint(userNames)
//
//let oldUserName = users.map { $0.name }
//debugPrint(oldUserName)
//
//let voters = users.map(\.canVote)
//debugPrint(voters)
//
//let bestFriend = users.map(\.bestFriend!)
//debugPrint(bestFriend)





//MARK: - Callable values of user-defined nominal types

//struct Dice
//{
//    var lowerBound: Int
//    var upperBound: Int
//    
//    func callAsFunction() -> Int
//    {
//        (lowerBound...upperBound).randomElement()!
//    }
//}
//
//let d6 = Dice(lowerBound: 1, upperBound: 6)
//let roll1 = d6()
//debugPrint(roll1)
//
//let d12 = Dice(lowerBound: 1, upperBound: 12)
//let roll2 = d12.callAsFunction()
//debugPrint(roll2)
//
//
//
//struct StepCounter
//{
//    var step = 0
//    
//    mutating func callAsFunction(count: Int) -> Bool
//    {
//        step += count
//        debugPrint(step)
//        return step > 10_000
//    }
//}
//
//var steps = StepCounter()
//let targetReached = steps(count: 10001)
//debugPrint(targetReached)




//MARK: - Subscripts can now declare default arguments

//struct PoliceForce
//{
//    var officers: [String]
//    
//    subscript(index: Int, default default1: String = "Unknown") -> String
//    {
//        if index >= 0 && index < officers.count {
//            return officers[index]
//        }
//        else
//        {
//            return default1
//        }
//    }
//}
//
//let force = PoliceForce(officers: ["Pavan", "Het", "Amar", "Rinku", "Amit", "Kishor"])
//debugPrint(force[1])
//debugPrint(force[6])
//
//
//debugPrint(force[-1, default: "Ramesh Lukkho"])





//MARK: - Lazy filtering order is now reversed

//let people = ["Arya", "Chiku", "Sumit", "Sameer", "Chinmay", "Hardik", "Sunny"]
//    .lazy
//    .filter{ $0.hasPrefix("S") }
//    .filter{ debugPrint($0); return true}
//
//_ = people.count
//debugPrint(people.count)





//MARK: - New and improved diagnostics

//struct ContentView: View
//{
//    @State private var name = "0"
//    
//    var body: some View {
//        VStack {
//            Text("What is your name?")
//            TextField("Name", text: $name)
//                .frame(maxWidth: 300)
//        }
//    }
//}






//: [Next](@next)
