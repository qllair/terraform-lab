output "api_gateway_execution_arn" {
  value = aws_api_gateway_rest_api.this.execution_arn
}

output "s3_bucket_name" {
  value = module.frontend_s3.s3_bucket_id
}