--- 
title: 상등성과 동등성
date: 2024-02-04 20:54:36 +0900 
categories: 
  - C++
tags: 
  - [cpp]
--- 

- 상등성은 `operator=`를 통해 두 객체의 값이 동일한지 비교합니다.
- 동등성은  `operator<`를 통해 정렬된 범위 내에서 두 객체의 값이 상대적인 순서를 갖는지 비교합니다.

상등성의 관한 예제
```cpp
(w1 == w2)
```

동등성의 관한 예제
```cpp
!( w1 < w2 ) // it's not true that w1 < w2
&&           // and
!( w2 < w1 ) // it's not true that w2 < w1
```

STL이 이러한 방식으로 작동하는 이유는:
> By using only a single comparison function and by employing equivalence as the arbiter of what it means to be "the same," the standard associative containers... avoid the kind of confusion that would arise from mixing uses of equality and equivalence within standard associative containers.

즉, 모든 STL은 동등성을 기반으로 작성되었습니다.
