# 2장. 변수와 자료형

## local variable type inference

- java10부터 지역변수에 var 키워드를 사용해서 타입 추론 가능
- var로 선언된 변수의 타입을 중간에 바꿀 수 없다.
- var는 지역 변수에서만 사용할 수 있다.

```java
public void do() {
    var i = 1;
    var b = 2.5;
    System.out.println(i + b);
}
```

## 타입 추론

- java9부터 사용 가능
- 지역변수 한정

```java
public void foo() {
    var i = 10;
    var b = 3.5;
    System.out.println(i + b);
}
```

## 2의 보수 표기법

- 책 내용에 오류가 있다.
- 모리스 마노 컴구조 참고할 것
