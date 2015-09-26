var http = require('http');

function onRequest(req, res) {
	console.log("Request received");
	res.writeHead(200, {"Content-Type": "Text/plain"});
	res.write("Hello World");
	res.end();
}

http.createServer(onRequest).listen(8080);
console.log("Server has started");
