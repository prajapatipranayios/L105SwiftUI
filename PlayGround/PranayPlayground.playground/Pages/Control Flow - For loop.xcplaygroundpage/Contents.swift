
import Foundation
import UIKit


let colors = ["Orange", "Yellow", "Green", "Red"]

for c in colors
{
    print("c = \(c)")
}

for index in 1..<10
{
    print(index)
}

let airportCodes = ["YUL": "Montreal", "SFO": "San Francisco", "JKF": "New Yourk JFK"]

for (airportCode, airportName) in airportCodes
{
    print("\(airportCode) \(airportName)")
}

for _ in 1...5
{
    print("Hello")
}

for i in stride(from: 0, to: 100, by: 7)
{
    print("i - \(i)")
}

for j in stride(from: 0, through: 100, by: 5)
{
    print("j - \(j)")
}
