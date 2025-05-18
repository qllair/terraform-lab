console.log("Lambda started");
const AWS = require("aws-sdk");
const dynamodb = new AWS.DynamoDB();

exports.handler = async (event) => {
  const { id } = JSON.parse(event.body);
  const params = {
    TableName: process.env.TABLE_NAME,
    Key: { id: { S: id } }
  };
  try {
    const data = await dynamodb.getItem(params).promise();
    return {
      statusCode: 200,
      body: JSON.stringify(AWS.DynamoDB.Converter.unmarshall(data.Item))
    };
  } catch (err) {
    return { statusCode: 500, body: JSON.stringify({ error: err.message }) };
  }
};