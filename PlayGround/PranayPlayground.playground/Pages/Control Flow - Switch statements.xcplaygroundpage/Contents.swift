
import Foundation


var tempInC  = -10

//while tempInC < 40
//{
//    switch tempInC {
//    case ..<0:
//        print("It's really cold today!  \(tempInC) C")
//    case 0..<20:
//        print("It's little warmer today!  \(tempInC) C")
//    default:
//        print("It's very warme  \(tempInC) C")
//    }
//    tempInC += 3
//}



//let character: Character = "a"
//
//switch character {
//case "a":
//    print("Character is in latin alphabet character \(character)")
//case "B":
//    print("Character is upper case latin letter \(character)")
//default:
//    print("any other character")
//}



// tuple : (0, 0)
let coordinate = (-2, 0)

//switch coordinate {
//case (0, 0):
//    print("the coordinate origin point")
//case (_, 0):
//    print("the coordinate is on x axis")
//case (0, _):
//    print("the coordinate is on y axis")
//default:
//    print("any other coordinate ")
//}




// value binding
//switch coordinate {
//case (0, 0):
//    print("the coordinate origin point")
//case (let x, 0):
//    print("the coordinate is on x axis with coordinate: \(x)")
//case (0, let y):
//    print("the coordinate is on y axis: \(y)")
//default:
//    print("any other coordinate ")
//}



// where clause
//switch coordinate {
//case (let x, let y) where x > y:
//    print("x > y")
//case (let x, let y) where x < y:
//    print("x < y")
//default:
//    print("any other coordinate ")
//}





// compound cases
//let char: Character = "a"
//
//switch char {
//case "a", "A", "c", "C":
//    break
//case "B", "b":
//    print("letter b")
//default:
//    print("any other character")
//}





// fallthrough
let char: Character = "a"

switch char {
case "a", "A", "c", "C":
    print("character matched")
    fallthrough
case "B", "b":
    print("letter \(char)")
default:
    print("any other character")
}
