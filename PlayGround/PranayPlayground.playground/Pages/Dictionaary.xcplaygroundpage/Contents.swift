
import Foundation


var studentIdName: Dictionary<Int, String> = [:]
var zipCodeDistrict: [Int: String] = [:]

zipCodeDistrict = [90001: "Main", 80001: "Downtown"]

// access
studentIdName[1] = "Thomson"
studentIdName[2] = "Jason"
studentIdName[3] = "Jane"

print("studentIdName = \(studentIdName)")
print("zipCodeDistrict = \(zipCodeDistrict)")


// modify
zipCodeDistrict[90001] = "Oakvilla"
print("zipCodeDistrict = \(zipCodeDistrict)")

if let oldValue = zipCodeDistrict.updateValue("Cityville", forKey: 80001)
{
    print("old value has been replaced \(oldValue)")
}
print("zipCodeDistrict = \(zipCodeDistrict)")


// remove

zipCodeDistrict[80001] = nil
print("zipCodeDistrict = \(zipCodeDistrict)")

let oldValue = zipCodeDistrict.removeValue(forKey: 90001)
//print("oldValue = \(oldValue)")

print("zipCodeDistrict = \(zipCodeDistrict)")


// iteration
for (key, value) in studentIdName
{
    print("key = \(key), value = \(value)")
}

for key in studentIdName.keys
{
    print("key = \(key)")
}

for value in studentIdName.values
{
    print("value = \(value)")
}

var key : [Int] = []
       
       for item in studentIdName.keys
       {
           key.append(item)
       }

print(key.sorted())


/// 111 Checking code.
//let values = [65.0, 65.0, 65.0, 55.5, 55.5, 30.25, 30.25, 27.5]
//let frequency = values.frequency
//frequency[65] // 3
//for (key, value) in frequency {
//    print("Element:", key, "count:", value)
//}
//extension Sequence where Element: Hashable {
//    var frequency: [Element: Int] { reduce(into: [:]) { $0[$1, default: 0] += 1 } }
//}
///111



let values: [Double] = [65.0, 65.0, 65.0, 55.5, 55.5, 30.25, 30.25, 27.5]

values.count
print(values.count)

var value : [Double: Int] = [:]

for i in values
{
    let z = value.keys
    if !(z.contains(i))
    {
        value[i] = 1
    }
    else
    {
        var k = value[i] ?? 0
        value[i] = k + 1
    }
}
print("Dictionary --> ", value)

