const AWS3 = require("aws-sdk");
const dynamodb3 = new AWS3.DynamoDB.DocumentClient();

exports.handler = async (event) => {
  const params = {
    TableName: process.env.TABLE_NAME,
    Key: { id: event.id }
  };

  try {
    await dynamodb3.delete(params).promise();
    return {
      statusCode: 200,
      body: JSON.stringify({ message: `Course with id '${event.id}' deleted.` })
    };
  } catch (err) {
    console.error("DeleteItem error:", err);
    return {
      statusCode: 500,
      body: JSON.stringify({ error: err.message })
    };
  }
};