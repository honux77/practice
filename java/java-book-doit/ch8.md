# 8장. 상속과 다형성

- 가상 메소드에 대해 언급됨, dynamic binding은 나오지 않았음
- 자바는 스태틱의 경우를 제외하고 기본적으로 가상 메소드임
- 책에는 없지만 C++의 경우 virtual로 선언한 것과 동일한 효과

```java
Parent p = new Child();
p.doIt(); // 자식 클래스의 메소드 호출, 자바니까
```

- @override 어노테이션을 사용하면 실수를 막을 수 있다.

- instanceof를 이용해 다운캐스팅이 적합한지 확인할 수 있다.

```java
Parent p = new Child();
if (p instanceOf Child) {
    Child c = (Child) p;
}
```
