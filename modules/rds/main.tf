resource "aws_db_instance" "main" {
    identifier              = "my-rds-instance"
    allocated_storage       = 20
    engine                  = "mysql"
    engine_version          = "8.0"
    instance_class          = "db.t3.micro"
    username                = var.db_user
    password                = var.db_password
    db_subnet_group_name    = var.subnet_group
    vpc_security_group_ids  = var.vpc_security_group_ids
    multi_az                = true
    skip_final_snapshot     = true
  }
