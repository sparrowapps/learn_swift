// operator, operand, assignment

// 타입엘리어스

typealias NameType = String
typealias IdType = UInt32

var customerId :IdType
var customerName :NameType


// 튜풀

var x = 5
var y = 4

var point = (7,8)

var point: (Int, Int)
point = (7,8)


var pbook  = ("junho", "123-1234-1234")
let (name, num) = pbook

//튜풀 값 가져 오기
var pbook  = ("junho", "123-1234-1234")
let (name, num) = pbook

print(name)
print(num)
// 결과는 아래와 같다.
//"junho\n"
//"123-1234-1234\n"


//연산자
//기본적으로 C언어와 유사하다.
// 범위 연산자 
// a...b a부터 b까지 a와 b를 포함한 범위
// a..<b a부터 b까지 b를 포함하지 않는다.
