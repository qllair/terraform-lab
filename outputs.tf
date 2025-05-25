output "api_gateway_execution_arn" {
  value = aws_api_gateway_rest_api.this.execution_arn
}

output "lambda_get_course_invoke_arn" {
  value = module.lambda_functions.lambda_get_course_invoke_arn
}