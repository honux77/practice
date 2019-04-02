this.x = 10

var foo = function() {
	this.x = 80;
	console.log(this.x)
	(function() {
		this.x++;
		console.log(this.x);
	})();
	console.log(this.x);
}

foo();
console.log(this.x)

