### java book (god of java) day 2

========

### pp.113 - pp.221

#### BigDecimal 

* http://docs.oracle.com/javase/6/docs/api/java/math/BigDecimal.html 

돈과 같은 큰 수를 표현할 때는 BigDecimal 클래스를 사용해야 한다.

#### print reference type
* https://docs.oracle.com/javase/7/docs/api/java/lang/Object.html#toString()

```java
public class MyObject {
	public static void main(String[] args) {
		MyObject[] array = new MyObject[1];
		array[0] = new MyObject();
		System.out.println(array);
		System.out.println(array[0]);
	}
}
```

결과값

```bash
[LMyObject;@7852e922
MyObject@4e25154f
```
자바에서 reference type을 print해 보면 
* [: array
* L: referency type 
* MyObject: class type
* @4e25154f: hash 

#### java 배열 

```
//array 1
int a[] = new int[5];
int[] b = new int[5];

//array 2
int[][] c = new int[2][5];

//it is ok
int[][] d = new int[2][];
d[0] = new int[5];
d[1] = new int[2];
```
