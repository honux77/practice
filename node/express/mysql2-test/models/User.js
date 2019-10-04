'use strict';
const db = require('../db.js');

class User {
  static listUsers(cb) {
      db.query('SELECT * FROM USER WHERE ID > 2', (err, results) => {
        if (err) cb(err, null);
        cb(null, results);
      });
  }
}

module.exports = User;
