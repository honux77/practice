const d = [0,1];

const fibo = function(n) {
	if (d[n] !== undefined) {
		return d[n];
	}
	d[n] = d[n - 1] + d[n - 2];
	return d[n];
};

//test
for (let i = 0; i <= 100; i++) {
	console.log(i, fibo(i));
}

