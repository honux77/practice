# Re-introduce JS study - day 3

## Closures

```js
function makeAdder(a) {
  return function(b) {
    return a + b;
  };
}
var add5 = makeAdder(5);
var add20 = makeAdder(20);
add5(6); // 11
add20(7); // 27

```js
function makeAdder(a) {
104   return function(b) {
105     return a + b;
106   };
107 }
108 var add5 = makeAdder(5);
109 var add20 = makeAdder(20);
110 add5(6); // 11
111 add20(7); // 27
```

- 자바스크립트 함수가 실행되면 스코프 객체가 생성된다.
- 스코프 객체는 함수의 매개변수와 함께 초기화되고 로컬 변수를 담아둔다.
- 일반적으로 스코프는 함수 종료시 GC에 의해 삭제된다.
- 위의 예제에서는 리턴한 함수 객체가 참조를 유지하므로 해당 함수 객체가 소멸하기 전까지 메모리에서 청소되지 않는다.
- 클로져를 사용하면 스코프 객체가 체인의 형태로 유지되므로 이를 스코프 체인이라고 한다.
- 클로져는 함수와 스코프 객체의 조합이라고 할 수 있다. 그리고 종종 객체를 대신해서 어떤 상태값을 저장할 때 요긴하게 사용될 수 있다.

## 클로저 참고 자료

- <https://stackoverflow.com/questions/111102/how-do-javascript-closures-work>