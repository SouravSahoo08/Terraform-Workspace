provider "aws" {
  region = "us-east-1"
}

module "my-vpc" {
  source = "./modules/vpc"
  vpc-config = {
    cidr_block = "10.0.0.0/16"
    name = "my-test-vpc"
  }
}