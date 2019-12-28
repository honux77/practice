# 6장. 클래스와 객체 2

- this는 메소드 내에서 클래스 인스턴스에 대한 참조로 사용됨
- this는 스택에 저장되고, 인스턴스는 힙에 저장됨

## singleton 패턴

- 책 코드가 조금 이상하다

```java
//...
private static Singleton instance = new Singleton(); // 이부분이 이상함

private Singleton() {};

public static Singleton getInstance() {
    if (instance == null) {
        instance = new Singleton();
    }
    return instance;
}
```
