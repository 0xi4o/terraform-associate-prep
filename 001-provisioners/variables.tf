variable "account_id" {
  type = string
}

variable "aws_access_key" {
  type = string
}

variable "aws_secret_key" {
  type      = string
  sensitive = true
}

variable "aws_region" {
  default = "us-east-1"
  type    = string
}

variable "instance_type" {
  type = string
}
