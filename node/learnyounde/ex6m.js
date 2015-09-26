var fs = require('fs');
var path = require('path');
module.exports = function(dirname, ext, callback){
	fs.readdir(dirname, function(err, list) {
		if (err) return callback(err);

		callback(null, list.filter(function(file) {
			return path.extname(file) === '.' + ext;
		}));
	});
}
