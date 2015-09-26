var express = require('express'),
	app = express();

app.get('/', function(req, res) {
	res.sendfile(__dirname + '/express.html');
});

app.listen(3000);
