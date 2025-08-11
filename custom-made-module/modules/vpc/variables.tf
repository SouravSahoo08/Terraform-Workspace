variable "vpc-config" {
  description = "provide vpc CIDR block and VPC name"
  type = object({
    cidr_block = string
    name = string
  })
}