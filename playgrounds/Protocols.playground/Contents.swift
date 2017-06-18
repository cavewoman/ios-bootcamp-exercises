//: Playground - noun: a place where people can play

import UIKit

//lecture notes Protocol
protocol Describable {
    func description() -> String
}

class Customer: Describable {
    var identifier = 12
    var name = "Acme"
    
    func description() -> String {
        return "id: \(identifier) - name: \(name)"
    }
}

class Product: Describable {
    var title = "Awesome Thing"
    
    func description() -> String {
        return "\(title)"
    }
}

let c = Customer()
let p = Product()

func printObject(d: Describable) {
    print(d.description())
}

printObject(d: c)
printObject(d: p)

class Customer2: CustomStringConvertible {
    var identifier = 12
    var name = "Acme"
    
    var description: String {
        return "id: \(identifier) - name: \(name)"
    }
}

class Product2: CustomStringConvertible {
    var title = "Awesome Thing"
    
    var description: String {
        return "\(title)"
    }
}

// Examples from Book (Chapter 19 Protocols)
func printTable(_ data: [[String]]) {
    for row in data {
        var out = "|"
        for item in row {
            out += "\(item) |"
        }
        
        print(out)
    }
}


let data = [
    ["Joe", "30", "6"],
    ["Karen", "40", "18"],
    ["Fred", "50", "20"]
]
printTable(data)