var AWS = require('aws-sdk');

var dynamodb = new AWS.DynamoDB({region: 'ap-northeast-1'});

//create table
var params = {
  AttributeDefinitions: [ /* required */
    {
      AttributeName: 'studentName', /* required */
      AttributeType: 'S' /* required */
    }
  ],
  KeySchema: [ /* required */
    {
      AttributeName: 'studentName', /* required */
      KeyType: 'HASH' /* required */
    }
  ],
  ProvisionedThroughput: { /* required */
    ReadCapacityUnits: 3, /* required */
    WriteCapacityUnits: 1 /* required */
  },
  TableName: 'student'
};
dynamodb.createTable(params, function(err, data) {
  if (err) console.log(err, err.stack); // an error occurred
  else     console.log(data);           // successful response
});

//wait until create
var params = {
  TableName: 'student' /* required */
};

dynamodb.waitFor('tableExists', params, function(err, data) {
  if (err) console.log(err, err.stack); // an error occurred
  else     console.log(data);           // successful response
});

//list tables
dynamodb.listTables( function(err, data) {
  if (err) console.log(err, err.stack);
  else {
    console.log(data);
  }
});

var time = new Date().getTime();
var str = "Hello, I am string " + time;
//insert
var params = {
  Item: { /* required */
    studentName: { /* AttributeValue */
      S: 'hoyoung',
    },
    email: {
      S: 'honux77@gmail.com'
    },
    data: {
      S: str
    }
  },
  TableName: 'student' /* required */
};

dynamodb.putItem(params, function(err, data) {
  if (err) console.log(err, err.stack); // an error occurred
  else     console.log(data);           // successful response
});

//scan
var params = {
  TableName: 'student', /* required */
  AttributesToGet: [
    'studentName',
    'email',
    'data'
  ]
  };
dynamodb.scan(params, function(err, data) {
  if (err) console.log(err, err.stack); // an error occurred
  else     console.log(data);           // successful response
});

//update

//delete

//drop table
