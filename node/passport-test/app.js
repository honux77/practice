const express=require('express');
const session = require('express-session');

const app = express();

app.use(require('morgan')('dev'));
app.use(session({secret: 'spider man mj',
    cookie: {maxAge: 60000}, 
    resave: false,
    saveUninitialized: false}));
app.use(express.json());
app.use(express.urlencoded({extended: false}));

require('./config/passport');

app.get('/', (req, res) => {
    res.send('Hello world');
});

app.listen(3000, ()=> {
    console.log("Server listen at port 3000");
});