const seq = {
	_cnt: 1,
	get next() { return ++this._cnt; }
}

const move = () => {
	let count = seq.next;
	let space = "";
	let space2= "";
	const end = 40;

	console.log(count);
	console.clear();
	for (let i = 0; i < count; i++) {
		space += " ";
	}
	for (let i = 0; i < end - count; i++) {
		space2 += " ";
	}
	console.log(`${space}🎾${space2}🎱`);
	if (count === end) clearInterval(id);
}

const id = setInterval(move, 100);

