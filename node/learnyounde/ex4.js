var fs = require('fs')
fs.readFile(process.argv[2], (err, data) => {
	console.log(data.toString().split("\n").length - 1)
})
