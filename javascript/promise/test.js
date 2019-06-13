const mycall = function(callback) {
	setTimeout(callback,1000);
	console.log("call mycall");
}

mycall(function() {
	console.log("Micole!");
});

const mycall2 = function() {
	return new Promise((resolve, reject) => {
		const data = 100;
		resolve(data);
	});
};

mycall2().then((resolvedData) => {
	console.log(resolvedData);
});

console.log("Code ended");

