var formidable = require('formidable'),
	http =require('http'),
	sys = require('sys');

http.createServer(function(req, res) {
	if (req.url == '/upload' && req.method.toLowerCase() == 'post') {
		//parse a file upload
		var form = new formidable.IncomingForm();
		form.parse(req, function(err, fields, files) {
			res.writeHead(200, {'content-type': 'text/plain'});
			res.write('received upload\n\n');
			res.end(sys.inspect({fields: fields, files: files}));
		});
		return;
		}

	res.writeHead(200, {'content-type': 'text/html'});
	res.end(
		'<form action = "/upload" enctype="multipart/form-data" '+
		'method="post">' +
		'<input type="text" name="title"><br>' +
		'<input type="file" name="upload" multiple="multiple"><br>' +
		'<input type="submit" value="Upload">' +
		'</form>'
		);
}).listen(8080);
