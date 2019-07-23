const express = require('express');
const session = require('express-session');
const cookieParser = require('cookie-parser');
const passport = require('passport');

const db = require('./db');

const app = express();

app.use(require('morgan')('dev'));
app.use(cookieParser());
app.use(session({
    secret: 'spidy-mj',
    cookie: { maxAge: 60000 },
    resave: false,
    saveUninitialized: false
}));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));

require('./config/passport');
app.use(passport.initialize());
app.use(passport.session());

app.get('/', (req, res) => {
    return res.send('Hello world');
});

app.get('/login', (req, res) => {
    return res.send('Login');
});

app.post('/login', passport.authenticate('local', { failureRedirect: '/login' }),
    function (req, res) {
        console.log(`login success for ${req.user}`);
        return res.redirect('/');
    });

app.post('/signup', (req, res, next) => {
    let { username, password } = req.body;
    db.save(username, password);
    return res.json({ status: "success", user: { username, password } });
});

app.get('/profile', (req, res) => {
    if (req.isAuthenticated()) {
        return res.json({ status: "ok", user: req.user });
    }
    return res.status(401).json({ status: "unauthorized" });
});

app.get('/foo', (req, res) => {
    return res.json({ status: "foo" });
});

app.get('/logout', (req, res) => {
    req.logout();
    res.redirect('/');
});

app.listen(3000, () => {
    console.log("Server listen at port 3000");
});