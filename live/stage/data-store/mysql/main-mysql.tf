terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  backend "s3" {
    bucket = "terraform-up-and-running-state-69"
    key = "stage/data-store/mysql/terraform.tfstate"
    region = "us-east-2"

    dynamodb_table = "terraform-up-and-running-locks"
    encrypt = true
  }
}


provider "aws" {
  region = "us-east-2"
}

resource "aws_db_instance" "mysql" {
    identifier_prefix = "heeler"
    engine = "mysql"
    allocated_storage = 10
    instance_class = "db.t2.micro"
    skip_final_snapshot = true
    db_name = "heelerDatabaseStage"

    username = var.db_username
    password = var.db_password

}