provider "aws" {
  allowed_account_ids = [var.account_id]
  region              = var.aws_region
  access_key          = var.aws_access_key
  secret_key          = var.aws_secret_key
}

provider "aws" {
  alias               = "aps1"
  allowed_account_ids = [var.account_id]
  region              = "ap-south-1"
  access_key          = var.aws_access_key
  secret_key          = var.aws_secret_key
}

locals {
  project_name = "TF-Learning"
}

