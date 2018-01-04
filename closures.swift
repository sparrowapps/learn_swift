#Closures

import UIKit

let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
func backwards(s1: String, _ s2: String) -> Bool {
    return s1 > s2
}

var reversed = names.sort(backwards)

print(reversed)


reversed = names.sort({ (s1: String, s2: String) -> Bool in
    return s1 > s2
})

print(reversed)

reversed = names.sort( { $0 > $1 } )
print(reversed)

reversed = names.sort(>)
print(reversed)


/*
 { (parameters) -> return type in
 statements
 }
 
 */

// map example
let digitNames = [
    0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let numbers = [16, 58, 510]

let strings = numbers.map {
    (number) -> String in
    var number = number
    var output = ""
    while number > 0 {
        output = digitNames[number % 10]! + output
        number /= 10
    }
    return output
}

print(strings)


// filter example
let prices = [12.0, 15.2, 30.1, 55,2]
var priceOver20  = prices.filter {
    (price:Double) -> Bool in
        price>20
}

print (priceOver20)
