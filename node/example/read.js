var fs = require('fs');

function read(filename) {
	var ret = fs.readFileSync(filename, 'utf8');
	return ret;
}

var data = read("./html.js");
console.log(data);
exports.read = read;
