var input = require('fs').readFileSync('/dev/stdin').toString();
var answer = [];
var hash = {};

for (var i = 0; i < input.length; i++) {
    var c = input[i];
    if (!hash.hasOwnProperty(c)) {
        hash[c] = i;
    }
}

for (var i = 'a'.charCodeAt(0); i <= 'z'.charCodeAt(0); i++) {
    var c = String.fromCharCode(i);
	var idx = hash.hasOwnProperty(c) ? hash[c] : -1
	answer.push(idx);
}

console.log(answer.join(" "));

