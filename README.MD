# Terraform RDS Lab

## Project Overview

This project provisions a **MySQL RDS database (Multi-AZ)** along with all required **network infrastructure** using a modular Terraform structure.

It was built as part of a hands-on lab to learn and apply real-world Infrastructure as Code practices on AWS.

---

## Project Structure

```bash
terraform-rds-lab/
├── main.tf
├── provider.tf
├── variables.tf
├── outputs.tf
├── .gitignore
├── modules/
│   ├── vpc/
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   ├── db_subnet_group/
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   └── rds/
│       ├── main.tf
│       ├── outputs.tf
│       └── variables.tf
