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

스위프트는 타입에 대한 안전한 언어 이기 때문에
일반 적인 변수는 nil을 할당 할수 조차 없다.

하지만 어떠한 함수에서 nil을 리턴 할수 도 있다.
해서 옵셔널 타입으로 변수를 선언 하고 nil을 할당 할수 잇도록 한다.
이러한 변수의 값이 nil인 경우와 아닌경우를 구분하여 처리 해야 하는 코드를 swift에서는

var strNum: String? = "1234"

if let num = strNum { // <--- unwrapping (옵셔널 변수 풀기)
var n = num.toInt()  // strNum.toInt() 는 사용할수 없음 (옵셔널 변수는 nill일수 있기 때문)
println (n)
} else {
println("nil")
}


선언 시에 ?
참조 할때 ! (unwrapping )
새로운 상수를 만들어 할당 하고 상수로 참조 (unwrapping)
암묵적인 언래핑을 위해 선언시 ! : 이러한 경우는 언제 사용하는지 모르겠음 안전성이 사라짐

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

func hello() {
    println("hello")
}

hello()

func makeMessage(name: String, old: Int) -> String {
    return("\(name), you are old \(old)")
}

var message = makeMessage("sparrow", 29)

func makeMessage(#name: String, #old: Int) -> String {
    return("\(name), you are old \(old)")
}

var message = makeMessage(name: "Sparrow", old: 29)

func makeMessage(YourName name: String, YourAge old: Int) -> String {
    return("\(name), you are old \(old)")
}

var message = makeMessage(YourName: "sparrow", YourAge: 29)

// tuple return

func lengthConverter ( #cm_length: Float ) -> (inchs: Float, yards: Float , ft: Float ) {
    var inch = cm_length * 0.393701
    var yards = cm_length * 0.010936
    var ft = cm_length * 0.032808
    
    return (inch, yards, ft)
}

var lengthTuple = lengthConverter(cm_length: 20)
println(lengthTuple.inch)
println(lengthTuple.yards)
println(lengthTuple.ft)


func displayStrings (strings: String...) {
    for string in strings {
        println (string)
    }
}

displayStrings("one", "two", "three", "four")


//매개 변수가상수가 아니라변수인경우

func calculateArea ( var length: Float, var width: Float ) -> Float {
    length = length * 2.54
    width = width * 2.54
    return length * width
}

println(calculateArea(20,20))

//inout 매개변수
var myValue = 20
func sqrtValue (inout value: Int) -> Int {
    value *= value
    return (value)
}

println(" sqrt \(sqrtValue(&myValue))")
/* sqrt400 */
println(myValue)
/* 400 */


//함수 포인터와 비슷한 함수 매개 변수

func inchesToFeet ( inches: Float ) -> Float {
    return inches * 0.0833333
}

let toFeet = inchesToFeet

var result = toFeet(20)


func inchesToFeet ( inches: Float ) -> Float {
    return inches * 0.0833333
}

func inchesToYards ( inches: Float ) -> Float {
    return inches * 0.0277778
}

let toFeet = inchesToFeet
let toYards = inchesToYards

func outputConversion(converterFunc: (Float) -> Float, value:Float ) {
    var result = converterFunc(value)
    println ("Result of conversion is \(result)")
}

outputConversion(toFeet,10)
outputConversion(toYards,20)


//함수가 반환되는 함수
func decideFunction (feet: Bool) -> (Float) -> Float {
    if  feet {
        return toFeet
    } else {
        return toYards
    }
}

// closure , closure expression
// 독립적 코드 블럭

let sayHello = { println("hello") }
sayHello()

let multiply = {(value1:  Int, value2: Int) -> Int in
    return value1 * value2
}

let result = multiply( 10, 20)

/* 스위프트 클래스 */

class Rectangle {
    var width: Float = 0 //속성
    var height: Float = 0
    
    func displayRectangle() { // 인스턴스 메서드
        println("width \(width)")
        println("height \(height)")
    }
    
    class func getMaxHeigh() -> Float { //타입 메서드 (c++ static 함수 , objective-C + 메서드
        return 1000.00
    }
    
}

var rect: Rectangle = Rectangle() //클래스 인스턴스 생성


// init 메서드
class Rectangle {
    var width: Float = 0 //속성
    var height: Float = 0
    
    init(widthvalue: Float, heightvalue: Float) { //초기화  init 메서드
        width = widthvalue
        height = heightvalue
    }
    
    func displayRectangle() { // 인스턴스 메서드
        println("width \(width)")
        println("height \(height)")
    }
    
    class func getMaxHeigh() -> Float { //타입 메서드 (c++ static 함수 , objective-C + 메서드
        return 1000.00
    }
    
}

var rect = Rectangle(widthvalue: 20, heightvalue: 20)


//속성 접근 메서드 호출
class Rectangle {
    var width: Float = 0 //속성
    var height: Float = 0
    
    init(widthvalue: Float, heightvalue: Float) { //초기화  init 메서드
        width = widthvalue
        height = heightvalue
    }
    
    deinit {
        //정리 코드
    }
    
    func displayRectangle() { // 인스턴스 메서드
        println("Width is \(width)")
        println("Height is \(height)")
    }
    
    class func getMaxHeigh() -> Float { //타입 메서드 (c++ static 함수 , objective-C + 메서드
        return 1000.00
    }
    
}

var rect = Rectangle(widthvalue: 20, heightvalue: 20)

//도트 표기법으로 얻기
var width = rect.width
var height = rect.height

//도트 표기법으로 설정
rect.width = 30
rect.height = 40

rect.displayRectangle() // 인스턴스 메서드 호출
Rectangle.getMaxHeigh() // 타입 메서드 호출



// getter, setter 계산된 속성
//: Playground - noun: a place where people can play

import UIKit

class Rectangle {
    var width: Float = 0 //속성
    var height: Float = 0
    
    var areasize : Float { // 넓이 계산된 속성
        get {
            return width * height
        }
        
        set(newsize) {
            // x * x = newsize
            width = sqrt(newsize)
            height = sqrt(newsize)
            
        }
    }
    
    init(widthvalue: Float, heightvalue: Float) { //초기화  init 메서드
        width = widthvalue
        height = heightvalue
    }
    
    deinit {
        //정리 코드
    }
    
    func displayRectangle() { // 인스턴스 메서드
        println("Width is \(width)")
        println("Height is \(height)")
    }
    
    class func getMaxHeigh() -> Float { //타입 메서드 (c++ static 함수 , objective-C + 메서드
        return 1000.00
    }
    
}

var rect = Rectangle(widthvalue: 20, heightvalue: 20)


rect.areasize = 100; // 넓이를 세팅 하면 width, height 설정된다.
println(rect.height)
println(rect.width)













