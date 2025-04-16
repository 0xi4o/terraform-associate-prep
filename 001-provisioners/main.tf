terraform {
  # cloud {
  #   organization = "PlusUltra"
  #   workspaces {
  #     name = "provisioners"
  #   }
  # }

  required_version = ">= 1.1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.94.1"
    }
  }
}

resource "aws_instance" "t2micro" {
  ami           = "ami-0e35ddab05955cf57"
  instance_type = var.instance_type
  provider      = aws.aps1

  provisioner "local-exec" {
    command = "echo ${self.private_ip} >> private_ips.txt"
  }

  tags = {
    Name = "test-server-${local.project_name}"
  }
}

# module "vpc" {
#   source = "terraform-aws-modules/vpc/aws"
#   providers = {
#     aws = aws.aps1
#   }

#   name = "my-vpc"
#   cidr = "10.0.0.0/16"

#   azs             = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]
#   private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
#   public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

#   enable_nat_gateway = true
#   enable_vpn_gateway = true

#   tags = {
#     Terraform   = "true"
#     Environment = "dev"
#   }
# }
