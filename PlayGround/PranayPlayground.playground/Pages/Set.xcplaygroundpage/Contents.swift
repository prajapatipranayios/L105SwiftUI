
import Combine
import Foundation
import UIKit

// Operations
// - Union
// - intersection
// - subtracting
// - symmetricDifference


let oddNumbers: Set<Int> = [1, 3, 5, 7, 9]
let evenNumbers: Set<Int> = [2, 4, 6, 8]
let primerNumber: Set<Int> = [1, 3, 5, 7]

let unionSet = oddNumbers.union(evenNumbers)
print("union set = \(unionSet)")

let intersection = oddNumbers.intersection(evenNumbers)
print("intersection set = \(intersection)")

let subtraction = oddNumbers.subtracting(primerNumber)
print("subtraction set = \(subtraction)")

let symmetricDifference = primerNumber.symmetricDifference(oddNumbers)
print("symmetricDifference set = \(symmetricDifference)")


// Set membership and equality
// - subset
// - superset
// - equality
// - strict subset
// - strict superset

let isSubSet = primerNumber.isSubset(of: oddNumbers)
print("isSubSet = \(isSubSet)")

let isSuperSet = primerNumber.isSuperset(of: evenNumbers)
print("isSuperSet = \(isSuperSet)")

let isDisjoint = primerNumber.isDisjoint(with: evenNumbers)
print("isDisjoinnt = \(isDisjoint)")

var set1: Set<Double> = [1, 2, 3]
var set2: Set<Double> = [11, 1, 5, 7, 5]

//set2.remove(11)
set2.sorted()
print(set2.sorted())

//set2.subtracting(set1)
set2.subtract(set1)
print(set2)

set1.isSubset(of: set2)
set1.isSuperset(of: <#T##S#>)

set2.symmetricDifference(set1)
print("symmetricDifference  -> ", set2)

if set2.isEmpty {
    print("set2 is empty")
}

if set1 == set2
{
    print("two sets are equal.")
}

let isStrictSuperSet = oddNumbers.isStrictSuperset(of: primerNumber)
print("isStrictSuperSet = \(isStrictSuperSet)")

let isStrictSubSet  = primerNumber.isStrictSubset(of: oddNumbers)
print("isStrictSubSet = \(isStrictSubSet)")
