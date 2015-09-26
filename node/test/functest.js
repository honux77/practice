function getMessage(func) {
	console.log("arg length" + arguments.length);
	message = "Hello"
	for (var i = 1; i < arguments.length; i++) {
		func(arguments[i]);
		message += " " + arguments[i];
	}
	return message;
}

foo = function(str) {
	console.log("arg type:" + typeof(str));
	console.log("foo is not " + str);
}

x = getMessage(foo, "Bear", [1,2,3]);
console.log("---------------x---------------x----------");
console.log(x);

