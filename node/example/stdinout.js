var process = require('process');

process.stdin.setEncoding('utf8');

//push ctrl-D if you want to quit 
process.stdin.on('readable', () => {
	var chunk = process.stdin.read();
	if (chunk !== null) {
		process.stdout.write(`data: ${chunk}`);
	}
});

process.stdin.on('end', () => {
	process.stdout.write('end\n');
});
