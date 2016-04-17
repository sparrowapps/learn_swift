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