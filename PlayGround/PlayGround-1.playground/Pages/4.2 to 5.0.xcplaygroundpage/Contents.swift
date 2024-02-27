import UIKit
import Foundation

//let rain = #"The "rain" in "Spain" falls mainly on the Spaniards."#
//print(rain)

//let keypaths = #"Swift keypaths such as \Person.name"#
//print(keypaths)

//let answer = 17
//let dontpanic = #"The answer to life, the universe, and everything is \#(answer)."#
//print(dontpanic)

//let str = ##"My dog said "woof"#gooddog"##
//print(str)

//let multiline = #"""
//The answer to life,
//the universe,
//and everything \#(answer)
//"""#
//print(multiline)

//let regex1 = "\\\\[A-Z]+[A-Za-z]+\\.[a-z]+"
//print(regex1)

//let regex2 = #"\\[A-Z]+[A-Za-z]+\.[a-z]+"#
//print(regex2)

//--------------------------

//enum NetworkError: Error {
//    case badURL
//}
//
//import Foundation
//
//func fetchUnreadCount1(from urlString: String, completionHandler: @escaping (Result<Int, NetworkError>) -> Void) {
//    print("URL ->", urlString)
//    guard let url = URL(string: urlString) else {
//        completionHandler(.failure(.badURL))
//        return
//    }
//
//    // complicated networking code here
//    print("Fetching \(url.absoluteString)")
//    completionHandler(.success(5))
//}
//
////fetchUnreadCount1(from: "https://www.hackingwithswift.com") { result in
//fetchUnreadCount1(from: "") { result in
//    switch result {
//    case .success(let count):
//        print("\(count) unread message.")
//    case .failure(let error):
//        print(error.localizedDescription)
//    }
//}
//
//print("")
//fetchUnreadCount1(from: "https://www.hackingwithswift.com") { result in
//    if let count = try? result.get() {
//        print("\(count) unread messages.")
//    }
//}

//-----------------------

//struct User {
//    var name: String
//    var age: Int
//}
//
//extension String.StringInterpolation {
//    mutating func appendInterpolation(_ value: User) {
//        appendInterpolation("My name is \(value.name) and I'm \(value.age)")
//    }
//}

//let user = User(name: "Kamlesh Oza", age: 31)
//print("User details: \(user)")

//-------------------------

//extension String.StringInterpolation {
//    mutating func appendInterpolation(_ number: Int, style: NumberFormatter.Style) {
//        let formatter = NumberFormatter()
//        formatter.numberStyle = style
//
//        if let result = formatter.string(from: number as NSNumber) {
//            appendLiteral(result)
//        }
//    }
//}
//
//let number = Int.random(in: 1...100)
//let lucky = "The lucky number this week is \(number, style: .spellOut)."
//print(lucky)

//--------------------------

//extension String.StringInterpolation {
//    mutating func appendInterpolation(repeat str: String, _ count: Int) {
//        for _ in 0 ..< count {
//            appendLiteral(str)
//        }
//    }
//}
//
//print("Baby shark \(repeat: "doo ", 10)")

//---------------------------

//extension String.StringInterpolation {
//    mutating func appendInterpolation(_ value: [String], empty defaultValue: @autoclosure () -> String) {
//        if value.count == 0 {
//            appendLiteral(defaultValue())
//        } else {
//            appendLiteral(value.joined(separator: ", "))
//        }
//    }
//}
//
//let names = ["Harry", "Ron", "Hermione"]
//print("List of students: \(names, empty: "No one").")

//-----------------------------

struct HTMLComponent: ExpressibleByStringLiteral, ExpressibleByStringInterpolation, CustomStringConvertible {
    struct StringInterpolation: StringInterpolationProtocol {
        // start with an empty string
        var output = ""

        // allocate enough space to hold twice the amount of literal text
        init(literalCapacity: Int, interpolationCount: Int) {
            output.reserveCapacity(literalCapacity * 2)
        }

        // a hard-coded piece of text – just add it
        mutating func appendLiteral(_ literal: String) {
            print("Appending \(literal)")
            output.append(literal)
        }

        // a Twitter username – add it as a link
        mutating func appendInterpolation(twitter: String) {
            print("Appending \(twitter)")
            output.append("<a href=\"https://twitter/\(twitter)\">@\(twitter)</a>")
        }

        // an email address – add it using mailto
        mutating func appendInterpolation(email: String) {
            print("Appending \(email)")
            output.append("<a href=\"mailto:\(email)\">\(email)</a>")
        }
    }

    // the finished text for this whole component
    let description: String

    // create an instance from a literal string
    init(stringLiteral value: String) {
        description = value
    }

    // create an instance from an interpolated string
    init(stringInterpolation: StringInterpolation) {
        description = stringInterpolation.output
    }
}

let text: HTMLComponent = "You should follow me on Twitter \(twitter: "pankaj"), or you can email me at \(email: "pankaj@ymail.com")."
 print(text)



//: [Next >](@next)


