//: [Previous](@previous)

import Foundation
import UIKit

let alertController = UIAlertController(title: "", message: "", preferredStyle: .alert)
let OKAction = UIAlertAction(title: "OK", style: .default) { action in
}
let cancelAction = UIAlertAction(title: "Cancel", style: .default) { action in
}
alertController.addAction(OKAction)
alertController.addAction(cancelAction)
self.present(alertController, animated: true, completion: nil)


//let alertController = UIAlertController(title: "", message: "", preferredStyle: .alert)
//let OKAction = UIAlertAction(title: "OK", style: .default) { action in
//}
//alertController.addAction(OKAction)
//self.present(alertController, animated: true, completion: nil)


//: [Next](@next)
