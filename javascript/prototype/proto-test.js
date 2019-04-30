function People() {
	this.eyes = 2;
}

Object.prototype.ho = function() {
	console.log("Hello protoss!");
}
	
const p1 = new People();
console.log(`p1.eyes = ${p1.eyes}`);
p1.ho();
console.log(p1.__proto__ === People.prototype);

const o = {}
console.log(p1.__proto__.__proto__ === o.__proto__);


