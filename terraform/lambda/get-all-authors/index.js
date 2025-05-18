const AWS = require("aws-sdk");
const dynamodb = new AWS.DynamoDB({ apiVersion: "2012-08-10" });

exports.handler = async () => {
  const params = {
    TableName: process.env.TABLE_NAME,
  };

  try {
    const data = await dynamodb.scan(params).promise();
    const authors = data.Items.map((item) => ({
      id: item.id.S,
      firstName: item.firstName?.S,
      lastName: item.lastName?.S,
    }));

    return {
      statusCode: 200,
      body: JSON.stringify(authors),
    };
  } catch (err) {
    console.error(err);
    return {
      statusCode: 500,
      body: JSON.stringify({ error: "Failed to fetch authors" }),
    };
  }
};
