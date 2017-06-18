//: Playground - noun: a place where people can play

import UIKit

var groceryBag: Set = ["Apples", "Oranges", "Pineapple"]

for food in groceryBag {
    print(food)
}

let hasBananas = groceryBag.contains("Bananas")

let friendsGroceryBag = Set(["Bananas", "Cereal","Milk", "Oranges"])
let commonGroceryBag = groceryBag.union(friendsGroceryBag)

let roomatesGroceryBag = Set(["Apples", "Bananas", "Cereal", "Toothpaste"])
let itemsToReturn = commonGroceryBag.intersection(roomatesGroceryBag)

let yourSecondBag = Set(["Berries", "Yogurt"])
let roommatesSecondBag = Set(["Grapes", "Honey"])
let disjoint = yourSecondBag.isDisjoint(with: roommatesSecondBag)

let myCities = Set(["Atlanta", "Chicago", "Jacksonville", "New York", "San Francsico"])
let yourCitites = Set(["Chicago", "San Francsico", "Jacksonville"])

myCities.isSuperset(of: yourCitites)