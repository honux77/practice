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

var main = function() {
	for (var i = 0; i < 8; i++) {
		for (var j = i + 1; j < 9; j++) {
			var sum2 = sum - dwarves[i] - dwarves[j];
			if (sum2 == 100) {
				var t = dwarves[j];
				dwarves.splice(i, 1);
				dwarves.splice(dwarves.indexOf(t), 1);
				console.log(dwarves.join(" "));
				return;
			}
		}
	}
}

main();
