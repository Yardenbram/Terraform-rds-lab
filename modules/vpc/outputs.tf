output "private_subnet_ids" {
    value = aws_subnet.private[*].id
  }

  output "db_sg_id" {
    value = aws_security_group.db.id
  }