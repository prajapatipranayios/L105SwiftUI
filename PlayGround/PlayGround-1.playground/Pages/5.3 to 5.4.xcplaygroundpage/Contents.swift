//: [Previous](@previous)

import Foundation
import UIKit
import SwiftUI


//MARK: - Improved implicit member syntax

//struct ContentView1: View {
//    var body: some View {
//        Text("You're not my supervisor!")
//            .foregroundColor(.red)
//    }
//}
//
//struct ContentView2: View {
//    var body: some View {
//        Text("You're not my supervisor!")
//            .foregroundColor(Color.red.opacity(0.7))
//    }
//}
//
//struct ContentView3: View {
//    var body: some View {
//        Text("You're not my supervisor!")
//            .foregroundColor(.red.opacity(0.3))
//    }
//}








//MARK: - Multiple variadic parameters in functions

//func summarizeGoals(times: Int..., players: String...)
//{
//    let joinedNames = ListFormatter.localizedString(byJoining: players)
//    let joinedTimes = ListFormatter.localizedString(byJoining: times.map(String.init))
//    
//    debugPrint("\(times.count) goals where scored by \(joinedNames) at the follow minutes: \(joinedTimes)")
//}
//
//summarizeGoals(times: 18, 33, 55, 90, players: "Dani", "Jamie", "Roy")








//MARK: - Local functions now support overloading

//struct Butter { }
//struct Flour { }
//struct Sugar { }

//func makeCookies()
//{
//    func add(item: Butter)
//    {
//        debugPrint("Adding butter…")
//    }
//    
//    func add(item: Flour)
//    {
//        debugPrint("Adding flour…")
//    }
//    
//    func add(item: Sugar)
//    {
//        debugPrint("Adding sugar…")
//    }
//    
//    add(item: Butter())
//    add(item: Flour())
//    add(item: Sugar())
//    debugPrint("Come and get some cookies!")
//}
//
//makeCookies()


//func makeCookies2() {
//    add(item: Butter())
//    add(item: Flour())
//    add(item: Sugar())
//        
//    func add(item: Butter) {
//        debugPrint("Adding butter…")
//    }
//    
//    func add(item: Flour) {
//        debugPrint("Adding flour…")
//    }
//    
//    func add(item: Sugar) {
//        debugPrint("Adding sugar…")
//    }
//}
//    
//makeCookies2()









//MARK: - Creating variables that call a function of the same name

//struct Table
//{
//    let count = 10
//    
//    func color(forRow row: Int) -> String
//    {
//        if row.isMultiple(of: 2)
//        {
//            return "red"
//        }
//        else
//        {
//            return "black"
//        }
//    }
//    
//    func printRows()
//    {
//        for i in 0..<count
//        {
//            let color = color(forRow: i)
//            debugPrint("Row \(i): \(color)")
//        }
//    }
//}
//
//let table = Table()
//table.printRows()



//struct User
//{
//    let username = "Taylor"
//    
//    func suggestAlternativeUsername() -> String
//    {
//        var username = username
//        username += String(Int.random(in: 10...9999))
//        return username
//    }
//}
//
//let user = User()
//user.suggestAlternativeUsername()



//let username = "Taytay"
//
//func suggestAlternativeUsername() -> String {
//    var username = username
//    username += String(Int.random(in: 1000...9999))
//    return username
//}
//
//suggestAlternativeUsername()








//MARK: - Result builders


//func makeSentence1() -> String {
//    "Why settle for a Duke when you can have a Prince?"
//}
//    
//print(makeSentence1())


// This is invalid Swift, and will not compile.
// func makeSentence2() -> String {
//     "Why settle for a Duke"
//     "when you can have"
//     "a Prince?"
// }


//@resultBuilder
//struct SimpleStringBuilder {
//    static func buildBlock(_ parts: String...) -> String {
//        parts.joined(separator: "\n")
//    }
//}

//let joined = SimpleStringBuilder.buildBlock(
//    "Why settle for a Duke",
//    "when you can have",
//    "a Prince?"
//)
//    
//debugPrint(joined)


//@SimpleStringBuilder func makeSentence3() -> String {
//    "Why settle for a Duke"
//    "when you can have"
//    "a Prince?"
//}

//debugPrint(makeSentence3())



//@resultBuilder
//struct ConditionalStringBuilder {
//    static func buildBlock(_ parts: String...) -> String {
//        parts.joined(separator: "\n")
//    }
//        
//    static func buildEither(first component: String) -> String {
//        debugPrint("first component")
//        return component
//    }
//    
//    static func buildEither(second component: String) -> String {
//        debugPrint("second component")
//        return component
//    }
//}
//
//@ConditionalStringBuilder func makeSentence4() -> String
//{
//    "Why settle for a Duke"
//    "when you can have"
//    
//    if Bool.random() {
//        "a Prince?"
//    } else {
//        "a King?"
//    }
//}
//
//print(makeSentence4())


//@resultBuilder
//struct ComplexStringBuilder {
//    static func buildBlock(_ parts: String...) -> String {
//        parts.joined(separator: "\n")
//    }
//    
//    static func buildEither(first component: String) -> String {
//        return component
//    }
//    
//    static func buildEither(second component: String) -> String {
//        return component
//    }
//    
//    static func buildArray(_ components: [String]) -> String {
//        components.joined(separator: "\n")
//    }
//}
//
//@ComplexStringBuilder func countDown() -> String {
//    for i in (0...10).reversed() {
//        "\(i)…"
//    }
//    "Lift off!"
//}
//
//print(countDown())


//struct CustomVStack<Content: View>: View {
//    @ViewBuilder let content: Content
//    
//    var body: some View {
//        VStack {
//            // custom functionality here
//            content
//        }
//    }
//}



//@propertyWrapper struct NonNegative<T: Numeric & Comparable>
//{
//    var value: T
//    var wrappedValue: T {
//        get { value }
//        
//        set {
//            if newValue < 0 {
//                value = 0
//            }
//            else {
//                value = newValue
//            }
//        }
//    }
//    
//    init(wrappedValue: T) {
//        if wrappedValue < 0 {
//            self.value = 0
//        }
//        else {
//            self.value = wrappedValue
//        }
//    }
//}
//
//func playGame() {
//    @NonNegative var score = 0
//    
//    // player was correct
//    score += 4
//    
//    // player was correct again
//    score += 8
//    
//    // player got one wrong
//    score -= 15
//    
//    // player got another one wrong
//    score += 16
//    
//    print(score)
//}
//    
//playGame()
















//: [Next](@next)
