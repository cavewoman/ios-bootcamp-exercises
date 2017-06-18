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
func printTable(_ data: [[String]], withColumnLabels columnLabels: String...) {
    var firstRow = "|"
    
    var columnWidths = [Int]()
    
    for columnLabel in columnLabels {
        let columnHeader = "\(columnLabel) |"
        firstRow += columnHeader
        columnWidths.append(columnLabel.characters.count)
    }
    print(firstRow)
    
    for row in data {
        var out = "|"
        for (j, item) in row.enumerated() {
            let paddingNeeded = columnWidths[j] - item.characters.count
            let padding = repeatElement(" ", count: paddingNeeded).joined(separator: "")
            out += "\(padding)\(item) |"
        }
        
        print(out)
    }
}

struct Person {
    let name: String
    let age: Int
    let yearsOfExperience: Int
}

struct Department {
    let name: String
    var people = [Person]()
    
    init(name: String) {
        self.name = name
    }
    
    mutating func add(_ person: Person) {
        people.append(person)
    }
}

var department = Department(name: "Engineering")
department.add(Person(name: "Joe", age: 30, yearsOfExperience: 6))
department.add(Person(name: "Karen", age: 40, yearsOfExperience: 18))
department.add(Person(name: "Fred", age: 50, yearsOfExperience: 20))

