--- 
title: C++ const_cast
date: 2024-02-05 04:26:11 +0900 
categories:
  - C++
tags: 
  - [cpp]
--- 

## const_cast

## 문법

> const_cast< target-type>(expression)

## 용어

1. cv-qualification: 참조 타입과 함수 타입이 아니면서 다음을 포함하는 그룹입니다.
    - const
    - volatile

## 설명

1. 두 유사한 타입의 prvalue가 cv-qualification이 다른 경우 변환합니다.

2. 한 타입에서 명시적으로 다른 타입의 포인터로 변환 할 수 있으면 다음도 가능합니다.
    - 변환할 타입의 lvalue는 변환될 타입의 lvalue로 변환할 수 있습니다.
    - 변환할 타입의 glvalue는 변환될 타입의 xvalue로 변환할 수 있습니다.
    - 변환할 타입이 클래스 타입인 경우 해당 타입의 prvalue는 변환된 타입의 xvalue로 변환할 수 있습니다.

## 예제

```c++
#include <iostream>
 
struct type {
    int i;
 
    type(): i(3) {}
 
    void f(int v) const {
        // this->i = v;                 // 컴파일 에러. 객체는 상수 포인터
        const_cast<type*>(this)->i = v; // 객체는 상수가 아니기 때문에 가능
    }
};
 
int main() {
    int i = 3;                 // i는 상수로 선언되지않음
    const int& rci = i;
    const_cast<int&>(rci) = 4; // 허용: i 수정
    std::cout << "i = " << i << '\n';
 
    type t; // 상수 타입 t가 아니였을 경우 t.f(4)는 정의되지 않은 행동
    t.f(4);
    std::cout << "type::i = " << t.i << '\n';
 
    const int j = 3; // j는 상수로 선언됨
    [[maybe_unused]]
    int* pj = const_cast<int*>(&j);
    // *pj = 4;      // 정의되지 않은 행동
 
    [[maybe_unused]]
    void (type::* pmf)(int) const = &type::f; // 멤버 함수의 포인터로
    // const_cast<void(type::*)(int)>(pmf);   // 컴파일 에러: const_cast는 함수 포인터로 작동하지않음
}
```
