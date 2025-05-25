module "label" {
  source  = "cloudposse/label/null"
  version = "0.25.0"

  namespace  = "lpnu"
  stage      = "dev"
  name       = "aws-lab"
  attributes = []
  context    = var.context
}