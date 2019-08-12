const NUM = 10;

fs = require('fs');
const ws = fs.createWriteStream('./data.csv');

const genId = (i) => {
	const ids = ['apple', 'banana', 'mango', 'tuna' , 'muken',
    	'ym', 'sony', 'aiwa', 'circus' ];
    const prefix = ids[parseInt(Math.random() * ids.length)];
    return prefix + i;
}


const chooseOne = (arr) => (arr[parseInt(Math.random() * arr.length)]);
const genName = () => {
	const fname = "김이박최정강조윤장임한오서신권황안송전홍";
	const chars = "철수영희참치동해물과백두산이마르고닳도록하느님이보우하사우리나라만세";
    const f = chooseOne(fname);
    const m = chooseOne(chars);
    const l = chooseOne(chars);
    return f + m + l;
}

const genDate = () => {
    const d = new Date();
    d.setDate(d.getDate() - parseInt(Math.random() * 100));
	month = '' + (d.getMonth() + 1),
	day = '' + d.getDate(),
	year = d.getFullYear();

    if (month.length < 2) month = '0' + month;
    if (day.length < 2) day = '0' + day;
    return [year, month, day].join('-');
};


//user
//write header
ws.write('id,name,money,date\n');

//write date
for (let i = 1; i <= NUM; i++) {
    const id = genId(i);
    const name = genName();
    const money = parseInt(Math.random() * 500) * 1000 + 1000;
    const date = genDate();
    ws.write(`${id},${name},${money},${date}\n`);
}
ws.end();
