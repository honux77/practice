# 2장. 변수와 자료형

## local variable type inference

- java10부터 지역변수에 var 키워드를 사용해서 타입 추론 가능
- var로 선언된 변수의 타입을 중간에 바꿀 수 없다. 

```java
public void do() {
	 var i = 1;
	 var b = 2.5;
	 System.out.println(i + b);
}
```

## log

start/end date: 2018.12.6

