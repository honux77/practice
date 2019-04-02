# Learn JS day 4

http://stackoverflow.com/questions/5525795/does-javascript-guarantee-object-property-order
```javascript
(function foo() {
	console.log(arguments);
	for (var i = 0; i < arguments.length; i++) {
		if (typeof arguments[i] === 'object')
			console.log( i + ": " + JSON.stringify(arguments[i]));
		else
			console.log( i + ": " + arguments[i]);
	}
})(1, 2, 3, 'hello', {'name': 'honux'});
```

