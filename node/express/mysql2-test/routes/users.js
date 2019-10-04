var express = require('express');
var router = express.Router();
const user = require('../models/User');

/* GET users listing. */
router.get('/', function(req, res, next) {
  user.listUsers((err, users) => {
    if (err) next(err);
    console.log(users);
    res.json(users);
  });

});

module.exports = router;
