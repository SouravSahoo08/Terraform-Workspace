provider "aws" {
  region = "us-east-1"
}

module "my-vpc" {
  source = "./modules/vpc"
  vpc-config = {
    cidr_block = "10.0.0.0/16"
    name       = "my-test-vpc"
  }
  subnet-config = {
    public-subnet-01 = {
      cidr_block = "10.0.1.0/24"
      name       = "test-public-subnet-01"
      az         = "us-east-1a"
      is_public_subnet = true
    }
    public-subnet-02 = {
      cidr_block = "10.0.2.0/24"
      name       = "test-public-subnet-02"
      az         = "us-east-1a"
      is_public_subnet = true
    }
    private-subnet-01 = {
      cidr_block = "10.0.3.0/24"
      name       = "test-private-subnet-01"
      az         = "us-east-1b"
    }
  }
}
