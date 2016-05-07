var fs = require('fs');
var process = require('process');
process.stdin.setEncoding('utf8');

process.stdin.on('readable', () => {
	console.log("Enter some string: ");
	var cmd = process.stdin.read();

	if (cmd !== null) {
		fs.appendFile('data.txt', cmd, (err) => {
			if (err) throw err;
			cmd = cmd.trim();
			console.log(`add: ${cmd}`);
		});
	}
});

process.stdin.on('end', () => {
	console.log('====================================');
	console.log('Input ended..');
	data = fs.readFileSync('data.txt', 'utf8');
	console.log(data);
}); 
