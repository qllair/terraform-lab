variable "name" {}
variable "stage_name" {}
variable "get_all_courses_lambda_arn" {}
variable "get_course_lambda_arn" {}
variable "save_course_lambda_arn" {}
variable "update_course_lambda_arn" {}
variable "delete_course_lambda_arn" {}
variable "get_all_authors_lambda_arn" {}
variable "region" {
  type = string
}
