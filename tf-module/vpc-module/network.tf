module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "6.0.1"

  name = "tf-module-vpc"
  azs  = ["us-east-1a", "us-east-1b"]
  cidr = "10.0.0.0/16"

  public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets = ["10.0.3.0/24", "10.0.4.0/24"]

  public_subnet_tags = {
    Terraform = "true"
    subnet    = "public"
  }
  private_subnet_tags = {
    Terraform = "true"
    subnet    = "private"
  }

  tags = {
    Terraform = "true"
    Author    = "Sourav-tf"
  }
}
