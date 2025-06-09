variable "vpc_cidr" {
    default = "10.0.0.0/16"
  }

  variable "vpc_name" {
    default = "my-vpc"
  }

  variable "public_subnet_cidrs" {
    default = ["10.0.0.0/24", "10.0.2.0/24"]
  }

  variable "private_subnet_cidrs" {
    default = ["10.0.1.0/24", "10.0.3.0/24"]
  }

  variable "azs" {
    default = ["us-west-2a", "us-west-2b"]
  }

  variable "db_name" {
    default = "mydb"
  }

  variable "db_user" {
    default = "admin"
  }

  variable "db_password" {
    default = "password1234"
    sensitive = true
  }
  