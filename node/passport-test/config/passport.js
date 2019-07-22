const passport = require('passport');
const LocalStrategy = require('passport-local').Strategy;

var db = require('../db');

passport.use(new LocalStrategy(
    function (username, password, done) {
        console.log(`Run Local strategy: ${username}, ${password}`);
        const user = db.find(username);
        //if (err) return done(err);
        if (!user || user.password !== password) return done(null, false);
        return done(null, user);
    }));

passport.serializeUser(function (user, done) {
    console.log(`serialize ${user.username}, ${user.password}`);
    done(null, user.username);
});

passport.deserializeUser(function (username, done) {
    console.log(`deserialize ${username}`);
    const user = db.find(username);
    done(null, user);
});

