var input = require('fs').readFileSync('/dev/stdin').toString();
var answer = [];


for (var i = 'a'.charCodeAt(0); i <= 'z'.charCodeAt(0); i++) {
	var idx = input.indexOf(String.fromCharCode(i));
	answer.push(idx);
}

console.log(answer.join(" "));
