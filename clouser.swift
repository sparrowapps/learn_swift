#clouser

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
