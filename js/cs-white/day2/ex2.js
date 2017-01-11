var avg = function() {
	var sum = 0;
	console.log("size:" + arguments.length);
	for (var i = 0; i < arguments.length; i++) {
		sum += arguments[i];
		console.log(arguments[i])
	}
	return sum / arguments.length;

}

var foo = function() {
	return avg.apply(null, arguments);

};

var bar = function() {
	return function() {
		console.log('I am function' + JSON.stringify(arguments));
	}
}
console.log("average " + foo(1,2,3,4,5));
var z = bar();
z("hello", "i", "am ", 54343);
