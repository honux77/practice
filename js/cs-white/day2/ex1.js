var sum = function(a, b) {return a + b;};
var calculate = function(a,b, func) { return func(a,b);};

console.log(calculate(1, 10, sum));
