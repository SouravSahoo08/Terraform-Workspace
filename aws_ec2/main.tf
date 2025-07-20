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
  instance_type = "t2.nano"

  tags = {
    Name = "Demo-Server"
  }
}