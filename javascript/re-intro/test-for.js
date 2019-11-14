"use strict"
const arr = [1, 2, 3, 4, 5];
const obj = {'a': 1, 'b': 2};

for (let i = 0; i < arr.length; i++) {
	console.log(i, arr[i]);
}

for (let i in arr) {
	console.log(i, arr[i]);
}

//can be used for object
for (let v in obj) {
	console.log(v, obj[v]);
}

arr.forEach((i) => {
	console.log(i);
});

//for iterable obeject 
for (let i of arr) {
	console.log(i);
}
