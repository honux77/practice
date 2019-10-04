'use strict'

//bad test
//not working!
const testDb = async () => {
  const connection = require('./db');
  console.log("db test");
  console.assert(connection, 'db connections test');
  connection.end();
}

testDb();