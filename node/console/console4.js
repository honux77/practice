let count = 1;
let end = 40;

const move = () => {
	console.clear();
	count++;
	let space = "";
	for (let i = 0; i < count; i++) {
		space += " ";
	}
	let space2= "";
	for (let i = 0; i < end - count; i++) {
		space2 += " ";
	}
	console.log(`${space}🎾${space2}🎱`);
	if (count === end) clearInterval(id);
}

const id = setInterval(move, 100);

