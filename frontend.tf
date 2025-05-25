module "label_frontend" {
  source  = "cloudposse/label/null"
  version = "0.25.0"

  context = module.label.context
  name    = "frontend"
}

module "frontend_s3" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "4.6.0"

  bucket         = module.label_frontend.id
  force_destroy  = true

  website = {
    index_document = "index.html"
    error_document = "index.html"
  }

  control_object_ownership = true
  object_ownership         = "BucketOwnerPreferred"

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false

  tags = {
    Environment = "dev"
  }
}


resource "aws_s3_bucket_policy" "frontend_public_read" {
  bucket = module.frontend_s3.s3_bucket_id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid       = "PublicReadGetObject",
        Effect    = "Allow",
        Principal = "*",
        Action    = "s3:GetObject",
        Resource  = "${module.frontend_s3.s3_bucket_arn}/*"
      }
    ]
  })
}
