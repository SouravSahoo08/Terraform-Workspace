variable "list-elements" {
  type = list(string)
  default = ["Sourav", "Sahoo"]
}

output "list" {
  value = var.list-elements
}

variable "objects" {
  type = object({
    name = string
    empId = number
  })
  default = {
    name = "sourav"
    empId = "20021"
  }
}

output "object" {
  value = [var.objects.name, var.objects.empId]
}

variable "maps" {
    type = map(object({
        name = string
        empId = number
    }))
    default = {
      "emp1" = {
        name = "Sourav"
        empId = 18308
      },
      "emp2" = {
        name = "racheal"
        empId = 21223
      }
    }
}

output "maps" {
  value = [for k, v in var.maps: v]
}