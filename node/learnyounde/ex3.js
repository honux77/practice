var fs = require('fs');
var buffer = fs.readFileSync(process.argv[2]);
var text = buffer.toString();
var lines = text.split("\n");
console.log(lines.length - 1);
