var input = require('fs').readFileSync('/dev/stdin').toString().split('\n');
var idx = 0;
var readLine = function() {
	    return input[idx++];
};


var dwarves = [];
var sum = 0;
for (var i = 0; i < 9; i++) {
	var n = Number(readLine());
	dwarves.push(n);
	sum += n;
}

dwarves.sort(function(a, b) {return a - b;});

var printValue = function(i1, i2) {
	for (var i = 0; i < dwarves.length; i++) {
		if (i === i1 || i === i2) {
			continue;
		}
		console.log(dwarves[i]);
		process.exit()
	}
}

for (var i = 0; i < 8; i++) {
	for (var j = i + 1; j < 9; j++) {
		var sum2 = sum - dwarves[i] - dwarves[j];
		if (sum2 == 100) {
			printValue(i, j);
			break;
		}
	}
}
