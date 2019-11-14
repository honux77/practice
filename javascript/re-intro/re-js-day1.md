# JavaScript 재입문하기

- https://trello.com/b/rGoY5WnG/2019-js-study
- 짧고 좋다

## JS Type

- Number
- String
- Boolean
- Symbol
- Object (Function, Array, Date, RegExp)
- Null
- Undefined

## Number

- IEEE 754
- 정수는 존재하지 않는다.

## Control

- switch-case 에 문자열을 사용할 수 있구나.

## for-loop

- 기본 스타일
- for in
- for of

- for in은 좀 이상하던데...
- https://jsdev.kr/t/for-in-vs-for-of/2938 참고하는 것이 좋겠다.

## Array

### 여러가지 배열 메소드들

```
a.toString(), a.toLocaleString(), a.concat(item, ..), a.join(sep),
a.pop(), a.push(item, ..), a.reverse(), a.shift(), a.slice(start, end),
a.sort(cmpfn), a.splice(start, delcount, [item]..), a.unshift([item]..)
```

## Function

- 정의한 매개변수보다 더 많은 인자를 넘겨줄 수 있다.
- 적게 넣으면 undefined로 들어간다.
- arguments 객체로 모든 arguments 객체에 대해 접근 가능하다.

### apply

```js
function avg() {
	let sum = 0;
	for (let i = 0; i < arguments.length; i++) {
		sum += arguments[i];
	}
	return sum / arguments.length;
}

avg(2, 3, 4, 5)
3.5

avg.apply(null, [2, 3, 4, 5]);
3.5
```

- null 인자에 대한 설명은 나중에...
