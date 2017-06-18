//: Playground - noun: a place where people can play

import UIKit

var bucketList = ["Climb Mt. Everest"]
var newItems = ["Fly hot air balloon to Fiji",
                "Watch the Lord of The Rings Trilogy in one day",
                "Go on a walkabout",
                "Scuba dive in the Great Blue Hole",
                "Find a triple rainbow"]
bucketList += newItems
bucketList.remove(at: 2)
bucketList
print(bucketList.count)
print(bucketList[0...2])
bucketList[2] += " in Austrailia"
bucketList
bucketList[0] = "Climb Mt. Kilimanjaro"
bucketList.insert("Toboggan across Alaska", at: 2)
bucketList

var myronsList = ["Climb Mt. Kilimanjaro",
                  "Fly hot air balloon to Fiji",
                  "Toboggan across Alaska",
                  "Go on a walkabout in Austrailia",
                  "Scuba dive in the Great Blue Hole",
                  "Find a triple rainbow"
                  ]

let equal = (bucketList == myronsList)

// Immutable Arrays
let lunches = [
                "Cheeseburger",
                "Veggie Pizza",
                "Chicken Caesar Salad",
                "Black Bean Burrito",
                "Falafel Wrap"
            ]

var toDoList = ["Take out garbage", "Pay bills", "Cross off finished items"]
toDoList.isEmpty

var reverseToDo: Array<String> = []
for todo in toDoList {
    reverseToDo.insert(todo, at: 0)
}
print(reverseToDo)

var indexOfBalloon = bucketList.index(of: "Fly hot air balloon to Fiji")
if var balloon = Int?(indexOfBalloon!) {
    balloon += 2
}
