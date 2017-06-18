//: Playground - noun: a place where people can play

import UIKit

var dict1: Dictionary<String, Double> = [:]
var dict2: [String:Int] = [:]
var dict3 = [String:Int]()

var movieRatings = ["Donnie Darko": 4, "Chungking Express": 5, "Dark City": 4]

print("I have rated \(movieRatings.count) movies")
let darkoRating = movieRatings["Donnie Darko"]
movieRatings["Dark City"] = 5
movieRatings

let oldRating: Int? = movieRatings.updateValue(5, forKey: "Donnie Darko")
movieRatings["The Cabinet of Dr. Caligari"] = 5
//movieRatings.removeValue(forKey: "Dark City")
movieRatings["Dark City"] = nil

movieRatings

for (key, value) in movieRatings {
    print("The movie \(key) was rated \(value)")
}

for movie in movieRatings.keys {
    print("User has rated movie \(movie)")
}


let album = ["Diet Roast Beef": 268,
            "Dubba Dubbs Stubs His Toe": 467,
            "Smokey's Carpet Cleaning Service": 187,
            "Track 4": 221]

let watchedMovies = Array(movieRatings.keys)

var countyZips = ["Happy": [35426, 95643, 76583, 95673], "Sleepy": [43567, 23575, 86453], "Doc": [34567,21679,654567]]
var sentence = "Georgia has the following zips codes: ["
var numInRow: Int? = nil
for (county, zips) in countyZips {
    let numOfSpaces = sentence.characters.count
    for zip in zips {
        if let num = numInRow {
            if numInRow == 0 {
                
            }
        } else {
            numInRow = 1
        }
    }
}
print(sentence)
