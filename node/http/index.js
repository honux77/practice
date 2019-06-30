const http = require('http');
const port = 3000;

const server = http.createServer((req, res) => {
    debugger;
    console.log(req.url);
    res.end("Hello HTTP");
})

server.listen(port, (err) => {
  if (err) {
    return console.log('something bad happened', err)
  }

  console.log(`server is listening on ${port}`);
})