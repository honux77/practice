// https://www.acmicpc.net/problem/2309
// this can't pass the test

process.stdin.resume();
process.stdin.setEncoding('ascii');

var input_stdin = "";
var input_stdin_array = "";
var input_currentline = 0;

process.stdin.on('data', function (data) {
    input_stdin += data;
});

process.stdin.on('end', function () {
    input_stdin_array = input_stdin.split("\n");
    main();
});

function readLine() {
    return input_stdin_array[input_currentline++];
}

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

/////////////// ignore above this line ////////////////////

function main() {
    arr = [];
    for (var i = 0; i < 9; i++) {
      arr.push(parseInt(readLine()));
    }
    //console.log(arr);
    var count = 0;
    while(true) {
      count++;
      sum = getSum(arr, 7);
      //console.log(count + ":" + arr + " - " + sum);
      if (sum === 100) {
        break;
      }
      mixArr(arr, 6);
    }
    arr = arr.splice(0,7);  
    console.log(arr.sort((a,b)=>(a>b)).join("\n"));
}
