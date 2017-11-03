var input = require('fs').readFileSync('/dev/stdin').toString().split('\n');
input.length--;
var idx = 0;

var readLine = function() {	
	return input[idx++];
}


var test = function() {
	for (var i = 0; i < input.length; i++) {
		console.log(i, readLine());
	}
};

test();

