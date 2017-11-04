var input = require('fs').readFileSync('/dev/stdin').toString().split('\n');

var str = input[0];
var ret = [];

var n = 0;
var exponent = [1, 2, 4];
for (var i = 0; i < str.length; i++) {
	var idx = str.length - 1 - i;
	var pos = i % 3;
	if (str[idx] == "1") {
		n +=  exponent[pos];
	}
	if (pos === 2) {
		ret.unshift(n);
		n = 0;
	}
}

if (n !== 0) {
	ret.unshift(n);
}

console.log(ret.join(''));
