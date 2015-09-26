var ex6 = require('./ex6m.js');
ex6(process.argv[2], process.argv[3], function(err,data) {
	data.forEach(function(file) {
		console.log(file);
	});
});
