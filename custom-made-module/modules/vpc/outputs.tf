output "vpc_id" {
  value = aws_vpc.main.id
}

locals {
  public_subnets_op = {
    for key, config in local.public_subnets: key => {
        subnet_id = aws_subnet.main[key].id
        az =  aws_subnet.main[key].availability_zone
    }
  }
  
  private_subnets_op = {
    for key, config in local.private_subnets: key => {
        subnet_id = aws_subnet.main[key].id
        az =  aws_subnet.main[key].availability_zone
    }
  }
}

output "public_subnet_list" {
  value = local.public_subnets_op
}

output "private_subnet_list" {
  value = local.private_subnets_op
}