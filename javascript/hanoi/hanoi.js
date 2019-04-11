let count = 0;
function move(num, src, target) {
	if (num == 0) {
		return;
	}
	count++;
	temp = 6 - src - target;
	move(num - 1, src, temp);
	console.log(`${num}번을 ${src}에서 ${target}으로 옮겼다.`);
	move(num - 1, temp, src);
}

move(8, 1, 3);
console.log(`끝: ${count}`);
