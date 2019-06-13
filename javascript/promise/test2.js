const p = new Promise((resolve, reject) => {
	resolve(100);
});

p.then((data) => {
	console.log(data);
});

console.log("End of code");
