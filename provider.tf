module "vpc" {
    source = "./modules/vpc"
    vpc_cidr = var.vpc_cidr
    vpc_name = var.vpc_name
    public_subnet_cidrs = var.public_subnet_cidrs
    private_subnet_cidrs = var.private_subnet_cidrs
    azs = var.azs
  }

  module "db_subnet_group" {
    source     = "./modules/db_subnet_group"
    subnet_ids = module.vpc.private_subnet_ids
  }

  module "rds" {
    source                  = "./modules/rds"
    db_name                = var.db_name
    db_user                = var.db_user
    db_password            = var.db_password
    subnet_group           = module.db_subnet_group.subnet_group_name
    vpc_security_group_ids = [module.vpc.db_sg_id]
  }
  