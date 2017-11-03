// https://www.acmicpc.net/problem/2309
// this can't pass the test

var randInt = function(a, b) {
  var range = b - a + 1;
  return n = Math.floor(Math.random() * range) + a;
}

var mixArr = function(arr, point) {
  var idx1 = randInt(0, point);
  var idx2 = randInt(point + 1, arr.length - 1);
  var temp = arr[idx1];
  arr[idx1] = arr[idx2];
  arr[idx2] = temp;
};

var getSum = function(arr, len) {
  var sum = 0;
  for (var i = 0;i < len; i++) {
    sum += arr[i];
  }
  return sum;
};

var myCompare = function(a, b) {
  return a > b;
}


var main = function() {
    var arr = [20, 7, 23, 19, 10, 15, 25, 8, 13];
    var count = 0;
    while(true) {
      count++;
      sum = getSum(arr, 7);
      if (sum === 100) {
        break;
      }
      mixArr(arr, 6);
    }

    arr = arr.splice(0,7);
    arr.sort(myCompare);
    console.log("try = %d", count);
    console.log("arr = %s", arr.join("-"));
    console.log("sum arr = %d", getSum(arr, 7));
}

//Run main
main();
