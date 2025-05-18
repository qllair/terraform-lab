const AWS = require("aws-sdk");
const dynamodb = new AWS.DynamoDB();

exports.handler = async (event) => {
  const item = JSON.parse(event.body);
  const params = {
    TableName: process.env.TABLE_NAME,
    Item: AWS.DynamoDB.Converter.marshall(item)
  };
  try {
    await dynamodb.putItem(params).promise();
    return { statusCode: 200, body: JSON.stringify({ message: "Course saved" }) };
  } catch (err) {
    return { statusCode: 500, body: JSON.stringify({ error: err.message }) };
  }
};