### java book (god of java) day 3

========

### pp.318 - pp.336

#### Object

* 모든 클래스들의 조상
* 제공 메소드 
```java
clone()
equals()
finalize()
getClass()
hashCode()
toString()


notify()
notifyAll()
wait()
```

#### toString()
= getClass().getName() + '@' + Integer.toHexString(hashCode())

#### equals()
equals()를 overriding 할 때는 반드시 hashcode()도overriding 해야 한다. 

* 서브클래스의 생성자를 호출하면 자동으로 부모클래스의 매개변수 없는 생성자를 호출한다.

* super() 의 위치는 반드시 서브 클래스 생성자내 첫 줄에 위치해야 한다.

* 부모클래스에 매개변수 없는 생성자가 없고, 매개변수 있는 생성자만 있을 경우 서브 클래스에서 반드시 super()를 이용 매개변수 있는 생성자를 호출해야 한다.


#### method overriding 

* 리턴 타입은 부모클래스와 서브클래스 모두 같아야 한다.

* 부모가 public이면 자식도 public이어야 한다. 자식 메소드는 부모보다 더 넓은 접근 권한을 가져야 한다. 

#### instanceof

instanceof 로 타입을 확인시 부모 타입에도 true가 리턴된다. 
```java
Parent p = new Child();
if (p instanceof Child) {
	System.out.println("Child");
}
```
