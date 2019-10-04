'use strict'

// get the client
require('dotenv').config();
const mysql = require('mysql2');
 
// create the connection to database
const connection = mysql.createConnection({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  database: process.env.DB_DATABASE,
  password: process.env.DB_PASSWORD,
});
 
connection.connect((err) => {
    if (err) throw(err);
    //connection.end();
    console.log("MySQL Connect success!");
});

module.exports = connection;