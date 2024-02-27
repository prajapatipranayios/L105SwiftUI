
import Foundation
import Combine

//protocol Subscriber {
//    associatedtype Input
//    associatedtype Failure: Error
//    
//    func receive(subscription: Subscription)
//}


func addTwoNumbers(a: Int, b: Int) -> Int
{
    a + b
}

let justPublisher = Just(addTwoNumbers(a: 1, b: 2))

//let justScbscriber = Subscribers.Sink<Int, Never> {
//    completion in
//    print(completion)
//} receiveValue: { valueFromPublisher in
//    print("value = \(valueFromPublisher)")
//}
//
//let justScbscriber1 = Subscribers.Sink<Int, Never> {
//    completion in
//    print("justScbscriber1 = ", completion)
//} receiveValue: { valueFromPublisher in
//    print("justScbscriber1 value = \(valueFromPublisher)")
//}
//
//justPublisher.subscribe(justScbscriber)
//justPublisher.subscribe(justScbscriber1)
