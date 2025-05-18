console.log("Lambda started");
const AWS = require("aws-sdk");
const dynamodb = new AWS.DynamoDB();

exports.handler = async () => {
  const params = { TableName: process.env.TABLE_NAME };
  try {
    const data = await dynamodb.scan(params).promise();
    const courses = data.Items.map(item => AWS.DynamoDB.Converter.unmarshall(item));
    return { statusCode: 200, body: JSON.stringify(courses) };
  } catch (err) {
    return { statusCode: 500, body: JSON.stringify({ error: err.message }) };
  }
};