resource "aws_vpc" "main" {
    cidr_block           = var.vpc_cidr
    enable_dns_support  = true
    enable_dns_hostnames = true
    tags = {
      Name = var.vpc_name
    }
  }

  resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.main.id
  }

  resource "aws_subnet" "public" {
    count = length(var.public_subnet_cidrs)
    vpc_id     = aws_vpc.main.id
    cidr_block = var.public_subnet_cidrs[count.index]
    availability_zone = var.azs[count.index]
    map_public_ip_on_launch = true
    tags = {
      Name = "public-subnet-${count.index}"
    }
  }

  resource "aws_subnet" "private" {
    count = length(var.private_subnet_cidrs)
    vpc_id     = aws_vpc.main.id
    cidr_block = var.private_subnet_cidrs[count.index]
    availability_zone = var.azs[count.index]
    tags = {
      Name = "private-subnet-${count.index}"
    }
  }

  resource "aws_nat_gateway" "nat" {
    allocation_id = aws_eip.nat.id
    subnet_id     = aws_subnet.public[0].id
    depends_on    = [aws_internet_gateway.igw]
  }

  resource "aws_eip" "nat" {}

  resource "aws_security_group" "db" {
    name   = "rds-db-sg"
    vpc_id = aws_vpc.main.id

    ingress {
      from_port   = 3306
      to_port     = 3306
      protocol    = "tcp"
      cidr_blocks = ["10.0.0.0/16"]
    }

    egress {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
