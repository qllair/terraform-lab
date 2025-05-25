const AWS2 = require("aws-sdk");
const dynamodb2 = new AWS2.DynamoDB.DocumentClient();

exports.handler = async (event) => {
  const id = event.title.toLowerCase().replace(/ /g, "-");

  const item = {
    id,
    title: event.title,
    watchHref: `http://www.pluralsight.com/courses/${id}`,
    authorId: event.authorId,
    length: event.length,
    category: event.category
  };

  const params = {
    TableName: process.env.TABLE_NAME,
    Item: item
  };

  try {
    await dynamodb2.put(params).promise();
    return {
      statusCode: 200,
      body: JSON.stringify(item)
    };
  } catch (err) {
    console.error(err);
    return {
      statusCode: 500,
      body: JSON.stringify({ error: err.message })
    };
  }
};