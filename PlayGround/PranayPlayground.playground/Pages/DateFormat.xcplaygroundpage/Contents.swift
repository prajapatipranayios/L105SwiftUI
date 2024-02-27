import UIKit

//let date = Date()
//let format = DateFormatter()
//format.dateFormat = "yyyy-MM-dd HH:mm:ss"
//let timestamp = format.string(from: date)


//class func currentDate() -> String
func currentDate() -> String
{
    let formatter = DateFormatter()
    formatter.locale = Locale(identifier: "en_US_POSIX")
    formatter.dateFormat = "MMM d, yyyy"
    return formatter.string(from: Date())
}

//class func currentTime() -> String
func currentTime() -> String
{
    let formatter = DateFormatter()
    formatter.locale = Locale(identifier: "en_US_POSIX")
    formatter.dateFormat = "h:mm a"
    formatter.amSymbol = "am"
    formatter.pmSymbol = "pm"
    //let timeString = formatter.string(from: Date())
    //print(timeString)   // "4:44 PM on June 23, 2016\n"
    return formatter.string(from: Date())
}

//class func currentDateTime() -> String {
func currentDateTime() -> String {
    let formatter = DateFormatter()
    formatter.locale = Locale(identifier: "en_US_POSIX")
    formatter.dateFormat = "ddMMyyyyhmmss"
    return formatter.string(from: Date())
}



//static func getCurrentTimeZone() -> String {
static func getCurrentTimeZone() -> String {
    let localTimeZoneFormatter = DateFormatter()
    //localTimeZoneFormatter.timeZone = self
    localTimeZoneFormatter.dateFormat = "Z"
    print(localTimeZoneFormatter.string(from: Date()))
    let str = localTimeZoneFormatter.string(from: Date())
    //let str1 = str.replacingCharacters(in: 3, with: ":")
    let str1 = str.unfoldSubSequences(limitedTo: 3).joined(separator: ":")
    print(str1)
    return ""
}

extension StringProtocol where Self: RangeReplaceableCollection {

mutating func insert<S: StringProtocol>(separator: S, every n: Int) {
    for index in indices.every(n: n).dropFirst().reversed() {
        insert(contentsOf: separator, at: index)
    }
}

func inserting<S: StringProtocol>(separator: S, every n: Int) -> Self {
    .init(unfoldSubSequences(limitedTo: n).joined(separator: separator))
}
}

extension Collection {

func unfoldSubSequences(limitedTo maxLength: Int) -> UnfoldSequence<SubSequence,Index> {
    sequence(state: startIndex) { start in
        guard start < endIndex else { return nil }
        let end = index(start, offsetBy: maxLength, limitedBy: endIndex) ?? endIndex
        defer { start = end }
        return self[start..<end]
    }
}

func every(n: Int) -> UnfoldSequence<Element,Index> {
    sequence(state: startIndex) { index in
        guard index < endIndex else { return nil }
        defer { let _ = formIndex(&index, offsetBy: n, limitedBy: endIndex) }
        return self[index]
    }
}

var pairs: [SubSequence] { .init(unfoldSubSequences(limitedTo: 2)) }
}
