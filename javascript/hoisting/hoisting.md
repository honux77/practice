# Hoisting

https://developer.mozilla.org/ko/docs/Glossary/Hoisting

- var로 선언한 변수 혹은 function 키워드로 선언한 함수를 앞쪽 코드에서 참조할 수 있는 현상
- 참조는 할 수 있지만 초기화는 실제 코드 부분에서 이루어진다.

## ex1

```js
catName("Tigger");

function catName(name) {
  console.log("My cat's name is " + name);
}

/*
위 코드의 결과는: "My cat's name is Tigger"
*/
```
