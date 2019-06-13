const p = new Promise((resolve, reject) => {
	resolve(100);
});

const q = new Promise((resolve, reject) => {
	reject(200);
});

p.then((data) => {
	console.log(data);
});

q.catch((err) =>  {
	console.log(err);
});

console.log("End of code");
