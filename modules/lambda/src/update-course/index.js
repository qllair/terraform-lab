const AWS4 = require("aws-sdk");
const dynamodb4 = new AWS4.DynamoDB.DocumentClient();

exports.handler = async (event) => {
  const item = {
    id: event.id,
    title: event.title,
    watchHref: event.watchHref,
    authorId: event.authorId,
    length: event.length,
    category: event.category
  };

  const params = {
    TableName: process.env.TABLE_NAME,
    Item: item
  };

  try {
    await dynamodb4.put(params).promise();
    return {
      statusCode: 200,
      body: JSON.stringify(item)
    };
  } catch (err) {
    console.error("PutItem error:", err);
    return {
      statusCode: 500,
      body: JSON.stringify({ error: err.message })
    };
  }
};
