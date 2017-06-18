//: Playground - noun: a place where people can play

import UIKit

func calcMonthlyPaymentFor(value: Double,
                        term: Double = 60,
                        rate: Double = 0.029) -> Double {
    guard rate > 0 else { return 0 }
    
    let rton = pow(1 + rate, term)
    let amount = value * ((rate * rton) / (rton - 1))
    return amount
}

calcMonthlyPaymentFor(value: 20_000)

func printGreeting() {
    print("Hello, playground")
}

printGreeting()

func printPersonalGreeting(to name: String) {
    print("Hello \(name), welcome to your playgound")
}

printPersonalGreeting(to: "Anna")

func divisionDescriptionFor(numerator: Double, denomiator: Double, withPunctuation punctuation: String = ".") -> String {
    return "\(numerator) divided by \(denomiator) equals \(numerator/denomiator)\(punctuation)"
}
print(divisionDescriptionFor(numerator: 9.0, denomiator: 3.0))
print(divisionDescriptionFor(numerator: 9.0, denomiator: 3.0, withPunctuation: "!"))


func printPersonalGreetings(to names: String...) {
    for name in names {
        print("Hello \(name), welcome to the playgound.")
    }
}

printPersonalGreetings(to: "Alex", "Chris", "Drew", "Pat")

var error = "The request failed:"
func appendErrorCode(_ code: Int, toErrorString errorString: inout String) {
    if code == 400 {
        errorString += " bad request"
    }
}
appendErrorCode(400, toErrorString: &error)
error


func areaOfTriangleWith(base: Double, height: Double) -> Double {
    let numerator = base * height
    func divide() -> Double {
        return numerator / 2
    }
    return divide()
}

areaOfTriangleWith(base: 3.0, height: 5.0)

func sortedEvenOddNumbers(_ numbers: [Int]) -> (evens: [Int], odds: [Int]) {
    var evens = [Int]()
    var odds = [Int]()
    for number in numbers {
        if (number % 2 == 0) {
            evens.append(number)
        } else {
            odds.append(number)
        }
    }
    return (evens, odds)
}
let aBunchOfNumbers = [10, 1,4,3,57,43,84,27,156,111]
let theSortedNumbers = sortedEvenOddNumbers(aBunchOfNumbers)
print("The even numbers are: \(theSortedNumbers.evens) the odd numbers are: \(theSortedNumbers.odds)")

func grabMiddleName(fromFullName name: (String, String?, String)) -> String? {
    return name.1
}
let middleName = grabMiddleName(fromFullName: ("Anna", nil, "Sherman"))
if let theName = middleName {
    print(theName)
}

func greetByMiddleName(fromFullName name: (first: String, middle: String?, last: String)) {
    guard let middleName = name.middle, (name.middle?.characters.count)! > 4 else {
        print("Hey there!")
        return
    }
    print("Hey \(middleName)")
}
greetByMiddleName(fromFullName: ("Anna", "Hope", "Sherman"))

func siftBeans(fromGroceryList list: [String]) -> (beans: [String], otherGroceries: [String]) {
    var beans = [String]()
    var other = [String]()
    for item in list {
        if (item.contains("beans")) {
            beans.append(item)
        } else {
            other.append(item)
        }
    }
    return (beans, other)
}

let result = siftBeans(fromGroceryList: ["green beans", "milk", "black beans", "pinto beans", "apple"])
result.beans
result.otherGroceries

