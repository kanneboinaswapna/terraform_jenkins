variable "subnets_cidr" {
  type = list(string)
  default = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24"]
}

variable "subnet_name" {
  type = list(string)
  default = ["subnet1", "subnet2", "subnet3"]
}
