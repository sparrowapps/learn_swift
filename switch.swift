#switch

switch some value to consider {
case value 1:
    respond to value 1
case value 2,
value 3:
    respond to value 2 or 3
default:
    otherwise, do something else
}

swift switch case에서는 기본적으로  break를 쓰지 않는다.
case에서만 수행될뿐이다.

그럼 C/C++ 처럼 여러 경우를 모두 처리 하는 코드를 수행 할땐?

case .enum1, .enum2, .enum3:
이런식으로 코마로 나열 하면 된다.
