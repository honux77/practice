const passport = require('passport');
const LocalStrategy = require('passport-local').Strategy;

var db = require('../db');

passport.use(new LocalStrategy(
    function (username, password, done) {
        const user = db.find(username);
        //if (err) return done(err);
        if (!user || user.password !== password) return done(null, false);
        return done(null, user);
    }));

passport.serializeUser(function (user, done) {
    done(null, user.username);
});

passport.deserializeUser(function (username, done) {
    const user = db.find(username);
    done(null, user);
});

