
resource "aws_vpc" "main"{
    cidr_block = var.vpc-config.cidr_block
    tags = {
      name = var.vpc-config.name
    }
}

# subnet creation
resource "aws_subnet" "main" {
  vpc_id = aws_vpc.main.id
  
  for_each = var.subnet-config
  cidr_block = each.value.cidr_block
  availability_zone = each.value.az

  tags = {
    name = each.value.name
  }

  lifecycle {
    precondition {
      condition = aws_vpc.main.id != ""
      error_message = ""
    }
  }
}

locals {
  public_subnets ={
    for subnet, config in var.subnet-config: subnet => config if config.is_public_subnet
  }
  private_subnets ={
    for subnet, config in var.subnet-config: subnet => config if !config.is_public_subnet
  }
}

# IGW creation. 1 IGW if atleast one public subnet is created
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
  count = length(local.public_subnets) > 0 ? 1 : 0
}

# route table creation for public subnet. 1 route table if atleast one public subnet is created
resource "aws_route_table" "main" {
  vpc_id = aws_vpc.main.id
  count = length(local.public_subnets) > 0 ? 1 : 0
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main[0].id
  }
}

# route table association with public subnet
resource "aws_route_table_association" "main" {
  route_table_id = aws_route_table.main[0].id
  for_each = local.public_subnets
  subnet_id = aws_subnet.main[each.key].id
}