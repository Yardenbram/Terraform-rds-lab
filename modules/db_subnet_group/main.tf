resource "aws_db_subnet_group" "main" {
    name       = "db-subnet-group"
    subnet_ids = var.subnet_ids
    tags = {
      Name = "db-subnet-group"
    }
  }