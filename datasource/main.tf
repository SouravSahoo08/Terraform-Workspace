terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.2.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

data "aws_vpc" "my-vpc" {
  tags = {
    Name = "my_terraform_vpc"
  }
}

output "vpc-name" {
  value = data.aws_vpc.my-vpc.id
}