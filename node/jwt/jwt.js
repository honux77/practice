const jwt = require('jsonwebtoken')
const privateKey="abcdefghijklmnopqrstuvwxyz012345"
let token = jwt.sign({name:"Honux", money: "Infinite"}, privateKey, { algorithm: 'HS256'})
console.log({privateKey});
console.log({token});

let decoded = jwt.verify(token, privateKey);
console.log(decoded);
try {
	decoded = jwt.verify(token, 'aaaaaa');
	console.log(decoded);
} catch (err) {
	console.log(`err: ${err.message}`);
}


