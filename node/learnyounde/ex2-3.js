const ans = process.argv.slice(2)
	.map(Number)
	.reduce((acc, cur) => (acc + cur));
console.log(ans);

