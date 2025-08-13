variable "vpc-config" {
  description = "provide vpc CIDR block and VPC name"
  type = object({
    cidr_block = string
    name = string
  })

  validation {
    condition = can(cidrnetmask(var.vpc-config.cidr_block))
    error_message = "Invalid CIDR block - ${var.vpc-config.cidr_block}"
  }
}

variable "subnet-config" {
  description = "Creation of subnet. Input : CIDR (String), Name (String), is_public_subnet (bool - default: false)"
  type = map(object({
    cidr_block = string
    name = string
    az = string
    is_public_subnet = optional(bool, false)
  }))

  validation {
    condition = alltrue([for subConfig in var.subnet-config: can(cidrnetmask(subConfig.cidr_block))])
    error_message = "Invalid subnet CIDR block"
  }
}