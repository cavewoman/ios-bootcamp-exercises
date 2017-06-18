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
protocol TabularDataSource {
    var numberOfRows: Int { get }
    var numberOfColumns: Int { get }
    
    func label(forColumn column: Int) -> String
    func itemFor(row: Int, column: Int) -> String
}


func printTable(_ dataSource: TabularDataSource) {
    var firstRow = "|"
    
    var columnWidths = [Int]()
    
    for i in 0 ..< dataSource.numberOfColumns {
        let columnLabel = dataSource.label(forColumn: i)
        let columnHeader = "\(columnLabel) |"
        firstRow += columnHeader
        columnWidths.append(columnLabel.characters.count)
    }
    print(firstRow)
    
    for i in 0 ..<  dataSource.numberOfRows {
        var out = "|"
        for j in 0 ..< dataSource.numberOfColumns {
            let item = dataSource.itemFor(row: i, column: j)
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

struct Department: TabularDataSource, CustomStringConvertible {
    let name: String
    var people = [Person]()
    
    var description: String {
        return "Department \(name)"
    }
    
    init(name: String) {
        self.name = name
    }
    
    mutating func add(_ person: Person) {
        people.append(person)
    }
    
    var numberOfRows: Int {
        return people.count
    }
    
    var numberOfColumns: Int {
        return 3
    }
    
    func label(forColumn column: Int) -> String {
        switch column {
        case 0: return "Employee Name"
        case 1: return "Age"
        case 2: return "Years of Experience"
        default: fatalError("Invalid column!")
        }
    }
    
    func itemFor(row: Int, column: Int) -> String {
        let person = people[row]
        switch column {
        case 0: return person.name
        case 1: return String(person.age)
        case 2: return String(person.yearsOfExperience)
        default: fatalError("Invalid column!")
        }
    }
}

var department = Department(name: "Engineering")
department.add(Person(name: "Joe", age: 30, yearsOfExperience: 6))
department.add(Person(name: "Karen", age: 40, yearsOfExperience: 18))
department.add(Person(name: "Fred", age: 50, yearsOfExperience: 20))

printTable(department)
print(department)
