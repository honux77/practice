var fs = require('fs');
var path = require('path');

fs.readdir(process.argv[2], function(err, list) {
	if(err) throw err;
	data.forEach(function onList(fileName) {
		if (path.extname(fileName) === "." + process.argv[3]) 
			console.log(fileName);
	});
});

