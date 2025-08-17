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

resource "aws_instance" "myDemoInstance" {
  ami = "ami-020cba7c55df1f615"
  instance_type = var.instance-type

  tags = {
    Name = "Demo-Server-${terraform.workspace}"
  }
}

# create workspaces:
# --> terraform workspace new dev
# --> terraform workspace new prod

# select dev:
# --> terraform workspace select dev
# change instance type to "t2.micro" in tfvars
# terraform plan

# select prod:
# --> terraform workspace select dev
# change instance type to "t3.large" in tfvars
# terraform plan

