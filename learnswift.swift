/* 
스위프트 언어에만 있는 특징 적인 것만을 기술 한다.

이 문서는 기존에 C언어 , C++언어, 그리고 Objective-C 언어를 사용할줄 아는 사람이 간단하게
스위프트언어의 차이점이나 특징만을 잡아서 쉽게 익히도록 차이점만을 기술 한다.

Created by sparrow on 2015. 4. 19..
Copyright (c) 2015년 sparrowapps. All rights reserved.

*/






/*
변수 선언
var

상수 선언
let

문장의 종료;생략

if,for 문 괄호 하지 않는다.

문자열의 변수 출력 \(변수)
"value is \(i)"


*/


/*
스위프트 옵셔널 타입
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
스위프트튜플
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
범위 연산자
x ... y

x에서 시작하여 y로 끝나는 범위

x ... <y
x로부터 y가 포함되지 않는 모든 숫자


*/
var x =  10
for index in 1 ... 20 {
    let y = index * x--
}


/* 
반복문, 제어문
for 범위 연산자
for in 사용
do ~ while, while은 c/c++ object-c와 유사
if c/c++,object-c와 유사
*/


import UIKit

for index in 1 ... 5 {
    println("Value of index is \(index)")
}

/*
Value of index is 1
Value of index is 2
Value of index is 3
Value of index is 4
Value of index is 5
*/


for char in "sparrow is ios developer" {
    println(char)
}
/*
s
p
a
r
r
o
w

i
s

i
o
s

d
e
v
e
l
o
p
e
r

*/


var count = 0

for _ in "sparrow" {
    ++count
}
/*
7
*/



/* 
switch
범위 연산자를 사용할수 있다.
where 구문을 이용하여 부가적인 조건을 추가 할 수 있다. 
break가 없어도 해당 case이후에 수행 하지 않는다. 
기타 다른 언어 처럼 break가 없을 경우 아래에 case를 수행하기 위해서는 fallthrough를 이용한다.
*/

var temperature = 83
switch ( temperature )
{
    case 0...49:
        println ("cold")
    
    case 50...79:
        println ("Warm")
    
    case 80...110:
        println ("Hot")
    
    default:
        println ("temperature out of range")
}

var temperature = 54
switch ( temperature )
{
case 0...49 where temperature % 2 == 0:
    println ("cold")
    
case 50...79 where temperature % 2 == 0:
    println ("Warm")
    
case 80...110 where temperature % 2 == 0:
    println ("Hot")
    
default:
    println ("temperature out of range")
}

/* 함수 */

/*
func <함수명> (<매개변수명>: <매개변수타입>, <매개변수명>: <매개변수타입>, <매개변수명>: <매개변수타입>, ... ) -> <반환값 타입> {
    // 함수 코드
}
*/





