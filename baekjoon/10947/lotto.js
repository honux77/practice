var arr = [];

for (var i = 1; i <= 45; i++) {
	arr.push(i);
}

while (arr.length != 6) {
	var idx = Math.floor(Math.random() * arr.length);
	arr.splice(idx, 1);
}

console.log(arr.join(" "));

