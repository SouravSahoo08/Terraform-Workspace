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

resource "aws_instance" "main" {
  ami           = "ami-0de716d6197524dd9"
  instance_type = "t2.micro"

  tags = {
    "Name" = "tf-test-import-instance"
  }
}

# make an empty resource file
# run --> terrafrom import aws_instance.main <ec2-id>
# watch configuration of the existing resource o/p in the console
# modify the resource block accordingly
# use 'terraform plan' to check & correct differences (if any)