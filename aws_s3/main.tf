terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.2.0"
    }
    random = {
      source = "hashicorp/random"
      version = "3.7.2"
    }
  }

  backend "s3" {
    bucket = "ssjack-terraform-state-files"
    key = "s3-state.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = var.region
}

resource "random_id" "rand_id" {
  byte_length = 6
}

resource "aws_s3_bucket" "demoBucket" {
  bucket = "sourav-aws-${random_id.rand_id.hex}"
}

resource "aws_s3_object" "demo-data" {
  bucket = aws_s3_bucket.demoBucket.bucket
  source = "demodata.txt"
  key = "sample-data.txt"
  region = var.region
}