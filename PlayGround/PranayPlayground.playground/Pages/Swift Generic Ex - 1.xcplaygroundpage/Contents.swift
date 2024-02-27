//: [Previous](@previous)

import Foundation

/*// create a generic function
func displayData<T>(data: T) {
    print("Generic Function:")
    print("Data Passed:", data)
}

// generic function working with String
displayData(data: "Swift")

// generic function working with Int
displayData(data: [5, 4, 3, 1])     /// */


///---------------------------------------

/*// create a generic class
class Information<T> {
    // prperty of T type
    var data: T
    
    init(data: T) {
        self.data = data
    }
    
    // mthod that return T type variable
    func getData() -> T {
        return self.data
    }
}

// initialize generic class with Int data
var intObj = Information(data: 6)
print("Generic class returns:", intObj.getData())

// initialize generic class with String data
var strObj = Information(data: "This is 'Swift' Generic func")
print("Generic class returns:", strObj.getData())       /// */


///---------------------------------------

/*//create a generic function with type constraint
//Note: Numeric is the built-in protocol for numeric values like Int and Double.
func addition<T: Numeric>(num1: T, num2: T) {
    print("Sum:", num1 + num2)
}

// pass Int value
addition(num1: 5, num2: 10)

// pass Double value
addition(num1: 5.5, num2: 10.8)     /// */

///---------------------------------------

/*//Swaping value with
func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
    let tempA = a
    a = b
    b = tempA
}

//var value1 = 30
//var value2 = 10

var value1 = "'First One'"
var value2 = "'Second Two'"

print("Before swap -- Value 1 is - \(value1), and Value 2 is - \(value2)")
swapTwoValues(&value1, &value2)
print("After swap Value 1 is - \(value1), and Value 2 is - \(value2)")      /// */

///---------------------------------------

/*struct Stack<T> {
    var items: [T] = []
    mutating func push(_ item: T) {
        items.append(item)
    }
    
    mutating func pop() -> T {
        return items.removeLast()
    }
}

extension Stack {
    var topItem: T? {
        return items.isEmpty ? nil : items[items.count - 1]
    }
}

var stackOfStrings = Stack<String>()
stackOfStrings.push("uno")
stackOfStrings.push("dos")
stackOfStrings.push("tres")
stackOfStrings.push("cuatro")

print(stackOfStrings.items)
print()

var stackOfInt = Stack<Int>()
stackOfInt.push(12)
stackOfInt.push(24)
stackOfInt.push(421)
stackOfInt.push(438)

print(stackOfInt.items)
stackOfInt.pop()
print(stackOfInt.items)
stackOfInt.pop()
print(stackOfInt.items)
stackOfInt.pop()
print(stackOfInt.items)
//stackOfInt.pop()

print()
if let topItem1 = stackOfStrings.topItem {
    print("The top item on the stack is \(topItem1).")
}
print()
if let topItem2 = stackOfInt.topItem {
    print("The top item on the stack is \(topItem2).")
}       /// */

///---------------------------------------

/*func findIndex<T: Equatable>(of valueToFind: T, in array: [T]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}

//let doubleIndex = findIndex(of: 9.1, in: [3.14159, 0.1, 0.25])
//// doubleIndex is an optional Int with no value, because 9.3 isn't in the array
//let stringIndex = findIndex(of: "Andrea", in: ["Mike", "Malcolm", "Andrea"])
//// stringIndex is an optional Int containing a value of 2
//print()
//print("Int index from array", doubleIndex!)
//print()
//print("String index from array", stringIndex!)

let strings = ["cat", "dog", "llama", "parakeet", "terrapin"]
if let foundIndex = findIndex(of: "parakeet", in: strings) {
    print("The index of llama is \(foundIndex)")
}       /// */

///---------------------------------------

protocol Container {
    associatedtype Item: Equatable
    mutating func append(_ item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item { get }
}

struct IntStack<Element>: Container {
    mutating func append(_ item: Int) {
        
    }
    
    subscript(i: Int) -> Int {
        
    }
    
    //original IntStack implementation
    var items: [Element] = []
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
    // conformance to the Container protocol
    typealias Item = Int
    mutating func append(_ item: Element) {
        self.push(item)
    }
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> Element {
        return items[i]
    }
}
















//: [Next](@next)
