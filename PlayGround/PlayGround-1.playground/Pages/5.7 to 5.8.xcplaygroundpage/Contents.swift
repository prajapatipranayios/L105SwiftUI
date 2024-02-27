//: [Previous](@previous)

import Foundation
import UIKit
import SwiftUI


// MARK: Lift all limitations on variables in result builders

struct ContentView: View {
    var body: some View {
        VStack {
            lazy var user = fetchUsername()
            Text("Hello, \(user).")
        }
        .padding()
    }
    
    func fetchUsername() -> String
    {
        "@twostraws"
    }
}


// The user is an active subscriber, not an active subscriber, or we don't know their status yet.
enum UserState {
    case subscriber, nonsubscriber, unknown
}
    
// Two small pieces of information about the user
struct User {
    var id: UUID
    var username: String
}

struct SubscriberView: View {
    @State private var state = UserState.unknown
    
    var body: some View {
        VStack {
            lazy var user = fetchUsername()
    
            switch state {
            case .subscriber:
                Text("Hello, \(user.username). Here's what's new for subscribers…")
            case .nonsubscriber:
                Text("Hello, \(user.username). Here's why you should subscribe…")
                Button("Subscribe now") {
                    startSubscription(for: user)
                }
            case .unknown:
                Text("Sign up today!")
            }
        }
        .padding()
    }
    
    // Example function that would do complex work
    func fetchUsername() -> User {
        User(id: UUID(), username: "Anonymous")
    }
    
    func startSubscription(for user: User) {
        print("Starting subscription…")
    }
}


struct CounterView: View {
    var body: some View {
        @AppStorage("counter") var tapCount = 0
    
        Button("Count: \(tapCount)") {
            tapCount += 1
        }
    }
}











// MARK: Function back deployment

extension Text
{
    @backDeployed(before: iOS 16.4, macOS 13.3, tvOS 16.4, watchOS 9.4)
    @available(iOS 14.0, macOS 11, tvOS 14.0, watchOS 7.0, *)
    
    public func monospaced(_ isActive: Bool) -> Text
    {
        fatalError("Implementation here")
    }
}












// MARK: Allow implicit self for weak self captures, after self is unwrapped

class TimerController
{
    var timer: Timer?
    var fireCount = 0
    
    init()
    {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] timer in
            guard let self else { return }
            print("Timer has fired \(fireCount) times")
            fireCount += 1
        }
    }
}











// MARK: Concise magic file names

// New behavior, when enabled
//print(#file)
    
// Old behavior, when needed
//print(#filePath)











// MARK: Opening existential arguments to optional parameters

func double<T: Numeric>(_ number: T) -> T
{
    number * 2
}

let first = 1
let second = 2.0
let third: Float = 3
    
let numbers: [any Numeric] = [first, second, third]

//for number in numbers
//{
//    print(double(number))
//}


func optionalDouble<T: Numeric>(_ number: T?) -> T
{
    let numberToDouble = number ?? 0
    return  numberToDouble * 2
}
    
//for number in numbers
//{
//    print(optionalDouble(number))
//}










// MARK: Collection downcasts in cast patterns are now supported

class Pet
{   }

class Dog: Pet
{
    func bark()
    {
        print("Woof!")
    }
}

func bark(using pets: [Pet])
{
    switch pets
    {
    case let pets as [Dog]:
        for pet in pets
        {
            pet.bark()
        }
        
    default:
        print("No barking today.")
    }
}





//: [Next](@next)
