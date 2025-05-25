
resource "aws_cloudwatch_metric_alarm" "any_lambda_error" {
  alarm_name          = "any-lambda-function-error"
  metric_name         = "Errors"
  namespace           = "AWS/Lambda"
  statistic           = "Sum"
  period              = 300
  evaluation_periods  = 1
  threshold           = 1
  comparison_operator = "GreaterThanOrEqualToThreshold"
  alarm_description   = "Any Lambda function has errors"
  alarm_actions       = [aws_sns_topic.alerts.arn]
}

resource "aws_cloudwatch_metric_alarm" "get_all_courses_called_alarm" {
  alarm_name          = "GetAllCoursesCalledThreshold"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  metric_name         = "GetAllCoursesCalled"
  namespace           = "Custom/LambdaUsage"
  statistic           = "Sum"
  threshold           = 3
  period              = 300

  alarm_description   = "Triggered when get-all-courses called 3+ times in 5 minutes"
  alarm_actions       = [aws_sns_topic.alerts.arn]  # твій SNS topic

  dimensions = {
    Function = "get-all-courses"
  }
}

resource "aws_cloudwatch_metric_alarm" "billing_alarm" {
  alarm_name          = "billing-exceeds-threshold"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  metric_name         = "EstimatedCharges"
  namespace           = "AWS/Billing"
  period              = 21600 
  statistic           = "Maximum"
  threshold           = 1      
  alarm_description   = "Billing exceeds $1"
  alarm_actions       = [aws_sns_topic.alerts.arn]

  dimensions = {
    Currency = "USD"
  }

  depends_on = [aws_sns_topic.alerts]
}