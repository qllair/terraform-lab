resource "aws_api_gateway_rest_api" "this" {
  name = var.name
}

resource "aws_api_gateway_resource" "courses" {
  rest_api_id = aws_api_gateway_rest_api.this.id
  parent_id   = aws_api_gateway_rest_api.this.root_resource_id
  path_part   = "courses"
}

resource "aws_api_gateway_resource" "course_id" {
  rest_api_id = aws_api_gateway_rest_api.this.id
  parent_id   = aws_api_gateway_resource.courses.id
  path_part   = "{id}"
}

resource "aws_api_gateway_resource" "authors" {
  rest_api_id = aws_api_gateway_rest_api.this.id
  parent_id   = aws_api_gateway_rest_api.this.root_resource_id
  path_part   = "authors"
}

# --- Methods & Integrations ---

# GET /courses
resource "aws_api_gateway_method" "get_courses" {
  rest_api_id   = aws_api_gateway_rest_api.this.id
  resource_id   = aws_api_gateway_resource.courses.id
  http_method   = "GET"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "get_courses" {
  rest_api_id = aws_api_gateway_rest_api.this.id
  resource_id = aws_api_gateway_resource.courses.id
  http_method = aws_api_gateway_method.get_courses.http_method
  integration_http_method = "POST"
  type = "AWS"
  uri  = "arn:aws:apigateway:${var.region}:lambda:path/2015-03-31/functions/${var.get_all_courses_lambda_arn}/invocations"
}

# GET /courses/{id}
resource "aws_api_gateway_method" "get_course" {
  rest_api_id   = aws_api_gateway_rest_api.this.id
  resource_id   = aws_api_gateway_resource.course_id.id
  http_method   = "GET"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "get_course" {
  rest_api_id = aws_api_gateway_rest_api.this.id
  resource_id = aws_api_gateway_resource.course_id.id
  http_method = aws_api_gateway_method.get_course.http_method
  integration_http_method = "POST"
  type = "AWS"
  uri  = "arn:aws:apigateway:${var.region}:lambda:path/2015-03-31/functions/${var.get_course_lambda_arn}/invocations"
}

# POST /courses
resource "aws_api_gateway_method" "post_course" {
  rest_api_id   = aws_api_gateway_rest_api.this.id
  resource_id   = aws_api_gateway_resource.courses.id
  http_method   = "POST"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "post_course" {
  rest_api_id = aws_api_gateway_rest_api.this.id
  resource_id = aws_api_gateway_resource.courses.id
  http_method = aws_api_gateway_method.post_course.http_method
  integration_http_method = "POST"
  type = "AWS"
  uri  = "arn:aws:apigateway:${var.region}:lambda:path/2015-03-31/functions/${var.save_course_lambda_arn}/invocations"
}

# PUT /courses/{id}
resource "aws_api_gateway_method" "put_course" {
  rest_api_id   = aws_api_gateway_rest_api.this.id
  resource_id   = aws_api_gateway_resource.course_id.id
  http_method   = "PUT"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "put_course" {
  rest_api_id = aws_api_gateway_rest_api.this.id
  resource_id = aws_api_gateway_resource.course_id.id
  http_method = aws_api_gateway_method.put_course.http_method
  integration_http_method = "POST"
  type = "AWS"
  uri  = "arn:aws:apigateway:${var.region}:lambda:path/2015-03-31/functions/${var.update_course_lambda_arn}/invocations"
}

# DELETE /courses/{id}
resource "aws_api_gateway_method" "delete_course" {
  rest_api_id   = aws_api_gateway_rest_api.this.id
  resource_id   = aws_api_gateway_resource.course_id.id
  http_method   = "DELETE"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "delete_course" {
  rest_api_id = aws_api_gateway_rest_api.this.id
  resource_id = aws_api_gateway_resource.course_id.id
  http_method = aws_api_gateway_method.delete_course.http_method
  integration_http_method = "POST"
  type = "AWS"
  uri  = "arn:aws:apigateway:${var.region}:lambda:path/2015-03-31/functions/${var.delete_course_lambda_arn}/invocations"
}

# GET /authors
resource "aws_api_gateway_method" "get_authors" {
  rest_api_id   = aws_api_gateway_rest_api.this.id
  resource_id   = aws_api_gateway_resource.authors.id
  http_method   = "GET"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "get_authors" {
  rest_api_id = aws_api_gateway_rest_api.this.id
  resource_id = aws_api_gateway_resource.authors.id
  http_method = aws_api_gateway_method.get_authors.http_method
  integration_http_method = "POST"
  type = "AWS"
  uri  = "arn:aws:apigateway:${var.region}:lambda:path/2015-03-31/functions/${var.get_all_authors_lambda_arn}/invocations"
}

resource "aws_api_gateway_deployment" "api_deploy" {
  depends_on = [
    aws_api_gateway_integration.get_courses,
    aws_api_gateway_integration.get_course,
    aws_api_gateway_integration.post_course,
    aws_api_gateway_integration.put_course,
    aws_api_gateway_integration.delete_course,
    aws_api_gateway_integration.get_authors
  ]

  rest_api_id = aws_api_gateway_rest_api.this.id
  stage_name  = var.stage_name
}