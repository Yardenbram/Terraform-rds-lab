variable "db_name" {}
variable "db_user" {}
variable "db_password" {}
variable "subnet_group" {}
variable "vpc_security_group_ids" {
  type = list(string)
}