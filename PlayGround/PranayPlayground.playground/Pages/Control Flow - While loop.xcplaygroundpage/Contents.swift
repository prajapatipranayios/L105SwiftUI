
import Foundation
import UIKit



var randomNumber = 2

while (randomNumber % 2 == 0)
{
    randomNumber = Int.random(in: 0...100)
    print("randomNumber = \(randomNumber)")
}


var index = 0

while (index < 10)
{
    index += 1 
    print("index = \(index)")
}

