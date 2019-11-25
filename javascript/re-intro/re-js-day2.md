# Re-introduce JS study - day 2

## Function

### callee

```js
var charsInBody = (function(elm) {
    if (elm.nodeType == 3) { // TEXT_NODE
        return elm.nodeValue.length;
    }
    var count = 0;
    for (var i = 0, child; child = elm.childNodes[i]; i++) {
        count += arguments.callee(child);
    }
    return count;
})(document.body);
```

## Object

- this가 이상하게 작동할 수 있다. Why?

```js
s = makePerson("Simon", "Willison")
> var fullName = s.fullName;
> fullName()
undefined undefined
```

- new 키워드를 사용하면 비어 있는 객체를 만들고 this를 거기에 할당한다.

## prototype

- 여러가지 문제점을 해결해 줌

```js
function Person(first, last) {
    this.first = first;
    this.last = last;
}
Person.prototype.fullName = function() {
    return this.first + ' ' + this.last;
}
Person.prototype.fullNameReversed = function() {
    return this.last + ', ' + this.first;
}
```

## apply와 this

- apply의 첫번째 매개변수는 this가 될 수 있는 객체

```
function trivialNew(constructor, ...args) {
    var o = {}; // 빈 객체를 생성
    constructor.apply(o, args);
    return o;
}
```

- 위 코드에서 ...은 rest 연산자

## call

- apply의 사촌인데 조금 다르게 동작

```js
function lastNameCaps() {
    return this.last.toUpperCase();
}
var s = new Person("Simon", "Willison");
lastNameCaps.call(s);
// 위의 구문은 다음과 같습니다:
s.lastNameCaps = lastNameCaps;
s.lastNameCaps();
```

## inner function

- 함수 안에 함수 정의 가능

```js
function parentFunc() {
  var a = 1;

  function nestedFunc() {
    var b = 4; // parentFunc can't use this
    return a + b;
  }
  return nestedFunc(); // 5
}
```

## Closures

- 몇 번을 봤는데 아직 클로져가 정확하게 뭘 의미하는지 살짝 헷갈림.
- 내부함수가 외부함수의 변수에 접근하려고 하는 현상인가?
- 외부함수의 변수에 접근하려고 하는 내부함수 자체를 지칭하는 단어인가?
- <https://developer.mozilla.org/en-US/docs/Web/JavaScript/Closures> 도 꼭 보자.

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
```

- 클로저에 대한 나머지 공부는 3일차의 나에게 미루기로 했다.
