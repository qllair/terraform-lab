const AWS = require("aws-sdk");
const dynamodb = new AWS.DynamoDB.DocumentClient();
const cloudwatch = new AWS.CloudWatch();

exports.handler = async () => {
  try {
    await cloudwatch.putMetricData({
      Namespace: "Custom/LambdaUsage",
      MetricData: [{
        MetricName: "GetAllCoursesCalled",
        Unit: "Count",
        Value: 1,
        Dimensions: [
          { Name: "Function", Value: "get-all-courses" }
        ]
      }]
    }).promise();
  } catch (err) {
    console.error("Failed to send metric:", err.message);
  }
  
  const params = {
    TableName: process.env.TABLE_NAME
  };

  try {
    const result = await dynamodb.scan(params).promise();

    return {
      statusCode: 200,
      headers: {
        "Access-Control-Allow-Origin": "*",
        "Access-Control-Allow-Headers": "Content-Type"
      },
      body: JSON.stringify(result.Items || {})
    };
  } catch (err) {
    return {
      statusCode: 500,
      headers: {
        "Access-Control-Allow-Origin": "*",
        "Access-Control-Allow-Headers": "Content-Type"
      },
      body: JSON.stringify({ error: err.message })
    };
  }
};