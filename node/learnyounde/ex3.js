const fs = require('fs');
const str = fs.readFileSync(process.argv[2]).toString();
console.log(str.split("\n").length - 1);
