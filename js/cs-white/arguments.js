(function foo() {
	console.log(arguments);
	for (var i = 0; i < arguments.length; i++) {
		if (typeof arguments[i] === 'object')
			console.log( i + ": " + JSON.stringify(arguments[i]));
		else
			console.log( i + ": " + arguments[i]);
	}
})(1, 2, 3, 'hello', {'name': 'honux'});

