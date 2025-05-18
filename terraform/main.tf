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