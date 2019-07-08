const div = (n, m) => (n/m);
const mdiv = n => m => div(n, m);
const udiv = (n, m) => mdiv(n)(m);

const tdiv = m => div(10, m);

//all the same
console.log(div(10,3));
console.log(mdiv(10)(3));
console.log(udiv(10,3));
console.log(tdiv(3));


