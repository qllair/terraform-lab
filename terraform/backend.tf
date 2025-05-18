terraform {
  backend "s3" {
    bucket         = "661689365238-terraform-tfstate"
    key            = "env/dev/terraform.tfstate"
    region         = "eu-central-1"
    dynamodb_table = "terraform-tfstate-lock"
    encrypt        = true
  }
}