// Set up
var Func = function() {
  var someInstance = {};
  var a = 0;
  var b = 1;

  someInstance.getA = function() {
    return a;    
  }

  someInstance.getValue = function(val) {
    return val;
  }
  return someInstance;
}

// Usage
var foo = Func();
console.log(foo.getA());
console.log(foo.getValue(10));