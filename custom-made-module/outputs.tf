output "vpc" {
  value = module.my-vpc.vpc_id
}
output "public_subnet_list" {
  value = module.my-vpc.public_subnet_list
}
output "private_subnet_list" {
  value = module.my-vpc.private_subnet_list
}