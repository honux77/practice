var input = require('fs').readFileSync(0).toString().split('\n');
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

(function() {
	var i = 0, j = dwarves.length - 1;
	while(true) {
		var dsum = sum - dwarves[i] - dwarves[j];
		if (dsum == 100) {
			var t = dwarves[j];
			dwarves.splice(i, 1);
			dwarves.splice(dwarves.indexOf(t), 1);
			console.log(dwarves.join(" "));
			return;
		} else if (dsum > 100) {
			i++;
		} else {
			j--;
		}
	}
})();
