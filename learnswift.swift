// 스위프트 언어에만 있는 특징 적인 것만을 기술 한다.

/*
1. 스위프트 옵셔널 타입
선언 시에 ?
참조 할때 !
새로운 상수를 만들어 할당 하고 상수로 참조
암묵적인 언래핑을 위해 선언시 !

*/
import UIKit

var index: Int?

index = 3

var treeArray = ["ok", "pine", "Yew", "Brich"]


if let myValue = index {
    println(treeArray[myValue])
    
}else {
    println("index does not contain a value")
}

/*
2. 스위프트튜플
let myTuple = (10, 11.33, "string")

*/

var myString = myTuple.2

// 모두 추출
let (myInt, myFloat, myString) = myTuple

// 무시

var ( myInt, _, myString) = myTuple

let myTuple = ( count: 10, length : 11.33, message : "string" )

println (myTuple.message)


/*
3. 범위 연산자
x ... y

x에서 시작하여 y로 끝나는 범위

x ... <y
x로부터 y가 포함되지 않는 모든 숫자


*/
var x =  10
for index in 1 ... 20 {
    let y = index * x --
}
