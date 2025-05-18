resource "aws_lambda_function" "this" {
  function_name = var.function_name
  role          = var.role_arn
  handler       = var.handler
  runtime = "nodejs16.x"
  filename = "${path.module}/${var.function_name}.zip"
  source_code_hash = data.archive_file.lambda_zip.output_base64sha256

  environment {
    variables = var.environment_variables
  }
}

data "archive_file" "lambda_zip" {
  type        = "zip"
  source_dir  = var.source_path
  output_path = "${path.module}/${var.function_name}.zip"
}

resource "aws_iam_role_policy" "lambda_logging" {
  name = "lambda-logging"
  role = var.lambda_role_name

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ],
        Effect   = "Allow",
        Resource = "*"
      }
    ]
  })
}
