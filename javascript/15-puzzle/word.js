var word1 = document.getElementById('word1');
var word2 = document.getElementById('word2');
var check = document.getElementById('check');


var game = {};
game.words = 'hello,good,morning,interesting,javascript,linux,apple,raspberry,monky'.split(',');

game.choice = function() {
    var i = Math.floor(Math.random() * this.words.length);
    this.answer = this.words[i]; 
    this.wordList = this.answer.split('');
    word1.innerHTML = this.answer;
};
game.choice();

game.btns = [];


game.updateDisplay = function () {
    if (game.answer === game.wordList.join('')) {
        check.innerHTML = '일치합니다';
    } else {
        check.innerHTML = '일치하지 않습니다';
    }
};

for (var i = 0; i < game.answer.length; i++) {
    var btn = document.createElement('button');
    btn.innerHTML = game.answer[i];
    word2.appendChild(btn);
    game.btns.push(btn);
}

game.copyBtnText = function () {
    for (var i = 0; i < this.wordList.length; i++) {
        this.btns[i].innerHTML = this.wordList[i];
    }
}

var swap = function (event) {
    var temp = [];
    //copy and swap
    while (game.wordList.length != 0) {
        var s = game.wordList.pop();
        temp.push(s);
    }

    game.wordList = temp;
    game.copyBtnText();
    game.updateDisplay();
};

var rshift = function (event) {
    var s = game.wordList.pop();
    game.wordList.unshift(s);
    game.copyBtnText();
    game.updateDisplay();
};

var lshift = function (event) {
    var s = game.wordList.shift();
    game.wordList.push(s);
    game.copyBtnText();
    game.updateDisplay();
};

var tf = Math.floor(Math.random() * 2) === 0;
if (tf) {
    swap();
}

var count = Math.floor(Math.random() * game.answer.length);
for (var i = 0; i < count; i++) {
    rshift();
}