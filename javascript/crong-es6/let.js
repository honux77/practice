var list = document.querySelectorAll('li');

/*
for (var i = 0; i < list.length; i++) {
  ((num) => {
    list[num].addEventListener('click', ()=> {
        console.log(`${num}: ${list[num].innerHTML}`);
    });
  })(i);
}
*/

for (let i = 0; i < list.length; i++) {
  list[i].addEventListener('click', () => {
    console.log(`${i}: ${list[i].innerHTML}`);
  });
}
