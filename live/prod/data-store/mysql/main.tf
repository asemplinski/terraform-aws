terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  backend "s3" {
    bucket = "terraform-up-and-running-state-69"
    key = "prod/data-store/mysql/terraform.tfstate"
    region = "us-east-2"

    dynamodb_table = "terraform-up-and-running-locks"
    encrypt = true
  }
}


provider "aws" {
  region = "us-east-2"
  alias = "primary"
}

provider "aws" {
  region = "us-west-1"
  alias = "replica"
}


module "mysql_primary" {
  source = "../../../../modules/data-stores/mysql"

  providers = {
    aws = aws.primary
  }

  db_name = "heelerProd"
  db_username = var.db_username
  db_password = var.db_password

  #must be enabled to support replication
  backup_retention_period = 1
}


module "mysql_replica" {
  source = "../../../../modules/data-stores/mysql"

  providers = {
    aws = aws.replica
  }

  replicate_source_db = module.mysql_primary.arn
}
