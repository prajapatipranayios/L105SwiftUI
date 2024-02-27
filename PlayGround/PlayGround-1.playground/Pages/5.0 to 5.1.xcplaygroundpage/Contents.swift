//: [< Previous](@previous)

import UIKit
import Foundation

//struct User {
//    var name: String
//    var loginCount: Int = 0
//}
//
//let piper = User(name: "Naina", loginCount: 0)
//print(piper.name)
//
//let gloria = User(name: "Gloria Mendoza", loginCount: 0)
//let suzanne = User(name: "Suzanne Warren")

//-------------------------------

//let doubled1 = [1, 2, 3].map { $0 * 2 }
//let doubled2 = [1, 2, 3].map { return $0 * 2 }
//
//func double(_ number: Int) -> Int {
//    number * 2
//}
//
//print(double(4))

//--------------------------------

//class NetworkManager {
//    class var maximumActiveRequests: Int {
//        return 4
//    }
//
//    func printDebugData() {
//        print("Maximum network requests: \(NetworkManager.maximumActiveRequests).")
//    }
//}
//
//class ThrottledNetworkManager: NetworkManager {
//    override class var maximumActiveRequests: Int {
//        return 1
//    }
//}
//
//let manager = ThrottledNetworkManager()
//manager.printDebugData()
//
//
//class ImprovedNetworkManager {
//    class var maximumActiveRequests: Int {
//        return 4
//    }
//
//    func printDebugData() {
//        print("Maximum network requests: \(Self.maximumActiveRequests).")
//    }
//}

//--------------------------------

protocol Fighter {}
struct XWing: Fighter {}

func launchFighter() -> Fighter {
    return XWing()
}

let red5 = launchFighter()

func launchOpaqueFighter() -> some Fighter {
    return XWing()
}

func makeInt() -> some Equatable {
    Int.random(in: 1...10)
}


let int1 = makeInt()
let int2 = makeInt()

print(int1 == int2)

func makeString() -> some Equatable {
    "Red"
}

protocol ImperialFighter {
    init()
}
    
struct TIEFighter: ImperialFighter { }
struct TIEAdvanced: ImperialFighter { }

func launchImperialFighter<T: ImperialFighter>() -> T {
    return T()
}

let fighter1: TIEFighter = launchImperialFighter()
let fighter2: TIEAdvanced = launchImperialFighter()











//: [Next >](@next)
