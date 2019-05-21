const { spawn } = require('child_process');
const ls = spawn('ls', ['-lh', '/usr']);

ls.stdout.on('data', (data) => {
  console.log(`<stdout>\n${data}`);
});

ls.stderr.on('data', (data) => {
  console.log(`<stderr>\n${data}`);
});

ls.on('close', (code) => {
  console.log(`child process exited with code ${code}`);
});
