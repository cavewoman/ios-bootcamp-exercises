//: Playground - noun: a place where people can play

import UIKit

let numberOfStopLights: Int = 4
var population: Int
population = 30422
let townName: String = "Shermanville"
var unemployment: Int = 10

let townDescription =
"\(townName) has a population of \(population) and \(numberOfStopLights) stoplights and has \(unemployment) unemployeed people."

print(townDescription)

var message: String
var hasPostOffice: Bool = true

if population < 10000 {
    message = "\(population) is a small town!"
} else if population >= 10000 && population < 50000 {
    message = "\(population) is a medium town!"
} else if population >= 50000 && population < 1000000 {
    message = "\(population) is a large town!"
} else {
    message = "\(population) is a metropolis!"
}

print(message)

if !hasPostOffice {
    print("Where do we buy stamps")
}