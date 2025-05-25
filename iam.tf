data "aws_iam_policy_document" "cloudwatch_metrics" {
  statement {
    effect = "Allow"

    actions = [
      "cloudwatch:PutMetricData"
    ]

    resources = ["*"]
  }
}

resource "aws_iam_policy" "lambda_put_metric" {
  name        = "lambda-put-metric-data"
  description = "Allow Lambda to send custom metrics to CloudWatch"
  policy      = data.aws_iam_policy_document.cloudwatch_metrics.json
}

resource "aws_iam_role_policy_attachment" "attach_metric_policy" {
  role       = "lpnu-dev-get-all-courses"
  policy_arn = aws_iam_policy.lambda_put_metric.arn
}
