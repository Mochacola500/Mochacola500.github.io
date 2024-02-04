--- 
title: C++ Values
date: 2024-02-05 02:22:21 +0900 
categories: 
  - C++
tags: 
  - [cpp]
--- 

# Values

## 용어
1. identity: 값이 식별성을 가질 경우 "identity를 가진다"라고 표현합니다.
2. move: 값이 메모리에서 이동될 수 있는 경우 "`move`될 수 있다"라고 표현합니다.

## 목차

|                 | move 가능| move 불가능|         |
|---|---|---|---|
| identity 보유   | xvalue   | lvalue     | glvalue |
| identity 미보유 | prvalue  |            |         |
|                 | rvalue   |            |         |

Primary category
- lvalue: `identity`를 가지면서 `move`될 수 없는 표현식
- xvalue: `identity`를 가지면서 `move`될 수 있는 표현식
- prvalue: `identity`가 없으면서 `move`될 수 있는 표현식

Mixed category
- glvalue: `identity`가 있는 모든 표현식 (lvalue, xvalue)
- rvalue: `move`될 수 있는 모든 표현식 (prvalue, xvalue)

## lvalue

모든 변수, 함수, 전위증감자, lvalue 참조, 문자열 등은 lvaue 입니다.

```c++
#include <iostream>
static int gv = 0;
int& foo() {
  return gv;
}

int main() {
  int a = 10;
  int* pa = &a; 
  gv() = 1;
  int* pgv = &gv();
}
```

특징
- 대입문의 좌측에 올 수 있습니다.
- 주소를 얻어올 수 있습니다.(identity가 있으므로)
- 표현식이 끝나도 사라지지 않습니다.

## xvalue

prvalue의 임시 데이터 객체를 xvalue라고 합니다. 

특징
- 컴파일러만 사용하는 객체이므로 주소를 얻을 수 없습니다.
- 표현식이 끝나면 사라집니다.

## prvalue

prvalue는 xvalue가 아닌 rvalue 입니다.

prvalue는 대입문 오른쪽에 올 수 있으며 주소가 없습니다.(정확히는 xvalue 형태로 존재하지만 컴파일러만 사용하는 객체이므로 주소를 얻을 수 없습니다)

```c++
int a = 10;
int b = 10;
if (a < b) { // a < b의 결과값은 prvalue
}
```

특징
- 대입문의 우측에 올 수 있습니다.
- 주소가 없습니다.

## glvalue

glvalue는 lvalue 또는 xvalue를 말합니다.

데이터가 저장된 메모리 주소를 가집니다.

## rvalue

rvalue는 xvalue 도는 prvalue를 말합니다.

우측에 나타낼 수있으며 이동될 수 있습니다.
