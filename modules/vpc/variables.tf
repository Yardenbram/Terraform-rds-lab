variable "vpc_cidr" {}
variable "vpc_name" {}
variable "azs" {}
variable "public_subnet_cidrs" {
  type = list(string)
}
variable "private_subnet_cidrs" {
  type = list(string)
}
