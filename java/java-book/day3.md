### java book (god of java) day 3

========

### pp.222 - pp.333

#### DTO class

* http://stackoverflow.com/questions/1612334/difference-between-dto-vo-pojo-javabeans

DTO는 Data Transfer Class 를 의미 
VO는 Value Object 를 의미 

```java
public class MemberDTO {
	public String name;
	public String phone;
	public String email;
}
```

#### method overloading 

overloading: argument가 다름
overriding: subclass로 구현 

#### static method

static method 안에는 static 변수만 지역 사용할 수 있다. (당연한 이야기)

#### static block

프로그램 라이프사이클 동안 딱 한 번 실행된다. 

```java
//inside class, not inside method
static {
	//some code to run only once
}
```

#### pass by value, reference (다 아니까 패스) 

#### 가변길이 인수 

자바도 이게 된다니! 
여러 매개 변수 사용시 가장 마지막에만 선언 가능!
```java
public void some(String message, int ... numbers) {
	for(int number: numbers) {
		...
	}
}
```

#### package compile

소스 

```java
package honux.test;

public class PackageTest {
	public static void main(String[] args) {
		System.out.println("Package Test Program");
	}
}
```

폴더 구성 및 컴파일

```bash
$ tree .
.
└── honux
    └── test
	        └── PackageTest.java
$ javac honux/test/PackageTest.java
$ java honux.test.PackageTest

```

package 이름에는 java를 사용할 수 없다.  

import static 을 이용하면 static method와 static 변수를 import해서 사용할 수 있다. 

```java
import static honux.Sub.staticMethod;
import static honux.Sub.VALUE;
//...

public void method() {
	staticMethod();
	int a = VALUE;
}
```

java.lang 패키지와 현재 패키지와 같은 패키지는 import할 필요가 없다. 

#### 접근 제어자

* public: 누구나 접근 가능
* protected: 같은 패키지 내에 있거나 상속받은 경우 접근 가능
* package-private: default, 같은 패키지 내에서만 접근 가능 
* private: 해당 클래스 내에서만 접근 가능

한 파일에 여러 클래스를 선언할 수 있다. 단 파일 이름은 반드시 public 클래스 이름과 같아야 한다. 
