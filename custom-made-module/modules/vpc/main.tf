
resource "aws_vpc" "main"{
    cidr_block = var.vpc-config.cidr_block
    tags = {
      name = var.vpc-config.name
    }
}