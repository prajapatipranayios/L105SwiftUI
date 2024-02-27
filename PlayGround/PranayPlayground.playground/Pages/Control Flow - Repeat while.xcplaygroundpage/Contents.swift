
import Foundation


var index = 0

repeat
{
    index += 1
    print("index = \(index)")
    
    if index >= 10
    {
        break
    }
} while(index < 20)

print("the end")
