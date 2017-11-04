var input = require('fs').readFileSync('/dev/stdin').toString().split('\n');
var idx = 0;
var readLine = function() { return input[idx++]; };


var dwarves = [];
var sum = 0;
for (var i = 0; i < 9; i++) {
	var n = Number(readLine());
	dwarves.push(n);
	sum += n;
}

dwarves.sort(function(a, b) {return a - b;});

var main = function() {
	var i = 0, j = dwarves.length - 1;
	while(i < j) {
		var dsum = sum - dwarves[i] - dwarves[j];
		if (dsum == 100) {
			dwarves.splice(j, 1);
			dwarves.splice(i, 1);
			console.log(dwarves.join(" "));
			return;
		} else if (dsum > 100) {
			i++;
		} else {
			j--;
		}
	}
};
main();
