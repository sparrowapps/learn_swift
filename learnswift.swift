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
해서 옵셔널 타입으로 변수를 선언 하고 nil을 할당할 수 있도록 한다.
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

standford ituneU 에 예제
함수 performOperation는 인자 double, double 를 받고 리턴 double인 함수를 인자로 받는다.
그러한 함수 multiply를 선언 한다.
case "×": performOperation(multiply) 으로 호출 하여 기능이 구현된다.

    @IBAction func operate(sender: UIButton) {
        let operation = sender.currentTitle!
        if userIsInTheMiddleOfTypingANumber {
            enter()
        }
        switch operation {
        case "×": performOperation(multiply)
//            case "÷":
//            case "+":
//            case "-":
        default: break
        }
    }
    
    func performOperation(operation: (Double, Double) -> Double) {
        if operandStack.count >= 2 {
            displayValue = operation(operandStack.removeLast(), operandStack.removeLast())
            enter()
        }
    }
    
    func multiply(op1: Double, op2: Double) -> Double {
        return op1 * op2
    }



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

/* 주 
새로운 클래스나 구조체는 대문자로 시작하는 소문자 조합으로 클래스나 구조체 이름을 정의하고
프로퍼티나 메서드는 이들의 타입이르므으로 소문자로 시작하는 대소문자 조합으로 일반적을 이름을 정의한다.

클래스와 구조체의 비교
공통점:
값을 저장하기 위한 프로퍼티를 정의 할수 있다.
기능을 제공하기 위한 메서드 를 정의 할수 있다. 
서브스크립트 문법을 사용하여 그들의 값에 접근하는 것을 제공하는 서브스크립트들을 정의 할수 있다. 
기본적인 구현을 넘ㅇ서 그들의 기능을 확장하시키기위한 확장이 가능하다. 
특정 종료의 표준 기능을 제공하는 것으로 프로토콜을 따를 수 있다. 

클래스는 구조체는 할수 없는 다음의 기능을 추가적으로 지원한다. 
상속은 어느 클래스가 다른 클래스의 특성을 상속받을 수 있게 한다.
런타임에 타입을 확인 하고 변화 가능 하다. 
해제 deinit 으로 인스턴스가 할당된 자원을 환원 가능케 한다. 
참조카운팅은 하나의 클래스 인스턴스를 한번 이상 참조 하는 것을 가능하게 한다.
*/

/* 클래스 상속 */
class BankAccount {
    var accountBalance: Float
    var accountNumber: Int
    
    init (number: Int , balance: Float) {
        accountBalance = balance
        accountNumber = number
    }
    
    func displayBalance(){
        println("Number \(accountNumber)")
        println("Current balance is \(accountBalance)")
    }
}

class SavingAccount: BankAccount { //<-- BankAccount 상속
    var interestRate: Float
    
    init(number: Int, balance: Float, rate: Float) { //<-- init 메서드
        interestRate = rate
        super.init(number: number, balance: balance) //<-- 부모 클래스의 init호출
    }
    
    func calculateInterest() -> Float {
        return interestRate * accountBalance
    }
    
    override func displayBalance() {  //<-- 메서드 오버라이딩
        super.displayBalance() //<--부모 클래스의 메서드 호출
        println("Prievailing interest rate is \(interestRate)")
    }
    
}

/* 스위프트 배열*/

/* var 변수이름: [타입] = [값1, 값2, 값3 .....] */
var treeArray = ["sparrow", "iso", "developer"] //타입유추
var treeArray: [String] = ["sparrow", "iso", "developer"] //명시적타입설정

//빈 배열
// var 변수이름 = [타입]()

var nameArray = [String]() // 빈 배열

var nameArray  = [String](count:10, repeatedValue:"sparrow") // 10개의 sparrow로 초기화된 배열

var jobArray = [String](count:10, repeatedValue:"programer")

var namejobArray = nameArray + jobArray // 배열 합치기

var itemCount = nameArray.count // 배열 항목 개수 얻기

if jobArray.isEmpty { // 빈배열 확인
    //배열이 비어 있다.
}

println(nameArray[2]) // 특정인덱스 엑세스

jobArray[2] = "sparrow" //특정인덱스 할당

nameArray.append("sparrowapps") //배열에 항목 추가

nameArray.insert("choijunho", atIndex:2) //삽입

nameArray.removeAtIndex(2) //삭제

nameArray.removeLast() //마지막 삭제

for name in nameArray {
    println(name)
}

/* 스위프트 딕셔너리 
오브젝티브 C의 딕셔너리와 사용방법이 거의 유사하다.
키, 밸류 로 이루어진 쌍의 데이터를 저장하고 관리 할수 있다. 

*/

