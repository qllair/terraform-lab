terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  required_version = ">= 1.3.0"
}

module "label_authors" {
  source  = "cloudposse/label/null"
  version = "0.25.0"

  namespace = "student"
  stage     = "dev"
  name      = "authors"

  tags = {
    Project = "terraform-lab"
  }
}

module "label_courses" {
  source  = "cloudposse/label/null"
  version = "0.25.0"

  namespace = "student"
  stage     = "dev"
  name      = "courses"

  tags = {
    Project = "terraform-lab"
  }
}

module "authors_table" {
  source        = "./modules/dynamodb-table"
  table_name    = module.label_authors.id
  billing_mode  = "PAY_PER_REQUEST"
  hash_key      = "id"

attributes = [
  {
    name = "id"
    type = "S"
  }
]
}

module "courses_table" {
  source        = "./modules/dynamodb-table"
  table_name    = module.label_courses.id
  billing_mode  = "PAY_PER_REQUEST"
  hash_key      = "id"

attributes = [
  {
    name = "id"
    type = "S"
  }
]
}

resource "aws_iam_role" "lambda_exec" {
  name = "lambda-exec-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = "sts:AssumeRole",
      Effect = "Allow",
      Principal = {
        Service = "lambda.amazonaws.com"
      }
    }]
  })
}

resource "aws_iam_role_policy" "lambda_dynamodb_policy" {
  name = "lambda-dynamodb-read-authors"
  role = aws_iam_role.lambda_exec.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "dynamodb:Scan",
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ],
        Resource = module.authors_table.table_arn
      }
    ]
  })
}

module "get_all_authors_lambda" {
  source              = "./modules/lambda-function"
  function_name       = "get-all-authors"
  handler             = "index.handler"
  runtime             = "nodejs18.x"
  role_arn            = aws_iam_role.lambda_exec.arn
  source_path         = abspath("${path.root}/lambda/get-all-authors")
  environment_variables = {
    TABLE_NAME = module.authors_table.table_name
    REGION     = "eu-central-1"
  }
}


module "get_all_courses_lambda" {
  source              = "./modules/lambda-function"
  function_name       = "get-all-courses"
  handler             = "index.handler"
  runtime             = "nodejs18.x"
  role_arn            = aws_iam_role.lambda_exec.arn
  source_path         = abspath("${path.root}/lambda/get-all-courses")
  environment_variables = {
    TABLE_NAME = module.courses_table.table_name
    REGION     = "eu-central-1"
  }
}

module "get_course_lambda" {
  source              = "./modules/lambda-function"
  function_name       = "get-course"
  handler             = "index.handler"
  runtime             = "nodejs18.x"
  role_arn            = aws_iam_role.lambda_exec.arn
  source_path         = abspath("${path.root}/lambda/get-course")
  environment_variables = {
    TABLE_NAME = module.courses_table.table_name
    REGION     = "eu-central-1"
  }
}

module "save_course_lambda" {
  source              = "./modules/lambda-function"
  function_name       = "save-course"
  handler             = "index.handler"
  runtime             = "nodejs18.x"
  role_arn            = aws_iam_role.lambda_exec.arn
  source_path         = abspath("${path.root}/lambda/save-course")
  environment_variables = {
    TABLE_NAME = module.courses_table.table_name
    REGION     = "eu-central-1"
  }
}

module "update_course_lambda" {
  source              = "./modules/lambda-function"
  function_name       = "update-course"
  handler             = "index.handler"
  runtime             = "nodejs18.x"
  role_arn            = aws_iam_role.lambda_exec.arn
  source_path         = abspath("${path.root}/lambda/update-course")
  environment_variables = {
    TABLE_NAME = module.courses_table.table_name
    REGION     = "eu-central-1"
  }
}

module "delete_course_lambda" {
  source              = "./modules/lambda-function"
  function_name       = "delete-course"
  handler             = "index.handler"
  runtime             = "nodejs18.x"
  role_arn            = aws_iam_role.lambda_exec.arn
  source_path         = abspath("${path.root}/lambda/delete-course")
  environment_variables = {
    TABLE_NAME = module.courses_table.table_name
    REGION     = "eu-central-1"
  }
}