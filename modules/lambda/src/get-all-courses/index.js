const AWS5 = require("aws-sdk");
const dynamodb5 = new AWS5.DynamoDB.DocumentClient();

exports.handler = async () => {
  const params = {
    TableName: process.env.TABLE_NAME
  };

  try {
    const data = await dynamodb5.scan(params).promise();
    return {
      statusCode: 200,
      body: JSON.stringify(data.Items)
    };
  } catch (err) {
    console.error("Scan error:", err);
    return {
      statusCode: 500,
      body: JSON.stringify({ error: err.message })
    };
  }
};