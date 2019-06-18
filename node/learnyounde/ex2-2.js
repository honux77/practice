const nums = process.argv.slice(2);
const ans = nums.reduce((acc, cur) => (acc + Number(cur)), 0);
console.log(ans);

