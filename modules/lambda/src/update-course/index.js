const AWS = require("aws-sdk");
const dynamodb = new AWS.DynamoDB.DocumentClient();

exports.handler = async (event) => {
  const id = event.pathParameters.id;
  const body = JSON.parse(event.body);

  const item = {
    id,
    title: body.title,
    watchHref: body.watchHref,
    authorId: body.authorId,
    length: body.length,
    category: body.category
  };

  const params = {
    TableName: process.env.TABLE_NAME,
    Item: item
  };

  try {
    await dynamodb.put(params).promise();
    return {
      statusCode: 200,
      headers: { "Access-Control-Allow-Origin": "*" },
      body: JSON.stringify(item)
    };
  } catch (err) {
    console.error(err);
    return {
      statusCode: 500,
      headers: { "Access-Control-Allow-Origin": "*" },
      body: JSON.stringify({ error: err.message })
    };
  }
};