//var 변수이름: [키타입: 값타입] = [키1, 값1, 키2, 값2 .... ]

var myDictionary = [Int: String]() // 정수형 키와 문자열 값을 저장하는 빈 딕셔너리

var myDictionary = [String: String] = ["int" : "Int",
    "float" : "Float",
    "char" : "Char"      ]

myDictionary.count // 딕셔너리 개수

myDictionary["int"] //딕셔너리 접근

myDictionary["char"] = " sparrow " // 딕셔너리 값변경

//딕셔너리변수[키 = 값 새로운 키-값 추가
myDictionary.removeValueForKey("int") //제거

for (key, value ) in myDictionary {
    println("Key: \(key) Value:\(value)")
}

/* 클래스 구조체 그리고 enum 
차이점
상속 : class only
캐스팅  : class only
vlaue type ( struct, enum ) vs. reference type (class)


choosion which to use ?
struct 는 좀더 기본 타입 일때 
더많은 기능이 필요 하면 class

분리된 데이터에 대해서는 enum을 이용한다

스위프트에서는 struct와 enum이 너무 많은 기능을 가지고 있다.

*/

enum EnumeNormal {
    case A
    case B, C, D
    case E, F
}

var samp = EnumeNormal.A

//type 을가진 enum

enum EnumType: Int {
    case type1  = 0
    case type2, type3, type4
}

//메서드를가진 enum

enum EnumMethod: Int {
    case type1 = 0
    case type2, type3, type4
    
    func str() -> String {
        switch self {
        case .type1:
            return "type1"
        case .type2:
            return "type2"
        case .type3:
            return "type3"
        case .type4:
            return "type4"

        }
    }
}

// 값을 가진 Enum
enum EnumValue {
    case type1(String, String)
    case type2(Int)
}

var samp = EnumValue.type1("sparrow", "developer")

switch samp {
    case .type1(let a, let b):
        println ("\(a) \(b)")
    case .type2(let a):
        println("\(a)")
}

/* Nested Types */
/*
중첩타입
Swift는 중첩을 지원하는 타입의 정의 안에 열거형, 구조체 클래스를 내장 타입으로 사용할 수 있다.

중첩 타입의 ㅈ참조
자신이 정의된 문맥 외부에서 중첩 타입을 사용하려면 자기를 포함하고 있는 타입의 이름을 그 이름 앞에 붙인다. 
*/
struct BlackjackCard {
    // nested Suit enumeration
    enum Suit: Character {
        case Spades = "♠", Hearts = "♡", Diamonds = "♢", Clubs = "♣"
    }
    
    // nested Rank enumeration
    enum Rank: Int {
        case Two = 2, Three, Four, Five, Six, Seven, Eight, Nine, Ten
        case Jack, Queen, King, Ace
        struct Values {
            let first: Int, second: Int?
        }
        var values: Values {
            switch self {
            case .Ace:
                return Values(first: 1, second: 11)
            case .Jack, .Queen, .King:
                return Values(first: 10, second: nil)
            default:
                return Values(first: self.rawValue, second: nil)
            }
        }
    }
    
    // BlackjackCard properties and methods
    let rank: Rank, suit: Suit
    var description: String {
        var output = "suit is \(suit.rawValue),"
        output += " value is \(rank.values.first)"
        if let second = rank.values.second {
            output += " or \(second)"
        }
        return output
    }
}

let heartSymbol = BlackjackCard.Suit.Hearts.rawValue
println("\(heartSymbol)")
/*결과 ♡ */

/*프로토콜*/
//프로토콜은 클래스, 구조체, 열거형 와 매우 비슷한 방법으로 정의한다.클래스
protocol SomeProtocol {
    // 프로토콜 정의
}

//타입을 정의하는 곳에서 타입의 뒤에 콜롤 으로 구분해서 프로토콜의 이름을 써서 프로토콜을 커스텀
//타입에 적용시킨다.클래스
struct SomeStructure: FirstProtocol, SecondProtocol {
// 구조체 정의
}

//클래스가 부모를 가질때는 프로토콜들 앞에 부모 클래스를 명시하고 쉼표로 구분해서 적용한다. 
class SomeClass : SomeSuperClass, FirstProtocol, SecondProtocol {
    // 클래스 정의
}

protocol SomeProtocol {
    var mustBeSettable: Int { get set }
    var doesNotNeedToBeSettable : Int { get }
}

protocol SecondProtocol {
    class var someTypeProperty : Int {
        get set
    }
}














